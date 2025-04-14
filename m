Return-Path: <linux-gpio+bounces-18765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD5A87A80
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA592170655
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EA625A64B;
	Mon, 14 Apr 2025 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wCZZfiiT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012049.outbound.protection.outlook.com [52.101.71.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE42580CA;
	Mon, 14 Apr 2025 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619749; cv=fail; b=msDgGwk+bfWqhuMB3CG3qONl2EZXo//I92NnH7vkkYzgNhsIW34A4ipGE3dGyTtdQ0rtrG1CSIzaavkrvOve4BtqKfRtnfZBd5T34eW+ZmFmzCyYOZTljb5iF2Fz2tg1THnQdUZPoqdqOALnHFOssa1W/9u3WtkzKc5r4/wquPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619749; c=relaxed/simple;
	bh=vdrrR0V8ijj/0CS6+lKCOXbcfHxb+Kb1NZMxq+ZEbMw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yf52yYV6fk+wxZjEY0MHpmR4IBJzgqerglK26XuW5zf1dXH4ibRtXwEPQvxJ+pkg38zb49Zj+cptC4Q2UNqWqgxBFE71WHTbrTic83wwJmAf88kKVI2sXn4NnJfP6++f9lUAXKXn1pcEfVD9dEyNccNsYHuzRxxC3pOBifA8O24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wCZZfiiT; arc=fail smtp.client-ip=52.101.71.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyTupy1nuiAG2pm6lEHZSh9JDDyIiP+De3mORbNSplFX6Pne0JCGS/LBfe5AvBDCp0bBL0taIS/Wzmn1FEVCJ2GpfOoov6Susen9hP3rHhTLTJ57RHYb7AGIOmyiTt0XDVw+DgHyT9frj9/F8jeBThMaGyi3B4jmGIL3JRZGZt7ELEmoe930Jwxa68QDktmB9b69Vge8kCnUrBSbuRvxvlFUkomHkLBVQZcNIcaWOdwkL+QfathfVHDXLrk1+uDPHm0N/6QrcmsQYh9dRq7cS8XW83AvPFn68QMixXmrXru/ksc9xRrAMdaZbfF49cEbwTI7c6xGeUtg7DXEk+hlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgRZ43ajbmhRgDgi/RDtzcYX8i9G/kBXBsyaOccB3Dg=;
 b=C76jdT5XspBRwJ41qey66g4eCDVwySzdcd1HxgTnRcsap2em3btoMv1w2g7f4c76LAYn3BwtbTwaKImOal43KTKC00r02Chp8S73K7abjE045E232QLrnG+FIqC0RZk0/pLWWQYb1T1lmFdcfA6sgv9RBtLwu41+7K0GRTGDaKnHWUTs1rhFjIlDK6VwEhksYnKZFqsnsnv4RSmLcsWd/7yY0nUherpyoa7ehCLpwTvV30oDxgrVCt6PJg0p+65G1D5ZvfdSuveTFA6F4k17pZ9yemNJ+lzammjB5iGPx/xZ0ZleAXIc8vs2tD1D+CO1o1PkKuyRp+4vryb0NgbCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgRZ43ajbmhRgDgi/RDtzcYX8i9G/kBXBsyaOccB3Dg=;
 b=wCZZfiiTNwOO9b2tI+etK2Z8byJ58XtHbMNZmHQmSR+mPgRsw/Hq8JIsLnRjy8Gx9OzaIS+oe+GDUFyUlbx5o/uKa3L50xAfh2xPEN5Ki+Wh6Y69+IW9aWIqCC8dPxNRuFhhgqeYEs7keLmjBOadBXZ1n2r68IxmZBvZ3z6Il231LOKqP/W3MR+D4sGRVFblJ2RghSdCiTJI3b4OI6zLH80ScNkUN1BEN1uSMzxPlPi7SD+SsDeaMHmr/zC2JXhsmyArtWgLQ+x2lCh0zwpV9N2sBDGB+rcQqB7iSsulE3p3YDXl4k1Jwz3cq9ZlMBIeF8LriEUnC3z3XHDlzEP2Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8408.eurprd04.prod.outlook.com (2603:10a6:102:1c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:35:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:35:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 14 Apr 2025 16:34:23 +0800
Subject: [PATCH 1/3] ASoC: codec: tpa6130a2: Sort headers alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-asoc-tpa6130a2-v1-1-5f4052e656a0@nxp.com>
References: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
In-Reply-To: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619674; l=1166;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=jM24IIrQo7q70EFRljgDvOSHipKIemX2e0u5xErl8yY=;
 b=uHePuUII/4qv1lUBEVab7eSn6s+g5QV/SKqkpguWEiEIyKHDofsoR+T53Hii5AgxvWB5CT3kr
 lM1KXYff3FWArh39zG09WCsPbIynj96XEL2/spqi5KlBOFmOovKrXq1
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f634cc4-9686-4e00-50d6-08dd7b2f5919
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVgrRkN0bExHT3JxZDMremhDclpmOEU2bkdudjg3djlQSnJWcHJuTjdQb2RP?=
 =?utf-8?B?OUZQOVBzZ1d1YURWUC84dlpxWUJOWklvWExOSE52RGFMSWU5bjA5WXRGL2JU?=
 =?utf-8?B?Rm03NGhGY3E5VDNtYmtZRE9kZXJCMHdiR291WkNrTE1vOWFNTWxPMjR5YnZB?=
 =?utf-8?B?RnY4STJQbWRCblhBSTVvNEdSTXQrR093bDJRNXJtb3Yvc2RndkRwMUgva2RS?=
 =?utf-8?B?eUJaenF6Z3k1UmRZQjNiZVlMRGtwOWM3Zjk5R2tRekZJVmtLRDVhSkRpMjc3?=
 =?utf-8?B?ZTYxT2lReHVrMmlTRmhmdWV5eVEvaHVKMW5UMUhOUDJQRnZCYXlJSjZMbk1D?=
 =?utf-8?B?Q3ZxWXBkRWZjbzJXZE1PT3R1ZjVYY1ptR0pnb1E1QmFBZEFEWFE0andaVTJy?=
 =?utf-8?B?eHJ2Rld2eGFrNWVQai9zUmNMRitDTnFpcDNORkVKTHJCZDJQbDRJd083cDM5?=
 =?utf-8?B?NDBGMjk1WVRkY1psSkNVbGY0bHRxRC9BV2hacFhYZ2RMMzRNTEpBYncxbjFI?=
 =?utf-8?B?Q1M5WHQ1Rkk4RGRXcjZuSCt5bHQ1eFN1OVc1bmRsdUo5UHFGYXFBbTNOWC9M?=
 =?utf-8?B?OGIrQ2RvdXdoU3dqTDhieW0zc1JDRGlHYXZxUjhjWmZWd1htRjlKOUc3MEY5?=
 =?utf-8?B?MmZ4R3E1V1Vxc0pLaDB0MmdxaThVWmI3ZVlSN1RVN3V5cHU0ZnpuUTg2dUV5?=
 =?utf-8?B?VmJyZDdoeFFiMXVPbEI0a2ZibEZ3Z0NEeVBGR2ptdFdPeFppRUdNSkUwVEpL?=
 =?utf-8?B?Y2JaMy94S2hFaEQvWHNQZ28xc3c1K3k4L2NmNWMwWU52ZW4yem9XTXlpU0pt?=
 =?utf-8?B?TVFnbHFVQ1AyL0h2ZUpYdmQ4ZDBKbVZXZm5DVzNFdGZUVGd3M1pYMWpFZlJI?=
 =?utf-8?B?SVVKVGhlMlRHM1MyVS9BZDMxVlg2ZVE2T0w2TXRMaWpIYnJuMk5PenRjQVBt?=
 =?utf-8?B?c05VYVF5MnVSWFppOXc1UGZZTW9hZFRkSllLTWlURkZzY05DMCswSjlnT29z?=
 =?utf-8?B?QWc3UVhwRmNyc3FMUlZORWlUZkY2amNtSFlkWU1KL001Z1dOZ2N5eHVHZHpj?=
 =?utf-8?B?Rkp5eG5ySnROQlA3d1kzenJkS3NmZUN1OSszUW5PNEI2OVpnR25CR3BKQURq?=
 =?utf-8?B?SzE3eEMwSjU3U3RtQ2RyTHl4Y0lYNFNPUDVEZmlxeDM1bXFnVm8zOEpvdFVh?=
 =?utf-8?B?WnhacG9SaGprU0ZYQkxqeXJZV0Y1MDdEbFMvTlVNTHlXSWZwNnhOaUx3MkVT?=
 =?utf-8?B?R0RrQUZNR011d1NKUiswaXI0QVZIblJ1NVRJelBORjYrTDBGSXZiRHhSQWpF?=
 =?utf-8?B?cEdacU5mejRBOXcxRTFtZ0N2aTZxVmFiZTRzYThuOUdCbEZVaUU5V0lSUU1N?=
 =?utf-8?B?UFJsc0pybUVRSzRqcDRLczh0N25GeXFuekNlTVUrTjhUWXdGVlBpU2xockxE?=
 =?utf-8?B?Y2lONklNWnBDdlc0eS9qV3NNK3g4ZFJ5ZkpRUGJhYWFvZTBwMnVmYTEyeEVG?=
 =?utf-8?B?bE4yWTAxMmppZzVwSkpDcElTdm9BMXphSTZ6UGY0M2E2Y1N1bWV3QjJwc3lL?=
 =?utf-8?B?MEo3WFBuQmlGZ0FmWjJLd0xqbkNlZERTTXNLenBPWmtQT2hLSW1Md3BpSXlZ?=
 =?utf-8?B?VzBtNXpTeXg2UVN3UGYzMXBTaGxGM1E1MjNRS1pYKzhNdC9VU1EvNDBSUjR4?=
 =?utf-8?B?cGtEdXZocUFyM09FMzhEUnFwRUJmOEI2ME5FUGdNRXRHdnl4bXVQVXZYTTZT?=
 =?utf-8?B?dG1vN1QyNFg0R3pZR0pnTFE2S1pUcHRiWnJvR0M1RDU1ZzNPalg1QjA4TTdF?=
 =?utf-8?B?a1VsWEhnNXJRdVlMVG91ZzZUUlAwQXA3TDZsU3NEL0VseXp3U1NQandsZUVM?=
 =?utf-8?B?VGFsUXplRzRhaUM1d0JjT0dnQUxDUXg3UFplV2U4ODJVMG9lOWdUbW5pcENP?=
 =?utf-8?B?dmpuZSszTjdIclVWUGd5ZWtvY1gvbnlWd1JtaEdIMTVQSEErQzJnNEV2L1By?=
 =?utf-8?B?YkFtVExtQjJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHhRTmdOVk1tWGNKdDZQRnV3VzZJS2gvOGJTRmo0RGZJL2pUelNoNXdieDZC?=
 =?utf-8?B?V24weVRNOTVhT3RyRU91SE9WWVRqYmpxZmpRbndJSHlnQ0ViMkJhSE9EeDBM?=
 =?utf-8?B?NVhpckV1WTd6RnhhMVJ6Q0hkQmZoT2JTbFQ1N1VVSmx6Mlp2ODEzZ2FNK3c1?=
 =?utf-8?B?TSt2MUFsbm53ZThHS0h2VWVXYmVQMEFPL1FzUEdzeWdwdDFWUE5WSFpGY2U2?=
 =?utf-8?B?UGZUR1dGVjk1SFRKdFVWdE90cmVtdzlVemd4dHB4dGNSRDcwL24vMEd0Y3hF?=
 =?utf-8?B?UVpsWFZDajZOb3hES3ZMV1QwQ01ONm9meW1rdVl4VTlBL3VwejlINWR2SUxh?=
 =?utf-8?B?QmxudW9CU0svU1c1YjlqampaNnF4aXQvZ2xvTFhRUWVNaVBtSjRwNFZnektj?=
 =?utf-8?B?dmEyZjY3SzZGNWtpOHlvWE8rbWZjbWNqSVJ6b2JqMTgyTkpUWE9keEd5NFBC?=
 =?utf-8?B?UVU2YjhqNStQbnhna0ZwZXp4WktKL3lORDhXYWtrM1ZSWU93SEpVcU5BN2l1?=
 =?utf-8?B?UEVmNnZMdTFWL0lYdzluVU40dU1MRktYeHJMbEk2ZFhBZ1g0TDN1Wjkvc0Zk?=
 =?utf-8?B?SWVRVmt0d1MyWnB4bW1Jek9Fc3ZqckUxYW5jYmJvbStDS1NtcGcwM3Q1dUdq?=
 =?utf-8?B?TG1oaSs2VUFNTDc4bjVUUHJyS1VGcXZOdmpwaDVVZE5sSGt5TTNkNjVLakNs?=
 =?utf-8?B?TzhMWkJXNnZtNnA4aWdOYThLbG9hK0llNHM5a0dPWVp5STRhRGtIMllmWFFy?=
 =?utf-8?B?L2p0b2lBakp2YWo0WEdsdGkzTTdiVTZuNkRTQVRmSFZoQnBlbFZ2VGFBNmxs?=
 =?utf-8?B?NTZhaWlhUzhRTEtldEk5ZC9vMmlTL0VvazRsSTkybDdoNXhaZTEzTmZsaWpO?=
 =?utf-8?B?QytmOTA0L1RaZWxnMUVFdlVjWWIwRkRBNVZLVXpudmxrdEJlSHVjaGJ0Q0gw?=
 =?utf-8?B?K0FFWVJOdm9XR0U0MlArV21YaktGQWY5cDd3M2dvalAwUFBnRGlCOGpHUFBa?=
 =?utf-8?B?czhGd1QrWWNOUndGdElnSVNwaElJSE9sWU14MGNKMy9oVHYrdTh5cjl1YzBq?=
 =?utf-8?B?S2poWGFpeS95SGk4RVNsUTBPRzViU2QxbDNtUEI2QXZXRlh1RGw5N2tta21L?=
 =?utf-8?B?K0VNMlM3SzJQT1k1Y2xEekhMUHNUUnRWS1pjNDB1RnFXWG5nVDJkcWJZVnZz?=
 =?utf-8?B?UDRCVS9HdEpjSnE2L01uY1JrL3BRU1B1RDNCNk92UmJXN2MxTFpCeEl5S0Qw?=
 =?utf-8?B?eDNQTGMxT1lpeHNic0IxekQvVGQxWmdpdy9zeGZtQVZ3SXlCT3k0VUVNdEhH?=
 =?utf-8?B?VnJQSFJpbWp6OVNWR0xuaDJOS1hZdUEwL1F6NXl5ZDJBc0ZJZFBWRDFhbDd6?=
 =?utf-8?B?a3YrWW12UTJRM0lzdVhtM0Q0K2UzKzh5ajBGTWF1cXlhYU9obVhScmZqNDJv?=
 =?utf-8?B?U1NoWVBZOGhjYXJnTERNZmNvS0UvaHRtcmx2dEFma3JYZUN4MmtOU3M5ZjJq?=
 =?utf-8?B?czFrWjR1RG1ST1hSTEFCb1ZzWnVvYXNFK3ZJRkNKb2R2QTFUay9mWHBTWHg2?=
 =?utf-8?B?WlY2UjFsRjc0a3dkRXN5VGhjbUNQYUtWMzRmZUlxYzNNaHpSM01BY3VpR2l1?=
 =?utf-8?B?M1JGSk1VOEsrTFR0K2RaYU1PSWh6Y3BNVWVzYlU2aU5yZElyc0Q4aHpEVDVI?=
 =?utf-8?B?dVVDWHNIRDQ3ZUF3Y09Ncmw4SHU3NDBpaHQyemlCazJrdVZYdUNGOTk2VEVv?=
 =?utf-8?B?MTNBY2xnNWZrajQ4dXJmb3JpdVZoMG5KVWlIRXRYK0J1MERweEVQUUdRWDBN?=
 =?utf-8?B?UTRxZnZPUmhxWlNFR01HN2xTSEFBSHU1VW9HbVFTV04zOGU3Z0ZtWlRLdnU1?=
 =?utf-8?B?R3d0WFlJWkNoZEsxNmpMSkNKeER1VmtUM21tODdyQmJVOUlIRTB0TlA1VTR6?=
 =?utf-8?B?ZXU5dVZYd1BDK3V0NWw5cnhldXU4cmVBQndpKytrbGo1QWI0OGRBMEpSa2FN?=
 =?utf-8?B?THJuWDFTYkJBMGtOdkdhMHRwaG5zUmZ4V0hWT3ZjNWVDd2ZTazNrSnVQWHhZ?=
 =?utf-8?B?dlYxa09DelBBLzZUT01pOEhKUDZvSzdPVWVZWXh4bU5BUUVQZWJ1QnB2ZGFF?=
 =?utf-8?Q?P//GCIZQXZF/+dAnaaE/L1bQn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f634cc4-9686-4e00-50d6-08dd7b2f5919
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:35:44.6064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GksJLY0sL9aOT1+VW50kBjci1PGSywLDObzSBkBf+th4uHmWhRZN5BgfUG4pn7aZPeHENVqIofQ+mqn2Q9v0kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8408

From: Peng Fan <peng.fan@nxp.com>

Sort headers alphabetically to easily insert new ones
and drop duplications.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/tpa6130a2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tpa6130a2.c b/sound/soc/codecs/tpa6130a2.c
index b5472fa1bddab3d69b88c040ed561e8b5d9d1d0d..7ee4f58c2abe19134534e7b8517a4cca20cf0ad7 100644
--- a/sound/soc/codecs/tpa6130a2.c
+++ b/sound/soc/codecs/tpa6130a2.c
@@ -7,19 +7,19 @@
  * Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
 
-#include <linux/module.h>
-#include <linux/errno.h>
 #include <linux/device.h>
-#include <linux/i2c.h>
+#include <linux/errno.h>
 #include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <sound/tpa6130a2-plat.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/regmap.h>
+#include <sound/tpa6130a2-plat.h>
 
 #include "tpa6130a2.h"
 

-- 
2.37.1


