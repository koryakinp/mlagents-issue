from mlagents.envs import UnityEnvironment

env = UnityEnvironment(file_name="mldriver-discrete-steering", worker_id=1)

brain_name = env.brain_names[0]

env_info = env.reset(train_mode=True)[brain_name]
