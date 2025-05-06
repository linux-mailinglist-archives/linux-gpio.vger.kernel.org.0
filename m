Return-Path: <linux-gpio+bounces-19655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E8AABBD2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6E74A114D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1109423C50E;
	Tue,  6 May 2025 07:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kd/jIUZt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9D23C390;
	Tue,  6 May 2025 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516690; cv=fail; b=RAV+s91bpF+FswcPo4k9AI6oCup1vUXbOkrv1sn/YpiyFJncE3lAjDk1SsZjx+3igj3KXjXRJ8MZKuUoFGVwbcperOZimW/FpJF+iXhERO1iZrYNuKYKkzjI/sS6xEH77xB37UUc9b9TckT0DarNYCL0IlQVNb+XYrr5W1hU1aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516690; c=relaxed/simple;
	bh=loGsb8BxVV8cN59KlSXd4XjQDzgQcKtScg539R8bxEM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LuHWV2Lh2uW85/SV+YuzXw/jFUKUgOtXI0Hsu3zfwbY5u5jfqVoZz2pJ9mPDTqJa1kXem1pybN5A/06X5o+tuJnfml/6kK3XEe30g/DM7BhQbvi1ZFqnvGSMkpN95liYFUHaEtnMOap5eYopn/VZv0y/3BwXPK4adS+re5IxrcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kd/jIUZt; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1N2FPBuYeHamzwWu+qqu4ZP0Nr5DrJ2qVeN9S0Q6BTBkFTSRXnH9o0WUlLQPtenND6ZG5fLb9Wbg3hLi4GjEir2DtITHxOLSu9DaH6wy06TCh9iI7mgBV8gYmgcWHDblvvivpm0qi3axSeUzx0WSoa2/4JjREUlcPw+NOM/s6jIBlffglrJyfo0TYz4vTWi/R1M3CdP4xN1NvPf7cX+ZrofLxIyoz2Z2KnaMcdeYNMl90qJm3ecEhvWof66krz4+DQZ5Yw/N8jiimeCcIeMpYhDNCN2dAApKQywNa7A2t+H1peZ9byxFiXf/p8DxdHLlZTc4h3X2dj56mOgG07Ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6VsyhUjYzbIhuCFZYke3WjMogqPQM7yhWcLNVJYzbQ=;
 b=jFFpzGwwBeRAjFNguB8V200ssQSUleodR5BPjozrvAOMIRcyyZcBYrXsiUgeQRhbARck52C+0Gifk0drL46zErqlFoLRtm2seeq8FNNnXT/Aq2XiyFqrx94/6xiGyxFP5gzs7ZNOUQBCGbMfiVZr2h7+k0AI8LtUv033t57Ig41wCI3VKG29+uBVh9Mdmm2kwGMer1W43vU6XFd7fM/a8MXHiREKEG3VyEf3/6zDJQf4kpczCswwGyZk0KzUldyjj4bMDnxSLLZhpQ/2e8TXND9e3CXLlQsZkkip+4+7DiakctDCmrgZ1nhjc68r9XeEChyIrerpKAFOavyY47jZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6VsyhUjYzbIhuCFZYke3WjMogqPQM7yhWcLNVJYzbQ=;
 b=Kd/jIUZt0ghKR+1AAL3lFXGpgzRwsFSi9J4OONQnH4bJGpVvwOpLknbBaR3q+b0ngE3BNIqgvLMELDYqb70H/oyPp8twHMIcFAh8tpYUrvuBX4133y0jdiqxCB+7EZMYJfLTOvTeg8LLQKR6I4Z4QUaCZreJufozuO/uvVIBmSDoRsV9XYWvZQpWxa22o1QmnPKR0SAzsAyCWOQDt86lDPuZvPb1JZZSQc5QBfXmHibpDPMQjP769+Ksm7t3jqyNnm3tAnPLM6k0UzEAiTtt+Tq7pARDumfiAaeX462QK0n/9j/r05chXJpiZnzhAEY4dEM9RJxIAssBU+XPpFuaFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 6 May
 2025 07:31:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:36 +0800
