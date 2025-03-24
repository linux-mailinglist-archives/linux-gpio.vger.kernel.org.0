Return-Path: <linux-gpio+bounces-17913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1DA6D98D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 12:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A8416C101
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 11:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B5125EF9A;
	Mon, 24 Mar 2025 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aWZZAK3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8048E25E834;
	Mon, 24 Mar 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817164; cv=fail; b=k5iZXEDUyPiR3R8ttd0qtrUL6jirj/SnALS5UAxQbaICvDKEJiajZfo0oMTGCJNG7UY1sqRBseM2LquPZtAvQ3FaR6TcNDux5TwUnL8Q1Fm36AyVsRj0XAS8HDsQ8Ozn4Dqd5bI3H2pb1MY0cHM6rLsav+GB1BBEEcNeaKF0wko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817164; c=relaxed/simple;
	bh=tEh8xndEV4DzAQiz5Ev7QRAHEmx0QSyxe4RRnt2cTY0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hBdSgsgM3b+/ZdHkXUbSijUZDMu54qZvdY0kJRlfFprJppWFrC5dXB+vsY/AFCMiv/5iCUpWxtkl6dTIe7cCKTmLENX70K4SbCZ44y0qLegKuZaDp/I5QBPYI4LBss2AcEjDoXNxoUmAthMTZHYImYGaw9RMVm4nX/qe29YpcMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aWZZAK3h; arc=fail smtp.client-ip=40.107.105.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnLOBppDMsMm4EjYewp6jzINLyHop25jLzdwNT4Ov+QYKZrhvu3+nwUeNvxkfc540rs7i8yiAB83rUrygU5GDmTygAV0TOMpAi+RApSYqq1VT9T8Gx9qGPiYF5Lh36pbT9u3/OFwvHrmqEEX3Lm/smCCKF9M81hIl6XsSyWZqqU9shrqLtQZ0f0RcRicuZDNJxde2cDQynuhkKpywMfEovvvpW7+z0sb87y4anY1mar+/JDiTaLh/AmfmD9hPsImAoy1KTr0boatOQ+jhuBjs27YlSb2Mk/ECOnUuFZtiIweJ0Ab/wLTDjEP8AH6gQpqQHo9seFZng12goQqMnpzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Z66TkoJaOB2GgBs3x7C09pBu6O01+YtSgB1JDK+/gs=;
 b=eflcUA8n+ma8yCbEYhdHG/5cUH388C4RoK7R4AefBT6zwPw9a7kIdTYZptv8C0D7i56Igm+2p4EKiLRXV0Qq385hCJciVh0qdkFDu7DbaHNQjd2FtJUtQIdEUiAYhmTstYNRfSEcRo9A+fZE/ZsoA85SAGiIHv0PD9NW8nXzRko49uWH8ol90jnNVYS1+/duziHNx8V7BB5NZsKboo9eBUQruOUwlNzeV6wPPjPdw6MCi+oeikM6HPttSVBqeakDPmTZpHTMvM+hFr/Yi2a4881UkHp9HEkIA5VfvJPSk2Ffy02pbV9tc811ivTWdA8bpxO3yv2kU6vmm0iuBxqsdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z66TkoJaOB2GgBs3x7C09pBu6O01+YtSgB1JDK+/gs=;
 b=aWZZAK3h/p3pswtYTH/SEwXOKlEv8kMag2UNGtfncS88m/TZFYyhWUBaLS6XC1gcucRd595bnBMY+8lPDDMP+EgP7rxGIfkXyWmd8GVRM/m7fXs8M3+aH9fWdvZkQrsSs9VmBmDbHB7fkdI8QjJEZospGsib5RJnHLQLCHeZkw5e6K1KPjX40X/6ji4AQz9+ZSGEhDr7J4MxNNCzYU4saX8Bjj8efuDl1IYK+8j3va0IRrtwwhZiQBmMhVd1BuCLiNhLSbGGyYgYx+1p4ecHGFNef+DzASVT482gGfIVcM0ZtLIJ4zb+vKVAbiOG61UpBczKhCm7kA0twH+ePZZWuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 11:52:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 11:52:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 24 Mar 2025 19:51:28 +0800
