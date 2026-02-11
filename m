Return-Path: <linux-gpio+bounces-31621-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHdrGBfujGmSvgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31621-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:01:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F03A6127949
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D04B630530A6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DFC3563FC;
	Wed, 11 Feb 2026 21:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aftXAoGm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9F14A91;
	Wed, 11 Feb 2026 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843630; cv=fail; b=c1FzExEm8BeSUKE/nXPcqIk+Hm0r2Oc+3g/3jo0aCizTjJPSNuBhw0HkPFSg3k7rH07XQ4lkQCWu7MQdueIVzuHxCqREdx8NiISIPoMpAWICjXnjQzAXlBDn8SZVEj/rzgoX1bYmz0G6RwTKUiXRNKqNgRuzQo2nf+8rB4YbL3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843630; c=relaxed/simple;
	bh=/kvfR07Ht6Zk6bfUHWvVKbV4vUQMgwIjO7Ny1Sxyg4U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FQUuO+Wu9KQLBjzaaGgi8BKWLzCayC2ubkHfYTdfDIjjuATJ3UXUVQEHsZtunTdqZ7zOG2FgYuJvTO3SKPCWCMcHD5n/2ZfJRE/gzz6QrE4BmX3uQKBbmt9PYDicaifmn9sVzxwjXYoNZ3ysjStK/Em4LRJ8goCtAt55BVCUV6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aftXAoGm; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HP4qiXsDVR61iH/2hX96eFQUWMpzp7Zp6XQ5QvUYqFSYzxl1T7Xh9aGT6H9ujs214DFFpkF11alw6GsyxBExoISL+8e9jegOtbbX8BkliBHekP8deGLWx5cnvrrfk6PiTUCR6XT9aBEz4VBAMMpAw4nAYD332/OQOMKUxpGdT0PACHZd+4Y0fA/MNfhihqMtTL+ggr0YGTG876IDNNZs5VsIXRcgMZSdhJCvSblAv4OO/cVMyYV0bvspgotG+vCimU+yxTcm4zQkS0h5/J7AcEuq43hdd3xSee1uZxhzEaIPQPEBXz6h/aNUVCdwWV1Q7fpcDlLOaiydteQZMMlkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ia2WEjnnH5MRmyWwVeqGD9whKPWinXARhvBaifEcJQ=;
 b=Hj4L8iUxIsWTtcLbFJVV+c89oXym6Dz3N+iPHucsdWzg//4B37YVA/JTnX6rpiQQbrcADAK2zSkHYhkuayHU4XYhnkFG+cLO9gYVvd/m408VkP/zE07SBRKEEBx0ECDN4RAXv+HuXTXgMzOHa1079zeDA9Oy5jRjuriqY93l3JXijohmgphyCkzoO+ww80rOjZ7orD0tHvlQ3p83lUKQxL2oGaPW1D1lr4YkelSoi2Cmrh6yJ6t2g3HgYzsXFuHiQ7ZTmAlxjNeI/iTCZGkyIaMnmOfyTEtuKomj1/wb2J1ostsJjca7YCw0ceWiZAmTZGrqPpbj2Nwbuq/dE946kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ia2WEjnnH5MRmyWwVeqGD9whKPWinXARhvBaifEcJQ=;
 b=aftXAoGmNlSijfsaR006/u5S3PS6Hbqs+5uR7DjeDkHAvA7PBRtLUfu1G5/iDEDlT6a6oW65DUktszDDdPLuU4Z28JDPAiCFOKDvryDAaDGDja/jMdGs7GobWaoljC8Su8G/7v5MsDQX2Tt/WfxNXbRXCW+TMulSuQU4ByA8rPm4hkNGQpAd5zC5aWEtgbgYcxMRNIhml9OssueIVQwMdDgvfX9maVdbXj5T1IKKz1BnO5bd0W1aqbfZqj39NEgrkPxuZ6nqw+t0CW2iTToqK54WdIW/nSqog0C+Ns98DaUbr1r0Q7r60f3vj/E4u1xd6MtXIDWRTI3hBYGXP6j70A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:00:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:00:26 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 16:00:01 -0500
Subject: [PATCH 2/4] dt-bindings: pinctrl: imx35: add compatible string
 fsl,imx25-iomuxc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
In-Reply-To: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770843616; l=802;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/kvfR07Ht6Zk6bfUHWvVKbV4vUQMgwIjO7Ny1Sxyg4U=;
 b=2R1ZQNV+176KTlT/fgIIMg0BsRQI8iR4AhP110JO2UKI2VHM97tUQOP4V68I2jWKZLAYu4pM/
 3kljL7j504ZAuWHYvxoRYwl6IyAxCR2FTnOED+5CQVlb/0VNifTS2dp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8954:EE_