Subject: [PATCH v3 6/9] ASoC: codec: cs42l73: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-6-e9496db544c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=3281;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=EJwDsMlb68b2TeHr3o9byLSOgFkhPb3M5yScw8I2Ms4=;
 b=B5PwnJETGNUr6rUlwhjL86Oddm8Jhy8HPlS/c+LOQE+AZx6AzSxU2ywKUt7NOEKQQKY3KdoyD
 AA8a9+dzkT4CuOtpB/uSkYZTmum8Q433qtCWGOjM0NNg183vhBLnUSn
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
X-MS-Office365-Filtering-Correlation-Id: 61fac5d0-f142-4cea-177a-08dd8c700254
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlIwUFVBWnhOTzU5c3poS3lGd2JXSzNQVDhmUFNWQmpFQ3dLTGt3M2EzS2NT?=
 =?utf-8?B?OGFQR2YwVFpsUjRuaGhCWGdCWU5EK3VjSERRL2kwWVlpQ2t2aGRKWDhWVy92?=
 =?utf-8?B?OTJVYnZXbm52NWxCeU95eWI5Sm1QV3dVSCtkTWtmdXdVS2lKUVRGVVBtOGt1?=
 =?utf-8?B?RFFEd3ppU1EvSmcvY1d1SXpXOGJrWm9UZ21sWStzelplcjc5SW5PRWxsVkRn?=
 =?utf-8?B?eWZqcEVEMkFHd2tsZVphR3FaSjBuODQyRWR3dXBKYlJpZmdDRHlYOEkvUEF1?=
 =?utf-8?B?S2JQYWZOMmtKektac2VPb0JoL1FUdFRMTzZxbXYwL094MUlwcEs3TUlLOWRz?=
 =?utf-8?B?RERoMmttdlFlaDcyejA2SHZUS0o5VEFCVWNHRVREUlV2b0NRSEVRVCtybHIy?=
 =?utf-8?B?QlhUNlFJMmkwQXF2NWhmbUVqVGdCamVvek5MTDhHVU5BbmdjbHBzS051MlNu?=
 =?utf-8?B?ZEdMYm9KbmlCNkJJd3hSQUg0NFpWUVBKUEkyc05TODFNMzZBaXFXbnJlZXh5?=
 =?utf-8?B?d29iYU9IT3JuVlJ3cmdvOGlEZGtWU0F1d3NvVmxSVkxoS3liK054a0w0QXBy?=
 =?utf-8?B?VTZsU0RCVkppdlRYT1ErZi8xaUZNZVkyQkpQSW92NmVSdU1BRDByNHdac2x2?=
 =?utf-8?B?SWhsTThBL21VTm5Gcm5iQWxvTG9sUU93VktORXo3ZGJ5dVZZZy9PQmhlNzUy?=
 =?utf-8?B?NUlzaFBkUEIrM1dIMGtrSkR1STZFYzBJUmF3ZVlyeFRLWXZJazJEYTl6d29q?=
 =?utf-8?B?ZUdTQWxPN2l0VHdIdHNzdW1vbVh4eVdncnE0Rm83aG84cEFNWkdRcHFBazcr?=
 =?utf-8?B?SEhjRXpyOE1EbG9NRW44Mmh3VEo0RjQ0bk9XWlQzc0NYUTBQZzdxQXBoNndm?=
 =?utf-8?B?M282YmU0TWN4SXJkTzdWS2YrYlB4L0E1dnFOSUtXYkd1N243WUw3MmxMSzhq?=
 =?utf-8?B?aUhaYkpPbG1FYi9iY05tb0I3WU05UWg2QzU4Nlplekt2bHJ4MEdOV3lPSVd2?=
 =?utf-8?B?NjhRbE5La01QdkcwWmVGWXRpNGpxY3l0cU44WFZDLzVjVWJIc1hxTzZYc2hi?=
 =?utf-8?B?SkkxdGl6RzJzTHQ0MjVzUHduWmhYQTZvMlc4VkdsN2VqZTJCdWdHSnhwdHFa?=
 =?utf-8?B?VnRTeG5sK1B1MGFkb2RTWEYxVnlsUDM3SCtYQjVFNUpOenRLZ1UvQitCTXl6?=
 =?utf-8?B?NjJzQWM4dlFxTHpCUElWK1pFT3Z2WGxvT0RRQkR2QjR3SHE3UUh4RURmUkYw?=
 =?utf-8?B?WENoL2lWOURUWXZ2bHBUdWpFNE02b1FVUzkraENsakRMOE5YTHRGMXdISVNM?=
 =?utf-8?B?L2IvWndOSFFZb3VsRWJlZENmbjhDR2N4d1owK1hNRFZrQlYyZGc0UW9hZ1pk?=
 =?utf-8?B?RGt5WTlEV0k4Z2FiSnMzRGFxZ3dSbUJhc2sxenRiOVFML05Ud0lWVmhLTEZP?=
 =?utf-8?B?ek40SmwyZjF0UXBNbmY0S2dqVW91NHZVZDdUL3JpU3Z5ekVTanVoSjZUSmky?=
 =?utf-8?B?YmUvVFhRWFZCNXBXRWlUdG1vQ3hmK3dac0lQRzJkbUJPQ25Fejlpd3kwUnpt?=
 =?utf-8?B?TkNrcjhjTnY2b1lMMTRzd3gzdnl1SElSVjljblZrcnkxWm9Fd1pYRTNVMlcr?=
 =?utf-8?B?MzMvQU9heWd3b3pZZVhOZmZNdCs5U3dpcWpjdTFDVk9PTlFDZW1mNTRKbkFQ?=
 =?utf-8?B?ZlFaR1VLbnYxdUFJNUlPZ2QvdnNmdTluWnFteWk4cEV5VGdpWi93amtpem5w?=
 =?utf-8?B?OUFVcDNqWWd3eUhEWkJrVlJqcnhJa1phd2d2SUh3QkZQd0xBbWhkeHNEbTBR?=
 =?utf-8?B?dVFHZGZOTTIxY2ZHcHZneUd6eUZuWU1NNjB1RU5DNkJmYnBxY2R0V2dIcUtM?=
 =?utf-8?B?N0VxTW5aL28zNXg4MmtWRGJ4UTJLZ0VubXZWQkJBU0pFZUNaYm1pSTlweVZQ?=
 =?utf-8?B?RDlSWVVqTURvVzhsNmZDN0lQOExyR0IwNGNrQmREZVFoUElKVU5UZ2VFKzdl?=
 =?utf-8?B?dGdPWnNObExRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEFhVFV5NjlhSFF1cVJOSm0rVWZSS3huQ2tQTG5ISkNtakRwUjR6SDF2UE9J?=
 =?utf-8?B?Q3J0VHdLV0tOcUpTSTRFNFUxNE1QZCtyV0pZQURZVk1ObFlFbWpTdUxQK1Bs?=
 =?utf-8?B?blN6alZVTXlHRDlmbzFndDQyMml6bXBsUE9yeFdZNVc3b0xlb0ZnUXR1RWtu?=
 =?utf-8?B?OWI2eW1kd0NQUWJZVytJM1VZYUtkaFUraDRpalZPc3BWZGI0Z2JFb2poaTdC?=
 =?utf-8?B?MDZjVnBIQWtwN0tOZGIyS09ZUjZMRzd6K21WVjN6N1cvNEE3V0ZsUERBSXV1?=
 =?utf-8?B?RDUxa0llSGJiZEpRVmVadzZGRGlEWEl1MGpmYkY1S0RNZnNmcW5wNFU0WHox?=
 =?utf-8?B?a1hwRG5XdDY0QWUwU0pjSTB2RjBoMGVTRTQ4ZHFtd2dLaTRlakVKNXN1b3J6?=
 =?utf-8?B?QWFPRzZ6elhLbXJVeUM0VVF6cW1DSlk3NXZVK3lBSlNiR2dKd01EYXA4aTRM?=
 =?utf-8?B?LzdtL3ZQZkl0Yk40dDlienNJOWJvQVIrYkhjTW5LaEVvRHR5NnBYZVNtZjdB?=
 =?utf-8?B?Y1NmN3R4Y1F2MXg4UVZlZkRxSEEyOEd5SXFQR3lRSHEwV3VhM2s2M1VXM2k2?=
 =?utf-8?B?OWkzMVVlUDUwRnByZ3QvYkFrbTd5a05PQXpMb3k2d2UxekhwT1E1VjlXWHRP?=
 =?utf-8?B?aHRTY085Q3MrS0Q3cXFoTmVjMTJ4V1pNNnl5eFJhQklyRHJNM05YeFpxdEly?=
 =?utf-8?B?NEJlaWoxU09hc1MzRVo0Wjl4L1hJMkdURWJEL1Bwc1lpMnJFYm1OZGw4VGhl?=
 =?utf-8?B?ZlhXYmZ3Wk01MlVoaExPclRPMU9NQ3VLODlsZWJCdVBURHZGTlppR3VPZzJY?=
 =?utf-8?B?UWdsZHRFVXEyRUNlT3cySE1LWTE4ZWhqTFoxN0lDaVMvM2RsUS9kdStpVEd5?=
 =?utf-8?B?Z0UyK3FDOHBVV1Q3cmdyc3NMU0JhTlY4dlhsTFR3ZEZjeTVTUjdORjZ5Z0o3?=
 =?utf-8?B?NjZQZ2wwbzM4ek5YbTZwY0VLa01ZK0kxZ2owbnBGQ25zcFMyNG9nTWt4NXNu?=
 =?utf-8?B?STd2STlOcEpuam5wR3JvQzhGSVNkMHMxS1ptYkdtOXVUSGJkOG5UdnJWY3pp?=
 =?utf-8?B?d2dPOUJjT2M4NWNJdUtVV3BSU0ZpTlRUY0wzUFZnR09oZmtnUmptNEZ3R0NL?=
 =?utf-8?B?MGlsMngxMm0rUTIrNHo4YnMwQ0NCRkhJWSswTzE4bUVUSjdnUkp4TnRyVHJ6?=
 =?utf-8?B?SEVJQUd4djB6MkptR2lGN0ZyM3FBT3M5dlV6ZkkveG9LbEZMT3dFTWg1L3dm?=
 =?utf-8?B?cnRZN3gxdllJZ0pnRzMxT0FweWMyZDdqN3hwQlR0QjVxSGxzVWl3eEI0ZEMr?=
 =?utf-8?B?Z28ySHJTVFpIdGtzeGhnYkVsL1dOWVZSbWNDUTNvdW82ck56eUN2VGMwamtQ?=
 =?utf-8?B?aWdyaDIrUitURTN5TkUzV050TWloMDBXa3owcE9ob20vNkQ4Qlh4RFlEbmJz?=
 =?utf-8?B?Z29McG9ad3ZJc3VHM0dnWjkweHpuTUd1NHhhUU81UFlyRElZOFZMWC9WQTBD?=
 =?utf-8?B?U1NUZ0JPY25CRndUUTA2cDRqQ1Z2eW96dTJLYmptU1Nsa0pTTnkzd3VhbHVJ?=
 =?utf-8?B?MDdtYmRFbVJuTGxWVVprUk1aVDFpWjNISUUwV1hZTlFXaU9WSzZoMlpnbndq?=
 =?utf-8?B?bVdBTDdkMDZVTFNZWXQ3N0ZhNFNUVEk4TllZMWcrTkxKVThJV2ZLRlpmNkJ1?=
 =?utf-8?B?RWQ5d3NSRUphV3paSTR0NXowdXRuejJMK0JESnRPc1BnK1lxUVhPdCtkbUNP?=
 =?utf-8?B?SGl5NmFBb0xoQU1EUDJLR3NyK280UWIyNldTRU5MVkx0OStvSmhQOU9CaTF4?=
 =?utf-8?B?cXFhODIzWEpHWmRlK2hoSWl4a084OWFUQi9yWW1rTkhxakpMRlNYQjlmbFJ0?=
 =?utf-8?B?aXRrNVNKbVc5cDNqNUZpOWV0dHdIK3BORWV5QnY2UlNLN05xQVlBclgxWjli?=
 =?utf-8?B?bVFDWFR4NnBWSXpwdmk2RzExd1pKbjNjRVg4dHorQ1lnaDVGRWNjZFRLU01k?=
 =?utf-8?B?bEhESnQxQ2xxOVhkK0hyWnBxVjB1SkZUSWswMkJCNjFleWIvZ3RjaG4ydDBx?=
 =?utf-8?B?aThRcVlSUUJhRGd4bGV6TTR0SHdPZ09qWXNPbENmRG9POFlNM041cjFvS0Rr?=
 =?utf-8?Q?5Ho4n/8VmOKd04CL8HJphenlE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fac5d0-f142-4cea-177a-08dd8c700254
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:26.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMVZ1sGK6vayxarxDPSlyyEg2nrIrfeXfrCsWBRuR/Pz75fDkNv7gCj/CJkd+K7Kcf6rf+sDexmoCl5h0QvB/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

