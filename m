Return-Path: <linux-gpio+bounces-19657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BDAABBD9
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB8E84E775A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AFA23ED74;
	Tue,  6 May 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MKiOV6Fs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2056.outbound.protection.outlook.com [40.107.241.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DA523D288;
	Tue,  6 May 2025 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516700; cv=fail; b=gCXXQwl9OW6DJGoT/N6YASUNEBmi22FNjl8DPQngILeDCunf1NUl9bTTYD6snnwLK6VzJKzyxJx+KLRLVCGTZXYn4g080ZMqvXhpUZWmKIqftxCSdDyd2a2y7h00isl/CpC55efUa2MwSThI7jePdAf531tYa4E1A/DNjupfhm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516700; c=relaxed/simple;
	bh=hRlT3/ewzgRHoWAAW4auCAg3K5hopTijr31RLhkkEZQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IzYmNi3nDj9SeeecrFnXuTVOQo3l1RFyh/XRUcHZE0E2NPX+ooE863RTZ4WJFVKrBueno5KdpKc1NCauuclIdUrkZ/xm3lkVeo2h96rDUuRWIUJb8GlzE1RnsUTg0e+s8wD87VDuXje1G0GbGhOnWHerhfEed1W4uqu+VeaRL/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MKiOV6Fs; arc=fail smtp.client-ip=40.107.241.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtIAMSghBUi+yYC5c1BPltiBShOQcag9F40Pis9xgut9Sow7eGOWBKLFRYKohnzdNHNTC/8jMpH/tk6yvKlPpYSeA+Tno8WI7SwhMyXuS3IILk+FaN9HobMAA4FeLPDNFKXQAs2hNCHMQuk3BdPrAJsOVJlgAn9oGI7GAdg64RkIyUfJcCE6OZ3LFsaVpN8kK7J832ZxWNeY+SbfoxrIHv55iOL6DuNttvwswR4klo1P/WfJM/666USxDqz+scWh4oO6ozNZj4EkD2ps3KJXZvQQp8H4uMRAciEloZzR+SSyzu4EyqaLWZr0MRSWfpAOajKFFK3USJHny7yjf+C0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzIn22C/bCqKKCp92PT/0N8Qjb6tiddD259dSvsaWRI=;
 b=QKjB6UO7C6/LHQ6P84T+xcojwmVH1z/GOf3LHJT3EpH3foNZyihk1cW8mfzYhyxnqwAxEXNLhFkRHqXL7ttaNmx/QPgry+beIxCN0bkfvr/VWR1L0O7T5WPXAhaUdOkgJZyrvg+VQg6dciowQygXU3Zsmhbx47RhyqpCUIbHib8mlJL7dBSQURilAYPNJLzXTi2RVXqJ4/J/k2ncHUoD3i9LnWEzTVEHdAa7cBqjf5nfy97MXwYI4o7XTLlBEZBeKKRd/iwF0Y8SeXoNpc7X+ocyWl4n7OROhAKFcWlWeLp50S2KskFw9Xzv8jCWyUw8J/OiX+uMnR/DapcQ5YsnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzIn22C/bCqKKCp92PT/0N8Qjb6tiddD259dSvsaWRI=;
 b=MKiOV6Fsp22wra8VXiDxbyo+hMTNTym4q5vU1xdu8LEJLX5PKRE32OK/RtJo2sElTSj0Y9Jp10ETbStzEn06O8R1EqFz2GOF4zZjrwcBb90UDs85mYGkggiEiGwg3g8YTBeUDidTwCJTnovRm6pj9xKijfJhmTpsxmi2sQwnvkFVC+asSRC6sHgm6i9B5jh3gFLskPiZAclsBL4BxcSAa68vkuv+pNlKfeAmBH1QzieVuwdvlS4TYt58MqybWYVEMvssHlSk4j/NGCc5wQY6cxsGG9Ql9nCCRWwZKJjBq5PQaaRegii/aSJSTfRvZ2Orc0P9upqcDFb9ILLAoHTMoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 07:31:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:38 +0800
Subject: [PATCH v3 8/9] ASoC: codec: cs42l52: Drop cs42l52.h
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-8-e9496db544c4@nxp.com>
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=4795;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=+Vvp6+/DXS9mmi5+1a0ljPE8nIjFVG5lF9th4X+L+ew=;
 b=bpVRN+6qqhc+y4Ln3HuGADcsqcMd30Dmq1KF62uOiUGFgAnXQTIXb5j7Pigf/F0uQLV3PXp9f
 0ymeQiOymS6AIyRDI4YPR8EN5nGCuDxS+dRwGetw1hzWkl4DhlMOZRU
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: e358fecd-7c34-4754-47e1-08dd8c700731
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEV3MFZnaENVQnJ1b25RVXhoR2ZpdXg5RlJQam1ORjZFeU1iVlE3RnZ6Kzlz?=
 =?utf-8?B?L1l4aHNQNTMyNm9LQnlORVMrSUtDRkM1NzhJU0J5aTNLTGNrMGUrUTlGTUp4?=
 =?utf-8?B?aVZTeDV1WWRaSXgrWWNtQTlXVllDSXhnbzVBTHBEdnFUdkhVb0RmUlNCSjgr?=
 =?utf-8?B?ck1jLzAvTmZ0ak1UeXg2WjR1Q0VVY3hsamlRQnk2clVWeG1FMW9zMmxuT0ll?=
 =?utf-8?B?bFFKdVJZT3lnSURmM1RabW9XV0p3cUNiaEgvL0gxQ1JIS3FRcjhzc0JCOXky?=
 =?utf-8?B?MHkrUUhGamRITklFcFh0dDM5K3N1TVFqRnh3bGtIMnBBYS9aUmNnOGhtUDlW?=
 =?utf-8?B?VHVVREx2bjlXK0dNTGkwOFc1ZjYrOTA1NElZZ0RodUt3Q2pHdmZqVVZjaVp5?=
 =?utf-8?B?MnlCWkZodzg4eXNIa21HeFdMMHhRekdGQUJUelJrUDZLY3I4R2lyQlY0ZDdj?=
 =?utf-8?B?c3NXUTRMUkoyeitiTEIxcU1wVHRLWDVJSDQrTDJkNWRiblRUZmJ5Y3luakhm?=
 =?utf-8?B?RW16MGhBRElSMkkzQklzZW1qeTJDM2hIQktFUGRGUEY3V1RlVVRBY25paTBR?=
 =?utf-8?B?N3RDUlViZlpPSDBaR1RONXNSSkhscXpyYllPRXcxTHNybVNodDZJbTJHRWtX?=
 =?utf-8?B?bzNHM2o4WjlnMEhuTys2R0FuZ2dacHRocFZ6SUlSbTNVRzI4My9sWjdLbUov?=
 =?utf-8?B?WThObUtUeTNlUHRKMkhhRnFvdVk4d3pZMC9SY2pmWU5SSFdNS1dJbjNueFhH?=
 =?utf-8?B?M21QL1BESnFYMHlSbmlmcHFWRy9Jb0dhMEliNnNUdzZNRFdoUUgvR3ZJVXp6?=
 =?utf-8?B?S1FRMEJPYXI4MXRaS1BKM1dDSGhuWG1mMERUd0RCWmVOREhDLy9PT3IwL1A0?=
 =?utf-8?B?US9xL3pNdlQ4SGh6a0xIQWxraWZUeGx3K3N1Yy83SlpMTFNSUE85WExqZ3Nv?=
 =?utf-8?B?SGVlcFNSMENDVnBqdUxuNVlqdEhZeElnbUhXTFBic3NHTk9Wb3pCN3FiQkNz?=
 =?utf-8?B?UGppZGEzVDhCNzA0MEp2V0N4ZkRFSGpyMWJuTDROZUhzMG5hVVpNdnM0Rm9v?=
 =?utf-8?B?N3UyT1dPMWhWTXcvS3EvZDgwZW5yNkh2RDlyVFd1Rmp0Z0FQdTA4RVM1QXFH?=
 =?utf-8?B?cDR2VGZ5aTZxR3liTUFCb3MybUJ4Z2plOTFTWjhCMDNxOUxRY0RCUVgrWXpT?=
 =?utf-8?B?NHpiVVRSZmlYZkU0bG9hV1lNSXRPeUNRNTZMUVVQWUpTMjRUS0crVmZnNURI?=
 =?utf-8?B?VThQVWtWbzlUOVAxSEt3R2lacHZjQ2VianY2OUY3VVR1OUw0YUVGdWV4bStY?=
 =?utf-8?B?QjVDbk5zMEdXMEs3aVdadU1TaDFLKzZQTGdMMVFEUmk1WnBDQUZmckZpWCth?=
 =?utf-8?B?UWRmYjR1dU5tSURWVm1ieVNCZVp5bVJ0aWlJck0rYjF4OWxuMXdpVkcrS1BP?=
 =?utf-8?B?OWFQWFJwT09yUUR3WHg3RWxCWVlyYXB1dExSVVZNVHU0TWNHMDZPK0tDUEkv?=
 =?utf-8?B?eVZZZEhMZUFmV2tRQkw5NHBiUGF4M05Ucm9qcXU3aUpmODMrSUVaU1Q1UHk3?=
 =?utf-8?B?M0JLUitua1A4ZU0yaC9ZOUp3U3hxWEpUQnM1UkRPQzJnTG55bm1IWWhlSGwr?=
 =?utf-8?B?VXVEV292Mzk2Z2UvbTYwQVpVL1pXVDEwSjJ6OWhmRldFN1VrU0EzdU91VHpZ?=
 =?utf-8?B?WHdTSWJxd1lDeEI3SEZ2R0lLbk5mc2hSYnB4M3RNVXZxeHpzR2JGMndSSU9i?=
 =?utf-8?B?VFJxMnpTRno5UDVtRHJhR0xqWmduRkVoMkkwVzVsQktmM1N6aVo3OThvbDdL?=
 =?utf-8?B?MHVseUpwZnREbnJlTkcweWg1TWxIK01TVDd0dk9uQTc5RW50WGZ2TEwxdzV0?=
 =?utf-8?B?NkVaM0JOWGVsMWJWOFZ4Ymc1Y08wT3NXdUltcVBPWVdYZm9aUGw4OWFnb2Ix?=
 =?utf-8?B?UUZUNjRHQkV4d2s1K3Y2M1BhelN4RFE2d2xmRExLOWRDNUZBRENDS25WSUdz?=
 =?utf-8?B?Q0FzTHl1NFRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGNSSXhHNmM0TEJSbzZ1MWFHTkY2VGJsa3ZmZG84VlZ6R0wwdEY3TEhIblE2?=
 =?utf-8?B?Y3BPNmJ6Mnl6SUlTbzI0cmFjUVU3ako3SzdlQnl1NHlRalRNTzkzZlAzVW0y?=
 =?utf-8?B?VTRua1V3bTU5RWdQOHJocFFmVmw5cHBFeTlBOXFBeWE5R2J3NzAxV05rK2RP?=
 =?utf-8?B?Mzc4c1J4MHdJOStJYlNtNDFqWHVBTnc3RFJxcVdOMzJ3eCs0anhvNDJZTEhw?=
 =?utf-8?B?SlZhS2RSd0VZV3lRMUVUdjVwT1hibWZvN2NxWHN2a2ptV2ZmOVdnRnJPNjFa?=
 =?utf-8?B?S05ycTNRVUtsV0lFZFlBMzIyS2NBaGg2dFdhQ0w4QmQ2cnlTU1JUd2hiUXVQ?=
 =?utf-8?B?d002THdGZnpkNEp6ZWFWSmlJaHRjcGpXb0hNUjNHU3JhQkRuTzliRS9tS1RC?=
 =?utf-8?B?S1lZamtwbUJVNjBoNGdzUlpoVXdFcVF5SXFobXhWd2YxWTZ2QUVlUG1jN3p5?=
 =?utf-8?B?RTJqdWxPVElMcWF2SDFXQlI2ZFFFa0xOZEhmeXhwTVFiUWZyZzgzVmhEd0Vm?=
 =?utf-8?B?WHd3VmNnWTdGMTRVVzl4QUpONUlkdjF4S2R2R3hKSDBzalRpYUhOZ2NWUEVV?=
 =?utf-8?B?RWFNSTJhaW85N2JxeTJueFlQTzljM0pTVXV6Q2VRQXAwcXpaaUpieVg0aVRT?=
 =?utf-8?B?Ti9IVS9aRTJQeDdUbm4xY3RIWEQ4c3FzbU5odFRGdkQzV0NyeFU1d2s4Slg1?=
 =?utf-8?B?enkwYnhCWk9vTDJZY3BNUklOdEZSOXlHS1RnWVRDOGVQZ2h1VTBSWlJyeDlZ?=
 =?utf-8?B?VEpPT0RYWHhJcmR0dVRIaEtQUlNvbVpvc1lPZzJ4Ly9wTmJmM2NqMU8vcEgx?=
 =?utf-8?B?V3VlZ3FqYUJOM1RLYUM2TWRUeUtab2lLNCszWXZEckZKSzVqODk3UytGVEg3?=
 =?utf-8?B?RVZzYWhQaHMyQ2szOW40RlFlMVIwY0M5akRJaUlVVkFHZU1GVnZGSmFZdkFa?=
 =?utf-8?B?bmo3MEF4ZTVLb2ovVlFmemZWUGhZTlV2Nk5FbXc4U0RYeEcxb2RtUmtxZDFV?=
 =?utf-8?B?OWF5bHpBNDltaWFteWlmV2oyVG9wMjJic0NQZ2lWWXI5OU9LcnpHR1dMZm1H?=
 =?utf-8?B?Mk40Z2l4QjhSR08vUUtua3ZsVkUvek1MeWRrWnI1eXhTclh6bmFhNzRWSk9W?=
 =?utf-8?B?c2ZiMk9LN2J6YXl5bmZFRnl1VklKQ2lPaENieUZNR1E4ZHpIRzJockhteHY3?=
 =?utf-8?B?ZFpKYWRjWTV4M2dLblgzb1VYcjZ5MFg0aW82b1FLYWd5K0VmZkw3NmNLUzNI?=
 =?utf-8?B?S0RoSXJkUVovL0EySjR3MG5wbFZkUndtWkFXTFZvUmFNa0ZqelZtNVNpMDNN?=
 =?utf-8?B?N0IzMW1vTnk2OVpYdVJWYkFWZnNzOE9zeXRSd1NCclB5TVU4eXlMbFBUbEo3?=
 =?utf-8?B?RHpNMU1qdUNTb0FoSDJZNDdaYzVzaHBBVG5FUUM2YXpUckhCZFdVdVVINlJz?=
 =?utf-8?B?T1RTc1RVNy84a095bENKUXJaQlB1K2gySGJYdlVSeWtNejNyQW4zM1NERDV0?=
 =?utf-8?B?RmoxK2pOWXRuNGwxMXkyQ3ZqSzZPei9NVnVmYlo0WktMVGE4OE9ENTJOVnY5?=
 =?utf-8?B?L0JjV3VIQm9UTWhmYUUzUzJoUkZCZzZIOFFpdHVpNE5na2ZUc29jVEZkdGFs?=
 =?utf-8?B?ZHRaOHU2VnhINEkraWhWOTZDeDNkMnhkVzdmOXgzRGhudFhYZUdENkhkUlVy?=
 =?utf-8?B?QUtnWGE2elVOVDArbmNxNHZSdzdXUVVIc2d2STZqQ1ZmNm5XTlFzWlhEUkFI?=
 =?utf-8?B?c3B3cmdybkFTV2dySXhzK2c5YXhNREtBSGdJOWNGT3J6MVk2RnlVY3NtMm9w?=
 =?utf-8?B?dDRvL3FONDhQQ2pUVHRuS3BPNlRORCt1eGN5b0ZqbXlHeHk5MFd2RVRvdUlW?=
 =?utf-8?B?SEFsSzNQWEQvdzRVYW1ScEphZm9KTitISnpUWW9wQUVxaU0yZHh3QmVwcHBI?=
 =?utf-8?B?MFhnMUp3WWJ6Rk0vNy81ZlZPUzFYNTRhbHNtK1o1dEYveTlYNjQyOGJSem51?=
 =?utf-8?B?dTJVRDhTRnNpRExIaUNxOFRIRE5LZFFjc21XUXVkZ2RTUHFUd0cvQjJ5M3dH?=
 =?utf-8?B?ZnVRa1V5Yk1yenJFWEg5anZxZjNYNDdzdjc2WlR0RG9xU3g2bzBsUVIyb2RT?=
 =?utf-8?Q?VA2p3Ldv0Qy3l7hwwMYrG/XbM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e358fecd-7c34-4754-47e1-08dd8c700731
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:34.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8+NZpcxQUBQedjzM7g179W9uZQ4awbVXzVvvHuos96xrCmgixHXPH8ENPjpCQAFzhHm5yrYtPHRI0NSNMukTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881

From: Peng Fan <peng.fan@nxp.com>

There is no in-tree user of "include/sound/cs42l52.h", so move
'struct cs42l52_platform_data ' to cs42l52.c and remove the header file.
And platform data is mostly for legacy platforms that create devices
non using device tree. So drop cs42l52.h to prepare using GPIOD API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l52.h    | 29 -----------------
 sound/soc/codecs/cs42l52.c | 78 +++++++++++++++++++++++++++-------------------
 2 files changed, 46 insertions(+), 61 deletions(-)

diff --git a/include/sound/cs42l52.h b/include/sound/cs42l52.h
deleted file mode 100644
index c20649666abe5dcbbf628f6c2d1692d3e7190eeb..0000000000000000000000000000000000000000
--- a/include/sound/cs42l52.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l52.h -- Platform data for CS42L52
- *
- * Copyright (c) 2012 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L52_H
-#define __CS42L52_H
-
-struct cs42l52_platform_data {
-
-	/* MICBIAS Level. Check datasheet Pg48 */
-	unsigned int micbias_lvl;
-
-	/* MICA mode selection Differential or Single-ended */
-	bool mica_diff_cfg;
-
-	/* MICB mode selection Differential or Single-ended */
-	bool micb_diff_cfg;
-
-	/* Charge Pump Freq. Check datasheet Pg73 */
-	unsigned int chgfreq;
-
-	/* Reset GPIO */
-	unsigned int reset_gpio;
-};
-
-#endif /* __CS42L52_H */
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index ba2ccc818ba6cc1b5fbcfb38e07e9bc8f68c4a6e..aa8c001cce099e3c1dfc979678fe8000caed097f 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -22,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <sound/core.h>
-#include <sound/cs42l52.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -36,6 +35,24 @@ struct sp_config {
 	u32 srate;
 };
 
