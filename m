Return-Path: <linux-gpio+bounces-19914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E7AB2D6B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 04:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CC723ADB8A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 02:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3888425393C;
	Mon, 12 May 2025 02:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DBdS2KfF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A12E25392B;
	Mon, 12 May 2025 02:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747016160; cv=fail; b=Nfzh6UrgmzmKljC1iKCPGTGDQWcmkeOTCMs8PauO/LDLzHV55jkl7ZbpN72jtewdmvwXHyw77cJNypLUyNZwLKlAogSf2xTMe6w5f3wV1pjcLTUZHIU1pxdJAVy40qOWs4T7TosQjzwxH7CY5See2vQfM300wQO44B+iXF0Gw38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747016160; c=relaxed/simple;
	bh=mv9+2tOQU7dZR9JCrJ9zhISWvBWi6z0AbnKEChl5uV0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DDygLhCOfRRVU6GpG0POfa0yx4aicO9VqQPCAhtz/ungT/ObUjafZcqqw28Uq0cWtM+bAZqsw69i+OFzq8PMV3OlmFbF8sEowqcSyZbnzSBE7jS/JJnpT1fwmqDZmA+J/xT0f+5Qz/7eChB2OLeT8qxv5qKcSRiQtOtDu71INNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DBdS2KfF; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7fuCixm+vZKk3SPlXJBpXyOXGGd6r1jY3rKm/m4a7hXiUFolc+d7p6iM6EmZDxNaQUhERX9X0LNlv18OjmY1/+KJAEhpwjZ/gOaZKUm+ULSH5z0rI74i4OLub0svgnf3Y53cDHdsABQTnX6SLU6F7XyRAOaXJzySEXJwLIZCVxsBurXUdT0CXbyHmHpbk5qgVdLWhv4WHMVcl7fSIYakudF91H23B3NuhBvg9UetKWKsljBRac1jIzKZQv1bz4sI3YbC3IjELEje7mUSB8QAsETfNjx1O2DqYBcbasDacxVmLi6swY+n74FekiPo88IbSuJBhNYf55F+DJC7Kk9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhedAhPZbthe7zSS9blxXQgYi0aZHCEPwCNN9HItPjs=;
 b=oDQXbEf+wPI5cFaM1nnrcHG7t/42HRd8DG+tasrLibyknWxActzaje1H6J6MTOV5DsbvsllW47gDfNbCAoiFfSbSwNGwo6tccQ4WOKsRlZaWBM07++NYPoXaTgr939yQkBotLbBDt7y+na8FRbZy28UvIu5A/sTP/EUuadEbiN7Mk6xCD/vI4VPd1KYP5SFVFS69mgMuxDLV+TpozcccdlfKqFdrgsLYZUwdss6fLZBxVSFs1eTaxhvYf2aXn+lf6dMNGn2/Qp6+j2/9IcZPuLUHcjPIzk2bK0qkqCSfVHbfvozZvvBZwhBgz+0OKmXdKffODSaFj49pTd3pDpyW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhedAhPZbthe7zSS9blxXQgYi0aZHCEPwCNN9HItPjs=;
 b=DBdS2KfFcGNT5mUKAtHSszEmZTIqjVgAQ7pLq5pD4ZWHPCQxgL5K6Zw9WNvf20tyPF7KccS2eEhABXUMGVQ4D+2CmIIGZKYEXPCRn/M1kw/j+9q9JJjBZnnnbcChI8tLePpjLsGSDIjKUYt2G6xUv1+xeQ5rlqWf5UleJtQTZaScp9I7gU59v/s2JE3AEbVVR/ozQWLm5FcdbwohlKnb/+JT+uUWgFOelVBl9xYnjkgn3ImkkKHb2vDpIGysy1s8FOL1qq2u1eurSxfNFOFIPdMXcd5VV0Jtz2k4McoTtn8jJ5GQ/X+5/t5MmjTu5pNDdDUZrVgLKdbhcOOMT+VuOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9240.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 02:15:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:15:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 12 May 2025 10:14:16 +0800