X-MS-Office365-Filtering-Correlation-Id: 0293a086-a196-46d6-7db3-08de69b09494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzR3TjFTZ2ZuczBlMFoxdGkxY052bXhIaHh4NGRLZWJDanV1RStMcG1Kd2gv?=
 =?utf-8?B?dVNIOGQ1UWR2TG10dzF2ZEpsWWFwWmc0bVFHT3RCSnBFUVBVdHRSRW9VVkN6?=
 =?utf-8?B?UVBwQmtWOWlCWUpOYlhSWnZoemVOVFBEUS9GVlhtUWRTaGNVVDQ4YVF1UldT?=
 =?utf-8?B?V29DVEZFNEZjdE9lTUJnOE9ZaVpXNXltZTBORjBzYVVFRGMxaFk2MFQvQ1lw?=
 =?utf-8?B?REJRRjFZUm1lR1poKzk0aGkvY1pqTjgxWXlUMmgwTHFJT1lWZkVDMXFzaTBz?=
 =?utf-8?B?RGdpdldva0dYdWlGaHZUZVBCc2pXajNTSGdWcVIxODF2RHI5TGQxWENGVjYy?=
 =?utf-8?B?T1F1Tk5XRlR3UmZQTG1pc0xhY3F4S1FUUjJwYVY4R2M5ZFU5SUpaN0hCUU5K?=
 =?utf-8?B?MVF1Z1VXTGkwQlZLcUJCTTVyZ0RCdjhXL2F4ZUZyOE0vQTRVK2xhUWlUMEti?=
 =?utf-8?B?bFl5V2pqUUgvYS84WXluMjdPbzNRVUhjNXVaTmxwRlhKL3hLcDIyaDV6RlFB?=
 =?utf-8?B?cTU0R29lYVNkZk1kZGVRdFZPcENiQ0tsNlZrWnhaVkx5OWwxeTVjekkzTE02?=
 =?utf-8?B?em1tUTZSQzg3eWZKZ21uR1EzZVpud21hMWZvalAvUnVYMENCQmJQU3JuWGxk?=
 =?utf-8?B?blBkS3N1UHNqRFg2Y3ErM3dGOUxsdmhSdzZ2OHl4ZnpIenNZUndxZFUrcUF5?=
 =?utf-8?B?eDZGQzRaUjRUZTFETXN2UllyZUJaSFo5Q0xlNG9CMmYwdzBQcm1ZQy9yV1cz?=
 =?utf-8?B?OWxJYTU4N3M4TG9jOWVqN0JGVUZGZ2gvNzVPM0RvRjc4UEZ6QlJMa1lYVkh5?=
 =?utf-8?B?QzkzVlIzZ1BHblpLVVFjOFFNOXMzVy81NGV5T09ISWhrWnlhK1NXZ3F0OFZK?=
 =?utf-8?B?MnhjZ29oVENTUTdMTUh5WVNiWWNoZEVEQ1ByVkM1U215Skx4ZDFJdEJINkdl?=
 =?utf-8?B?MU5IMmVCNG9pYVpGaklFM3lTZXF0bjFCc3A0MGgzOFJUMGxRRTVhNW4vNWRL?=
 =?utf-8?B?eHlhVGRlTkN2dHRiZE8yQmp1NXpMZ3hMM2FpS1B4aWNWSjgzTk0vM21MVVVn?=
 =?utf-8?B?ejNnSmFQTTR6STViTTMyVDUzdy9Dd1RjcjhQL08wTjlhdnRnQ1RzaVBzc0tO?=
 =?utf-8?B?ZlZEQnd3NU1PR1lTbEE2cmF2V3J3bWNHYUdxeno1YXlTZk9QZVpjYU9STmRo?=
 =?utf-8?B?WkhNZkswSWZkQ3lWMS8zeHZMSkVZMnViaWpBY1VhMzVzYXZuaW9VcWwyTnY1?=
 =?utf-8?B?cDlMdTNJMVo2MVNtMFc3RHlmcTQ4QWltMlRJRlhvT3krSFNFMkVHUy9zQnBt?=
 =?utf-8?B?V1VrYm5wWEwwWCtqbDNwRWY2b2FTcVVYUTdKU013MUthNUJzTTV4WGVHWU5r?=
 =?utf-8?B?Smo4dExFSVp1OVV5cWFacXk5UFlTeGF1VFhJMUtndUZ3SFg3ZWVJcFZieDZI?=
 =?utf-8?B?VmtoZFhlNHRaVDZjaWROSThubFdpQ3BXSUl6bnh1NmxoZ1FJWVpvQ3pOWEhj?=
 =?utf-8?B?SVlFV05xSTV0U1NuaW1qTm9JQlgvS1FpdWlwY1BtMHQ4TlJ2UzFjWjBtQUM4?=
 =?utf-8?B?eERiSWZEdHk2M2lPQkxOcFRZbVRqZk5ZdExnRWVzbmlRTnhreVlCVmlYUUQ5?=
 =?utf-8?B?MHBFWmhaQWwwcUd2Yy8rWFRWOWR6NFZjUmxQYzJyL2YrZnVWb2ZBU3c4Q1Vy?=
 =?utf-8?B?YVlLdXhac2o5Q2J0UW04YlNwenZZRzVuU2dFUk9ITWhST2Q2N3VyWm5uN2lF?=
 =?utf-8?B?bGQ4b01BNHBMNXp3dGd1bmQrVDBJVWRUdk1UVTlnYkdKZzZTeE5CL0lvRTBF?=
 =?utf-8?B?RGpWditPSW9FWXV3aVhzY3I4TE9VMmhZV1RmSDB5NnNpQzJWTmpzcnVlV2Jr?=
 =?utf-8?B?M2JZYTJsR2dOdnFLZmpyV1lDeGt3d0JZZkhkaDY3d3RWZm8zN0hvNGNxcWR4?=
 =?utf-8?B?Y0Z1cmNJUWRlVitoWWIrZnV4cEQ2YWUzZDVSNTJlME1iSndDZ2t6YUF2ZVVr?=
 =?utf-8?B?VndYaU1kVVJvNEw3cEx6MDcxNExYd3BtQzZJMDJudUJ5V0gxMm8yK1lrY1Fl?=
 =?utf-8?B?TGJKN0VUNVRjTWJmTFNZc2dmazJaVldWUHRWR3FMdHh2SHlXVlZIOGhrOUp6?=
 =?utf-8?B?ck5wOVdvbzdhVlRSQXQ0WDB2bllzNWl5bFZJb2hsYjNzSTZHbmduTEJnbFhp?=
 =?utf-8?Q?LwGRBC1MI+5S46NFp0Nwn9z+lbdlJew25g4hwK35P0xG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1prZ0VHYnNQM3JzaFo4UTBLQ0ZiL2U0amVNSTlJc0lNOXdXNWZiSW8xM1Bu?=
 =?utf-8?B?NTNnYW5MZ1VMVWJvM0xkdzVJZ2hkRDlSRmg5dGhwV0MzSDdCN3dpamExdzZW?=
 =?utf-8?B?dnZmazJwNGNlZG9CVjgrUXl1SjYraXNHRUMrRjlTd0JjbUpwSW1iNGU2T0hk?=
 =?utf-8?B?M0RjbVFOMzNMamw1Y1E2bmR0Vjc1Rkp3WGNwUHNXRWF1TWIyT2pDK0g1OWVk?=
 =?utf-8?B?RTR1aDhQVXdmRTc2OXV0U2V2U21mRkxYMXErd3NCd2VsMXpBV2ZNK211cjN0?=
 =?utf-8?B?YzNsVWJyRWZpNGEyMzVHNVc5ZzVIWC9SaVg3UEovMW93VEJEN1JoK0RzTE1H?=
 =?utf-8?B?N0dTN0ZDbGZ3WWVtY1JNcFI1NS9VbnhEQWhuQUplaUMzdlNteGw3V3N2Y0NV?=
 =?utf-8?B?b0YzNHM1QkNFdjRQV1NMdnRMdDJUeDBWV3lWVkFvc0pGV3hmaTB5WStIU0tv?=
 =?utf-8?B?d1hDeVZSQjlFZW1VTWhHUzl4YW9PaW1WeHZWNi9yd052cGd1aUZ6WUNuRXBP?=
 =?utf-8?B?cE0reDdYZk9XOG1KK04vUk9pdEZHRlFHR1B4cHdzRm0yOXFVUnR3ZHlpYlNB?=
 =?utf-8?B?Z2JDb0wvV3ZnTlNZcVphdzdURzIrQ0hpcFZjNVA0eFhSRmFNUlRicE5jMEpG?=
 =?utf-8?B?OXJHSXRnRXdNODM3RENqUmhTd2sySnN6clhmL0xHV0VhZ1N4TUhreVdIYlNr?=
 =?utf-8?B?bnFBWHNFdUJzWVdNdld5TTB2SUhaU0p6Tm9wZ2Q5S2Rvc2hQejg5QzdJSlR1?=
 =?utf-8?B?eTBxMHp2NFJ3Q0d4WFlTWW9WZWJmYXUwc3lVRkFtTEluejY3d3dqT3UzSUpP?=
 =?utf-8?B?MzB4Tldmbk90MlVYZHpMMDF3WnFuR0txcnY5QTBSSk8rL3krM3p1bVFMcXJw?=
 =?utf-8?B?UmpsUGo4TW9GTjlobHhRK1NNbS9jeGdlOEFNdEFZWU1lRkJWd2JxbTFGeTlj?=
 =?utf-8?B?RU5DbkhZM0F3NHBwbkc0elRuVzJiVzdicFRYMHhIRGJXZ3Ftc0xyK1dPWnJF?=
 =?utf-8?B?ckIrNHJPWHpiRzNZUGNLQURiQ3I3Y3dnUHFzcnBlQjBidVZXekpJYlFDT0tN?=
 =?utf-8?B?STVkUFBNZlpSdTMwSWlrdmVxMjd4WUtCY1BKU25NYW4weEo3SUl3TkZrQWhJ?=
 =?utf-8?B?bUM2R0pNeXlXSEhqYnVrL0pNMVlKQnI2a01wZllKcXlrcVBpK3NlMUx6RFVx?=
 =?utf-8?B?czI5QzJwSkRRQllTbnZORmwyUDlDeEJkU3NWbjBMZlg3V1VFS3Zkc2dKZHAy?=
 =?utf-8?B?NnZyNm1yTUZwK1hyaE12TjdVanpvRE9yWDFUOGZqV2tMYVh1bHduZ0ZZZmVN?=
 =?utf-8?B?djY3bGV3RlpWU0FpNTRLT3dOUmlIdHZobFpxbnlkWkZ2WmxrMnNJMThhTnRN?=
 =?utf-8?B?RmFKT0dMYXZEaUpHZGljaFFPaHpVVzdWUDZIVG5LSVZ6NGw3M3BsZ09aTENm?=
 =?utf-8?B?L3pwc1pETlorcklkUTBtODBkK1VsRFFUQkpMR3BBTWhGWGViVXVHOU5XUVVB?=
 =?utf-8?B?R2grc3hQSkh2c1BZekxXNWRYWkkyazRudHVDSWo0UjFycWE4eXlyQkVEeExs?=
 =?utf-8?B?M0pobEx0eGNMOFZDZ29ENVZNSmFicGF2a0o0RDhwcUJLczBZY2VkUnVUY1ht?=
 =?utf-8?B?WEt3a1lUZ3Q5NFNPSGs1ZU1jUngyNFVyWmxiNlVKdENnQldnTy9XcjZzc2ll?=
 =?utf-8?B?MFI1OThMOWk5cEVib2dHcm9nLzdGakpnT3BNbEdQUEM2ZzBxOEJQZmc3dzNo?=
 =?utf-8?B?ZFRqeXdUNkIzNzZKZTRpeHpDcDBIK2FST2hpSUlPUnhwcWQzRWlqYThnV1hZ?=
 =?utf-8?B?WjRsRERhVFhWU1czd2pyZHFYSXd4QTlhU3J6cFJZVnNIYXlRc3VIM2RyRE9Y?=
 =?utf-8?B?bTFsTld0bW5NOEdiQ3FQZFJUNDJLUTV0Mnk1MmRWZlpFK3BCTHFNcGFrK21z?=
 =?utf-8?B?eDBadDBVN2Z6cDBCT3g0cGNBeWU2Vkt5eUE2dncvcHpTOE5ldjUzeElhUUQ4?=
 =?utf-8?B?UFA0WjJjdmgxekhib3kzVnRWTElsN1RxSTNJVWUyQmVIMmVLYnhVWUxlY05N?=
 =?utf-8?B?Nk5nTlAzcFkzUWd5eEVmZlFjb1hFTWp4bVBVLzVuYTR4eHN4Wi9saE1VRHdu?=
 =?utf-8?B?aWZKZFBUVWFQcWFKbURpTklXVEpwVXpFd1kwMkZrdzFZQVk3aVhlcHhENXhx?=
 =?utf-8?B?RU55a3JhRVVKNkhqVmdnRHora0pyc2k5S2NpeVNvdmRMYWgvV1crVk5ReUN1?=
 =?utf-8?B?bnY3eTBQaEtQM2lLOCs1NXN5UkswaHM5ZWVOM2N0QjBqNVNudXQ5a0twUm1X?=
 =?utf-8?Q?uAgODve3UcS06FFVdR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0293a086-a196-46d6-7db3-08de69b09494
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:00:26.2656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pac+pI4Auw8EenjE59sOtH5wuiEFJxJqq332utYRtHIMU5nDnzQmF5vfeut1FSUhGkmPkiH8n61Cy17JCX1EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8954
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31621-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: F03A6127949
X-Rspamd-Action: no action

Add compatible string fsl,imx25-iomuxc.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
index 265c43ab76f4c3323d45162c01aa3cacfef53a3e..846e110062b2ad815a849ae0ff1e186d4daa1e07 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - fsl,imx25-iomuxc
           - fsl,imx35-iomuxc
           - fsl,imx51-iomuxc
           - fsl,imx53-iomuxc

-- 
2.43.0