+struct cs42l52_platform_data {
+
+	/* MICBIAS Level. Check datasheet Pg48 */
+	unsigned int micbias_lvl;
+
+	/* MICA mode selection Differential or Single-ended */
+	bool mica_diff_cfg;
+
+	/* MICB mode selection Differential or Single-ended */
+	bool micb_diff_cfg;
+
+	/* Charge Pump Freq. Check datasheet Pg73 */
+	unsigned int chgfreq;
+
+	/* Reset GPIO */
+	unsigned int reset_gpio;
+};
+
 struct  cs42l52_private {
 	struct regmap *regmap;
 	struct snd_soc_component *component;
@@ -1090,7 +1107,7 @@ static const struct regmap_config cs42l52_regmap = {
 static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l52_private *cs42l52;
-	struct cs42l52_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
+	struct cs42l52_platform_data *pdata;
 	int ret;
 	unsigned int devid;
 	unsigned int reg;
@@ -1107,38 +1124,35 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
 		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", ret);
 		return ret;
 	}
-	if (pdata) {
-		cs42l52->pdata = *pdata;
-	} else {
-		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
-		if (i2c_client->dev.of_node) {
-			if (of_property_read_bool(i2c_client->dev.of_node,
-				"cirrus,mica-differential-cfg"))
-				pdata->mica_diff_cfg = true;
-
-			if (of_property_read_bool(i2c_client->dev.of_node,
-				"cirrus,micb-differential-cfg"))
-				pdata->micb_diff_cfg = true;
-
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"cirrus,micbias-lvl", &val32) >= 0)
-				pdata->micbias_lvl = val32;
-
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"cirrus,chgfreq-divisor", &val32) >= 0)
-				pdata->chgfreq = val32;
-
-			pdata->reset_gpio =
-				of_get_named_gpio(i2c_client->dev.of_node,
-						"cirrus,reset-gpio", 0);
-		}
-		cs42l52->pdata = *pdata;
+
+	pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	if (i2c_client->dev.of_node) {
+		if (of_property_read_bool(i2c_client->dev.of_node,
+			"cirrus,mica-differential-cfg"))
+			pdata->mica_diff_cfg = true;
+
+		if (of_property_read_bool(i2c_client->dev.of_node,
+			"cirrus,micb-differential-cfg"))
+			pdata->micb_diff_cfg = true;
+
+		if (of_property_read_u32(i2c_client->dev.of_node,
+			"cirrus,micbias-lvl", &val32) >= 0)
+			pdata->micbias_lvl = val32;
+
+		if (of_property_read_u32(i2c_client->dev.of_node,
+			"cirrus,chgfreq-divisor", &val32) >= 0)
+			pdata->chgfreq = val32;
+
+		pdata->reset_gpio =
+			of_get_named_gpio(i2c_client->dev.of_node,
+					"cirrus,reset-gpio", 0);
 	}
 
+	cs42l52->pdata = *pdata;
+
 	if (cs42l52->pdata.reset_gpio) {
 		ret = devm_gpio_request_one(&i2c_client->dev,
 					    cs42l52->pdata.reset_gpio,

-- 
2.37.1