Subject: [PATCH 3/3] arm64: dts: imx95: Add property nxp,iomuxc-daisy-off
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pin-v1-3-d9f1555a55ad@nxp.com>
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
In-Reply-To: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747016064; l=694;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=PncbpgH/3A84sgqVuG04OU2adO1KXIgE+pPtr9uu7RU=;
 b=4uiDb3YEXRByJ0CDGX1+6i92o2ITrjsA5hPvF+PXhCMp/m1ktxqmIYe5MiCTJabPkp43GcQjc
 MlGuGPOmQeNDms9aFPTOjfiZRW/PzYqCAl5vsUPcryTj3w74Q9i9aqG
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:3:18::30) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 8390326d-75ba-4db2-a7d8-08dd90faedfc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWpSRFloMGJxdFdraVlzdzRORkpRTm9CQlNxcnc3RFZaZHl3SkZYOVZQcXlS?=
 =?utf-8?B?OWZQbXR5UVlrMDRSN1gxQUFTa0o3aUtMcW1KekNFS1JaZkcraVZJVmhBcXg2?=
 =?utf-8?B?TVVBR1dLdXVyVVh0ejBkekRYTmNIN2dYMjhFUmJaanBJc0hxTm1veHc4N3gx?=
 =?utf-8?B?SzFyQXkxTE9IWE5jRVBWaCsrWWpxTVFVQUZRQ1BOanlscHlkaWF4cWxwTkxV?=
 =?utf-8?B?UU5JSWRveVgwRllGbDZEdnFVQnI2dkI3RU1jZ3loVjNXNlFQRjBmR0ZFeGE4?=
 =?utf-8?B?QXNSTGhPbVhyalVhOTlpeS8yZlVkcmJ4ZnI1aTRGeEJZcnFWb3ZFK2p1bU1M?=
 =?utf-8?B?Qlk0RHdkUzJWZkVLRXA0RHRXWGNBMjZHamRMYXE3em05MnhJQ2ZZSDA1MUNL?=
 =?utf-8?B?Q1JFNFlkYTB5NXlQdXl3RlJTa0ttRVk3YXd3WVBnRTVMc0Z0bllHYkpOYWNT?=
 =?utf-8?B?VGdTZmgxUlpuTGFwbUhuczFXNFVwTzdDZDlWNlIwaHM5Uk9DTDlQUThyTzRk?=
 =?utf-8?B?Q2VoUEQ5c2VSakFwa1FXeWpHd3FpNmp2eDhlT3F6T1owTmZ3ek93UHRoTWts?=
 =?utf-8?B?MmFTYXM3RG52R3h5cnFXdCtGR1pwU1Y5MkVoa0hGZ1ZUbFBEekIwTTRJZEh4?=
 =?utf-8?B?TG5sY2F2dUkrQ0hEQWVtSDRNZlhXM1RVbitqUzJQd2MvemJDUUdqYkUvZDFa?=
 =?utf-8?B?V2g5RDYxSDZaWEh4aXhoZnUrVVNNOXk2Z2NtbHFRb0grV2dyaTFsT0hreFJK?=
 =?utf-8?B?WjVxRnJhWHFqSzBnOTk0WTVKVXBRT3ZKZFAveVFBMERpeFRpVjkvdy9kTk5T?=
 =?utf-8?B?azdSSVlJTU9jS2ZCTCtBNS9EZ0w5ZXZZTVNRTVBZQ0pFNzU5dFVwazMrN2g0?=
 =?utf-8?B?dk43RGU0RkFTWDZDZk9ZZjA5WVNUYnlOMzRwODI0TkI4Q0h5Qllib2dscTVS?=
 =?utf-8?B?Z0xQanpaMDFSVnhOaHpEb1FPdTZSQ2FFdEZ3d01WUFF5bzJyaEtDMnA4MXAy?=
 =?utf-8?B?bkJ1MkZVdXVOYmxLSEx5aTlVVnhhNHZNdERkeVo0cFp1K3Q5cXRmWUhQVHVt?=
 =?utf-8?B?NG54YlBzd1dmNi9GWStRaXBCbVVHMUlxK0pOdit1YXFTYjdJc3VKRUhnOEhs?=
 =?utf-8?B?Nk1VQzRJelpYd2ROenlzb2ZiclRQZ2NrVTg2TE5KdWtUMU1MSmFBSTZMbXhL?=
 =?utf-8?B?TG1VMTJMV21JUkNpTlNGdE5uLzE4ZDRtMlJHNWFOUUhzNUcwQ3dTOXBkcE9O?=
 =?utf-8?B?OXFwS1B1WnRFc0VsK3k1OCtlK0Z6emZkeHJ1OGpPdm1HQ2h6QTlwNnZaRklw?=
 =?utf-8?B?QmYvQjFLTUxueUo1Y29YRStNSC9tUGJIWWUwWVZWTkRGTUNnMVJ2Yzh2cW5r?=
 =?utf-8?B?QU1mQmEwMjZ6TzhuSTBkcGdsa3R3Z05lVnlGdmp3dFMya2dXZTd5VHUvSkov?=
 =?utf-8?B?d2U5U3krR21DY0NTaCt4TWs2QWx2UlpqOWJDS3k0UmRTTEZRSDR0SHV3S2lz?=
 =?utf-8?B?a0Uxd09OdlRVaW1yTzlnQTJwemdSWFFwb1VLZ3MwSWJrVlVwVDQrM09FVzZl?=
 =?utf-8?B?cmNKbWc1MVl2Y0JKT3VEQ0taL2hBMXFQTEowQ0QxbXUwbGY5NWsweU1WTmM0?=
 =?utf-8?B?R3ZQUkpjUU9aWkFTZzZjNXBQUzZ0bDJ4amUrYjl5MWJaQkE2T0NPVzBML3di?=
 =?utf-8?B?b2c0Z08xaEhFcXlKeXRmMjZzeUdoWHZJb2tJUlNMWjYyeENXR2I1NkRGN2g3?=
 =?utf-8?B?YmlONzBPeXhiTEEvL2FoTCtlVU91VXpiTXowQlNBMGd0Z3c2YUkydjM4MXc3?=
 =?utf-8?B?eEdWNmYxNm5aNnZMWFlYa0xFTDdxTTRxb3NadlM5bENjdWp6V0xMeXhGMzdF?=
 =?utf-8?B?aUhTVURFWnZFZVYrRWJHRDZUcG1VUnJmb015bG1uZE1PcnJhK1cwMXhidWo0?=
 =?utf-8?B?RlFEYkoyY2RGelRsUWJBL3JWa2MxTkFvRVRwWXovYlpMS0wwRi9zczF4NDZj?=
 =?utf-8?Q?4n+vUDoq7CvKT319HfWszZAEwu018o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk9FbE5QVFZNVWprRzhtQ3hWNmZDdnRlMmFXUE1Sckk2blBGMEVPN0RrL2hR?=
 =?utf-8?B?bU1TejNEVVFZQjhjZG1icGF1T05YSjhvd291dUQwWGtkVk1jblFlbkh5OTFn?=
 =?utf-8?B?MFRrM2ZUZDBFUVl6Q2FtMTBLa0V1ZUNjYWhuUEwwTGlaZGlxamVtS2QzRGpL?=
 =?utf-8?B?RDhCQ0VyWjFDalRHTU5oNHI4eXB5cGFEUkJlb3NnYlRTRThzSW9YWUE4d05x?=
 =?utf-8?B?OFRhNTdtaDVOODJLa3NsZno0ZDFRdmt3aFVMY3I4dHdid05oQm1DRGVhbFVy?=
 =?utf-8?B?WjdCQXRRYTZ3YnVFVXhoZDc2ajl4T3JSdTBmMnhZeXBpM1VYbU13SHBIb1pU?=
 =?utf-8?B?YUJuYXh4cFRCTEJEQ0xxNy8xRE5PcVJLbkVIWGxqM0t5QTdyNUgzMHA0bGlp?=
 =?utf-8?B?Q3Z0NEpIZEdtWlNscEUxVzVyNFd0OTJQZXk4aUhUd0R2QXJGRHVMT2tFUDBK?=
 =?utf-8?B?RTU1b21mRnBFY25JeGQwNkJaQksxY3NkYzcraG13V2V1bG5GU2lSbG5HWkps?=
 =?utf-8?B?bUF0MDJkbVVrVCtna3pHQVBUamNDKzJMOWp6WlgxaDAvL1RZa0RVSlNSLzZr?=
 =?utf-8?B?YW8zZVpHNEpDL3VTcTFuVFo2L0hJQ2x6Smd3WU9sME0xLythRENUVEU0Tk10?=
 =?utf-8?B?MXpjay9BWlF2clJRTVkyWFRTbEVaYmZyK1JOVWU3OGZMekI1bVA0VWZPU2h3?=
 =?utf-8?B?ZVErS2dDMWdESk1zdXUxdENNSzA0ZlNoTWpHNHkyY1JRUWhFMjM0dE5EdWNq?=
 =?utf-8?B?a2xxTkpicmIxeHlWVytsRW5XdTZ6UmlnTkVROWJKdzA4eElobWZQSkNGY29w?=
 =?utf-8?B?L0FUQ3Q2dUxualNVUVNveStrM1RjZ212QW5wR2srSndqZjBYSTV2V1NGMXhj?=
 =?utf-8?B?ZFpBYy9jcXBVU3BVU3RBNkdvQ0VsU2R3NGxRV0tneVlFcEpBTnNyRFZHc0o1?=
 =?utf-8?B?Qm8yVVRzemZUYjkwdU1IOFFGd0hTWW5tNW5HWWVwVlltMVlZSVFJSGd0WHZo?=
 =?utf-8?B?TUZkVWlVWThIcVNhU1RoNnNyaU8wSmJuWUtFUUxzbThsNU0xaitBU3JGS1J3?=
 =?utf-8?B?enRQTGROYmNFTldFOXJwYjZDMmhqSC9XTmVpaHgrcUpWU2NQZVB1bnNSTE5H?=
 =?utf-8?B?TFBsQnJVN3UwUXQ0U0txa0IwMWNCa1NsVFhQbE1FUUc0OU5OSitiYmM3b2dl?=
 =?utf-8?B?VjlUbE5MRlc1SjczSnhESVRnakhjdk1OVk9aVGp5UlNXczhkdk5Sa3Vra1Ew?=
 =?utf-8?B?cFJyOGpLMDRRelM5QTlqcDRUUVJqRzc0M1lnYWFCVWlHbWFYcnUxREp1SEJF?=
 =?utf-8?B?UVhKcjRXUTNuYmNPNTE0S2M1SStleFJEV3RvZkhTVllPRFZrQjY0NFQzQ2s2?=
 =?utf-8?B?bnZXVGJ6b0h4ZFJ1WDlFdEJLMUJBMTZjOG9OVmh3a2pjZDU2dzgySmlkaysv?=
 =?utf-8?B?dEdyOUNTOFdRSmhzNHV4WW9UTStwcWZkNTJ0bnplMVBaeUJObTZGSXAwdFE5?=
 =?utf-8?B?TDAvbkY5SGNGemxwaWRnQytzeWgzM2NOQVg2YTJQMk0vNzMyRXRYVFUydklV?=
 =?utf-8?B?b0RzdStPL2VXbHhmKytXU3YzNE9wdSs5RGcvZ1dObllBNnRhZ1FtS3hGbjJa?=
 =?utf-8?B?NWZIdEYzRWIwWlQwVm4vL3lWTUdHSlYwaEEwa3dUZkZ4aFA4S1c3RjZoUFl4?=
 =?utf-8?B?Q1ZZNllWTk56MmxIeEcraXZ3VTdsOCtiUVh0ZlFjU3RNQWUxNzFYUEhva1gz?=
 =?utf-8?B?eHJLM1d0dVpObFFkaStzNXZPeHJqZGNqTkZ5UUVYK3c0cktXZ01yVG00T0Zm?=
 =?utf-8?B?WlE3U0RDODhKaGlyNHV4UjkxTlVjWVNtZkQzTkRZWG9wY0NKS1laaEdENmMy?=
 =?utf-8?B?TkhMVGZuQ281OHRsMVk2eitFRENURk5MODgvT3FMeWh4YVNsb0hNSkpkbGM3?=
 =?utf-8?B?Qlp5TGR6NXlBRmF2ajVWZnYxYXplM3ZOZllWZU9UMWQ1b2ZLZzNyUDV1bzBy?=
 =?utf-8?B?RFZvMWIyT01sc1RXUmMrUG9DczQyQlJzZUVnTUJvOGdPUlluYzFxSFhXVmox?=
 =?utf-8?B?WGYzaWRmc0tlRmR2cjVKb0h2Qmg2VERydm1NWjhRamJHUDBZQkxPNEN5TkMw?=
 =?utf-8?Q?byUYR6+ceqDzVWG6x2iCwEGa1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8390326d-75ba-4db2-a7d8-08dd90faedfc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:15:56.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlB2c4vXi+rw3r2kcbTBRAbTAhxSpDXpDJK0Njc7Tjw0LyVEC1X6k1npxkbyEzL1Zf2OP2R2Sj/8I6q2U5F8zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9240

From: Peng Fan <peng.fan@nxp.com>

i.MX95 IOMUXC Daisy register offset is at IOMUXC offset 0x408, set it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 632631a2911224cadc16a943cdb467e091e43384..9b60bbe3b5c679331d38c86e2aca4b0b9d4340c8 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -348,6 +348,7 @@ scmi_sensor: protocol@15 {
 
 			scmi_iomuxc: protocol@19 {
 				reg = <0x19>;
+				nxp,iomuxc-daisy-off = <0x408>;
 			};
 
 			scmi_bbm: protocol@81 {

-- 
2.37.1


