Return-Path: <linux-gpio+bounces-17911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B342EA6D98A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 12:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7883F16F662
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 11:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC80725E817;
	Mon, 24 Mar 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vAID7+/x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CC25E46F;
	Mon, 24 Mar 2025 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817159; cv=fail; b=oodsG6hRFX5pj4rz9h1C2iIsmycoIZFtDHbp6CP4kIl9SBE/vZyOYBiRh3JzfrAW2TukWKhaJJP3iHzmcoA2sFdiT1yIhDBKVyi194AjxZi/FAThXfvk1WXmPv2EGOBJErNhjFPVymxNWP+FAc9TN+yCJqQ25M9MNrpYf8u5S0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817159; c=relaxed/simple;
	bh=q7jP31Cy9Sl9TtZGLvds9qvAjJ6+RzB6WkHeM4hf32k=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Ht+fBTd7qJrx+XF4olvB3LYWStLIWEH0Eovp85Szjiqn0H8iLHLQe9s96Ah14udXMtqNhL70JiDiX3toVcd24TdbclQ6Kg8NOCJGo1cHQ5YzVY5CdMESefsTkaw3bCbYmQdk/FXSkAGdBYtZxx+k4868ddJFJdnI9u898uBiMeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vAID7+/x; arc=fail smtp.client-ip=40.107.105.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lxds4AEedCvIoFb9BkzPfksOHlZDJWQRTVxWzO99AdHdvZ/gb2/jZBwUC7LieLkmXP614P8/3fSqJR2xqq0rWAStSz13eeeXId/g2R07TzyymZUIsE6rEXNMBkS/svBKhGU3MR2CN7w4QugkilO9vSEMKASyfCkoDlEMPscV7SBAMM0xGTstzYkYRz+U7pU/ZgWRv2XbYN1Tanm/j4KMWQuSAl3yQbVKouP8RGG3KsRyxCrRP50DNNKBjtqHdz3yEBC1eIyNuGXGZuEE3K+Ii4zwo87sD/pymn3f/HXV5gwcjpC7wGIZ2iPW58os6uYiPzD5hT2YsCbttFbCHGB9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNwqpJ+qWwXV1v016XZvw3/tgHoMSo0ey6+WzGAhXjU=;
 b=uUBtX/q9WPYtAWFQu1frtDaGFEbFmfZltwW9K4Qp1mUdXsopgI0gccqzoMz+n5JG4uaLkSv9E/xbJ21qp6Xt3PajpSomvCopeaiH5qt39ucKOYCaLSVJGMX4vCS6bRfdtrmd7QpLoXw2is4Ab/53J2b5dY3QZsP9b1TAkqFS1Bk8CJEli/gznsWehtgC/zRkem2maRdtprLDP3uBEi84XxiaMDktRdsHdZ76tM8kquZwF/9SHWZwSS5lHv0MwNyfC4siMuZ3YHbzajUUKe2qsEDLVyChcmZe7ZVrNYHnK4ans5pfT2EdkghzULipVz+lmBTMmtDfzsQ9oKEbQlt74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNwqpJ+qWwXV1v016XZvw3/tgHoMSo0ey6+WzGAhXjU=;
 b=vAID7+/xUv3wg7uV9+Kht0BxouN8yTgy6CGx4i3qqLLUvFU02g3tvtcQM3i+hopud64FaJNEYACBjLYmuu+4rpODga1xmYJ7sVCZK10/2RUIfdzCpQA7zyvsvrJ9Zq0+fcmpuxEveBhVmtf7Vj6cD42GTP5iqfHIWVsUGnxsaCo+OsDDwIo2tVkFAGEJCu/NfPWEWphLBKX2DW8eRi9Go2Ck7SkJIRw6WZZidSZ95LO3xlgCQHvOddP0JiEgyaATSIIZFFa86RqfVsazFa230Fo6e9AhZDS+SVUpvgmL3nL6l/JPuJeytMzZrkrSf/ieRETglnJX9fBmqLi5yENcOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 11:52:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 11:52:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/3] ASoC: codec: wcd93xx: Convert to GPIO descriptors
