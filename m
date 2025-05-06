Return-Path: <linux-gpio+bounces-19651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68CEAABBC4
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D63F17415A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D89233D9E;
	Tue,  6 May 2025 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bVDuF+NW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C8E23314B;
	Tue,  6 May 2025 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516675; cv=fail; b=BVQ1HfMnW4sUW++tdVPwHYL85AWfCkxxrtKeWP3N8rGDExjh+cTHjYqCzlGogRwApruWRBrW7bfrGk4y2Kn3riaGFBT5Y46s/kn0AODYfmGWGWsveCrjbkh9XYWsoiMzSHTdWKxSYaGLwHycNc36tLMlyPxH6jxJYK3HrTvvvrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516675; c=relaxed/simple;
	bh=d9XsZOm5HN31TB3o+Cc3rtYz1J+CsGeVUq+zrNjEVpA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NOs0CH9102dji7KUEOL9GHp1bt+8lArfpZF3RXH22G/yqoA+S8pw6Mms2u/SkJ5Q6oJ1QD/ShZ2M/yihJCmBhdbRcWGR922AbhB1RgdvbOFNVsTbv3gVtZXvFpkw335xbVYa5naYZcE2Ib/DkA4KUXRaH6xcMZU7MIfU1laHp7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bVDuF+NW; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZfpO0oRET95dni19w26p1gaKaBOVYYxL9PSKEK63PjfffRRJ/JEY9jCg0M08RjVRDf6SH3CKWrexxAoUpJMzuiBlxn6cIBlksf5XX+JZPSd8Mo8ltXulVq8eSD9C3UIWPI/j15v2vTa32SOFv+YpvpNTTHYIWdvDn8V/LZWkUAUotb2wgyjq0/1/4s9tdZ2xca6MxaaJJDKvf1EjLGRF7/t7wL0IzJQB5Vche4ij7efjzqibkoOKvSBsUuW74tQoEr7nuBpI5EzeXXkAZDpBZW1p14jDHwZ2oSKYaNuCla12a8G1yZwTFmJM8I3Ac+HA84HeGuv0es/KxHe+HU3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCcNcUQb6VDoFfspJ29cZ90knzyy35SVsuFGx5dhAjg=;
 b=NpFPKGQpspPYqD2PDE73d55ZotjbYUfuDI1ORY8OwBZabZkL4mKrOXrRBJdPDqCuvBFDF2aFiTMeJtMLLaz4ZOaKezTARabVTSrGAOg8CwWptMuYLcQq6s55E+JWZjydyOHLcRYWcy7HOUtzT+k88YfiyjA4JflIleTVekgSv/Re72a83DSWwc4eNJyyYH2TxHQU81H45Qp5PJVlnWl7DvvxC37vKnwfzbkYUlLb5R5tZY7Sq989CNmJlq/8C28V+9J50tlpBxKAyju5hulIspKFEK8OAju3lJm4Wc5C2zH+aKIVpZsVY7yfZgk0nqEYcHrNvlURMS2g2H6/ySPbzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCcNcUQb6VDoFfspJ29cZ90knzyy35SVsuFGx5dhAjg=;
 b=bVDuF+NW4tPcJYaZKhvFHTgB/RxmqkGrOyQ+owjUGH9sfwoN1wO34FRDRmFoIPwmD9TAJv8nGUPsj+NPtLa1Fqd158Pm9QLSozj0+dHQizQTpc8jXcBWW5H7TZkKU1CXtI3fAD+sc0ofYMKaRsb+INDqdJPN1c18h9j1bWR5nnec3xqzvZlfcUfuBQZ4uJkykcnLsF8LhwX2GCCUg8xTfGPmPwjJ20kJS9iE2aZlZ03Ht8TzD2Ysz1zYZRdD4rD4/cPXt3BObSNvfFjGJmOLYxe7sWfVeb3o8R9YlA5sthTEkpk79v92VSOSSdNlAWBHzDTLBk8orCfdMTzscc7b3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 6 May
 2025 07:31:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:32 +0800