Subject: [PATCH v2 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742817094; l=2592;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=KSNVXc7VPsbNPc5hvKvI9fW2pZtagLee72i+Ls0pits=;
 b=eLTZNwa1m4W/6cgx7DG8GkY0x4wlSm9QZHXfTAGsttxLL9XulTTc5OH1f4VK0T9CzT7YaqMFB
 EDNpy+aVzbXBXarIrBQor1tuMvqddQ7EnqfNgEhLHFJYbD2SOV3xhTK
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
X-MS-Office365-Filtering-Correlation-Id: 6c37ad15-525e-4c4b-3753-08dd6aca6140
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0Z1azAxNy9ncjlHdWd5RmJUWGg5YlRka3daRHpIb2xvWkFvT3pyUkV3Qk5Y?=
 =?utf-8?B?b2svdmNQZUNiekJaMDhmUDJkaFpyU3QrckY5UWNyVEFoR0NYRGorMWJKOWlQ?=
 =?utf-8?B?T0srNGt6SEtsTjFaYndiN3dFUkFIaFV5cXR0NlNYRGRNTEx3bytsVkQ5dmRk?=
 =?utf-8?B?dDZXdmNBWUY5UW1kNGZzZjhiK2FES0tWdE8zRk1mbWhMUC83U29ZT0RtbHJu?=
 =?utf-8?B?QjFvL2QwRHJkMk1ySTZFWE92Z0U1SmxudUIydU9ONDJ1cEg2NkRKYVVKWVZ5?=
 =?utf-8?B?UDVpZktUOHg4YWNRbFRrWVV1N2hNVEF6cmsyRFZMKzJLZ1BEVk5WSjM2Y1ZI?=
 =?utf-8?B?NlBoQ0xVZEw1Z0oxSnM0T1hJRmNvdUJiMUd1MGJtSUFyS2J3VzNKNGM1bUFM?=
 =?utf-8?B?N2U1SWV4VGhGczg3SkN1aUpKU2VuTi85SXhpR21IVU4vRW9DZFVxWlVFOVNW?=
 =?utf-8?B?VmZlZFhuT2R6cjdEZVV6RVZnaWs4ZHptZzhvME53djRuSzd4WlpwcGdrS3Ux?=
 =?utf-8?B?L2ZxcUZET2YxMmUvT0Mxa1htMFVRUEdqWStrc3RCNGZZZzM5N0xudk13blB2?=
 =?utf-8?B?NzdnNUh0N0JXYUIzbFdhSVVRenEyM2FsV3JUWk5qUEk1VDRIQytvMDV0czNl?=
 =?utf-8?B?M3d4ZmM0VzV2a0E4eGI3cWxwWEViMHBDWWV6U3pWWGFlcDFhb3BiRXg0N05C?=
 =?utf-8?B?c2RaU0poRUw4UVRIdnd3SWx6aC8wdGcxSU05RGJ5blNrWUs0QVMrYzJoNVhi?=
 =?utf-8?B?aHBKN1NtVWJURC9DVGt2cUlTRGRPMkl3bTZrc3d0U1ZKa0xSOVRBU0lLdzUx?=
 =?utf-8?B?VjlJNnlmVERpYXc0MmVvbnBwdFNqMHNpT2RhNXlyaHcyK3NiNktkRnh0dy9V?=
 =?utf-8?B?UVRvSUNVSWRoY014c1QzSDdSdFZhU0UxbzhyM0hxK0JxT0RwSWJxak5VcmRT?=
 =?utf-8?B?b3gzYXRMVk5IckxZUldHN0dzWHo3aXExR1NEcDJ0alM5QWU5Lzd4MHVQWGxR?=
 =?utf-8?B?K3FVdFFCaHc5TjF1TFlJVHJCZWx2Wm1xdksyM0tnNG11UlJSRk1zODV5V3M1?=
 =?utf-8?B?UEtZVDhJcldDMGZIN2wvQzZodkZRdE5IaEFOSE1oUy9DeVpyTlJaaXBPRklX?=
 =?utf-8?B?OGN6cGNvcGdUcDFPRU4xT0VTYjBnYVBzV1drMXkzYWJTcHlzckwvbFM0bjJo?=
 =?utf-8?B?OWhoVml4UmpGNW5xVjZEZkw1Z215Q3pTbS9JRjB1QUxIQ0drMzhwUFh1ZVAx?=
 =?utf-8?B?ZFh6a0huL2JzRGE3OEtkNVkvL3lQSEpqMUpiMm8zNzFYSWhwbUN2WFpYd3NH?=
 =?utf-8?B?TlVxMkxZMXJYeklLN1dJanJQbFZiSTVRL1pUQ0tycXd2MHZrVUs4T0Jvck1l?=
 =?utf-8?B?bkMvOE5Tc2VvUThsSU5ENEJuZnk5VjlXZk9iUUxtM0lOYXl4SFV1VG84Yjk1?=
 =?utf-8?B?a0NTSzVqMlU5dHJQdEJVa1lCMUJnTEMvWEtHVWZCemdHMjlrQ2dNRkQyWWky?=
 =?utf-8?B?ZVpWV05zWldsb2k3cThRSWpUbWR5NFB2NHp5V3JacFBHT2wyYmtjSkM2VHNn?=
 =?utf-8?B?Y1FpdGxYOEJWdkticUo4T3JhVjMvOWZDaWlZRDhlVHIrVFdHV2djamNaeXdM?=
 =?utf-8?B?eUVhVEN3UlhpTnZXTXNIb3lHbXlYQ2dSYUNlVEtUY0R2dUFsWUhTaGNBTDM4?=
 =?utf-8?B?ZkxsbittSjNHbHI5ZkRucjBkeE9NN0syY2Ixc3RKdVBQOGtvcUR1ZGJRcC9h?=
 =?utf-8?B?dFZNTVFkNno4cjh4b2VTZ1hneW92Y0hSYmt1WTBCQ0FXNXN3MmpzT3ZRZzgw?=
 =?utf-8?B?cjlHcWZ1dUNQWHY2N2M1dEIzcFdFaGpBK0x4ZVpGdkR1M3NYcGJvYXBJUldx?=
 =?utf-8?B?M2NQck9nMGhLcWsvRHJTMlBwYk54WjE5NnBnWWhLWXlsc2RWSEJ6WVBZOU82?=
 =?utf-8?Q?y1AXeymsyUT9gyiGMKqQUkMawQAAV8so?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THlvTGlxY1J0a1Zsc1Vza1lEd0NzVXFPNWtCVG13OFpoUm82TWZwRVArOXhj?=
 =?utf-8?B?QlFKVVh2Zk9ORUNnRGdmSUh5WXp4enFpNFJiWUxEeWxnSUdRc2JKN3RJWGg5?=
 =?utf-8?B?WXU4OGoxTXFVUUtmeEdVbWFlTWEzNEl2UFhiMU9rbG9mUmt3eG9VK3c4ZFJK?=
 =?utf-8?B?VXJRL3hmV0w1M2ZCbXF0NzN2VHRDMnhBbVhCQlRlSlA1NkZYMVhGaVd4R3dw?=
 =?utf-8?B?Y0V5QmkrdlpYK2JoK0I1YWs0U2o2OHd6VFNNdFNlK2ZUU0xBSWwxNXZ5T092?=
 =?utf-8?B?blNFL0UwYnVzTHQ5Sjk2NTNQZjJZK21tYW93aytLVlZIVmNoVkxESVNiVisx?=
 =?utf-8?B?MVFKNXJmeFlVM0pJMEpDTkFOOHFBbUpPZ1JoWXQrdlBoVzhKRDhRZDZnMG9K?=
 =?utf-8?B?OENlZXNiazBnSDFqaDBld2FReWN4dm9jbTBCYjY1cS9LMGxtb1N1eHVhNnpR?=
 =?utf-8?B?dlFxdXNaV3F1RTNTdjBndkQzSVdLSXdWZjErdFlLUEpnWG14dEovMEtCSDNs?=
 =?utf-8?B?NVpuWnJZOTQ2OExwVkR5cXdQUkVSN3d4elp3MC9hakw0NDV6WWxpb09mcnJD?=
 =?utf-8?B?bXBwbW1qbXdtOEt1M2dmT01HcmhOeWVyYUU5cXh6U0FxNGxFL2tsR1FVWlNJ?=
 =?utf-8?B?djdYWUc4VGVEOFNCT3BBa1U4UWNOajlib2lKL3o5TnlpajlEWkw5cE4zVVdC?=
 =?utf-8?B?dmVMNFVNSnpFUWF6bmR4SlJmSGhXN1ppbXBhS2doZmg4QUwzeWpCajc2N05p?=
 =?utf-8?B?QjFYbmJYWE1MVHE0STA0UG53S2ZPN001M21KY1djYXVoeWRiN2JMREVTQ0JF?=
 =?utf-8?B?R2VoU0tocmRZUG0yTkIvVVlPd0VHNzF6R1k0bjZzYmdyOGxaSGVWQnliMEdH?=
 =?utf-8?B?MVdIcm9FeEExYUh1ZXpqM0Z6WGRiWmVaLzZRT285UkxHeCsxVS9RSG5EZ05G?=
 =?utf-8?B?NTRjVGpPZ1h1cGdRYXpzYTVlNUxFNlp4U3JzZmgzVzhHd3ErcVgyc0wzV0NJ?=
 =?utf-8?B?RVJ4WTBKbyszaGUvUWFKT2NqTHJzZXpkUVk2T1pLOS9ZcWlldE9HQU9FOHd6?=
 =?utf-8?B?ZGhOVDNVQUtySHdLdzViVmRjNjZtRjU1Q1RsQmwvT3EyUnZKOEV0YXFwN3Y2?=
 =?utf-8?B?ei8zTDZrNjRBTzhGQWVKRzJVYi9ISHZIalRjcHBlZGdDb3g3WWMrQlFpMWVJ?=
 =?utf-8?B?WHVwOWo4SndITTJrSHU3K2srUGJlV1JWM2pQWlJPMHBLdVl4MitqSk95TWl0?=
 =?utf-8?B?Y2hCbmV2VUFCOE1sc2hTOXVhWHBmaHFMLzMxckw2UEthbjJLUUlhOENEZkFh?=
 =?utf-8?B?eDRQUHp2d3BrK3cxY2hpRitGTUh5YjJiUGp1UkRjVkN0TjZIcUlTVExrQktV?=
 =?utf-8?B?eHM4SWhYamhaS3FJZWx0Y2FKSkRqb0VaTWxNU0x4SGh1VzZkc2xsM09GalJJ?=
 =?utf-8?B?dzRiMDVYVzk4SGtKNmV0K2NvNzNOeCs3NnBsa3FDY3NFSEozS2lUY1llSDB5?=
 =?utf-8?B?M0d5a0VKUlFCZlE1ZW1kVkJZcE5ESUtmQzhScVd5S2JrU0FRcHBsQXRQQU1l?=
 =?utf-8?B?Y1RMWnh4RmxOV0NGU0dnaXpVZklraWVmUjFRbkRBcmRXbW1sOVcra0w1MjJO?=
 =?utf-8?B?NEFjc1l0UTV0NWlEMzZRY25QMWl5eGpvQldUZWNHZS9KcXdHQ3BvLzMrWVAr?=
 =?utf-8?B?ZUw4YWlzb2JYT0pnN3NteXk3Ty9pdFFpQWwxWVhEdytQYUR4VU5aM1ovM3Zp?=
 =?utf-8?B?NTdZUStueXlNQ01LWmUxTlNkOVIxWjBkWUF5dCtKcjhaYkxoQVR3bFhtYVZh?=
 =?utf-8?B?c2JPTGpLeC9DT013ZUJxdXlqUlMvUXpMZURGUGxSd1QrK3phM28rVkdKYU5l?=
 =?utf-8?B?UnlhcDBWMXJ6TDkxbWZKcWl1aDRFWEtzVDVZRERlOEtPb1g0ZTNlZGJTcndS?=
 =?utf-8?B?aUdNV3oyNGZFdnNBdDdYL1lyTlRBZ1V3YjQ4MGwwTHR3Y21tdVkyR1IvQ2hC?=
 =?utf-8?B?SXh0UTNKemVpOUdueWNZbWVaOERPV0R4c1VzWjdjbmlzZ2ZxaUZ6N0RydEFS?=
 =?utf-8?B?dEVnandhN215OFg3YXRBTTJXamxOaGJvaVN6Q2NsL0FQaUZtWGMyUzJ6d3Vz?=
 =?utf-8?Q?2jGXvCEuLO0aWgMpI81n/LEhd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c37ad15-525e-4c4b-3753-08dd6aca6140
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 11:52:40.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcF9i7kwwWdIzPXgB2VzrQOKM3AD0bGz2Z/AS1Odu9lFP/oRvogaKtSqRW7E/7Kol95ouiiqDfm/P91OK0mLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use dev_gpiod_get to get GPIO descriptor.
 - Use gpiod_set_value to configure output value.

With legacy of_gpio API, the driver set gpio value 0 to assert reset,
and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 means
output low, set value 0 means output high with gpiod API.

The in-tree DTS files have the right polarity set up already so we
can expect this to "just work".

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/wcd938x.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 1ae498c323912ed799dcc033e7777936d90c9284..955a0d3a77d7cb45932faa0c7a6f5060232d33b4 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -11,7 +11,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -171,7 +170,7 @@ struct wcd938x_priv {
 	int flyback_cur_det_disable;
 	int ear_rx_path;
 	int variant;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct gpio_desc *us_euro_gpio;
 	u32 micb1_mv;
 	u32 micb2_mv;
@@ -3251,9 +3250,9 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 	struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
 	int ret;
 
-	wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
-	if (wcd938x->reset_gpio < 0)
-		return dev_err_probe(dev, wcd938x->reset_gpio,
+	wcd938x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(wcd938x->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(wcd938x->reset_gpio),
 				     "Failed to get reset gpio\n");
 
 	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
@@ -3297,10 +3296,10 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 
 static int wcd938x_reset(struct wcd938x_priv *wcd938x)
 {
-	gpio_direction_output(wcd938x->reset_gpio, 0);
+	gpiod_set_value(wcd938x->reset_gpio, 1);
 	/* 20us sleep required after pulling the reset gpio to LOW */
 	usleep_range(20, 30);
-	gpio_set_value(wcd938x->reset_gpio, 1);
+	gpiod_set_value(wcd938x->reset_gpio, 0);
 	/* 20us sleep required after pulling the reset gpio to HIGH */
 	usleep_range(20, 30);
 

-- 
2.37.1


