Return-Path: <linux-gpio+bounces-19912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED862AB2D64
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 04:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F11193B2855
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 02:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA73253331;
	Mon, 12 May 2025 02:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DH6KN60N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C836242D6D;
	Mon, 12 May 2025 02:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747016152; cv=fail; b=qTZ1SxfTgKmRUF+0luEvO0LEjdfEPGMqm+MIX7XMNXc9IWG3Obuz+w7gcblUryBo+f0ePm8BNivjKw3nQXrmGkHFkBnCq0QIPOIt23RPCWyQqeQHs1f6wD1Z2qZygTR0qsf0n+e0qqRybgdq2FwDGbRa2sgVAz1f7tDbSiJXuOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747016152; c=relaxed/simple;
	bh=JUKqp7IflG3QAm1aRaeO9Ph099IWJbnOAPgOVkLzqWk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G0diYOO/9HAv+gC+BxCo+MC6YfqbR3DnXVS7e2pwsMjMf+j9fOwRauwSoHvfRyFy7KzsZr1ajjxAKb/N7s6uzuYXjwO5BO7OIWOJeEo9ZJCMyEYhRrnMveBblf68G4lWrlwT9W6jnuFihfUP2Fo2QPWWQEMO4Wc6uMfVDbFTuiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DH6KN60N; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBMBFqkb3apl2ttHmQqPxYdfOzXHTrrkNIaX6BQ0rTVNMWYHP9TGAoP6dYAKs5k/uy87TZ4KimoIiEWu6mqvfkyOeBeeafiNy/N20Xi+DqXlCMdfXFISmFH7rUntxRJ2O/lw0v5uPzdTj4K52WbOVmxMekDR2X52EF3ELI8TAywlVh6eKbKmn5Y0SCiRpUqOL3hv5fVqGsTxRegnfJCjtKbdum1nd2Mr8RZMyoLxJV2U3Aans5iKiT5lZ8WC1EJWej5fLJeQ5wRLaYkLmAtWw0+AlkrWHO1aL7Lc50pSg7RldIpH2TcdM5GjcavQmDMtTUwKzI/1RSKJOQ1w19fQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNQzhcopIHk71GfNfwpYeK9wbrIyGJtDEo2O6q6QXdI=;
 b=xYa/lgrTT1iicN+grwEE7V48z01Mw8DKAfQpCPg3JuC+s1EQhpUOTqgwYhHBJODpXwaRdwqADQiPiHNILl0fqy5lWwBKx9QPX1nDwQMG7JnB4TQDgVDHqN8WT3L+34GQeqcxE4lM+446WU13jpeanY2AYCfZ+llR28+MtLdbLLO2FDl9Rz/bUtTM3qePFd7uZdm+5+gY3WHC+5t1oAYRjRXN4CUZCbwoLpj1qMs+O9kayw3JVV7PNmGULYsr/tS0TP+M6a93A2AOeTDKPkdzXoJKSQts4TybMLJBXGk9w71Ow6wuvk12/OY/JSKl+ZeY7gRHpSUtkL5j2UGdqDEDew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNQzhcopIHk71GfNfwpYeK9wbrIyGJtDEo2O6q6QXdI=;
 b=DH6KN60NWa9YTEAmnavAqGUDAi+GC+atQOyfR/ZAoGzwq7c9CEZ4VtL4T+P5yIVAlM4C9ZhiT1jMT0t0kn1RQr1hxDJgnp3OeTjflWRJ7IeNSLYm65MPjIeRQVzRtaVo+8cyHfCw3N33ZkBcYtF4DI7JFKYJxRRAs4MZgYjkQiQypYRIc2aqeymqbx8pBQ8zMqP9JlLcLFlJkFWlk51MSX4JfIzRvEHK5Mf2LoF55iDRL+Yp0/nmjZcPtXfkPGm5Gw0bluwxmI8kKjTVwKscbmqwW4eNpLURhxmb15/W68UVTZ5fwgvrwJJxWCvO1zapnivcQhEN2HBf4/EV7EvqvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9240.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 02:15:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:15:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 12 May 2025 10:14:14 +0800