Subject: [PATCH v3 2/9] ASoC: codec: cs42l56: Drop cs42l56.h
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-2-e9496db544c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=4414;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=eQ7UdEZ4xHJklXPmR4di3YvcmBTWJXIeJvZOIGA8q0U=;
 b=cukX6B4dylPXdPLfg6q2rW19aJzWL08TFsI8T3UuSD2nhqYPPNwmRa3llNdrQemmPVg0YBsQ4
 nKbjmkIDqzkC0kl/oi+mAfprDTx9kZHevcMSweLJP756nSvnKZPPqEA
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 952f785b-63df-4feb-ef67-08dd8c6ff880
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjZpZVVEM25aaUxyYWNTRnZvK0RXSWVZUWQvZjNqVlliaG9Dam1DTVZEL3Fz?=
 =?utf-8?B?Sm9la2QwUVZNUnFFUTlRUTlvb01rRFFMbUJCNDlRWjlzZFlJM2NUQTVBc3Mz?=
 =?utf-8?B?Wi82dnhTc0V1OHdLMEVrUFRFVXphWGhGRWtEZG9pK052YUJoQ3Zsak1wS3dZ?=
 =?utf-8?B?QUNjdHNqeEtQc2UrNTdlK0hFZ2E0RFZqMDIzSkpEWFdBWFZkdERXWGZNcjNQ?=
 =?utf-8?B?TkwyaCtMVUtHeEoyMUx3QlBMM2cydVhpUU9FVmV1WmZ3Z2RyYXR5ZDBVUVJk?=
 =?utf-8?B?MmJZdTlEZlVwZCtxM2FHSlRyZjhWWU1FTDByOTRkK2pNZ3YvNWxKRmxPZmlV?=
 =?utf-8?B?VkVLZURxZDBLcXlucy9RVE1ER2g0VDkwZklqVkR1NG5qdEJZN0lrdjhHNk0x?=
 =?utf-8?B?a214ZllweWVMN3hERUdpS1NSeElNb0tJaHB5MHZSWlBKbXk0NFppNlNmR0ZC?=
 =?utf-8?B?WkpxY3M5Mml3dlVWKzRXQnJhK3dWd2lnR2l6NXczVlp1OURvR20zeUlvbDBR?=
 =?utf-8?B?Vk5QUVNFUzBDeUlDQ1J4UGcrcSsrRVpKcmxDTW92eUVGYjBwR1pZTUloSHF6?=
 =?utf-8?B?TWY3MnBJU2JsYkx5OGZTeFdmQ28yWE9WSFZpV0UyVTJiYU1VQVl2WnVIbmc5?=
 =?utf-8?B?bHluWUlEZHBES0N5dFBsUjhzTFFDSllraWtSay9sQU9ERW1KcC84OHpTSWI4?=
 =?utf-8?B?cExRa2pOd1FOTGdLZjRtNExKNkZudFVTVVpEU2ZlcWZhdWk2c1lNR2tjUnBP?=
 =?utf-8?B?clR4bllXTTlJSEhzaFdkUjd4R3hHWElqenp6TS9DR3Mzd0twenZaRlVpRGdn?=
 =?utf-8?B?eGltckpZVG1MK0tkUkhyaVF3azVXdkx6RUdUbUVCbVdTSmtxaFZFcnZMK1BD?=
 =?utf-8?B?eWREZkJBLzNKT2kzcUh6VSt0cHNZbFVYaTRlbnR4QXRQSTV2c0RtU2tZblF1?=
 =?utf-8?B?V0htN3pzb1Zwek5PTGFDUGpNRW5GeU5wRmhobEVXTGtqaUx0RldoMzV4eVRr?=
 =?utf-8?B?Zjk1Q3ZXMkFRczRqamRlMit4a2hkS0gzd2tLNmJYcFlIa3o5QzlqTEMvMHU2?=
 =?utf-8?B?LzB1NzBpZ0NWVlJqRkFHd3ExTndxdVU5Uy9PclYxcWhZWWpoVXAxcjhPemhu?=
 =?utf-8?B?K2tTSlpwZ0dURmtqQ3Rld0hxWTJ1YS9BaTNIMERhTUt5OS96MUhuaGpKK0g2?=
 =?utf-8?B?Qmc5MTl0eENhRFE3R1g3dWdGeVFxVEFmZ2N2Z3VNcHlpU28rcEJlemZWRktX?=
 =?utf-8?B?dmFsRndvdCt6UGRpc3Q3SGZuTE10U2lVdUV3Tzk3UWcrOUJTNEpwN01BSFdS?=
 =?utf-8?B?Y2dERFdMcGJmcHlnd0srVW1DckdlRTZEUmJzZXlscVFtMjhocFJaUWFvaFIr?=
 =?utf-8?B?SnF0K2x3ZnQyTk9kVTZjUldRVW9hVWVZVkUzU2tTc2lxOTBjQTdlay9JM1BR?=
 =?utf-8?B?VDM2NHRxclhDNmUySWVlUmlUd1VpYmZoVDNZSEt3V1JMOC9ZSjVoeGVYYTZo?=
 =?utf-8?B?Qmp0bEUyK1lLbjlDRFQydC9LMnB4VlB3OUg2V3Fab1BtaHBPakw0azFtSHI4?=
 =?utf-8?B?a0hsZnFNUWJ1L0NRbXlGakloTmNkRmVoYzZnMFlFeDJGV3BoQzhONkZLQWVO?=
 =?utf-8?B?SlRjWmUvd2Y5QS9TZGorRldpaTVWYWFhU09HUUZSMWlxVnlxdEo4eS9sVVE0?=
 =?utf-8?B?bFNFVDhzNTRydk0xVStqWE1aak5oMWhMMkdvSkFCS0QxaFoxc1I4ZzV3VGp2?=
 =?utf-8?B?MkhiN1U1WTdUNUh4bll4SG9oSVpSSkVXZklGS1E0eVZsdG1YYXpxUHB5dkNr?=
 =?utf-8?B?L1dMckJzbndCck16WjgxRTNYTXp1MVFTdE1NZ3RCRENDaUtFUC9VTTNlRlVN?=
 =?utf-8?B?MWZJbVFsbXltdDM0K05HR2tmeUdtN3lqWElKdmFiNHJYYUtETms1SHRlT0or?=
 =?utf-8?B?Z3RxL25peDlwL0ZlYTBEa2x2YWI0RFlUNkVHR0N3dTJXcTBMMGlaTlMydGpr?=
 =?utf-8?B?d1hVVnFaZHNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjFqRS9ZK2NmRmdUNkQ1WnRRQ1h5b2NWU2F0V3dUVm4zRDIyUzFYRllKQ3FU?=
 =?utf-8?B?N1pVVk1GbHNJcjJpdlZaRERVcjVPTkJDbnF2NGp0NlVuTEQ4a2tRaW8rNW9O?=
 =?utf-8?B?SS9sdHllUWVKRGhOZWMxOEtPRWUzZ2YweEE5MXpKakZMUTVVV1EwSkVlRS9x?=
 =?utf-8?B?UFhnLzIwNzN4V1hzM2lzQ2tTYk40cnQwakFrdkJVZGs1U0p6VmlKS1FZNWlE?=
 =?utf-8?B?cC9kSlFOdm5QRkFTMnRINEpNS29FYnlUakd3S1BZS0h0TGkyL2QrbjQ2Zlh2?=
 =?utf-8?B?RVViUllNWXZHMCtmeHZwWHRGdmVhRmJDVXNvQkEwZ21oaFdjTWg5STYwSUox?=
 =?utf-8?B?Q1c4b2F4QTJ3YTFaVVNWVmpUTXhEY0ZMK3J4L2FObGxqeGkvd3VhT1BjemtE?=
 =?utf-8?B?WDlXSENxWEppVEF6dUtWR2xoS1NEdzU2Yzdkb1p4KzBGeHpWSmh1WTVzOS8r?=
 =?utf-8?B?T0k5MVdmd0R1bEdabHorOUhmRWJjSVlzdWZuQ0VMUU1SQTFPWElLT2pBcnRm?=
 =?utf-8?B?TWxUdEhKNTVCVEI5SFBrZ0tEY0xjQSt5WUZYV0JzcCtLZmpaNmVLcGt3aDIx?=
 =?utf-8?B?OTFjajYyNy9VTVlGU3crdzE1eG5kS3pYRktaSlZpcjVwbFVXaFZydUk2WEh2?=
 =?utf-8?B?WmV2cjBJRG9ZOHpqeVFVR3RYR1ZHS1JXVTNvM25FSmx5cjEzYlZ5MXloVzBw?=
 =?utf-8?B?YUhXaSswM3B5LzNkUjM4T3ozL1pTdEVVUVJUYld1UjhqdjVYYlF3QUtiYlhS?=
 =?utf-8?B?WjRSc3B5cS9uZzczNElkNWJxSjYyVURyeFhxUFN2aitZZk54WFQyREsvZE0v?=
 =?utf-8?B?a1VMVnoyYjZiWjhEVGpwbm05LzZ4ZzJPdHNEVWhDRG8yU0FjUUdsdVl4a1By?=
 =?utf-8?B?RHNSMlkvYkxKWGpBZE81bE1hVTQvUW5QVGpnZ3ljaHpreW1aOXh3L0ZOMFZY?=
 =?utf-8?B?SnNIa3UwUmxnOGR5MjNXWktlcFhhUmhlZEhSbXVhZWpxRU9ra1RiOG90NEFk?=
 =?utf-8?B?YUNSSEJ0cnBMb2JkV1V4R0JxK2grWXExTS9HSHZtWEgza0R0ZUMxSlg4eC83?=
 =?utf-8?B?V28xSk9va0pXU1RMbjBudzRZZGVrUWIvUTc2dUZDWGFHS3RVN05YVmJxNUhE?=
 =?utf-8?B?VjE1a1ZpTnBBNWpWQWU3VVg4RmhncktuUnA5VWhTQTZFSTlkOEhzUWN5LzVx?=
 =?utf-8?B?WS80V2pxYWQwajc1Nk1qNlJUYThtL08vZTF2V0k0L1VPMlhtNHI3N2RKY1BG?=
 =?utf-8?B?OURhQm52MWo0bW1zL3ZiUVRmdG5rclFCYnhYMzhBeHpPTEFiMnhOOGtyLzBY?=
 =?utf-8?B?cWw4V0U4MHZyNVdLdktremkrQmJOQ3VJTm5HUmFOSy9YNTc5bXFLMCtsMFNW?=
 =?utf-8?B?UGhNK1E1RVNNZkovMW53bzR3WWJySHRuRE5kRmtFOFQrOGxGNmw5cWQzb3c1?=
 =?utf-8?B?V0pRMWNob2p4alk0OEZrb3oyUnlqYXJrUW1kUGdRWm1sVDQydFY3RnhuUTRy?=
 =?utf-8?B?MzAvZlRBaUdRTlRUSFNTNjV1WlFSaDlSb0ludEJjdHpjazhNYTJaM1RoOWlk?=
 =?utf-8?B?d3BtUzdQNDZEbFJKSzhTUzFuQW10NUdQWlQ3QmgzUDZHY1UvbURqVGx2VCt5?=
 =?utf-8?B?V3hRYzFxZUVPTzlKYnkxLzN1dHhOdk1YZ2lMSWZEeUFBMGdoR2hHS204RXhp?=
 =?utf-8?B?N05YRHYrNEtKV2ZCOW1aampBaWZ6a2gwOU1raUNJd0x2K0VHQi9OcU9XUVA0?=
 =?utf-8?B?SWVwV1Qzc25DZlpXUyt4N1QySWd4MFkyTW40YUZ6c0MwY3dMRmJPVFVTZnRG?=
 =?utf-8?B?YW9oNzhFOFFXTXhwR1hIYlRuT28vUUVZSGRsZUZQbFhuMk5aK2htdnpuQVZ5?=
 =?utf-8?B?RG8vS3dqbUFSUzBueTdtT2hmYVowUHN4WkhKUENUWVRGd0wwdFRLQWZrVGNa?=
 =?utf-8?B?b2VuVnYyN24ySDZkYmNCd3lpYndVNUZFQk1tS2RwK0ZUY0ZjY1lKaXJ4QkFz?=
 =?utf-8?B?MGk2dkNJVk05WThDZ0poUWkrT1YxamdwS1k3Sm1tZmNXbmhjdTZ1RnltMkVi?=
 =?utf-8?B?U3FoRVBGR1pyai9uWmZKcVFqTW4xV2RQUnBzRExRSHpzcmdtU2VEVjJkaGVw?=
 =?utf-8?Q?IKE4xgMC1syA7UimQZywEE52A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952f785b-63df-4feb-ef67-08dd8c6ff880
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:09.6669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIsOLeGxueiZADrOXGnBJBDgHiEhloVDZGRKZhGYmlkGQZlUwtYPJPf/NbIILYtkT0HlJwRBLIcfH5G33QYcDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