Date: Mon, 24 Mar 2025 19:51:26 +0800
Message-Id: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5H4WcC/23MQQ7CIBCF4as0sxYDQxXiynuYLgjQdhYCAYM1D
 XcXu3b5v7x8OxSfyRe4DTtkX6lQDD3wNIBdTVg8I9cbkOOFSxzZ2zq2JIqOKY12NNzpq9bQ/yn
 7mbbDeky9VyqvmD8HXcVv/adUwThDZWYzKvRSinvY0tnGJ0yttS+SfAs/oAAAAA==
X-Change-ID: 20250324-wcd-gpiod-782c4a0d8688
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, Johan Hovold <johan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742817094; l=1824;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=q7jP31Cy9Sl9TtZGLvds9qvAjJ6+RzB6WkHeM4hf32k=;
 b=+mXReymfzcTzYw8t0q4bYkNJ7jbuoE1ZCrX2u0Lf2VfRHpiJXeMo5hRmm7kCQhV7oNlvtL4bS
 eiT4gDAUg9vBdxdSrKRVdiA+20Ov+dHe+sIY7wTT0ySSe/I/onOZ/WM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc57b7b-dbce-4bb4-9826-08dd6aca5c29
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTNyZnNweGhRaUJiUmlhaFdGNThBaGpZTnR1MHlwTFJXbllIdW1rMG0xajh0?=
 =?utf-8?B?YXpaQ1QxajU2RXJ4dG5RSDdJZXhtT2I3Yk9EcjkxSmRzdHljK3JIcC9TT0xY?=
 =?utf-8?B?VDFTWG84R01WZkdkdVNSbGVvVXB6LzFtYThVZGJFV1VlNkczME1FbW9JZDRE?=
 =?utf-8?B?WDdTSTdEeENwSVgvcEkxWjBMZEs0b0EzMHNGbEZSSW1idWdhbWtXUHlvbDlS?=
 =?utf-8?B?dWYvSSs2dlR2M25rYnI2dkVXTVFIU0NiMlpJUEN3UnpRU3pzNitnSTR3ZmlS?=
 =?utf-8?B?L1ExVGxTVEhXVHV6dFNaTmdwUmcrNUlqM2ZDQlMzZTdYazBlVVBjNUUwbThW?=
 =?utf-8?B?NEI4R1BDSGN2RHc3R2dac0c5WUJwajZvazVkY2J6bW1KMUhmNytKdjczT3Bi?=
 =?utf-8?B?bFBQNXFwUnJrRE80RmtkR01RUFJOU1d5NXlsaEdMbzh4R1I1c0xxVzZ4ODJO?=
 =?utf-8?B?SXNsaHVtRDFvMTdvRE5EbEt2ZlFDMU1XVmhLVVdCcWRvMFZBSDhld0d0MUZP?=
 =?utf-8?B?ZVBZcFNSSmxEQ3hEU2xOQ3VUMlgzdEE4bU5pVU5CcWpZWUhnbnRkS09XMzRa?=
 =?utf-8?B?Y3R6eXdCbGd3YzViVk0wYkdRTTJXT3ViSXVON1hNYjhoanE2ejNmWTBtQWdt?=
 =?utf-8?B?RUtROVpWaG9LWU15bjF6VE9KVitXNmtmTVdrKzZISEZQd1ZqWjRXdjQ0UW9t?=
 =?utf-8?B?eDZRaWU2S0MzbE1SaVJSWEVSS21IMUFQZmlPVnlRNzk1MHM2bERLb0NnM1Vw?=
 =?utf-8?B?YkQ4YlRwcERDUkZPNXR6UDMzM1J0bXFFTGwrc1VCWVA0U0Y1NlN3L3lVZDNl?=
 =?utf-8?B?R2xxckdDUDVOOEs1OEZjU293d0MxdEN0SmtxaVZEU3pmN2ZjeUpzL2hWN0g3?=
 =?utf-8?B?RlJ5RDJTZnNBVWVFdjFlbGlabElHWnlPRTFrMFlQN0gvdmpTUlNta2Q4WDE4?=
 =?utf-8?B?NWNMQ0VhejJUWFArZFphMUlnNzBMOHNSSmwrcW1vRUwwUEQ3TFBLRUpqVUo5?=
 =?utf-8?B?aDdCMGZHSmN4UlNzeUM2UlVxSjh3Z2QzaVZzT1dCaDhsc1RRNVp1djA4RGZl?=
 =?utf-8?B?YjY1Z1lGZldxSXJYVWRiSW5TWlhWclRSVjFWZWVNSDlOMWVvSGl0Vlk0QXVP?=
 =?utf-8?B?TTEzNnpJc3VKVHVIajA5cXdNZjNIMEsyekZucmkxak1ZVTFTZUoyY1M1T2t6?=
 =?utf-8?B?dUNJZy8rajZKaFVGay9TeEtzQlpVMS80OVdPT1VzdGovb3JYWGtUVy9EOUJ5?=
 =?utf-8?B?UG9pRWtHcGI1cjlYeEVpZ1BjRnVXcHpwL1lPaUR2MFhCU3A5QXVpbWl2NU1n?=
 =?utf-8?B?VWg3NkU5R05SSUdXbnY1VStoU3RJUnZUVmdpdXVYVDBxM1cxajFTNUV3aVpU?=
 =?utf-8?B?OW93YW0vSzBCekszYzJvcjhIdzRpUms4NWg3RCsyYTJQTWVDMUJ2dldCcTVx?=
 =?utf-8?B?N3U3ODdtYWFzRlBoaFR3UlFDL2FLaG9nVC9idVltMmVQNGJ2U2N5Wm00R2du?=
 =?utf-8?B?a3pUYXZKSWM5N0ttNGZaaEVMVUZQQVRqbjBFcExGbU1DVHJkZ3o3L1AxUmJo?=
 =?utf-8?B?WXpjekJ5dnNRc2FBQVZFZkZWNEFOYm9ENGJ1SEtrbTNXL3pVaFAvNjg3alBa?=
 =?utf-8?B?TnRZdFlqWDMxNWt3TmMrS2N1ZFg5RTBNQmEwYVNabVNLUDZTZ0h2QndyRHJW?=
 =?utf-8?B?T25RT3ZTZFA0L25KU1ZKd0dFUFBIR0JTZUVSazUyd3F6cm16L2sxeXFkSVFH?=
 =?utf-8?B?dzEzWlFtamdRS1d6ZmNJWXBubFozbEtXWHljUVBQdjNHcUp4SWdwNjU0VmxW?=
 =?utf-8?B?WWJnc2pTVW5GaTJLVXZiaUlTdlVVOVA0U0d1U0pTTWhBWHh1Q0ZxODZTZlVh?=
 =?utf-8?B?a1ludEtqV2ZHK0J4bXoyb05aZkRHSEIvQktMSVAycC9uTW1RRVNQdjA2LzU5?=
 =?utf-8?Q?AvNl8S7K0RXaBbbZoi1eSArtD9wPA0Nx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S01VNmx3T3EzcXRxWEdYRGsvRjNjd2x2Q1p6czlVbWRtZU4wMklsdVpiaGRh?=
 =?utf-8?B?UTNxK0Q4c3JhVzhMR0QxK2dtV1Jib3N5VE1xZEoxK0VoQVBTcmd5MVBKRkJp?=
 =?utf-8?B?aXg5OGVtOWlNb3dYN200RitsdkRtaGpaUnhoc2h2MkoxbmE2V211NnhUTzNs?=
 =?utf-8?B?a1dmekVRZTNIZERXVFUrMHk2OUFiZkx2dnhpZUNTZ0hsQ2o3dFNjRXJ0T0h4?=
 =?utf-8?B?L0tONXlQV2ttZWpDa1Mvb1ovRWhXNHcrMlJ4NzBlRldrQURGR2hrSzIrMTZX?=
 =?utf-8?B?azVTYVhKUG9JcjBWa3Y0alkxUnFuOFpEdWNLQkY5b2xBbVVFYm0zckxoN3ZM?=
 =?utf-8?B?RDZsK3dZcS92VS9pdC8zUG81eHI4cUtGVHRMTXdDTWhFMjExRUQwdEF5Rm1I?=
 =?utf-8?B?TlhVa3NZOURiTmlGalNFQzdEdFRLSVZVRGhIeDZXMzQvL20vNy9odDA1Zi9R?=
 =?utf-8?B?WVZ3aFMzS2RxUXlTSjZIdC82TXpsb0liL1YvSFJQcXE5dWNlYkl4Wk01VXhp?=
 =?utf-8?B?UURBcVhBTWdZMHlrMjdrc2xnQ3VUTUYrK1RCL3hwVndONnFwd015WHFXSm9H?=
 =?utf-8?B?N3ZST2xSRnFMQm9vcElJWWdKSytmd0Jza1NKZjZwRVBwbndHam9WVm1sOWFV?=
 =?utf-8?B?eHhDWURpUDBVb0pZaWlJSnd0SjVxMkhhMmV5VWt5eG0vd0k1VEtKVVMzSDNK?=
 =?utf-8?B?Wm93RFdKQnIrQnZ6SW1oTmZySVJ5N3d2V1kzZWpkakVtWE1TclMyVzU0d1hp?=
 =?utf-8?B?bjlydStiZE9xbW91L2xDbDhPbktrRTc5Q1lPV3gvVjRGQkdnOCtMdzVoc2tN?=
 =?utf-8?B?MjNyUTdDeDJUZE9UWlZUU2xNWmNpVkZKRkNDbDJaVFBQd0pRVk5yWVgzWjJJ?=
 =?utf-8?B?dW1LejMvOWp3K2pVOXNXY3haS2N3NXN2bkszVHRiZEZMd29DNmpRYkk3QnU0?=
 =?utf-8?B?OEJWTkxiMmJlelJlQ0Fzd09DY1dMWC9LS1hpQzdxdmhCRy9pRDFMZWZ3ejJU?=
 =?utf-8?B?anN4QUZranFlMGRLSFpCUkFUT010ZGoxeFZaQmJEUmNnNlhrVTdLNjV5MWVY?=
 =?utf-8?B?Q0FxOVhTUlN5cnJMS1V6QzhXUjRWZTg5MlJ3Q3JUMkJHR2FKTzlYb3F6Z2hH?=
 =?utf-8?B?amEvUkVybGZ6OW9iZ0t6VVphL05vd2FGRGNNOGovZFBidWtkeTZKRi9zcFA1?=
 =?utf-8?B?bnpjQ0NvWmc3THZHbE40R1RHcnJJeGNJV2kycjRYdzE4YkIyNDJXdjVNN3VC?=
 =?utf-8?B?YXgzVDNHWDV6Z1hxK2w0YTltaE1ueVpMVmJ4UENjWTMrbDBZalh2dlpjVVBm?=
 =?utf-8?B?Qlo1RlVCVHpQUWlORGorMkZpTWJwYkg3QWp0cS92a3VBMUlxdFBTQVp0RnFm?=
 =?utf-8?B?bzNRY3RVRWg4cUdacDhFclFGazcxdHJpeDlUSTVYNEdsVkRzMy93N0Q0cjVp?=
 =?utf-8?B?NmZxUmE2ZmgzVFhCc3UvZHYxRFNCVitSNU8rL0RucUF5UWc1UjVhenBERW1D?=
 =?utf-8?B?MG1IMlErTGdlUDNFVlR1SnVRVUdDcXFDZ1paNWY0bXZFMzJObTE2ZkFKZXcw?=
 =?utf-8?B?UXdDYzFiVkdrRE9tODBNRTRFSkl5aGRNaS9Db2VhM29iNE9Od1JrZmlWRWFx?=
 =?utf-8?B?bkRiWitjb002b3ZHcWJISTF3cXpDdXY5TnNWQ0IyZ1BCRnBzTnlySTV3RXQ0?=
 =?utf-8?B?MFdmc1ZZcUMxL2dTNWZHMGRJWlVsdzRyMHk1d1lxREJYM0RlQVJ0d1VYQS9D?=
 =?utf-8?B?STluMGE4UC9sMFpURm5XQ21GcEtrTGRKSG1KVHlEcE9MY2hIQlZQNEN4dlVM?=
 =?utf-8?B?Mm8yL29NdmV0UThuL3IxZWF0anhCaTE4ZjFBS1E2VXdtVWo3R2xnMUV0RTBT?=
 =?utf-8?B?MFprcXN3ZEJGM2NDS1ZSd0RDdkFvTENYMEpDRTlJWjd1VS9ySzg1SzUyU3d2?=
 =?utf-8?B?VHhxMk83NU05QUlsZkdVYVZtemprSDRpeTlTTXRlZHN5MW1Ld1BPZjlubUZF?=
 =?utf-8?B?QWVobG1kNkVCaVVhNk5TTFViOGFzbTd3TW5MMnFKN2RydVgrdXFGR2k1ZEk3?=
 =?utf-8?B?WXV6M0VKb1dJVUwwWkJtSFZZRTdrdE5rUm5sanVHL0tnYmdBbHVaYmtKOFZw?=
 =?utf-8?Q?lkkhkkBcyLoRaPjIPPG9zrUJ6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc57b7b-dbce-4bb4-9826-08dd6aca5c29
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 11:52:32.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBakTfS1o2BjX9GQAdFmRGpsuqbLM/xt/zJNCUrRP2jWdMX8NjqWNd6y15l5LHYi1IcEb4Kh6H3yb/zk6Y3UVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793

