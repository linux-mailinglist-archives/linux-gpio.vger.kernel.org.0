Return-Path: <linux-gpio+bounces-19654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AE7AABC08
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579B91892864
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2877D2367BE;
	Tue,  6 May 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CvlPCqnJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2972367B8;
	Tue,  6 May 2025 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516685; cv=fail; b=BPf+J/lLPSDzHxHtlLJp1Eqqh/KOoVAeXUw/75Gz0qyn2/Cb2+oTXi8Sc4QVfVBM9wUcWF9GzmYn12brKZMriLTqLcQKlRRcs63jyBYnLlzZ0NLvji/LQfqRrY995Ap+zzMxd/3oYdxJIBH03d3jWEMhYHqwrtd4779uxenAedI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516685; c=relaxed/simple;
	bh=ELs0prRj4buO7DOMESGbfYW3eNKKzXbPc6UawqTh6bQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AeOYKocQfT+rMUavXb7OlbvCtM88zTNN0aK5Qz55lV4uQ8ScbRodMqiesO4zCPmf89Ot7H2HRCLq6jfGsLcDFYcp+dTicTnClJdXzBM17ae3O9pYBOgXqGTs7hkXkgS55Hp4aEJeIol4Y/dnO/B/jPZ4mFxGK3vULBstBMwzwoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CvlPCqnJ; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFPpNeGVPtAwqvZPLRoFFnX9HADd19BfzNIeHn7w2jukODalFiEfYrvPqc4lgHDN4RNGpbHBRPbSdeb8qCtsb+qe85B1iRMhe6aTy4Uo1HcrKfD3B5t4wjwgi4NmYynE5v8fPnlxj5t/4mgcffPsgMQ5z3e2hS6JQ8sWZ1UC9JoAz1nhotsFtgyBqfSV7Ic087CKM6bggrs2j7Gx8hDLcvpovBne9anhYWpjQkc39cpG9C/9zE0ecO9u7oAFxCwy3vleTJSkt1VhAFkzeGcGblshehkznwtpjLLhSQtjpTdCwRNyKA37cNraLbVO9doN2BEIm3D9g604SKUYfbtB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4BbDRr0H7lZYE/FYwfwbyAmQbK8yhyjyFqJ7j7fmjA=;
 b=FrInssJZFewrJdUvNCgtM4qBb7DG68ts6SygRjqotHPSp4DUnUOj3mrMCnpoCrzh3y4xBgvQuBRhxY99s9mdVZdVo7ebz/eeW+JNCledu0MTxes1sprVMRBBzDfyEmnwCxAefL15MtwsPCkHH6vRsP7100txOUySdssGN3BxGZYRjzd7lYQM8vfqUuXPQzfWj/e7j0yAtZUauCaAu3fUsASY1ZoQ5U7ytSiHZMnzUhbGH+tZKHXVIJ1CSU4OTdopjA63E5i3MRVUIP4Bp9gOHxqlD7S3Di4Uho8XTMosGEPBL28NTr1MzXqxZMEaF5yToVWXfrkRhw/goT3yQ+QsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4BbDRr0H7lZYE/FYwfwbyAmQbK8yhyjyFqJ7j7fmjA=;
 b=CvlPCqnJsU6QB7E/iMIIyBY6lnZd7bmhaX/UXzk/JMNhfB5ZOYguQM9sTtHTwraNLPE7NzrNomsopwE0qMJxsBZZS6KivEpnLk35tRB888+1WPLcLNHL2Zaatb716LKUCFof90QytanHmgmpBItE2esP1TJdgs5ADlquAp77ZUzZOpWXmn5SlgnjvrYZrZnZPi10Qjvvv904p2J0n/pMh3EEpku87h48G7q4izJ/CyaXWiZkUWKYt8KzAeI3MkcmAwD5zb76aXu48K06Bcb+rwIm6YZMbJzFzSrZAHhgZBbesVhKzEIZLJR6B3thdk1EwgT+tcjLAYdhbZcaIqPrfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 6 May
 2025 07:31:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:35 +0800