Checking the current driver using legacy GPIO API, the
reset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, Hold RESET LOW (active) until all the power
supply rails have risen to greater than or equal to the minimum
recommended operating voltages.

Since the driver has been here for quite long time and no complain on
the reset flow, still follow original flow when using GPIOD
descriptors.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
no in-tree DTS has the device, so all should be fine.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l73.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index c09c23487d2e73340b8947ed0e1ffadb24414e7c..535a867f9f2a6d32986190c4302dfeb1e9f06913 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -9,12 +9,12 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -30,7 +30,7 @@
 
 struct cs42l73_platform_data {
 	/* RST GPIO */
-	unsigned int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	unsigned int chgfreq;
 	int jack_detection;
 	unsigned int mclk_freq;
@@ -1307,23 +1307,19 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 		if (of_property_read_u32(i2c_client->dev.of_node, "chgfreq", &val32) >= 0)
 			pdata->chgfreq = val32;
 	}
-	pdata->reset_gpio = of_get_named_gpio(i2c_client->dev.of_node, "reset-gpio", 0);
+	pdata->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev, "reset", GPIOD_OUT_LOW);
+
+	if (IS_ERR(pdata->reset_gpio))
+		return PTR_ERR(pdata->reset_gpio);
+
+	gpiod_set_consumer_name(pdata->reset_gpio, "CS42L73 /RST");
 	cs42l73->pdata = *pdata;
 
 	i2c_set_clientdata(i2c_client, cs42l73);
 
 	if (cs42l73->pdata.reset_gpio) {
-		ret = devm_gpio_request_one(&i2c_client->dev,
-					    cs42l73->pdata.reset_gpio,
-					    GPIOF_OUT_INIT_HIGH,
-					    "CS42L73 /RST");
-		if (ret < 0) {
-			dev_err(&i2c_client->dev, "Failed to request /RST %d: %d\n",
-				cs42l73->pdata.reset_gpio, ret);
-			return ret;
-		}
-		gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
-		gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
 	}
 
 	/* initialize codec */
@@ -1360,7 +1356,7 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 	return 0;
 
 err_reset:
-	gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
+	gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
 
 	return ret;
 }

-- 
2.37.1