Steev,
 I would appreciate if you have time to help test again.
 Hope V2 could work on your platform.

Linus,
 Since v2 is only a minor change to use GPIOD_OUT_LOW to replace
 GPIOD_ASIS when devm_gpio_get, so I still keep you R-b. Appreciate
 for your quick action.

Johan,
 Thanks for help look into V1. Appreciate if you have time to look
 into v2.

Sorry for this quick V2, there is no rush, but just wanna to avoid sending
this out in coming merge window.

of_gpio.h is deprecated, so update driver to use gpiod API.

The current driver use value 0 to assert reset and 1 to deassert reset.
The DTSes in tree that use the codec are using GPIO_ACTIVE_LOW.
So it is safe to use devm_gpiod_get to get GPIO descriptors and
use gpiod_set_value to configure output with value 1 means raw value
0, value 0 means raw value 1.

Note:
I not have devices to test, just my best pratice to do the convertion.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Use GPIOD_OUT_LOW to replace GPIOD_ASIS to configure direction.
- Update commit log with "in-tree DTS files have the right polarity set up
  already so we can expect this to "just work"".
- Link to v1: https://lore.kernel.org/r/20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com

---
Peng Fan (3):
      ASoC: codec: wcd939x: Convert to GPIO descriptors
      ASoC: codec: wcd938x: Convert to GPIO descriptors
      ASoC: codec: wcd9335: Convert to GPIO descriptors

 sound/soc/codecs/wcd9335.c | 15 +++++++--------
 sound/soc/codecs/wcd938x.c | 13 ++++++-------
 sound/soc/codecs/wcd939x.c | 16 ++++++++--------
 3 files changed, 21 insertions(+), 23 deletions(-)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250324-wcd-gpiod-782c4a0d8688

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