Subject: [PATCH 1/3] dt-bindings: firmware: nxp,imx95-scmi-pinctrl:
 Introduce nxp,iomuxc-daisy-off
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747016063; l=1380;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Yn7p/In1xdMmY898O/+sPKMs4S8vUz7kUVvmopPrJvE=;
 b=WoYYqoZBIg67pKlxA85sKoER5c72sAYJIGchzWuCyl0XKtQydMpl0odk+6GYqpzaoppKtl0iJ
 LYkCuYBEsdoDOV2t6wbNlbuSPjv0JO0mYcVo5x/x4RyppmnDtZmxyCU
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
X-MS-Office365-Filtering-Correlation-Id: 37fec3c8-6b55-4a7b-22a4-08dd90fae877
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzdpWG1sTVZ0RC9lTU10TGRxdFRueEpZeldCdDUrZHovRHN0MzdFUUlUZXJx?=
 =?utf-8?B?WVpvTmxRMUhONmtoZVRYdngwQ2RQa0Rjd1dpNDhoNFk5NzBFd3RUWllzd0xS?=
 =?utf-8?B?VkhwN2pLMUh3aEdFMElJUkZIUjFlV1o3VDZkc3FmTFdZZys1aHRHSWhXdElH?=
 =?utf-8?B?bjc5R2FNbkdhZ09VVmVEUTJ6bXQ3cFF1d05DdDNBajUzZ2ViQnorMzk4Tkk5?=
 =?utf-8?B?RmhxckM2ZlFGeU5oM3Nvc1Jya1hCZzNwbmM2czhTRnl2ZmxocUlMai94aWsx?=
 =?utf-8?B?dFFXNURIUUdobVZDOGo0cHVkU0UxajZkdG12NVIvYnFKS3pQL1RXbFlVREJ4?=
 =?utf-8?B?Y1VmM0xBYjFhMS8yVEIzSitQc1BqeVk1aDk5OFNzVHA0MnMzRGNnbU4vN1pP?=
 =?utf-8?B?ZVhDRWo1QzF0L0RIZVBXNVhBc3ZyQ2pCd0t6RTJuVjdTQ1RSYW04cWljUVUz?=
 =?utf-8?B?bXhJV3BBaDZHNExKSDdyZ2MwamkvZkVtLytlakp0dFRRVndlK1JHRW9LTG5j?=
 =?utf-8?B?Ui9DQm9FNmU5dmZocnFxMk5odCswYUJkMENlUkVNajlQTk02SDdaWkdNY2xB?=
 =?utf-8?B?NDY4K1c3VlQzWFdKeXNYRURCdjQxWmptL1hNei9GbjdGcWtkdmxZYU9hWDdF?=
 =?utf-8?B?aEhidGhtcmF0OERkN1ozRkFBR2ZURVkwQzVVeHh3Nk4rTDljN1JaaExoTllI?=
 =?utf-8?B?Y1FjRzVvNnE4RXVrdlh5R0tQSlBJcWNFOURWL0tlejZqcG9JcTVvbTU0S1FZ?=
 =?utf-8?B?SzY3VEhoVDFQOVUvYm92eUZWNTFJODlVT1VYNDNDTThZdUhlMFpYYjFqbDFl?=
 =?utf-8?B?cmhkcDVleGRjVjVhVTR4RHRBWnJES09GWUY3RGR0aENDeHJselVsZWpIa0Jz?=
 =?utf-8?B?bU4yVHJKSnEwaHpqVnAvVWUxNDBOQWNibEx3WFFiZHYvRjJ2S1NBdVc0WXYv?=
 =?utf-8?B?S3MxS3IxMUhWM1ZBVU1yMVJwRmpEQWZ2K21PT3ppS0xwcUh4WlFWeGhCQWRS?=
 =?utf-8?B?dFFDeE01dkRCU2drd0VIWmNPQ29WZHNvcVlaYk5YTXFJdlA4MHNmRDVyemRV?=
 =?utf-8?B?V095QkRGSzJHMUk4a210L0JmMWF5bHRpcEFiUUJCaWpIV1V6Q1VCdEM0clZ3?=
 =?utf-8?B?ZVhlZW9XWWcxUldMRGUrSmMvbzJYTFFGTVNnMytCR0FiUFFtZFV1OUFVcGFF?=
 =?utf-8?B?b2toNUJRK2gxd2ZJRVdZb2Rqd3lYVW02dTcxVkJETHdoeEVQUktnVnV3eU5P?=
 =?utf-8?B?aEN3ZThoZWJmeVdtdkNkYTdHUEJxd25VaTluMXZELy9mWVFZVmpJSmI3WTlp?=
 =?utf-8?B?eFh3TCtNWFNIUDhWaE9PR1Fqd3NEc0VGY093VUJEVFVkVlZiVVJ2b0F5ZWti?=
 =?utf-8?B?dUFVWDJra3lMeGhKK3ZYTjdZN21INldNZ0hJUHIyWTdGa0M4ckpBL2pTNkdD?=
 =?utf-8?B?OHJCNG4yby9YaCtLTm14bkpHaTRweHJlRXZINkxvQkpCMDkwbFFrSjkxMTU2?=
 =?utf-8?B?SmozaEFCZ0ZoT2E2aWZadGJqNjB4aWcyd0Z2Q3RRQXdXcmM2WVQrY2x4b3Nq?=
 =?utf-8?B?dXNBS2NUTm43OHdRdEZzdTFodXdsUlplbUFZOHpDQTFsLy81U2syOGJERmd6?=
 =?utf-8?B?Q3N2SmxsM0xxaGdrYUljd2NaOGIvWi9Fc2NGR0Uydy9SUDFSYjEzNHZGY2d1?=
 =?utf-8?B?QXBMRlFyckMvMk9RaGkxYlJITFdpeFF6UlJOYVVOLzZWMDdsbWxubmpRYW9W?=
 =?utf-8?B?NjRqeURsc0J1b2lZemUzNFUyUUE3L0VhUHBOL2RTcktnUkdJVktnU3F3N0xL?=
 =?utf-8?B?cFZtVXZYekkzMUZVa21SRVJGSjhpRmVud1JNV1E5L2d1Z3dFc1J1SWd5WGdW?=
 =?utf-8?B?QWV1VERrS29qZnR5bUlCVHpZdG5MUnZLWWZ0WXg0S2N5YnQrL2RHZ3JSK2FM?=
 =?utf-8?B?NFYvdXZFVXZSNVlFdTVkbUNiQVkzMzdZYk5BS0hJL01LVS8vcWlnSkJ2Ti9E?=
 =?utf-8?Q?y1Rm/PBxZl46DwldT3JeKRiU5i+mC4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZURiNGV1T0JmTVN3c0ZBRkljd2pORW5ZdVQyd2o0ZjAyRlA5ZTJFZEtEUi9W?=
 =?utf-8?B?UWxLNlJ1TGFtT0RXaUx6NkV6UWI5K21DK1RLSEtrL3hFOUdpRitraDM4NmpN?=
 =?utf-8?B?SVhCcFlUOHkzbjJubVpyajYvR1Q0R3VtYzh6YkRVVGJOcm5VVEFKV1lHc0NM?=
 =?utf-8?B?NEcxQ0JkQ3dpSTFPVmltTm1LUlN2a3h6YWc3dlpSb2t4NFUweWd2eEtnZ0Vo?=
 =?utf-8?B?cmVGaWlIVDZ4UHR3UjgzbGFwQ21TcVAzOUMrOGh0NlpGOFhHRXFnMy84OXVV?=
 =?utf-8?B?T21FKzRpSHNwR3FvOGJ4ckU3c1F1bmdOYzFYem1HN0o0b3JrQnUxM21qSElN?=
 =?utf-8?B?Nld0UEJ2OU5tSW1lcU1GNjVndnJORXJ6TG45Wk14NlJXNXA0THV5MUV3UW9s?=
 =?utf-8?B?WllORG1pcUUxT2Y2QkwveDd0dVZnU25aYjVtRUpZS1Y2MnVqa2ZEZW52eTN1?=
 =?utf-8?B?WUY2R2JZMWREZWFENzBLNkJUNWlGeXZCU0pQem1FOWlBeWd3Q2gvQU9UbWo2?=
 =?utf-8?B?dWxsYjAwanVLK1RoMDdFNDM2R2JWTDhpYkhFVkgrM1hybmRVZldubFVrV1pE?=
 =?utf-8?B?YVlYaUc4SXpHZXhZQVlQZUc3YU9GVnE2SGd1cHF2bVVpSzVZWkZMMmQzdkpj?=
 =?utf-8?B?bWRsZy9uYjVoRTA0UFVGT1pqNzh4bm50Nmp5UG5BbTljRWZkdVliZWttRFE1?=
 =?utf-8?B?MEJ1STZ1MmkxMmpMS1BKTm00aWcwRE9SeU96MktzR0wzYWI3dzhETHlNK1h0?=
 =?utf-8?B?YlhKZ3I3VlhVUTNqbmxkNnkvcjFrZmNvYVJ2OTF0Zk9GalN5RUdMM1REcnJq?=
 =?utf-8?B?dDFhTFpYNTBxSnB6ZnExajVaYWg0TzhnVStVbGRzUmhrREVOZWFsb05rNFUr?=
 =?utf-8?B?N0xpVXRuVG9XYkRuM2k5S1U2bmJLanNMSFV5ZHNvSWlKK0NPM0FSUFU3emZi?=
 =?utf-8?B?YzNBcEFFTk9tWWlncE4rR1A5S2VUMHpTUm5oVHBJUzJuUjRJTWFKc2FPUlJ0?=
 =?utf-8?B?WmswVTVqNUE3Q2lFZ0ZweVZteVlwQ1F0cmplUXFsMHFPeWV1TS82OWpVcXNQ?=
 =?utf-8?B?MFB2REFBN2t0dHFXNncrWkpJS1poMFovQXdORDQ1WVJkanJDZVRFVXZrNUxt?=
 =?utf-8?B?Q2dDenJNK0E3c2xta09UMzhqM3VyRStNS09Fb1dEN0JoVlg4V0FnaHFoOUpq?=
 =?utf-8?B?dkJCRmNibXdUOFZVem5ZZXIydlcwUjlCaHFxNENCL0xRTlYxZ1NhZHppOVpS?=
 =?utf-8?B?S3V4dk0rSGt3N1J6Q1RjMklxN2ozcHdyVVNveGMzbGxqNkVvSkdGQ1Z5emVR?=
 =?utf-8?B?c2NodVRYRGtIMGc2b0dXWXg1RWovemx0YVQzK3pSazJWcmVTMEtKdHdqWjVT?=
 =?utf-8?B?YWdzcFVKWkpNZTNaVUNMV3NxeWFGVlpXTEp6ODdxN01yYWZoSW9FNWErdStr?=
 =?utf-8?B?ZFdDczAwMzFobmdEQ2p2TFpZVSswaEIzNEJTNkp5YnFTYTl0VFlnVHpLSTFN?=
 =?utf-8?B?bTMvK2VrcEZmUU5Ed1ZFTXpVWld0QS9nZ2F1NThlSTJJZWViQlB3eXhkTzA0?=
 =?utf-8?B?S29HRFcra0RuVFVwWHU1S1pnM2M5NFBFWHRSbm1TUTUzVDdrcTRhVGlsSVA2?=
 =?utf-8?B?UUpiVi9QT1VQcjBmMVcrS0hIVGpjZDVzYlJhQ3lLZktoVjljd1JObXZKZDE5?=
 =?utf-8?B?VEQ0RTB0Z29WV3QrVXBxdWlZKzhTMjZ1WEhIVHp5Z3BCdWl5M1E1aG9zWUVm?=
 =?utf-8?B?b1VnQkpxa0ovcXQ4dlp2OElpdTUwV2paVlV4ckwrNk84QTFOWW9kaWdkdVRK?=
 =?utf-8?B?YnF1ZXRTRGxtbDF6U2puRk9tdXZ5TG5wQXNuc0VKL3hJTFpZNzNQTVJBeDFw?=
 =?utf-8?B?SkYwTmpMQlVYUFZUbHRSVS9IWmxNdnVRRFFyd3BJTmNhOWtuK0dxT0hzZkM4?=
 =?utf-8?B?K2pOTFhJcUc0M0tIeVZCeXlJa1RpQ01FbEFiQXg4aW1rRkk5dnp5UGYzaFI1?=
 =?utf-8?B?cUJMbzYvdU8xVVZQa2JhanVlV2kxOVhZd1gxcFg2cDkrWk1ydXZ2SU5Qb2pu?=
 =?utf-8?B?NXZGSjFDZUpBQm41TFRXUFpTd3oybXJFTzJhRm9TUVZkU3RoUERsUXQ4WW1o?=
 =?utf-8?Q?vaqjdctVpmXVOE29rUC0bEB1p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fec3c8-6b55-4a7b-22a4-08dd90fae877
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:15:47.4738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhZ+tq25IGGdJIG9Uc0QURdgynBhIbzG1lcKs2YlcRNdX50tnBVNjvikPwNbptmVtuMDN9gl0429JAJ8feMAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9240

From: Peng Fan <peng.fan@nxp.com>

The IOMUX Controller in i.MX9 family has Daisy chain that multi pads drive
same module input pin. Each SoC has its own register offset, so
introduce "nxp,iomuxc-daisy-off" property to specify the daisy register
offset. With this property being parsed by driver, there is no need
to hardcode the offset in pinctrl driver for each new SoC.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
index a96fc6cce502c10ab415e0b26bff1be8c3bc82f5..b5b2a9c8688a7f6525cdb6a32db22681f4f1a0b9 100644
--- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
@@ -13,6 +13,11 @@ maintainers:
 allOf:
   - $ref: /schemas/pinctrl/pinctrl.yaml
 
+properties:
+  nxp,iomuxc-daisy-off:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify the IOMUX Controller first Daisy register's offset
+
 patternProperties:
   'grp$':
     type: object
@@ -51,3 +56,6 @@ patternProperties:
       - fsl,pins
 
 additionalProperties: true
+
+required:
+  - nxp,iomuxc-daisy-off

-- 
2.37.1


