Return-Path: <linux-gpio+bounces-38718-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cLA0M2VkNWrhuwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38718-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:46:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3076A6CE9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:46:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=SVnmmEDm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38718-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38718-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5572430E11BC
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C3D3B47D7;
	Fri, 19 Jun 2026 15:41:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F763B47F5;
	Fri, 19 Jun 2026 15:41:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883715; cv=fail; b=PQhDvnslDOqhCJrNAWIlhX9z+SlbtVBoMpLFdrpa/ZJk18ej84Ea16B4NFo/kRQlSI/lv9ajifeFwPMhNmqHbRWx4cC0hdhs4Daw1vNVfXH00Kd66EYREc3w2fXRMBnjCM2lqIYEpdxwu8vWvW/MHwOQ8VBSkNrGtJ7pPVmbW90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883715; c=relaxed/simple;
	bh=JCmlBUd1hOs2Ql7tP5Nd4u4S4zO64Tgj2qbXT6oeWPY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QyddrAFaGuh+Oc5QCySoXBE90BcbaI5IsggjUJSTszq4C8dGwmjNVfqi6ZvH621tl3E54B/ZLhkoaGtCE8+6V17tbRjctGibIjwibYDZs6kIQxkVJgwRamz8RuOLqNrALRRWrIpHYLx6TsXZ3oLGSEyVrTLyLyvwe5VzaJAbbRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SVnmmEDm; arc=fail smtp.client-ip=52.101.84.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWJ3Trp80Qa7VXuMpOS/k7KPddmzeOEoF3fiLxBjJXjwisy8HNvjsNMGhflFrJ0Jm5lSGW7cbkpVVepnpI9udbHZ1Ql54iM33+8KwiLQxv+ulxLxfxEHKTl8I0EzG4HWtIixqol9ZhzqmkmWJcFoTsgiGAGuGM+PKHMznfaZndFZ92FtQr7NxLcfdq+ndkadPoCdD6odtgFYFKaDklWawjTHTHL3TlzdONYlCWNtA+qbNmnQT+w3RTLqkNtMkP1OzStpGUh1YuG8MdKhmD94bFMJab4D+x9VTaxkf+mCXfsQ5Id9tg4D4O5ispAoRbpAwjbWJgk5ZCkos4/X4EuVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zeoyPgg1pLQy6SDUrpuRmPYHEZN6yNgpmetPoyyQoA=;
 b=Lsryca2g//XDqH0f1x6rq1qdXs6oBBaGwtKdJjP3FJHFf+cVdSYPa+hwh+Em7nSxfsuH5qAkpPp5meMK2KKKaE5s0f/xOI3fA78D5PG16rmLyh60/RgAg+QedsJC2zDYW5v/jwDZS6LVug0tRN3wnzH8mLNjoMn2OBgEGuOvKOtfT7C25uh3CjEBW6/rFnL6rrJvXSTk3eaIpBHqqpxAkQXghv7C+SV3kZqZbSr+Faiuk0PjhISh1dEgf5TmWbYVH/4ye7sJbMaMDBFydKrb+K+AnkzzbTSJAOhLRx7xUfTM6M3BAleEGTfOzjj8By0IEzfeQiWwQLWg9bsG7hmOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zeoyPgg1pLQy6SDUrpuRmPYHEZN6yNgpmetPoyyQoA=;
 b=SVnmmEDmkOgRff7asQy+GrbK5/DTt6sK7jEVBSQEpljC/3pgPXw/jMHC53ZDi8r1kETB/qxjR+AmPBy/X7aXZUBgX3Rzl29RBz/CNWhi+KRYv6DZ3ptBmlBW70DFfIoUXpuDpNEgQyyT+Vrs/BHg2iI8x9/U1IbcVcwC0pwOroh9cApNaCtYX5RpHYVtmrbUSLcn3XusXhVZprvS++3BjC4B6jOzecLoFe3aTJWO4S5cYFEFDXJaOnAMbUdRYcqqmYmh/ieY3GHI1dc+7dp/HpTb/OLi8++10Gfi497K/J+UjaoVxQde3Uv/zrNfAr+dua4YATJSUuDLL05eFtH8FA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11550.eurprd04.prod.outlook.com (2603:10a6:102:50b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:41:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:41:48 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 19 Jun 2026 11:41:03 -0400
Subject: [PATCH 06/11] ARM: imxrt_defconfig: Remove NOMMU platform support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-6-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=1530;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Fg2/EEkj9US4bov//rUzpLGGqwn+OjqVDgwWuLVahMk=;
 b=N3KcD9rYtWNAg/R7PlCb7Fx/XJiVDBIqcl5bNcQyCwbvQryquGJkFPrU2VuEOdqpFNACpkf3j
 KPI3Z/FVXk6CIj//jHE8XwYdTDXZGG/YLXlXUL/7UpN2y0JdTE931YQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0116.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11550:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce36b8d-9eb0-42f8-b4ed-08dece194608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	6VCgrxOPead6zXZpzkSG5AsVMKJRjVtrG5Nzy6aJLUCjo7FNEkCDqkmTZqPkWvOIAN5Sd6G4SMOO473x8kvU/P28nxWjtAqVh81y9zCJWzYrpJaIXuaeq7/xCZ8BNXi7ZWrey6eqz+GI1tiYL5a1/k4tNCXBxAWPwadQpmMiyouCe/L81WGSjfkuATfZ14fuKoFJiWEGKHiBNNBOjIW4tzn5IAhdK35oagcCxEWNZ7yt/cV1goev3+lEGkYaXFGnJRpvrSw86B9VIXCs2ZUmUiRJiY8+X87rWZWBxycstIFXSJ4dCeD9hhpN0wVOgVXv5g6GyzGY37hzY8CpElp23dXT7t7gwxde5tXq50QiA/Jw+UHeSHEPPQDakD7UBT03TFx3xeSKogO0CQcD7QjIRbO5K//NAy7A7KvoCsICCs9UJm78Ui+4gTPXR2RoXeBo447yDqs5oBG16BrwisBaP9KaRdgyYV8zdkencfJVc2NWYrpIa8bxUGHcJrPZst6RlPOxAAlDGFnwVxGfiXshQ2nrrcCRJg6qxmUfx2WkJu50Y3Qg931ATRGBf8O+OLZYVFUJ0Fyc7+Rt+R6uJ27MJ7I3Cmu8aYZQAg2RcDSpJkiBwhbaQssysLnOn/RH21jhQIOtJBOFqkNwH+uQDok/iuFGvlUB/B7DK6XOko34+IW5Jzduc1naJGacHrrgncAHCpbsRqZSIEVooMfspnyxbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2hvZ3ZPaGVVUEpZSEpIcmU1NnZPSzVLKzlXT291M0s0OUovMEQ0d09VaGoz?=
 =?utf-8?B?VHVpWi83eHZBUWVzYWsza1h4OU93azZZOFY5a2RaZlpnSDNLU3Q0N2tsYU9G?=
 =?utf-8?B?dGluSUlkeXkvcXRrOVVseElaamRKYzNhaW9tSStIMVRtWmRJbSt3MmxNbUVk?=
 =?utf-8?B?VDRrUUhUSE1va3VJeGEweGY5cng0dkZ0YWZ1R2R1SnpSUDFiNDR4Y2FUY2Jo?=
 =?utf-8?B?aGFLaGlsbHFuTUpGVVhVRmlLcEdleWFNM01RMGp1SytlT1d5SVE2RzBmZFU2?=
 =?utf-8?B?eVhHcS9uenVKREYyVzJoVy9PbG1QWXRwYlYxeWFaaURXOHBzVGw3aTdXcjNE?=
 =?utf-8?B?SUdOUkpRNUNiZThUaVAvN2IyNmpCZlUzSFlZNHFNWjBqSlhiSysyczRDTHd2?=
 =?utf-8?B?aXBWbDk0dzlTdmtBc21aS1RsVTdnRFFqenNaTTlpY1ptMkNZTlJBSlVYT2oy?=
 =?utf-8?B?K0VFcWdwMHh2blEwWWFPM1NONDlVOHNEYkVSazFUb05nZUYrdFVvZ2pTem83?=
 =?utf-8?B?WER0NXVVUy9sTTNjN2RaemRTY29od1RlVGNSZmI1ZW43emNWZUdjSWw1NjBX?=
 =?utf-8?B?aXI2QXRvbWgrWWgzZTFEbWNMcU1LOWlhemFkdFo5SnV5MGhFdi9GMlgra01Y?=
 =?utf-8?B?NWVodWdML0phTlBGUXV1VzVJb3NlUHhNNzB4Uys1Zmo3ODhMU1VoOThzVnM3?=
 =?utf-8?B?YkVnM1F0QVJzemh4bWNjQnVuQ2svNThqL1Nickd1akNoUC9nbHN4bVdOWWlQ?=
 =?utf-8?B?cm9lSS8yWm1NVXBwa0IwcDc5dTZrazRaK21IenFjb21KRXhUS1JNdGpDZEM2?=
 =?utf-8?B?YlV1am9Sb3ZZZ1AyaFdERG1zbUVlYm9ReGxPUXlieDBFamlVRDdVRnpXZ0xk?=
 =?utf-8?B?ai9zL0QxSnRaMzBTSzlIVmpqVml0SlBVemhaK3phMnkyNjBPQTYyUEZLSnRh?=
 =?utf-8?B?UGpBSi94UllLb0p3ZzZEL2k0c3BzSHFIMUVROXROL1dwbHRWRVN6UEQrU0ZG?=
 =?utf-8?B?bXkxc3RwNjlpSGZ4OVk2WDdZR2Z0NkNqRFIvcFJBUVc2djIrS2NaQnpURU1L?=
 =?utf-8?B?NXhsTFBMSUxRdVpRUXlEZUZ5MC80UW5FZ1RZbTBsanV5bmF2UGpvbUk5bnk0?=
 =?utf-8?B?VDR0RTZkdURuZkk1ZWk2czlGT00wSVVISkZHZzhzYUx1eXpBTlVWV0NRT0dJ?=
 =?utf-8?B?MHdpZUNlUDgzRDRnT0JNOXBJRzZubWQvSkZZM2lSVEpmaWtpTVlSMktoaVQr?=
 =?utf-8?B?VVhjdEZMUnRmcTZMVUltUmt1bGsyd0dQNE5sREw1T2tLNExlOWM1L3ZuRjN3?=
 =?utf-8?B?clBTMGpHY0cvemVyeTRyS1AvYVRsbjRudHdqVU1LS205SXNLdW9jWC9QRkFH?=
 =?utf-8?B?UGxTS1pnQmVKYXRLS1hJbDhtVnVmcDZsNHpyRHpRd3F5Nkw4RFFvTENCREF5?=
 =?utf-8?B?eHdXZ3RJem9POU9FaHA4NEoxWmZvZUVoSWRiV2ZMKzlNMGd3dE5lcHNrOUFR?=
 =?utf-8?B?UDc3S2NzSVlJZDVCaEFqRE1Kb0NQMytsdWMwcm1uRFpwQlVIYWFmeGV5a0Nq?=
 =?utf-8?B?bkVET0w5STlYclMwRDJsU3lla2tvVjd2bDBMQTFzdHNjN0ZNZDFqbU14SDRK?=
 =?utf-8?B?NjVrRHV1UTRkRHF1WXlyanJ5TU5vd0paRFFsSkVESENCSS9VQkdDZFZWZGFx?=
 =?utf-8?B?SnlCSkNJbmdiRDRiUXRLOFl3UWduQ1YyMkFvS1FPeWt4aFRJbzlkYnUrRWhj?=
 =?utf-8?B?djdyY0pwRXJuMTFNa0NrQ3BaYVJrbTR0MVlvZ1J5WitNUDZGQTFkRWE0cHJp?=
 =?utf-8?B?bllFYnIyN2tRcW9jN0tUdXU5aW05b0w2TUk4Z2V6VTNBcDVwdzZ1R3RFQ0lO?=
 =?utf-8?B?dWdkTW1BMTk1SWJiV2Q1NFQ1RnBmOFhZQ3puYnF3cjZQZWZleCtjK0toVkUv?=
 =?utf-8?B?cjRyalgxZnJGb09VdHRxUUFCTVBsaHgvZkIxSTlkdGtuSmlqd0hOUXBPUWJk?=
 =?utf-8?B?bkdVWXcra2kxRlRqVVc4WWpmK0p6Uy83TktRSEFoNUViR1p3Sld5Q3RDQmY3?=
 =?utf-8?B?WU05UUlMZjVFZzllZytNUjhTcFh2MU5FbjJ2bmZLYmdPaWhPOWI0MkVCVVly?=
 =?utf-8?B?d3A2dElTWkV5UlZXUnJUWWJGVVEvVVNoVStzYnUvS05hOWxFQkFJUURidS9R?=
 =?utf-8?B?MElEWTkvQkx0TGdwdjV5NkM4OW11YjdLUjRUdU5ZL2RTa0ZMVTVScU03OExu?=
 =?utf-8?B?ZTltUnA4MXpSTytYczNZWHpxV1orNDY5MjNKaUdIc0ZzYTU5bitzcVM0TTdC?=
 =?utf-8?B?WEN2NWs3U2UyWldRNE81MkxUaFlxVVpZVmh4Vzl2QllPVGhhcEc3UmI1eEJV?=
 =?utf-8?Q?rL8q/JLIwDqKo3VwiVWCH74ZmGX+0FxcknDJf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce36b8d-9eb0-42f8-b4ed-08dece194608
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:41:48.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9/rrK5sCk4qswfnmPxtLCKT8Nv8DA4Nw1BgFOI/MSm0fBgfHqXyr27ouJDolHKwawMV2TtgTdhgHH6VI9qW7bajFItv4jurZtPSH0UAi8P1Zwn3hLthU6mutdY65Ljh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11550
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38718-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[arndb.de,pengutronix.de,agner.ch,gmail.com,kernel.org,armlinux.org.uk,nxp.com,baylibre.com,redhat.com,mleia.com,timesys.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:mid,nxp.com:email,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E3076A6CE9

From: Frank Li <Frank.Li@nxp.com>

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
i.MX platform code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/configs/imxrt_defconfig | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
deleted file mode 100644
index 52dba3762996c..0000000000000
--- a/arch/arm/configs/imxrt_defconfig
+++ /dev/null
@@ -1,35 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_BPF_SYSCALL=y
-CONFIG_SCHED_AUTOGROUP=y
-# CONFIG_MMU is not set
-CONFIG_ARCH_MXC=y
-CONFIG_SOC_IMXRT=y
-CONFIG_SET_MEM_PARAM=y
-CONFIG_DRAM_BASE=0x80000000
-CONFIG_DRAM_SIZE=0x02000000
-CONFIG_BINFMT_FLAT=y
-CONFIG_UEVENT_HELPER=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_IMX_WEIM=y
-CONFIG_LEGACY_PTY_COUNT=2
-CONFIG_SERIAL_FSL_LPUART=y
-CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
-CONFIG_SERIAL_DEV_BUS=y
-CONFIG_PINCTRL_IMXRT1050=y
-CONFIG_GPIO_MXC=y
-CONFIG_MMC=y
-CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_MMC_SDHCI_ESDHC_IMX=y
-CONFIG_DMADEVICES=y
-CONFIG_FSL_EDMA=y
-CONFIG_CLK_IMXRT1050=y
-CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_VFAT_FS=y
-CONFIG_FAT_DEFAULT_UTF8=y
-CONFIG_EXFAT_FS=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_UTF8=y

-- 
2.43.0