From: Peng Fan <peng.fan@nxp.com>

There is no in-tree user of "include/sound/cs42l56.h", so move
'struct cs42l56_platform_data' to cs42l56.c and remove the header file.
And platform data is mostly for platforms that create
devices non using device tree. CS42L56 is a discontinued product,
there is less possibility that new users will use legacy method
to create devices. So drop cs42l56.h to prepare using GPIOD API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l56.h    | 45 ------------------------------------------
 sound/soc/codecs/cs42l56.c | 49 ++++++++++++++++++++++++++++++++++------------
 2 files changed, 37 insertions(+), 57 deletions(-)

diff --git a/include/sound/cs42l56.h b/include/sound/cs42l56.h
deleted file mode 100644
index 62e9f7a3b414f6d1bcb651b22f7f8bd1f29b0eb3..0000000000000000000000000000000000000000
--- a/include/sound/cs42l56.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l56.h -- Platform data for CS42L56
- *
- * Copyright (c) 2014 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L56_H
-#define __CS42L56_H
-
-struct cs42l56_platform_data {
-
-	/* GPIO for Reset */
-	unsigned int gpio_nreset;
-
-	/* MICBIAS Level. Check datasheet Pg48 */
-	unsigned int micbias_lvl;
-
-	/* Analog Input 1A Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain1a_ref_cfg;
-
-	/* Analog Input 2A Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain2a_ref_cfg;
-
-	/* Analog Input 1B Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain1b_ref_cfg;
-
-	/* Analog Input 2B Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain2b_ref_cfg;
-
-	/* Charge Pump Freq. Check datasheet Pg62 */
-	unsigned int chgfreq;
-
-	/* HighPass Filter Right Channel Corner Frequency */
-	unsigned int hpfb_freq;
-
-	/* HighPass Filter Left Channel Corner Frequency */
-	unsigned int hpfa_freq;
-
-	/* Adaptive Power Control for LO/HP */
-	unsigned int adaptive_pwr;
-
-};
-
-#endif /* __CS42L56_H */
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 0201206518cd9ea8ecfb823a96fb59cae37c36f4..9c58d4f08692871c5baf2702c73367287735cf24 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -23,7 +23,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <sound/core.h>
-#include <sound/cs42l56.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -33,6 +32,39 @@
 #include "cs42l56.h"
 
 #define CS42L56_NUM_SUPPLIES 3
