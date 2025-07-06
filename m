Return-Path: <linux-gpio+bounces-22826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B24AFA277
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 03:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F0F3B8626
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 01:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3E713E02D;
	Sun,  6 Jul 2025 01:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EqknLskn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012026.outbound.protection.outlook.com [52.101.71.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D77263E;
	Sun,  6 Jul 2025 01:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751763996; cv=fail; b=hWXeVjB7dCuV3IHdn0QMue+SZzwoVqWKw6JbgOrE1FHLCWXmLbps1o29O5JVoUcfjxM0VEqLW2CSJMcVt3BAVz3/rImxF8+6K+i2e6VgOjf/5BSB49ERLNm7lJqP23pDq85egBOrTVN3ghcRef+wTb/e+ueoUE2XWB+ZeADn85w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751763996; c=relaxed/simple;
	bh=1erBgDO9YQTsUPReW5GRSBqXlHOpBFfWmMmesMgsHeY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YJoCriTFXRLvs/Is1cSh/v40KNTcfBHp6bwCEeq7+4+fA7TBzCPKjdwiZZi3k/56bEFA8+jKSoRbU8nCk2Jg1FC377SzyKC8dWomjbndkfXA4Ywe8co0MvXCkwE7VUHTvm/RvfgAVRGI8Ac4nl4G2hFKOk6fXRbj5PbDIS4KIbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EqknLskn; arc=fail smtp.client-ip=52.101.71.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHEkv/+JMHSBF02Qe0eUb2p4Mz6kH6ZtjhiAGeHVDIkDpgoAm15zcH2ghiW25Oxri1DniZxqpwjEXwIKgJibuKm36O4tghjQJEI/mitaYQcpG6LzJD0e9W/OIi11Q3YT7HdsuEulU9n3KOSov6aT8hwuyhYD4m3pke/HAOM6VA1A8TeuFQ5yQmJBnFQcGLf8wY/Yet46KZEb1wdVzTzeQulK4bbsvRF09mPr6m54JWNyTdA3YWAIwCPgTQDSfnfkEFfpqct4JEhNQ/BnU26xEDWx4/HgCqVGJiGaQqg5P/MXZEn9BkNOIqLdwK+WTjEtBoQt03QDo9C7o+WodM4LJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nf7pXeMlNemN/g6HoBRhRPf4Czw6ETAxtx5LP4TBQPU=;
 b=n5Oem4kY9UhogPxtSdDksWOfQJP3CtS4fTk1k6i615X+5ADgg/AZIy0P1+tsGcWyNanReITG1P/tQI9E7kAMpjZA8c0VX8NTEEfmhuPOdPfe4a+C6U2ReZ2njcQ3MCCDzZ5r4gRA+UkoI6Y9R8J1u8uOLk7UsZNY//EkhaHRdwIHns9j3XIKHlhJmi9VdykLPEkjppC2xrTkgJO8lsl4QAXQe3M6fj8u95grzkjeCs2coY/C6j3q2iLuc093888yoUJHf88XgqErz4AJkLxNBZ7Ez8gbrfMLbdv7X97OF5ern0Fq0rSf1xehzcrxOktJtGfYHx+C+9C+cCHS1xY1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nf7pXeMlNemN/g6HoBRhRPf4Czw6ETAxtx5LP4TBQPU=;
 b=EqknLsknwO5ZN0GwmbL+HFiNRt++hilkP67/Ft/5PkHCdf7lP2eyt19WDpERUcpNfYqoOT4qMaWsaHKfc32PQV5fSQucLbVd8Y5LWH2Ui17P/vYzjI6oRzzTuXVmv0ZenqdH7fK88dY22M290hxRGwS9r8K9/gVlXxVpzJW24x38LGimMAWc5mOSmShw23dSd45PcjU1Hzi0e/cl5ATnjF/TtqbhhVwBnrJLCMvHbWyH5yIrwqUgg6LdjBbY9MFkXead+trSIWGyQKwTAjRyQ9/j/SLCJYwqJEe3oTccGmrvAg+aqjTf7cRaPMM78wOSuJjQIstTIqDrEiAIkEaPMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9894.eurprd04.prod.outlook.com (2603:10a6:20b:655::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Sun, 6 Jul
 2025 01:06:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:06:32 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sun, 06 Jul 2025 09:04:23 +0800
Subject: [PATCH 1/2] ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-asoc-gpio-1-v1-1-f0912095e923@nxp.com>
References: <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
In-Reply-To: <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751763885; l=1913;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1erBgDO9YQTsUPReW5GRSBqXlHOpBFfWmMmesMgsHeY=;
 b=rbbq13rx4FdQZEY1JStqHELI56Cx51PPzxCVTyKLGULv+oxULjjiQuBygQJMQRj0pY7/ErWnw
 9D0asY2xoiWCJeXf82n0pZpFm9CGPhTTd2r+3tK1xOwURl/2xGgE/SN
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9894:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b39087b-b19e-4c25-0bfd-08ddbc2958ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjF3cFkrRVN2c1d5b2xaQlBKNXpsTkZGQXdQakgrRVpaekdGc2tVRFBvVG1j?=
 =?utf-8?B?bUZNVGd5bzllQ2xXM004ZjBtb21pUjl4MlBnZzh5TkVmdFQyN1lQRWpYV3BP?=
 =?utf-8?B?K0JPMGdiS2dQRkM0MVpINjQ0b3VPSzNFNHZhd3QreFRnOUkvMWJVaDZJZmpa?=
 =?utf-8?B?cnIwb085SFdjbUNpOXFLVGZuRnJXSkFybzZOOFpUbHFtSGlla1pvYlhOamEr?=
 =?utf-8?B?a2hKU3dCVHZ3RmM1a3hvYU9ZM0NnTmluWi9KcWliVVBLSXlLSGJpSlVLTTZO?=
 =?utf-8?B?d0xHS2JSZW45WTQwV1FXV3dKQUc0WnpJdTkyT0p3WjdBcEN4c3M0K1B6bG1Y?=
 =?utf-8?B?UUJibjJqQkJlZHJnV0JMSDFEQzFIUzVKclhFdC93YnR4Q2ZHQ3lWc0pKSGNz?=
 =?utf-8?B?akdIbkxVZ3JzQlpoenpFbnkrd1pMODBobDNmWkNYSU4yaTNabWc1WjNVNTlP?=
 =?utf-8?B?VXhXNHcybHA4Y2tQYTFVNXBJS00xUFVzc1ZnRExzUUM4eFVwcm9sQXVQTUtm?=
 =?utf-8?B?V2RVNHlCLzJHQ3RSM2hWYVZkZUJZOFArdDVXMkEyM1cvaG1WZWpoNE1LbmJs?=
 =?utf-8?B?aitueTBtZE8xWUJPNGxLcmdaY2FHT1BidVIyRlR0ZUpaclY4clNwOFlzZjY4?=
 =?utf-8?B?MkVnckFwdE9CYUtlUmwvSE9ZeGlkQzNkQUR6cUlsc3ExYTFJYldpRTNRckVK?=
 =?utf-8?B?UXcwQjRMdXIwcE9ha1djd2pSeDh4bWtZREZSYmJ5SFhuSjJGVXMxYUJjcW5M?=
 =?utf-8?B?MHV1R2tDZzZlR2UyclJsSFRQbEJGc2g3WUdQSUN3d1J5WDBmL3RuOHV0aWxL?=
 =?utf-8?B?dHNWbUxTK1VuUXI4WEEybnZnQTJsMzNYMlRGTzQ2c0g1Qncrd0piQURpenNB?=
 =?utf-8?B?anZoQ1pBa3NYN251b0ZHZDFqajArSGUwMVdENEhlYm5GS2MweGgvVDV6L0tB?=
 =?utf-8?B?YjU4RUtWZjBVZmlydmRvQmlLWTF3S25OVlY0cElvMEhTUnZmdjJPWHNFbzBY?=
 =?utf-8?B?YTdLc2QxRkJPUStqeDFVbC9wSnBTMmRZOFBkMlJMejZsdmtMYVF3SkUzU05S?=
 =?utf-8?B?S0gxc3ZhdE9Yd3VRdS8xRXFFN1pZMzl0c3VQMzJzd3dWOCtKZUVPbWhvTTFi?=
 =?utf-8?B?QzhtU2R0cUVEKzdteml3MmloZzh5RGxGWjY4MEFZMnYrN1BSU1BBQmVtZ1BQ?=
 =?utf-8?B?UGlaaXJibGRQQzhZVEYwdkVoZzh3QktoZzM1Y0hhNDRFMWdhQ1FWTnc0cVln?=
 =?utf-8?B?TXV2eDVIUDNGeUZxcm5hUmVweEVIVjVQRE5MVzhTSDR6Vy9OR281R2lzTXhH?=
 =?utf-8?B?M2VkOGhsNlBCZzB4SXpYMzNTSDlnVUJKdHc5NTdVU3VMVEY1dktQUkRnRkNv?=
 =?utf-8?B?Yy9iQ1IyUFBKTExudGFMSUpuTXYvTE05SUJtaktKTmpVY3FMSmRyOXcrVnJD?=
 =?utf-8?B?OW9NTlBaOXBSdHN6WVhEc3phYVplNkJVMmRtVmZYUGdEb0tLbjZjaHNMZ0k5?=
 =?utf-8?B?U0NVSVZSOHdmT3U2bU83ZU8vaTJGdUlZS0cwY3F1M1dMYm5yWE1ZWm04WlYv?=
 =?utf-8?B?MUVQQmN3cXE5bmZERlNoWjk0RUNobW82ZWdXcytBZnRlQVJsWSswdVFlWGlp?=
 =?utf-8?B?V2NFTWNLSTZOOVhZdFdMSml1Sy9RSWhSVHMrb0JVdmlrSWFGc3VYaDdGUzVG?=
 =?utf-8?B?WnMzRXVpVDVCdUZRMWczSXlpVlFLNFVSWkF3OVd5TWtBcnJLNk9wbmhyUEc0?=
 =?utf-8?B?OU5yekxEUDZZQWVMa3lUQTJVQVRIdG42ZWw1d3V6N1hhanFNVW5GN0l4RHN4?=
 =?utf-8?B?L2cwOUQwMldYS1lJNGRyZWRtVE50Nk9sNE04T285bzJQOWthSTVuZE1rSlo4?=
 =?utf-8?B?QWEraGtjaXcyZHlUNTJZb1p6OHVGaHgrTDRlQ0tTZmNMT1hDblJMWlU2SU1G?=
 =?utf-8?B?dVYrVlRGNFVtdllMbnAxSWlORThrOFBxaEFKcXRya2Y0Ym4yMyttNy9ETXU1?=
 =?utf-8?B?M3VaRGFBbWZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTM5Q0ozeWVUYmtQTm0wTW5FU1BMVCtmMkQrU2R2RDdDblFVUjN2ck9KSG5n?=
 =?utf-8?B?d3RtWmRBUVo3WEd1NWVkengxUkp1cjFEckZOQzZ2aVZIb2I5aS9lTE4yTjdQ?=
 =?utf-8?B?UTZJZmNYWTVXOHJRdS9SbUZvdmUvVkJSRE93NTJLUEZPMDVLek9VNFpCaUM4?=
 =?utf-8?B?dVIvN0xINXpkUE8zYkJGeVRvWnZxdThjSFg2WitwRjM5dTk0cC9TWHhsajE5?=
 =?utf-8?B?U0VzVTFEakd6Ky9iOTRwV1NOd0MySTJGY2pTeXZrOG5tUW5Od0tjeWJPTzJu?=
 =?utf-8?B?QVN1SUhKOWtNMldDWEFxVmtrMjFmdnRPNTl0a09tVTBBUk9IUWNpVDJLN2Y4?=
 =?utf-8?B?TXNoMEdoOEFRRzZvVGdSemg4U01XZC9ReVltQzhsK1dKblhjUFNvOFV3VUpP?=
 =?utf-8?B?M21QK24yS2U3ZjkwdUIvTitHUGdIczJCamdaem1nejkvM1lSdWJZM2dwdHFM?=
 =?utf-8?B?TUpNUVR2dEhMTGVIZ0F3cFJ4WXRRL3JCZjRZT3kyZHJXb2gzamtnVlFMSVhM?=
 =?utf-8?B?dHNJUW1WSm5JeTVrZ0JZcUtGdmpOT29icGFKUzdOamJDOW96RE5TWlFlNzNE?=
 =?utf-8?B?c01sWUFkdWdQWVNJVWdIWk5aS1hXbGpZbnlXRm1SVVRnU1ZaaENkT1R4VDdM?=
 =?utf-8?B?cm5FV0dVckcyYWo5VFI0TTZlMm5iV1ExWEdib3NPdEdXNXJnejd0Nmxobk9u?=
 =?utf-8?B?eTBBYXNpajVLTWI2RmhndE9SWG45S2NFam8rNFdBQ0V4dXhpTnF3cktRUSt3?=
 =?utf-8?B?b2VUT2szeWtvQTJSMkpxQUZxVFVhR0tmemZ4L3c3NUxNb2ViOHBSZ2Q5aGlZ?=
 =?utf-8?B?VnVNb3pFNzJiZFVacURBZWtqNjRtTTdIeHA3TXhBOWhUc2lpeXMzVS81dEZV?=
 =?utf-8?B?S043WkZnT3k0eG9aVjgvbVFnYUpkUWdXRHQ0WVNNUXUvMUlyL1RLdFZxK3ZG?=
 =?utf-8?B?ckZzYy9RZEl2NWlaUGRrMEZtMUVmRUJzblNGeTY4N2ZlbWQrdlVxeXRoMzVM?=
 =?utf-8?B?QU9oVUJPbjQ4ZEcxUUhoS1FCTXpmMmpjVHRJeFpOVkhzZmllNWJNejcxa2NF?=
 =?utf-8?B?ZzRldHdqWXVvUGQ2bTdzQjVQOS9YMmpSTi83akVjaktaalJ4RCs5UitmM3o0?=
 =?utf-8?B?S05pcUgwbExCYWZwM0drVnM1UXdpRFNnSmVKR3JIdFpWejNRUGhVY2tQU2xm?=
 =?utf-8?B?bkNrbEJCN0J4NnJEWnNoZVc1WFVpeCtYd1ZOZEZ5ZjVXbkF6WnQ1Mk5kYWpY?=
 =?utf-8?B?YzYrS2o4cEpEcFIvUXlkcmJhVlh1OUdnZFBUWllYdU41M3pWTnFHNjV6UnFr?=
 =?utf-8?B?TEJ4YUNINERrbVNEWVB2TmdkWXRtNExZWmc1VXRER2FSdzhDOU0rRXU5cjcr?=
 =?utf-8?B?aW5NcldZMmJZSnkrUjVhUmpkUUVYWU1BVDRXYUM1K3JjSnFNWjFKUkt3MGZ1?=
 =?utf-8?B?UGpxL200S2VVU3VCZlB4QktoWFYrWTFIM3JoNyt2VWNld0tBSjU5Z3RzMHlv?=
 =?utf-8?B?eWtsYTlaMEgzMWFYd1RvQlBXUUpZa2xtMXRBUEtLQTgyV0dBNkJQbTA5T2hv?=
 =?utf-8?B?MWtSbU1kUDAzc0h5Y2RzS3d4WFhtTGVMTmgvNHVnZkk0Vks3Z3NKaWxMdFU1?=
 =?utf-8?B?OVNnOTc0ODUxTm4yVXpRZzZkU3EvYll5WnpIVkZXVFA0bGNSaWMyUEw4alBk?=
 =?utf-8?B?UUFWR2lRdWFYYUpDa0JYK1Y0aXFaRzRjWndVUGUxS0VtTnRtM2ppM3dkSmVX?=
 =?utf-8?B?Zm9temR0NWZweFVlZEY0MnJkMHYzZUZsUmNhYUNSZy9qd3Zvazh0bFRoaE5N?=
 =?utf-8?B?bWNlQnQ3MUxmY1c1WThsYUFNeU5kUkNXTll4QW5vNDgxamw1ajZVdW93Q3pi?=
 =?utf-8?B?NEN2Y1libHdQUU1NS2U1YjBLK1Fhb0dhNmFpOUNuWFUvK2l0SlJVQkhBM2px?=
 =?utf-8?B?VkVTTFlrTmdOZWQrU3RDblRVbUxCWFNXcFpVRnJTTUt1a3orMG96VVhrbVB6?=
 =?utf-8?B?VERmblVvVUFBa2VScTE4cGQ2TkZyV3doVWliRHZDVGZ4YUVIaHVWZVQzczBj?=
 =?utf-8?B?eGdISTJJc1g4bUZjVERYd3diWEM5c0ZDMjVObUVmb1VkeDhQR0lwRjhZVDgx?=
 =?utf-8?Q?oF+eNPeSsw+8O0ZlDK8bUFEZU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b39087b-b19e-4c25-0bfd-08ddbc2958ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:06:32.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YKtSobHIXZqPikDC+40QiVG33fKHS83TjGcMN+8RPWXAkCtfLIBf0BA9Q2GzrMz9JejkEzYHotLgGc8nSvE4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9894

There is no machine is using aic32x4_pdata as platform_data, so
remove the dead code.

Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/tlv320aic32x4.h    | 9 ---------
 sound/soc/codecs/tlv320aic32x4.c | 9 +--------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/include/sound/tlv320aic32x4.h b/include/sound/tlv320aic32x4.h
index 0abf74d7edbd69484c45ad6a1c39b3f67d61bd63..b779d671a99576deadc6e647edff9b1b3a5d33c2 100644
--- a/include/sound/tlv320aic32x4.h
+++ b/include/sound/tlv320aic32x4.h
@@ -40,13 +40,4 @@
 struct aic32x4_setup_data {
 	unsigned int gpio_func[5];
 };
-
-struct aic32x4_pdata {
-	struct aic32x4_setup_data *setup;
-	u32 power_cfg;
-	u32 micpga_routing;
-	bool swapdacs;
-	int rstn_gpio;
-};
-
 #endif
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 54ea4bc58c276d9ab39a15d312287dfb300dbab9..7dbcf7f7130b04a27f58f20beb83eb3676c79c3d 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1346,7 +1346,6 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 		  enum aic32x4_type type)
 {
 	struct aic32x4_priv *aic32x4;
-	struct aic32x4_pdata *pdata = dev->platform_data;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -1363,13 +1362,7 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 
 	dev_set_drvdata(dev, aic32x4);
 
-	if (pdata) {
-		aic32x4->power_cfg = pdata->power_cfg;
-		aic32x4->swapdacs = pdata->swapdacs;
-		aic32x4->micpga_routing = pdata->micpga_routing;
-		aic32x4->rstn_gpio = pdata->rstn_gpio;
-		aic32x4->mclk_name = "mclk";
-	} else if (np) {
+	if (np) {
 		ret = aic32x4_parse_dt(aic32x4, np);
 		if (ret) {
 			dev_err(dev, "Failed to parse DT node\n");

-- 
2.37.1