Subject: [PATCH v3 5/9] ASoC: codec: cs42l73: Drop cs42l73.h
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-5-e9496db544c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=3246;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=rew4x52/zX89IH2Hq3pLjiqBbHThbPuEbhuzSoJGRZc=;
 b=ERoDdILtRWmt0EBeOeZV2nIaV7MEQOL3MLHY+uR1KGi91s6zs30d4iGb7K9+xFf3deckHuscY
 TfpcJnCxnxrABJKeKJA0oD8gs3uf+ZYWGyTC4wUO6tsbDajwIKruRGK
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
X-MS-Office365-Filtering-Correlation-Id: c26903ee-eac1-4376-d5e6-08dd8c6fffda
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2JUNnVOUldwVXk0YXJqZVY3N281ZVBpWFRCTTRsT1VUaGZlLytCZmczN3g1?=
 =?utf-8?B?QkhiNTg5WGFnenN6YWd0OU43dlZYRXNkdXNPUEgxN0d2U0QxRjltOHVyL2lz?=
 =?utf-8?B?QXRrRGg0U2lkRUMxQ2loZUU0SlRwK0dva25CdE15OGZaZ1VBTGtyR0l6dU1T?=
 =?utf-8?B?OEVRSUZmU3BmalJ3cDc0dmk0cSswQ2FaNWNZOENVQlpXUDdldlhBWmdQalE5?=
 =?utf-8?B?S3N4b084S1hTc0pSWHp3SDlQYjVGQVFlSWo2M1Mzd0tVb1hRR2ZsZjducnhR?=
 =?utf-8?B?S1JFOWRSYzdjMWgwNUxwdlpSZlFVY3ZmR2piUmluQjBoOGRKVnhQM1lxTWpq?=
 =?utf-8?B?Y2p6N2pkUm14LzZkUkY2M2J2dUt6MGF2VXVHTHBQam56K2ZtazJ2M3YvakRN?=
 =?utf-8?B?RzFXTFVaeXBxakN4UlZydDdEVFZURGUxbGVNQ0lXT2dOOFBOS2p6dHJOb1Vh?=
 =?utf-8?B?dHRPUTQ1Mm05YmpKMk50bEh5L2xCaU5ZZkFJb24reWJ0NWZhT1ZjUjZuTVNt?=
 =?utf-8?B?a2pVcm1jTW5TT3c0SFJhWStsSEZEcVpJMjNGbERBS3pJekhOdEVKSEltai9r?=
 =?utf-8?B?VWhPMGd6dmhUQzJoUnNiMmlLdVM3b1Qxa3AxTE4vMTdEbUlHVnNKQmtKY1J2?=
 =?utf-8?B?RGIwU2ttMXNzR3lKMU5nb2cyNkIyNFBSMXFyMmsvaGJ4Q28yL3REMFR1MTZR?=
 =?utf-8?B?em1DckRGSkRUY3U5Vi8vWEJaNWQ4VGVLcG1kVTlZeVJWbDBWNXNFdFJLR0J2?=
 =?utf-8?B?MFhhaWFiWE9CWHAzR3ZNMkhCamxQdEcrLzdFUTAvblBOUVJNRHBReWxDS0tp?=
 =?utf-8?B?VlN6ZDByS3czNGFnMlVCU29UdEpvdzJKdHppSlNDalp3UEs1ZlhFcDB2K0hs?=
 =?utf-8?B?ejBtcE5vcGU3QURCbDRpODNFOFVGaVptSlRNM0xPTFl1a1JEUkFGbkFJMFJR?=
 =?utf-8?B?Um9vbEowUkhhNG13eW5KR3dHQXJJaEhMc2ovY1NQVUQ3dlZ1NEk1T3ZpYWJv?=
 =?utf-8?B?Um4rWkNRZlZlTlY4UDhONlFOczA4TjlZTFdaOTNNZXg3NnlYNzcydGlzZjB0?=
 =?utf-8?B?ckx5cHhXYmxsUlF6REduMzJiSnFHWWxtdXpMa2VKbUhtQ0pjd1huUFp2Y1gv?=
 =?utf-8?B?Q1hSSWJYYVF6N2VHQXZ1TzhXU0lnYk4wNHhYUGZHNnN2azBnZnJJK3VQcFFS?=
 =?utf-8?B?UFptVUFRZ0U4S2tTdllsOVpTRm1Ld1hJK1RlWHU3NjZlSXdMZmd1L1RlWlEy?=
 =?utf-8?B?RitDTFpmNnNISlpxMTBCZ3JMbkR4c2JlSk9OYWw3cFpPSE44K3A2ZW1SbEhE?=
 =?utf-8?B?WTFoS1IyNmxKY1hHUnN1T2tKVitNeWJ2aERHTml6ODE1aHpzam01U1VkbU5q?=
 =?utf-8?B?WFZDM25jRnN0RmhwVVQ2N1cyTFNxT0l3WXM4QXA1bDdhVVgvNjFkM2pndkIz?=
 =?utf-8?B?VmxlNnFUcW13em5qNDFWUXRHdjhQa0hLWE5YMHVpT3JlVTNFWWxPb3diTmpL?=
 =?utf-8?B?TjVCWElPQVNTblM2WnVxVFAxRkcrTjZXZWN1RFFhcHNoVHBhbjRieVJ3OG5z?=
 =?utf-8?B?SFNRZ2J4eXZXd2RlNjB3dUpWbCtjL2xLZkNKYU9GSE15M2xhdG1xOGJ1MUNQ?=
 =?utf-8?B?OGxQTzZFYTByKzRyRnJDNnYvVzJJY1hJWXAyYm5rUWJCWTdIU1FPWW1rYlNB?=
 =?utf-8?B?NlorNzk5SjN4a3RVVjFNYmZiM0ZrVzJGNGNBUFRVaUtjKzBKOCtkbzBJN1Vr?=
 =?utf-8?B?Z1NlVG8wNnJpZjVIUGE3Vzk4WjFXQ1gwUHg2NldLZGwxclFmRHhhbHFMZnV1?=
 =?utf-8?B?RXBpVzA4ZlhHTzVJVW02SG00ZzRmWEJyVVMveTduR2ZHUy9CL2l2ekpoNXJj?=
 =?utf-8?B?QlcyYllvWnJVR1pSMXgyaSt5MVZJTkRlclVESi9EdS9MS3o5RFVLMUJBTXBO?=
 =?utf-8?B?cXJyL25EemF3TmxCS0tUVXY5S1RtdXU1Y0hSLzVNcjVNSnA3VWhnd3VabEd0?=
 =?utf-8?B?UXJvTW0zYnlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVMwZnVZRmJoenM5a2RBbGNFU3M0ZGRtOWVpTjA0TmFnUWZzYUF5OTlrWFlT?=
 =?utf-8?B?bS9vVU9HQnVjVnRkWitwSkxWcGs3RVp1a2N0RSthT1pmZGpWMU1sL1VaMVVy?=
 =?utf-8?B?K3cxajlmeklmaGxBSVorTExDaHNML25HTWVMNmhJUTlGUSs0UkgrMVpPZFJl?=
 =?utf-8?B?RnNGWnJSeldweEE5aFhGWnB4TkVTR0xaRmNHTHNrTkloTktpZUtLVWI3V1k1?=
 =?utf-8?B?MFA0bmplM1JsYmxxem9PcnhXbkl5Nnkyd05xajRoSWFreWtFNlI5ZTNXVkV4?=
 =?utf-8?B?T0JTdmFtUlUwREF1UHBqZkdtNkxCQXFZOXZMbnlURnREb3FpVkhZOEdiTHNh?=
 =?utf-8?B?bUVwcnhROEhHSWNhNHI0dWdjdC9KN0pQTmlVb3U4eHlOakIybTlxV3dra0N4?=
 =?utf-8?B?T3NWU0tWcTVUS1pPMHgybGlCK0dRSE4zTExKOFc0d1dkN0R2NnV0Tit0QnRK?=
 =?utf-8?B?a2dRSlBTeWRiQmd6bWd2UEI1ODgxNnlUeU14V3huaHBOSHlyZDM2VHVOTDdU?=
 =?utf-8?B?QWVlbko5cGRTNVBaRncrYVR6OFQwL2N4UTVrNDFVeGtPV1JaZndrRTNmODJJ?=
 =?utf-8?B?LzZnbXZPWjVwQlUvK0p2UW1NdFJZMjhjaVFZU3FYeVFReGpaNS9Rd2V4bzVQ?=
 =?utf-8?B?dDRZdkxoSnROVzlSNEpianB5QmtJSkFnZHJMRVoyOGIzZzdUMWdmS295MUtZ?=
 =?utf-8?B?Ukk2YnhTSEFZL2NNT0ZlclNmck5icTJOcUJSM0djUVdMWHJLMml1ZGJocm9Q?=
 =?utf-8?B?WnJzaEFDbml1aU9EN1BnZDFlYWM3c0JOZDZNaWRrVXlVYnVtTlJlUzR2a2ps?=
 =?utf-8?B?UGdLc1l0U1VvV3VpMWhQVzN5TjFSamxIVlBsVXhYLy81d1BNcmcxUWdDMXJr?=
 =?utf-8?B?Z3hWQXo1Z3VzUGN4aXVzY3hCTWRzTW0xbTI4YitCMEYydSs2RG04Ykt1b2Vx?=
 =?utf-8?B?akVEN2tYUjBWc1FCdGxYcmJYR0pzOVZTRUF2VDF4YXJjcUtPb2Y0K0pVV0pE?=
 =?utf-8?B?UDk1S01VSXNtQzM0K05xMFJXdFJRRlRLOVJ0U2lFbG5XMGUxeVBpdyt3QkND?=
 =?utf-8?B?TW5pMTVYalQ5ZVkrb1g2MDJ3SEE3QzdqRWJNRGU1TkJDSE5FVWp1UnFyNFhh?=
 =?utf-8?B?SVVaUWhLaWh3czhlRnNsMEdJLzFveWVxc2xDVDBQZldGc2NnTTBnbTN1UURI?=
 =?utf-8?B?RkI3ZUJIWDlJMVI3azhTN1g5ZVUxOSszY0NDZ0pTRjV6WDJsSlp1Y1IzQ1ZL?=
 =?utf-8?B?bWtDc0ZtVXNOM0pieHo2UFdXcWU5ZCtmMUpsc29ENlVINno3NWhjaFRmcS9r?=
 =?utf-8?B?TFZTM3VXSGlHSFRraHZRdVhQMWFaa1V2blM2WnY4SXlYYlg2MVU3MnFKZjNK?=
 =?utf-8?B?S2EvQTZQTmk2ZUhwdUVJeDBzaVRPOGVGSURuRjRxRkIxdGo0OHZFWlFJTEYv?=
 =?utf-8?B?VnFxNVZQdnlWcW1GV3loN0xuSk94QlY5RGRVUXhDcDNMcHAxMkhSOTZlaGU2?=
 =?utf-8?B?WERaenhXVlZZaEFXMW9GbzJ3ZGhYZFhMKzVVY2FCTS96b29ORmZ6MXR1TUJu?=
 =?utf-8?B?L3FEdm5ITEVudDVEajdkeU1ONlpnR2lZemNvYS80RGwyMDFnNWdqbGE4ODNY?=
 =?utf-8?B?ZXdPdU1SQlJJSGI4RzNKWHJObDcyVE9rNFhXVWFKT0JJTkJGbmdpL2luY3gv?=
 =?utf-8?B?c3I4bHllOUdFSE82L0VRS1RzK1IwVEkwM0gwK1Awamg5bllnTUk1WEdKa05M?=
 =?utf-8?B?ZmY1alNNU3BSWk05S3hoSmttaXNIQktMNGF5TTlOTE5NODJGTGxpUUd1WE9Q?=
 =?utf-8?B?RjYyS3F2amFHNWN1TWllbFdWNmVHTlJnblNKWVRaZWZsR0Nqb0hlOWI0Zk8r?=
 =?utf-8?B?ZjVEVGpqaWNlT2l3ZXZmOWxNSkw3WFpUbTBVUGdLSUc3bzBGZnp3eHJTTVRr?=
 =?utf-8?B?QXNtN2JEVmpyUHppYlNMNjJYU3ZBSDdrNFM1SHFhR1FrQ2N1VS9ma3lWSnpk?=
 =?utf-8?B?U0poOVRUcWlVV2VGc1BTMVRNdkFoWDNoN3h1TWh2Wkl0Z1NQUzNUUUlHM0kx?=
 =?utf-8?B?Rjl6ZWkvMlNLSnJtclR3NUdmaGw0WFEvZ0doN2c1TS93TmhTY25NdHF0OWZ5?=
 =?utf-8?Q?muheJbDHMJQYii+0qVAb1PWo4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26903ee-eac1-4376-d5e6-08dd8c6fffda
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:21.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myeWEHwoy4KLdBcC5seE4FuaDIB3ILfkaFNzeeKm7dMrIc/WzBYRvEB9HN16r6JyWcH5y5OQhSaDZVGZyLhJ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