+
+struct cs42l56_platform_data {
+	/* GPIO for Reset */
+	unsigned int gpio_nreset;
+
+	/* MICBIAS Level. Check datasheet Pg48 */
+	unsigned int micbias_lvl;
+
+	/* Analog Input 1A Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain1a_ref_cfg;
+
+	/* Analog Input 2A Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain2a_ref_cfg;
+
+	/* Analog Input 1B Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain1b_ref_cfg;
+
+	/* Analog Input 2B Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain2b_ref_cfg;
+
+	/* Charge Pump Freq. Check datasheet Pg62 */
+	unsigned int chgfreq;
+
+	/* HighPass Filter Right Channel Corner Frequency */
+	unsigned int hpfb_freq;
+
+	/* HighPass Filter Left Channel Corner Frequency */
+	unsigned int hpfa_freq;
+
+	/* Adaptive Power Control for LO/HP */
+	unsigned int adaptive_pwr;
+};
+
 static const char *const cs42l56_supply_names[CS42L56_NUM_SUPPLIES] = {
 	"VA",
 	"VCP",
@@ -1169,8 +1201,6 @@ static int cs42l56_handle_of_data(struct i2c_client *i2c_client,
 static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l56_private *cs42l56;
-	struct cs42l56_platform_data *pdata =
-		dev_get_platdata(&i2c_client->dev);
 	int ret, i;
 	unsigned int devid;
 	unsigned int alpha_rev, metal_rev;
@@ -1188,15 +1218,10 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 		return ret;
 	}
 
-	if (pdata) {
-		cs42l56->pdata = *pdata;
-	} else {
-		if (i2c_client->dev.of_node) {
-			ret = cs42l56_handle_of_data(i2c_client,
-						     &cs42l56->pdata);
-			if (ret != 0)
-				return ret;
-		}
+	if (i2c_client->dev.of_node) {
+		ret = cs42l56_handle_of_data(i2c_client, &cs42l56->pdata);
+		if (ret != 0)
+			return ret;
 	}
 
 	if (cs42l56->pdata.gpio_nreset) {

-- 
2.37.1