From: Peng Fan <peng.fan@nxp.com>

There is no in-tree user of "include/sound/cs42l56.h", so move
'struct cs42l73_platform_data ' to cs42l73.c and remove the header file.
And platform data is mostly for legacy platforms that create devices
non using device tree. So drop cs42l73.h to prepare using GPIOD API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l73.h    | 19 -------------------
 sound/soc/codecs/cs42l73.c | 36 ++++++++++++++++++------------------
 2 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/include/sound/cs42l73.h b/include/sound/cs42l73.h
deleted file mode 100644
index 5a93393b6124f746bfb7bf5076e4bd1f458019d2..0000000000000000000000000000000000000000
--- a/include/sound/cs42l73.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l73.h -- Platform data for CS42L73
- *
- * Copyright (c) 2012 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L73_H
-#define __CS42L73_H
-
-struct cs42l73_platform_data {
-	/* RST GPIO */
-	unsigned int reset_gpio;
-	unsigned int chgfreq;
-	int jack_detection;
-	unsigned int mclk_freq;
-};
-
-#endif /* __CS42L73_H */
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 556270befa941a69e17b47a15677e1c4f912b14f..c09c23487d2e73340b8947ed0e1ffadb24414e7c 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -19,7 +19,6 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
-#include <sound/cs42l73.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -29,6 +28,14 @@
 #include "cirrus_legacy.h"
 #include "cs42l73.h"
 
+struct cs42l73_platform_data {
+	/* RST GPIO */
+	unsigned int reset_gpio;
+	unsigned int chgfreq;
+	int jack_detection;
+	unsigned int mclk_freq;
+};
+
 struct sp_config {
 	u8 spc, mmcc, spfs;
 	u32 srate;
@@ -1276,7 +1283,7 @@ static const struct regmap_config cs42l73_regmap = {
 static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l73_private *cs42l73;
-	struct cs42l73_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
+	struct cs42l73_platform_data *pdata;
 	int ret, devid;
 	unsigned int reg;
 	u32 val32;
@@ -1292,23 +1299,16 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 		return ret;
 	}
 
-	if (pdata) {
-		cs42l73->pdata = *pdata;
-	} else {
-		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
-		if (i2c_client->dev.of_node) {
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"chgfreq", &val32) >= 0)
-				pdata->chgfreq = val32;
-		}
-		pdata->reset_gpio = of_get_named_gpio(i2c_client->dev.of_node,
-						"reset-gpio", 0);
-		cs42l73->pdata = *pdata;
+	pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	if (i2c_client->dev.of_node) {
+		if (of_property_read_u32(i2c_client->dev.of_node, "chgfreq", &val32) >= 0)
+			pdata->chgfreq = val32;
 	}
+	pdata->reset_gpio = of_get_named_gpio(i2c_client->dev.of_node, "reset-gpio", 0);
+	cs42l73->pdata = *pdata;
 
 	i2c_set_clientdata(i2c_client, cs42l73);
 

-- 
2.37.1


