Return-Path: <linux-gpio+bounces-38723-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pxx6CDJkNWrFuwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38723-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:45:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F766A6CCB
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:45:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=XLHszsLr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38723-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38723-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11FC33054CD4
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4CA3BAD93;
	Fri, 19 Jun 2026 15:42:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E23B8D7E;
	Fri, 19 Jun 2026 15:42:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883753; cv=fail; b=H8LeuY+zAZbLgB58JHhW6cVWni9usxXEjv1OvtnAHikCck2zCQeIR0FYz55k4X0djkECIrHWZ4LPsHq6iyMsZPbTs/kt6l4wmVYXSx+iN8M8Ho4rxjIPeZHsOHjtPwkidJRfsqKUqVSjfZDg2PiJuc2/e82UBj5Ly1qhrzon1e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883753; c=relaxed/simple;
	bh=z+x+YdRFkphb7UzaT9e/blNFcw26f5hPl19SX5QjTFg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jkVCdqjQlUVzsR67lFJX04IrNsvEmSKPQVDb5qNXPUigA/cYXfLlwCjwO2WBMkshlkY2qxslaz7oWqnLesk3DlIgPXFdSHGBrqDc8fzXfzt5lbpOogdQ+u56M6N7BGl+mevLWj/p9J+zHJ7+LAVUMUg5qvpQziXlsPe5zNu+A1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XLHszsLr; arc=fail smtp.client-ip=52.101.66.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJztp/t3Et1+tRPBNWHcKUVMhHwUF+pK0oZIeerkIzA7iAdA8hA5+8YlvHFepd3stzWXjOOWTWZGC+jzjBNO9OjXMRR/H431/eGgCiMVR62cCY47McRvwhmuIk4U94NBz3ofjt6msl9Z5lBAHjSnt0Y/WGtrCl36C91Gyk10od4V8LufxDHZtvWirQFN7Sn7v+WwTzHYkXN9fZGM0ch3zv7uHd+ji3h7Vqhju2vogt59e8uz7Ft3+3VDIzCECA5q5h20AGGrulAPhT7Dm4XjXf72YTo/Wz6+/IcgDcCWBhCu+9nZKMo3EZ6O1DqCPWtv0szjoiQAeG9ppmdMkt3Cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4WhbTZZo3X+4TKjJJPXy/vP2X7pOmkBnU+JauptuDY=;
 b=AgBg/aVdnwELsdwA0hq2ykbESIdzEahOJKs71Ygm8U+jiXdIWFBuixDu8zmmx1FZhdktecbo/bKChWbLBnJjCDPFSC3SnBfZ38nXyWWZL2QStYQTgLlWSMi+ZU2ExjJuHFFYTWQif7i1yxPHSupiMQde1HOycA7HVSbyj3wKtTF0gg5NLPzdimQTgELV/c2oo+Yly480Re5L4sHtmBJ0GgHOSE21Ni9y9UFLYy/k/Y1dSmlgGe91LcmsESiRil6I3mqttTccdsZVdLjsFaDHb5AefJ12XO3FFedZqQfq4+Zwegv1pep8PiuRNTwVHwkIsKcmhm+2B20YsB9ehyeAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4WhbTZZo3X+4TKjJJPXy/vP2X7pOmkBnU+JauptuDY=;
 b=XLHszsLr/GqI8dYX2AfW7Hv4y3907k2ngnkihEB4BheUR8NWACVsWl67obyar5+CSACYtDm5PQLSRshwAXvHKhKbFBztWD0bZHgZYohMd6mDoI/Fdiv6Dh3X5ZZ2ec73v9xlAS05R69jV74u2Z03EgVpuExV5/5AArIO8BmDZtl2A1oeHm/LT1Gm3Pncw+qdXSLgS6mrtPpVYctumTdGfvADqGRhuux/fpRkKvgWB8lfRKGM/PTvxgeRBZNbmsezNu8+kTXMAmbZDVn2miZQ54AQ7JfzBQFyAaghzGPX3kIMin8/B6yabfWdagxfCxFREWQsfqI7CvLkzrjUBlbh0g==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 15:42:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:42:10 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 19 Jun 2026 11:41:08 -0400
Subject: [PATCH 11/11] pinctrl: nxp: lpc: Remove NOMMU platform support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-11-0101795a2662@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=48004;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YQakxEhvpIT03Ykri03OSg/Yg9U1XdVk9vhXKGG66aM=;
 b=Ja3B6tV6BFNzGtmOrtbXGUGcLq416EvdPrDhunBy7sLyzbRfV2Q+Qzs5ScmAHJyWoiuIFO1G4
 yOvDCuW3Be4ByP+e9Vr+Msbn46L7/yJDcggR2EjfW555bo4mEE8F4p7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0144.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2626e2-7f34-4084-e4e4-08dece19539b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|19092799006|376014|1800799024|18002099003|921020|22082099003|5023799004|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	uNfEgnRetHkWyHAra0Km96duv/unih+7v++S4WrTWonBURDHXXUPXP9CcP88NxtcZ29dcpLqcvShA0Q7t2mSad0QYSH1T9ozEC42eguf4IIkwddLQ7OgkHL9Fv0kb4FFvdXKQyfW0SaIuWrpaTbWei4t9WLwEKe0ZdT8mUpFBP1nlyOWExkyvJNxUz24L1CEYKBdv+LmaXEb+1P7fhQDG4pCplrYGf8D3xTA0zJWwEpOiiNMPB+ZAlwdSpUfVagiWLqu3f7Ewa3sF+yDu93522bySTQA2pPTSd56enV3xW8MxZLUIxTU9hnRhMNzs/4dnhRRyED96pHP9TshdN2w/lmffGYvSwdLrq4ybz64PR8zE6j3rXVrtXhjebLyY0/PL6f4yJ9R4DduzansPrhJj6PWjh0w/FLLxX5bHaF0ih/qSaeGnqXmGwB9pxv7kfs7eRe5vqYM69ljWx2OmmaYNUu3YesvKTaPhUqyx8lc45AUBj3LtBD66MtBOY/Ra6jvO2YyidiZgIuEJI7EWDMVsTevTwgRDb/TIMC5+MDaDrg5VOKmqjULQ5aSqdyqBjSOHSSqggPo2VYj1bDJ4OkUB89cBBPrza18SlI59mPsgxphUmT9SmTJWvmBgX10rLbyFSw0hBZK9aus8vnaanQxADXygA92sd2P9V/J7BtKBTG29z0EUBmwKbdlWeUMVDAxs4s3oY5JH6jmsS/7tCcNjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(19092799006)(376014)(1800799024)(18002099003)(921020)(22082099003)(5023799004)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2h2K1JwTCtqUkxRTDV2QXRtaGl2YXlrcGdLTFZzQjRuckR6dU9JUE1ac1c3?=
 =?utf-8?B?ZDlSZFlROWtCd2c1bURvcDVzQWxldG1OcVA5aTQrZ25UOXFBMmJORGtrVVlD?=
 =?utf-8?B?QlMyd21WT0RlNGc5UnNjaGJSR2tGQ2F1cTRSUlZCM1JweXl3a3ZqOUJ5R2xv?=
 =?utf-8?B?eUhRQ2I2UkVCUzhlYTRLK1RObFl0bDJ0OXBIc08wNmJ1eUZkbWV1aXUwc0Fl?=
 =?utf-8?B?UHpwWVM0VVdQRDJzOElXRis3N3ludkFoZ0hJUWpyMWZKMDdIZzNDUitSUmk1?=
 =?utf-8?B?VTBtNjh3aTU4MTZpTkVLMm5Bb25QVW1aVTlxWCtIVXBtUWN4ZXBScWV6R01Z?=
 =?utf-8?B?UlIrdUJUejYwZ2NRRCs5NXFFa01hcktNdWtlNyt5RGx4ZS9qLzNwdXp0MTBr?=
 =?utf-8?B?NzVkM2JKUThsMFhDTFVIdTJWR25PMFhUdzBKc3NqWHlHRGdEQ3BzbUxVd3NL?=
 =?utf-8?B?WU1OOXdka01jaDA2VUFacjNrL282Tmc1NHZmYnhUcU9yeXFPb2hGclgvd09r?=
 =?utf-8?B?VE5seDhYaXpTNmlkcVUzSGQ4TDg5eE1leXR5cFBtN3lIVFRGRnBwOXUvd0kz?=
 =?utf-8?B?dk9XbkpqZldXaVhLNjUyU1BMeDYxVGRDaXp0MWExMDJicWVhOUFsNVBtdWtP?=
 =?utf-8?B?enV0L3ZPS2NPMzhCUTE4NExaSUp0MjNTcTVaaUtBNnF0TVAzam5vVW83VHYy?=
 =?utf-8?B?dVZXaEdBMGZsbnRsSmhJR053YmtDc2V5NU11dmV5VEhYUDNkRnVjY25LTWlq?=
 =?utf-8?B?UHpaOUdFNGxtV01QNVBxb0lkSG40d1FFSVdkZlBBLzhlbGhKSkYrVU1Talgr?=
 =?utf-8?B?Und1emtsdXh5WnQyYlZ0NGVCc3BFTi8wdnpZNDQrcHM2UnpsV3lwbTIvTXMy?=
 =?utf-8?B?bnN5YkpYMmpvSTJwclIwdkVnU0Y5elNtY0NKeEhNeFBpWFo1TVVrbFp5eFM0?=
 =?utf-8?B?c2dBb2E5Vlg3UlFoV3k4bmlkeGRVenYzY0ppd0tOMjB4Y1BnVjBmdmhiaDhY?=
 =?utf-8?B?SE9wNmp1YmhzM1g0dzZSU25XMy84Q0hsdkVYM0E4S2lUNzM2TWtmV29mTFVj?=
 =?utf-8?B?c3EzZUl2czNWa0VvRktLSUVabHBlWFU2VUJuejBic2hnU2VoZmtnRkNCb1k5?=
 =?utf-8?B?OVI2Z245RC91NXBTSitFNVF3OS9OekJjOEVmOG5Hb3N6MHhKcXcxUUhzQ0x3?=
 =?utf-8?B?OERxaHRWR2NRM3pIV1BYRDFqdHF5MUZPb3IrUk5DZVcwekVkWnZxUENzeHNS?=
 =?utf-8?B?NExOMnlZd0NCVUtKQkF0aHFLZkNyRU9sbXVWc09jK2t4RXRqK0lvTnhMN1VQ?=
 =?utf-8?B?Z0FQazg5K3FKK1d0T3pGZlFLaC9ZZ0RPWDE2VTRYNHROVktwTUNjbVRDLzRu?=
 =?utf-8?B?ZUJJM3l0dlM2ZHlGNEx4RTlhK3NkV3NXVUZDVDUvY2k0ZzFlSnNsZU1KYjIw?=
 =?utf-8?B?YSswLzVhTzBaUWtseGt3T3RwYUhtNUpDbWtJdVFjQkpxSGZnMjluSlBKcFFs?=
 =?utf-8?B?bE9qWk5Bc1R5bllpMjFvc3BBTzhsMFlqRlNBQ0J5ZytDd0JLZHQ5VU9NOGVB?=
 =?utf-8?B?aUF6N2Noenp2bkJiZmlLLzBYTWtKZEtGNy9mQkhabTBhWnNWOVB1UnRSaXBN?=
 =?utf-8?B?Q0xBbU9seVFjVHdTK1BJT1VGY2JyTm10dkxObVFmS2dUdUw4ejBPUHIxRFdJ?=
 =?utf-8?B?Q2t4ZzJaNFF3bVBEei9iS1dtNTBUUkRsUGVXRXlIS1BjZ0tJRDJEaVdDdTNw?=
 =?utf-8?B?TWpENW9DRWRPNXJSVXlMM2VUYVVNU2R6OUxyQ2xuVisybUtqdk5meUd4Qkdn?=
 =?utf-8?B?ZGJ2dmVuRDNYcCtnZHR5NW1NekV1WjgyMlR1OHFzNE1KWTJjQW5mZEJmUzhx?=
 =?utf-8?B?YmRlamFPdEh6UHV1LzRGaVBZbzlxV2dRNnY4ay82ck5UMHJYT0duOVdUQnh4?=
 =?utf-8?B?K0hNTFJZb1NKUVlvZWlhMk9VamtSRFdHTmZteWpjUjZSaGpkMU9ydU5waFFT?=
 =?utf-8?B?ekxtT1JVR2pGMjNCc1YwV1M2TTVWRnB2MXJaQlpCdFdDeTdLbzFubDZjeFJR?=
 =?utf-8?B?UWlna0hnV0Q3ZEdtWDVKeUMxZDlaclYwSU8vWkNweDhjM3hlSDFSL0dibmlB?=
 =?utf-8?B?NFZwd0lzWm9Jb25zV1FFc01HaU9TZzFSK3kyZEZYcHlyZW5KcktsWm94NXRQ?=
 =?utf-8?B?cjkxMUVNdVYrWk80L0l1T0lwN0RoTlFmVC9PYjVyNzZJblJRbkp4NDNyVk50?=
 =?utf-8?B?aUwvbjhub3JRSTBBY2V4ZUo5NjltenhpZ2JhTmJ4UUl2T2xKQXIxelcrNHlC?=
 =?utf-8?B?UEU2dUVsQ0Jsc3ZOTnlVVkh5aFpDMk9UNkMzZjF4VFJFcTdJWUJIRDZXNHcz?=
 =?utf-8?Q?w//PxnUEJex/exd+eGaqE5Q6cCuQZTd94uReg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2626e2-7f34-4084-e4e4-08dece19539b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:42:10.8051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WRNXdEo559jQbiKehBJTL0ilq1hjfY0A6XivbuHLHXKxvK4SacwQ0x84FCIaFQfw9KN6B0xFsD0OIzUl824jbWLnduhD0WYZ+OQxqFcrHNvRkx9bK/0ZaTNCrAZx5ch
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38723-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78F766A6CCB

From: Frank Li <Frank.Li@nxp.com>

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
NXP/Freescale platform code.

The pinctrl driver is highly SoC-specific and provides little opportunity
for reuse on future hardware

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pinctrl/Kconfig           |    9 -
 drivers/pinctrl/Makefile          |    1 -
 drivers/pinctrl/pinctrl-lpc18xx.c | 1382 -------------------------------------
 3 files changed, 1392 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2cdd7b2c49b0..35a379570becd 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -364,15 +364,6 @@ config PINCTRL_XWAY
 	depends on SOC_TYPE_XWAY
 	depends on PINCTRL_LANTIQ
 
-config PINCTRL_LPC18XX
-	bool "NXP LPC18XX/43XX SCU pinctrl driver"
-	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
-	default ARCH_LPC18XX
-	select PINMUX
-	select GENERIC_PINCONF
-	help
-	  Pinctrl driver for NXP LPC18xx/43xx System Control Unit (SCU).
-
 config PINCTRL_MAX7360
 	tristate "MAX7360 Pincontrol support"
 	depends on MFD_MAX7360
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index a35d71135abfb..2176baf2ec3fc 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -38,7 +38,6 @@ obj-$(CONFIG_PINCTRL_LANTIQ)	+= pinctrl-lantiq.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
 obj-$(CONFIG_PINCTRL_LOONGSON2) += pinctrl-loongson2.o
 obj-$(CONFIG_PINCTRL_XWAY)	+= pinctrl-xway.o
-obj-$(CONFIG_PINCTRL_LPC18XX)	+= pinctrl-lpc18xx.o
 obj-$(CONFIG_PINCTRL_MAX7360)	+= pinctrl-max7360.o
 obj-$(CONFIG_PINCTRL_MAX77620)	+= pinctrl-max77620.o
 obj-$(CONFIG_PINCTRL_MCP23S08_I2C)	+= pinctrl-mcp23s08_i2c.o
diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
deleted file mode 100644
index 5e02017683235..0000000000000
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ /dev/null
@@ -1,1382 +0,0 @@
-/*
- * Pinctrl driver for NXP LPC18xx/LPC43xx System Control Unit (SCU)
- *
- * Copyright (C) 2015 Joachim Eastwood <manabian@gmail.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- */
-
-#include <linux/bitops.h>
-#include <linux/clk.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
-
-#include <linux/pinctrl/pinconf-generic.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinmux.h>
-
-#include "core.h"
-#include "pinctrl-utils.h"
-
-/* LPC18XX SCU analog function registers */
-#define LPC18XX_SCU_REG_ENAIO0		0xc88
-#define LPC18XX_SCU_REG_ENAIO1		0xc8c
-#define LPC18XX_SCU_REG_ENAIO2		0xc90
-#define LPC18XX_SCU_REG_ENAIO2_DAC	BIT(0)
-
-/* LPC18XX SCU pin register definitions */
-#define LPC18XX_SCU_PIN_MODE_MASK	0x7
-#define LPC18XX_SCU_PIN_EPD		BIT(3)
-#define LPC18XX_SCU_PIN_EPUN		BIT(4)
-#define LPC18XX_SCU_PIN_EHS		BIT(5)
-#define LPC18XX_SCU_PIN_EZI		BIT(6)
-#define LPC18XX_SCU_PIN_ZIF		BIT(7)
-#define LPC18XX_SCU_PIN_EHD_MASK	0x300
-#define LPC18XX_SCU_PIN_EHD_POS		8
-
-#define LPC18XX_SCU_USB1_EPD		BIT(2)
-#define LPC18XX_SCU_USB1_EPWR		BIT(4)
-
-#define LPC18XX_SCU_I2C0_EFP		BIT(0)
-#define LPC18XX_SCU_I2C0_EHD		BIT(2)
-#define LPC18XX_SCU_I2C0_EZI		BIT(3)
-#define LPC18XX_SCU_I2C0_ZIF		BIT(7)
-#define LPC18XX_SCU_I2C0_SCL_SHIFT	0
-#define LPC18XX_SCU_I2C0_SDA_SHIFT	8
-
-#define LPC18XX_SCU_FUNC_PER_PIN	8
-
-/* LPC18XX SCU pin interrupt select registers */
-#define LPC18XX_SCU_PINTSEL0		0xe00
-#define LPC18XX_SCU_PINTSEL1		0xe04
-#define LPC18XX_SCU_PINTSEL_VAL_MASK	0xff
-#define LPC18XX_SCU_PINTSEL_PORT_SHIFT	5
-#define LPC18XX_SCU_IRQ_PER_PINTSEL	4
-#define LPC18XX_GPIO_PINS_PER_PORT	32
-#define LPC18XX_GPIO_PIN_INT_MAX	8
-
-#define LPC18XX_SCU_PINTSEL_VAL(val, n) \
-	((val) << (((n) % LPC18XX_SCU_IRQ_PER_PINTSEL) * 8))
-
-/* LPC18xx pin types */
-enum {
-	TYPE_ND,	/* Normal-drive */
-	TYPE_HD,	/* High-drive */
-	TYPE_HS,	/* High-speed */
-	TYPE_I2C0,
-	TYPE_USB1,
-};
-
-/* LPC18xx pin functions */
-enum {
-	FUNC_R,		/* Reserved */
-	FUNC_ADC,
-	FUNC_ADCTRIG,
-	FUNC_CAN0,
-	FUNC_CAN1,
-	FUNC_CGU_OUT,
-	FUNC_CLKIN,
-	FUNC_CLKOUT,
-	FUNC_CTIN,
-	FUNC_CTOUT,
-	FUNC_DAC,
-	FUNC_EMC,
-	FUNC_EMC_ALT,
-	FUNC_ENET,
-	FUNC_ENET_ALT,
-	FUNC_GPIO,
-	FUNC_I2C0,
-	FUNC_I2C1,
-	FUNC_I2S0_RX_MCLK,
-	FUNC_I2S0_RX_SCK,
-	FUNC_I2S0_RX_SDA,
-	FUNC_I2S0_RX_WS,
-	FUNC_I2S0_TX_MCLK,
-	FUNC_I2S0_TX_SCK,
-	FUNC_I2S0_TX_SDA,
-	FUNC_I2S0_TX_WS,
-	FUNC_I2S1,
-	FUNC_LCD,
-	FUNC_LCD_ALT,
-	FUNC_MCTRL,
-	FUNC_NMI,
-	FUNC_QEI,
-	FUNC_SDMMC,
-	FUNC_SGPIO,
-	FUNC_SPI,
-	FUNC_SPIFI,
-	FUNC_SSP0,
-	FUNC_SSP0_ALT,
-	FUNC_SSP1,
-	FUNC_TIMER0,
-	FUNC_TIMER1,
-	FUNC_TIMER2,
-	FUNC_TIMER3,
-	FUNC_TRACE,
-	FUNC_UART0,
-	FUNC_UART1,
-	FUNC_UART2,
-	FUNC_UART3,
-	FUNC_USB0,
-	FUNC_USB1,
-	FUNC_MAX
-};
-
-static const char *const lpc18xx_function_names[] = {
-	[FUNC_R]		= "reserved",
-	[FUNC_ADC]		= "adc",
-	[FUNC_ADCTRIG]		= "adctrig",
-	[FUNC_CAN0]		= "can0",
-	[FUNC_CAN1]		= "can1",
-	[FUNC_CGU_OUT]		= "cgu_out",
-	[FUNC_CLKIN]		= "clkin",
-	[FUNC_CLKOUT]		= "clkout",
-	[FUNC_CTIN]		= "ctin",
-	[FUNC_CTOUT]		= "ctout",
-	[FUNC_DAC]		= "dac",
-	[FUNC_EMC]		= "emc",
-	[FUNC_EMC_ALT]		= "emc_alt",
-	[FUNC_ENET]		= "enet",
-	[FUNC_ENET_ALT]		= "enet_alt",
-	[FUNC_GPIO]		= "gpio",
-	[FUNC_I2C0]		= "i2c0",
-	[FUNC_I2C1]		= "i2c1",
-	[FUNC_I2S0_RX_MCLK]	= "i2s0_rx_mclk",
-	[FUNC_I2S0_RX_SCK]	= "i2s0_rx_sck",
-	[FUNC_I2S0_RX_SDA]	= "i2s0_rx_sda",
-	[FUNC_I2S0_RX_WS]	= "i2s0_rx_ws",
-	[FUNC_I2S0_TX_MCLK]	= "i2s0_tx_mclk",
-	[FUNC_I2S0_TX_SCK]	= "i2s0_tx_sck",
-	[FUNC_I2S0_TX_SDA]	= "i2s0_tx_sda",
-	[FUNC_I2S0_TX_WS]	= "i2s0_tx_ws",
-	[FUNC_I2S1]		= "i2s1",
-	[FUNC_LCD]		= "lcd",
-	[FUNC_LCD_ALT]		= "lcd_alt",
-	[FUNC_MCTRL]		= "mctrl",
-	[FUNC_NMI]		= "nmi",
-	[FUNC_QEI]		= "qei",
-	[FUNC_SDMMC]		= "sdmmc",
-	[FUNC_SGPIO]		= "sgpio",
-	[FUNC_SPI]		= "spi",
-	[FUNC_SPIFI]		= "spifi",
-	[FUNC_SSP0]		= "ssp0",
-	[FUNC_SSP0_ALT]		= "ssp0_alt",
-	[FUNC_SSP1]		= "ssp1",
-	[FUNC_TIMER0]		= "timer0",
-	[FUNC_TIMER1]		= "timer1",
-	[FUNC_TIMER2]		= "timer2",
-	[FUNC_TIMER3]		= "timer3",
-	[FUNC_TRACE]		= "trace",
-	[FUNC_UART0]		= "uart0",
-	[FUNC_UART1]		= "uart1",
-	[FUNC_UART2]		= "uart2",
-	[FUNC_UART3]		= "uart3",
-	[FUNC_USB0]		= "usb0",
-	[FUNC_USB1]		= "usb1",
-};
-
-struct lpc18xx_pmx_func {
-	const char **groups;
-	unsigned ngroups;
-};
-
-struct lpc18xx_scu_data {
-	struct pinctrl_dev *pctl;
-	void __iomem *base;
-	struct clk *clk;
-	struct lpc18xx_pmx_func func[FUNC_MAX];
-};
-
-struct lpc18xx_pin_caps {
-	unsigned int offset;
-	unsigned char functions[LPC18XX_SCU_FUNC_PER_PIN];
-	unsigned char analog;
-	unsigned char type;
-};
-
-/* Analog pins are required to have both bias and input disabled */
-#define LPC18XX_SCU_ANALOG_PIN_CFG	0x10
-
-/* Macros to maniupluate analog member in lpc18xx_pin_caps */
-#define LPC18XX_ANALOG_PIN		BIT(7)
-#define LPC18XX_ANALOG_ADC(a)		((a >> 5) & 0x3)
-#define LPC18XX_ANALOG_BIT_MASK		0x1f
-#define ADC0				(LPC18XX_ANALOG_PIN | (0x00 << 5))
-#define ADC1				(LPC18XX_ANALOG_PIN | (0x01 << 5))
-#define DAC				LPC18XX_ANALOG_PIN
-
-#define LPC_P(port, pin, f0, f1, f2, f3, f4, f5, f6, f7, a, t)	\
-static struct lpc18xx_pin_caps lpc18xx_pin_p##port##_##pin = {	\
-	.offset = 0x##port * 32 * 4 + pin * 4,			\
-	.functions = {						\
-			FUNC_##f0, FUNC_##f1, FUNC_##f2,	\
-			FUNC_##f3, FUNC_##f4, FUNC_##f5,	\
-			FUNC_##f6, FUNC_##f7,			\
-	},							\
-	.analog = a,						\
-	.type = TYPE_##t,					\
-}
-
-#define LPC_N(pname, off, f0, f1, f2, f3, f4, f5, f6, f7, a, t)	\
-static struct lpc18xx_pin_caps lpc18xx_pin_##pname = {		\
-	.offset = off,						\
-	.functions = {						\
-			FUNC_##f0, FUNC_##f1, FUNC_##f2,	\
-			FUNC_##f3, FUNC_##f4, FUNC_##f5,	\
-			FUNC_##f6, FUNC_##f7,			\
-	},							\
-	.analog = a,						\
-	.type = TYPE_##t,					\
-}
-
-
-/* Pinmuxing table taken from data sheet */
-/*    Pin    FUNC0  FUNC1  FUNC2  FUNC3   FUNC4   FUNC5   FUNC6    FUNC7 ANALOG TYPE */
-LPC_P(0,0,   GPIO,  SSP1,  ENET,  SGPIO,      R,      R, I2S0_TX_WS,I2S1,     0, ND);
-LPC_P(0,1,   GPIO,  SSP1,ENET_ALT,SGPIO,      R,      R,   ENET,    I2S1,     0, ND);
-LPC_P(1,0,   GPIO,  CTIN,   EMC,      R,      R,   SSP0,  SGPIO,       R,     0, ND);
-LPC_P(1,1,   GPIO, CTOUT,   EMC,  SGPIO,      R,   SSP0,      R,       R,     0, ND);
-LPC_P(1,2,   GPIO, CTOUT,   EMC,  SGPIO,      R,   SSP0,      R,       R,     0, ND);
-LPC_P(1,3,   GPIO, CTOUT, SGPIO,    EMC,   USB0,   SSP1,      R,   SDMMC,     0, ND);
-LPC_P(1,4,   GPIO, CTOUT, SGPIO,    EMC,   USB0,   SSP1,      R,   SDMMC,     0, ND);
-LPC_P(1,5,   GPIO, CTOUT,     R,    EMC,   USB0,   SSP1,  SGPIO,   SDMMC,     0, ND);
-LPC_P(1,6,   GPIO,  CTIN,     R,    EMC,      R,      R,  SGPIO,   SDMMC,     0, ND);
-LPC_P(1,7,   GPIO, UART1, CTOUT,    EMC,   USB0,      R,      R,       R,     0, ND);
-LPC_P(1,8,   GPIO, UART1, CTOUT,    EMC,      R,      R,      R,   SDMMC,     0, ND);
-LPC_P(1,9,   GPIO, UART1, CTOUT,    EMC,      R,      R,      R,   SDMMC,     0, ND);
-LPC_P(1,10,  GPIO, UART1, CTOUT,    EMC,      R,      R,      R,   SDMMC,     0, ND);
-LPC_P(1,11,  GPIO, UART1, CTOUT,    EMC,      R,      R,      R,   SDMMC,     0, ND);
-LPC_P(1,12,  GPIO, UART1,     R,    EMC, TIMER0,      R,  SGPIO,   SDMMC,     0, ND);
-LPC_P(1,13,  GPIO, UART1,     R,    EMC, TIMER0,      R,  SGPIO,   SDMMC,     0, ND);
-LPC_P(1,14,  GPIO, UART1,     R,    EMC, TIMER0,      R,  SGPIO,       R,     0, ND);
-LPC_P(1,15,  GPIO, UART2, SGPIO,   ENET, TIMER0,      R,      R,       R,     0, ND);
-LPC_P(1,16,  GPIO, UART2, SGPIO,ENET_ALT,TIMER0,      R,      R,    ENET,     0, ND);
-LPC_P(1,17,  GPIO, UART2,     R,   ENET, TIMER0,   CAN1,  SGPIO,       R,     0, HD);
-LPC_P(1,18,  GPIO, UART2,     R,   ENET, TIMER0,   CAN1,  SGPIO,       R,     0, ND);
-LPC_P(1,19,  ENET,  SSP1,     R,      R, CLKOUT,      R, I2S0_RX_MCLK,I2S1,   0, ND);
-LPC_P(1,20,  GPIO,  SSP1,     R,   ENET, TIMER0,      R,  SGPIO,       R,     0, ND);
-LPC_P(2,0,  SGPIO, UART0,   EMC,   USB0,   GPIO,      R, TIMER3,    ENET,     0, ND);
-LPC_P(2,1,  SGPIO, UART0,   EMC,   USB0,   GPIO,      R, TIMER3,       R,     0, ND);
-LPC_P(2,2,  SGPIO, UART0,   EMC,   USB0,   GPIO,   CTIN, TIMER3,       R,     0, ND);
-LPC_P(2,3,  SGPIO,  I2C1, UART3,   CTIN,   GPIO,      R, TIMER3,    USB0,     0, HD);
-LPC_P(2,4,  SGPIO,  I2C1, UART3,   CTIN,   GPIO,      R, TIMER3,    USB0,     0, HD);
-LPC_P(2,5,  SGPIO,  CTIN,  USB1, ADCTRIG,  GPIO,      R, TIMER3,    USB0,     0, HD);
-LPC_P(2,6,  SGPIO, UART0,   EMC,   USB0,   GPIO,   CTIN, TIMER3,       R,     0, ND);
-LPC_P(2,7,   GPIO, CTOUT, UART3,    EMC,      R,      R, TIMER3,       R,     0, ND);
-LPC_P(2,8,  SGPIO, CTOUT, UART3,    EMC,   GPIO,      R,      R,       R,     0, ND);
-LPC_P(2,9,   GPIO, CTOUT, UART3,    EMC,      R,      R,      R,       R,     0, ND);
-LPC_P(2,10,  GPIO, CTOUT, UART2,    EMC,      R,      R,      R,       R,     0, ND);
-LPC_P(2,11,  GPIO, CTOUT, UART2,    EMC,      R,      R,      R,       R,     0, ND);
-LPC_P(2,12,  GPIO, CTOUT,     R,    EMC,      R,      R,      R,   UART2,     0, ND);
-LPC_P(2,13,  GPIO,  CTIN,     R,    EMC,      R,      R,      R,   UART2,     0, ND);
-LPC_P(3,0,  I2S0_RX_SCK, I2S0_RX_MCLK, I2S0_TX_SCK, I2S0_TX_MCLK,SSP0,R,R,R,  0, ND);
-LPC_P(3,1,  I2S0_TX_WS, I2S0_RX_WS,CAN0,USB1,GPIO,    R,    LCD,       R,     0, ND);
-LPC_P(3,2,  I2S0_TX_SDA, I2S0_RX_SDA,CAN0,USB1,GPIO,  R,    LCD,      R,      0, ND);
-LPC_P(3,3,      R,   SPI,  SSP0,  SPIFI, CGU_OUT,R, I2S0_TX_MCLK,  I2S1,      0, HS);
-LPC_P(3,4,   GPIO,     R,     R,  SPIFI,  UART1, I2S0_TX_WS, I2S1,  LCD,      0, ND);
-LPC_P(3,5,   GPIO,     R,     R,  SPIFI,  UART1, I2S0_TX_SDA,I2S1,  LCD,      0, ND);
-LPC_P(3,6,   GPIO,   SPI,  SSP0,  SPIFI,      R,  SSP0_ALT,   R,      R,      0, ND);
-LPC_P(3,7,      R,   SPI,  SSP0,  SPIFI,   GPIO,  SSP0_ALT,   R,      R,      0, ND);
-LPC_P(3,8,      R,   SPI,  SSP0,  SPIFI,   GPIO,  SSP0_ALT,   R,      R,      0, ND);
-LPC_P(4,0,   GPIO, MCTRL,   NMI,      R,      R,    LCD,  UART3,      R,      0, ND);
-LPC_P(4,1,   GPIO, CTOUT,   LCD,      R,      R, LCD_ALT, UART3,   ENET, ADC0|1, ND);
-LPC_P(4,2,   GPIO, CTOUT,   LCD,      R,      R, LCD_ALT, UART3,  SGPIO,      0, ND);
-LPC_P(4,3,   GPIO, CTOUT,   LCD,      R,      R, LCD_ALT, UART3,  SGPIO, ADC0|0, ND);
-LPC_P(4,4,   GPIO, CTOUT,   LCD,      R,      R, LCD_ALT, UART3,  SGPIO,    DAC, ND);
-LPC_P(4,5,   GPIO, CTOUT,   LCD,      R,      R,      R,      R,  SGPIO,      0, ND);
-LPC_P(4,6,   GPIO, CTOUT,   LCD,      R,      R,      R,      R,  SGPIO,      0, ND);
-LPC_P(4,7,    LCD, CLKIN,     R,      R,      R,      R,   I2S1,I2S0_TX_SCK,  0, ND);
-LPC_P(4,8,      R,  CTIN,   LCD,      R,   GPIO, LCD_ALT,  CAN1,  SGPIO,      0, ND);
-LPC_P(4,9,      R,  CTIN,   LCD,      R,   GPIO, LCD_ALT,  CAN1,  SGPIO,      0, ND);
-LPC_P(4,10,     R,  CTIN,   LCD,      R,   GPIO, LCD_ALT,     R,  SGPIO,      0, ND);
-LPC_P(5,0,   GPIO, MCTRL,   EMC,      R,  UART1, TIMER1,      R,      R,      0, ND);
-LPC_P(5,1,   GPIO, MCTRL,   EMC,      R,  UART1, TIMER1,      R,      R,      0, ND);
-LPC_P(5,2,   GPIO, MCTRL,   EMC,      R,  UART1, TIMER1,      R,      R,      0, ND);
-LPC_P(5,3,   GPIO, MCTRL,   EMC,      R,  UART1, TIMER1,      R,      R,      0, ND);
-LPC_P(5,4,   GPIO, MCTRL,   EMC,      R,  UART1, TIMER1,      R,      R,      0, ND);
-LPC_P(5,5,   GPIO, MCTRL,   EMC,      R,  UART1, TIMER1,      R,      R,      0, ND);
-LPC_P(5,6,   GPIO, MCTRL,   EMC,      R,  UART1, TIMER1,      R,      R,      0, ND);
-LPC_P(5,7,   GPIO, MCTRL,   EMC,      R,  UART1, TIMER1,      R,      R,      0, ND);
-LPC_P(6,0,      R, I2S0_RX_MCLK,R,    R, I2S0_RX_SCK, R,      R,      R,      0, ND);
-LPC_P(6,1,   GPIO,   EMC, UART0, I2S0_RX_WS,  R, TIMER2,      R,      R,      0, ND);
-LPC_P(6,2,   GPIO,   EMC, UART0, I2S0_RX_SDA, R, TIMER2,      R,      R,      0, ND);
-LPC_P(6,3,   GPIO,  USB0, SGPIO,    EMC,      R, TIMER2,      R,      R,      0, ND);
-LPC_P(6,4,   GPIO,  CTIN, UART0,    EMC,      R,      R,      R,      R,      0, ND);
-LPC_P(6,5,   GPIO, CTOUT, UART0,    EMC,      R,      R,      R,      R,      0, ND);
-LPC_P(6,6,   GPIO,   EMC, SGPIO,   USB0,      R, TIMER2,      R,      R,      0, ND);
-LPC_P(6,7,      R,   EMC, SGPIO,   USB0,   GPIO, TIMER2,      R,      R,      0, ND);
-LPC_P(6,8,      R,   EMC, SGPIO,   USB0,   GPIO, TIMER2,      R,      R,      0, ND);
-LPC_P(6,9,   GPIO,     R,     R,    EMC,      R, TIMER2,      R,      R,      0, ND);
-LPC_P(6,10,  GPIO, MCTRL,     R,    EMC,      R,      R,      R,      R,      0, ND);
-LPC_P(6,11,  GPIO,     R,     R,    EMC,      R, TIMER2,      R,      R,      0, ND);
-LPC_P(6,12,  GPIO, CTOUT,     R,    EMC,      R,      R,      R,      R,      0, ND);
-LPC_P(7,0,   GPIO, CTOUT,     R,    LCD,      R,      R,      R,  SGPIO,      0, ND);
-LPC_P(7,1,   GPIO, CTOUT,I2S0_TX_WS,LCD,LCD_ALT,      R,  UART2,  SGPIO,      0, ND);
-LPC_P(7,2,   GPIO, CTIN,I2S0_TX_SDA,LCD,LCD_ALT,      R,  UART2,  SGPIO,      0, ND);
-LPC_P(7,3,   GPIO, CTIN,      R,    LCD,LCD_ALT,      R,      R,      R,      0, ND);
-LPC_P(7,4,   GPIO, CTOUT,     R,    LCD,LCD_ALT,  TRACE,      R,      R, ADC0|4, ND);
-LPC_P(7,5,   GPIO, CTOUT,     R,    LCD,LCD_ALT,  TRACE,      R,      R, ADC0|3, ND);
-LPC_P(7,6,   GPIO, CTOUT,     R,    LCD,      R,  TRACE,      R,      R,      0, ND);
-LPC_P(7,7,   GPIO, CTOUT,     R,    LCD,      R,  TRACE,   ENET,  SGPIO, ADC1|6, ND);
-LPC_P(8,0,   GPIO,  USB0,     R,  MCTRL,  SGPIO,      R,      R, TIMER0,      0, HD);
-LPC_P(8,1,   GPIO,  USB0,     R,  MCTRL,  SGPIO,      R,      R, TIMER0,      0, HD);
-LPC_P(8,2,   GPIO,  USB0,     R,  MCTRL,  SGPIO,      R,      R, TIMER0,      0, HD);
-LPC_P(8,3,   GPIO,  USB1,     R,    LCD, LCD_ALT,     R,      R, TIMER0,      0, ND);
-LPC_P(8,4,   GPIO,  USB1,     R,    LCD, LCD_ALT,     R,      R, TIMER0,      0, ND);
-LPC_P(8,5,   GPIO,  USB1,     R,    LCD, LCD_ALT,     R,      R, TIMER0,      0, ND);
-LPC_P(8,6,   GPIO,  USB1,     R,    LCD, LCD_ALT,     R,      R, TIMER0,      0, ND);
-LPC_P(8,7,   GPIO,  USB1,     R,    LCD, LCD_ALT,     R,      R, TIMER0,      0, ND);
-LPC_P(8,8,      R,  USB1,     R,      R,      R,      R,CGU_OUT,   I2S1,      0, ND);
-LPC_P(9,0,   GPIO, MCTRL,     R,      R,      R,   ENET,  SGPIO,   SSP0,      0, ND);
-LPC_P(9,1,   GPIO, MCTRL,     R,      R, I2S0_TX_WS,ENET, SGPIO,   SSP0,      0, ND);
-LPC_P(9,2,   GPIO, MCTRL,     R,      R, I2S0_TX_SDA,ENET,SGPIO,   SSP0,      0, ND);
-LPC_P(9,3,   GPIO, MCTRL,  USB1,      R,      R,   ENET,  SGPIO,  UART3,      0, ND);
-LPC_P(9,4,      R, MCTRL,  USB1,      R,   GPIO,   ENET,  SGPIO,  UART3,      0, ND);
-LPC_P(9,5,      R, MCTRL,  USB1,      R,   GPIO,   ENET,  SGPIO,  UART0,      0, ND);
-LPC_P(9,6,   GPIO, MCTRL,  USB1,      R,      R,   ENET,  SGPIO,  UART0,      0, ND);
-LPC_P(a,0,      R,     R,     R,      R,      R,   I2S1, CGU_OUT,     R,      0, ND);
-LPC_P(a,1,   GPIO,   QEI,     R,  UART2,      R,      R,      R,      R,      0, HD);
-LPC_P(a,2,   GPIO,   QEI,     R,  UART2,      R,      R,      R,      R,      0, HD);
-LPC_P(a,3,   GPIO,   QEI,     R,      R,      R,      R,      R,      R,      0, HD);
-LPC_P(a,4,      R, CTOUT,     R,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(b,0,      R, CTOUT,   LCD,      R,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(b,1,      R,  USB1,   LCD,      R,   GPIO,  CTOUT,      R,      R,      0, ND);
-LPC_P(b,2,      R,  USB1,   LCD,      R,   GPIO,  CTOUT,      R,      R,      0, ND);
-LPC_P(b,3,      R,  USB1,   LCD,      R,   GPIO,  CTOUT,      R,      R,      0, ND);
-LPC_P(b,4,      R,  USB1,   LCD,      R,   GPIO,   CTIN,      R,      R,      0, ND);
-LPC_P(b,5,      R,  USB1,   LCD,      R,   GPIO,   CTIN, LCD_ALT,     R,      0, ND);
-LPC_P(b,6,      R,  USB1,   LCD,      R,   GPIO,   CTIN, LCD_ALT,     R, ADC0|6, ND);
-LPC_P(c,0,      R,  USB1,     R,   ENET,    LCD,      R,      R,  SDMMC, ADC1|1, ND);
-LPC_P(c,1,   USB1,     R, UART1,   ENET,   GPIO,      R, TIMER3,  SDMMC,      0, ND);
-LPC_P(c,2,   USB1,     R, UART1,   ENET,   GPIO,      R,      R,  SDMMC,      0, ND);
-LPC_P(c,3,   USB1,     R, UART1,   ENET,   GPIO,      R,      R,  SDMMC, ADC1|0, ND);
-LPC_P(c,4,      R,  USB1,     R,   ENET,   GPIO,      R, TIMER3,  SDMMC,      0, ND);
-LPC_P(c,5,      R,  USB1,     R,   ENET,   GPIO,      R, TIMER3,  SDMMC,      0, ND);
-LPC_P(c,6,      R,  USB1,     R,   ENET,   GPIO,      R, TIMER3,  SDMMC,      0, ND);
-LPC_P(c,7,      R,  USB1,     R,   ENET,   GPIO,      R, TIMER3,  SDMMC,      0, ND);
-LPC_P(c,8,      R,  USB1,     R,   ENET,   GPIO,      R, TIMER3,  SDMMC,      0, ND);
-LPC_P(c,9,      R,  USB1,     R,   ENET,   GPIO,      R, TIMER3,  SDMMC,      0, ND);
-LPC_P(c,10,     R,  USB1, UART1,      R,   GPIO,      R, TIMER3,  SDMMC,      0, ND);
-LPC_P(c,11,     R,  USB1, UART1,      R,   GPIO,      R,      R,  SDMMC,      0, ND);
-LPC_P(c,12,     R,     R, UART1,      R,   GPIO,  SGPIO, I2S0_TX_SDA,SDMMC,   0, ND);
-LPC_P(c,13,     R,     R, UART1,      R,   GPIO,  SGPIO, I2S0_TX_WS, SDMMC,   0, ND);
-LPC_P(c,14,     R,     R, UART1,      R,   GPIO,  SGPIO,   ENET,  SDMMC,      0, ND);
-LPC_P(d,0,      R, CTOUT,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,1,      R,     R,   EMC,      R,   GPIO,  SDMMC,      R,  SGPIO,      0, ND);
-LPC_P(d,2,      R, CTOUT,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,3,      R, CTOUT,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,4,      R, CTOUT,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,5,      R, CTOUT,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,6,      R, CTOUT,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,7,      R,  CTIN,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,8,      R,  CTIN,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,9,      R, CTOUT,   EMC,      R,   GPIO,      R,      R,  SGPIO,      0, ND);
-LPC_P(d,10,     R,  CTIN,   EMC,      R,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(d,11,     R,     R,   EMC,      R,   GPIO,   USB1,  CTOUT,      R,      0, ND);
-LPC_P(d,12,     R,     R,   EMC,      R,   GPIO,      R,  CTOUT,      R,      0, ND);
-LPC_P(d,13,     R,  CTIN,   EMC,      R,   GPIO,      R,  CTOUT,      R,      0, ND);
-LPC_P(d,14,     R,     R,   EMC,      R,   GPIO,      R,  CTOUT,      R,      0, ND);
-LPC_P(d,15,     R,     R,   EMC,      R,   GPIO,  SDMMC,  CTOUT,      R,      0, ND);
-LPC_P(d,16,     R,     R,   EMC,      R,   GPIO,  SDMMC,  CTOUT,      R,      0, ND);
-LPC_P(e,0,      R,     R,     R,    EMC,   GPIO,   CAN1,      R,      R,      0, ND);
-LPC_P(e,1,      R,     R,     R,    EMC,   GPIO,   CAN1,      R,      R,      0, ND);
-LPC_P(e,2,ADCTRIG,  CAN0,     R,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,3,      R,  CAN0,ADCTRIG,   EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,4,      R,   NMI,     R,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,5,      R, CTOUT, UART1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,6,      R, CTOUT, UART1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,7,      R, CTOUT, UART1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,8,      R, CTOUT, UART1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,9,      R,  CTIN, UART1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,10,     R,  CTIN, UART1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,11,     R, CTOUT, UART1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,12,     R, CTOUT, UART1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,13,     R, CTOUT,  I2C1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,14,     R,     R,     R,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(e,15,     R, CTOUT,  I2C1,    EMC,   GPIO,      R,      R,      R,      0, ND);
-LPC_P(f,0,   SSP0, CLKIN,     R,      R,      R,      R,      R,   I2S1,      0, ND);
-LPC_P(f,1,      R,     R,  SSP0,      R,   GPIO,      R,  SGPIO,      R,      0, ND);
-LPC_P(f,2,      R, UART3,  SSP0,      R,   GPIO,      R,  SGPIO,      R,      0, ND);
-LPC_P(f,3,      R, UART3,  SSP0,      R,   GPIO,      R,  SGPIO,      R,      0, ND);
-LPC_P(f,4,   SSP1, CLKIN, TRACE,      R,      R, R, I2S0_TX_MCLK,I2S0_RX_SCK, 0, ND);
-LPC_P(f,5,      R, UART3,  SSP1,  TRACE,   GPIO,      R,  SGPIO,      R, ADC1|4, ND);
-LPC_P(f,6,      R, UART3,  SSP1,  TRACE,   GPIO,      R,  SGPIO,   I2S1, ADC1|3, ND);
-LPC_P(f,7,      R, UART3,  SSP1,  TRACE,   GPIO,      R,  SGPIO,   I2S1, ADC1|7, ND);
-LPC_P(f,8,      R, UART0,  CTIN,  TRACE,   GPIO,      R,  SGPIO,      R, ADC0|2, ND);
-LPC_P(f,9,      R, UART0, CTOUT,      R,   GPIO,      R,  SGPIO,      R, ADC1|2, ND);
-LPC_P(f,10,     R, UART0,     R,      R,   GPIO,      R,  SDMMC,      R, ADC0|5, ND);
-LPC_P(f,11,     R, UART0,     R,      R,   GPIO,      R,  SDMMC,      R, ADC1|5, ND);
-
-/*    Pin      Offset FUNC0  FUNC1  FUNC2  FUNC3  FUNC4    FUNC5   FUNC6      FUNC7 ANALOG TYPE */
-LPC_N(clk0,     0xc00, EMC, CLKOUT,   R,     R,  SDMMC,   EMC_ALT,  SSP1,      ENET,  0, HS);
-LPC_N(clk1,     0xc04, EMC, CLKOUT,   R,     R,      R,   CGU_OUT,   R,        I2S1,  0, HS);
-LPC_N(clk2,     0xc08, EMC, CLKOUT,   R,     R,  SDMMC,   EMC_ALT,I2S0_TX_MCLK,I2S1,  0, HS);
-LPC_N(clk3,     0xc0c, EMC, CLKOUT,   R,     R,      R,   CGU_OUT,   R,        I2S1,  0, HS);
-LPC_N(usb1_dm,  0xc80, R,      R,     R,     R,      R,      R,      R,          R,   0, USB1);
-LPC_N(usb1_dp,  0xc80, R,      R,     R,     R,      R,      R,      R,          R,   0, USB1);
-LPC_N(i2c0_scl, 0xc84, R,      R,     R,     R,      R,      R,      R,          R,   0, I2C0);
-LPC_N(i2c0_sda, 0xc84, R,      R,     R,     R,      R,      R,      R,          R,   0, I2C0);
-
-#define LPC18XX_PIN_P(port, pin) {			\
-	.number = 0x##port * 32 + pin,			\
-	.name = "p"#port"_"#pin,			\
-	.drv_data = &lpc18xx_pin_p##port##_##pin 	\
-}
-
-/* Pin numbers for special pins */
-enum {
-	PIN_CLK0 = 600,
-	PIN_CLK1,
-	PIN_CLK2,
-	PIN_CLK3,
-	PIN_USB1_DM,
-	PIN_USB1_DP,
-	PIN_I2C0_SCL,
-	PIN_I2C0_SDA,
-};
-
-#define LPC18XX_PIN(pname, n) {				\
-	.number = n,					\
-	.name = #pname,					\
-	.drv_data = &lpc18xx_pin_##pname 		\
-}
-
-static const struct pinctrl_pin_desc lpc18xx_pins[] = {
-	LPC18XX_PIN_P(0,0),
-	LPC18XX_PIN_P(0,1),
-	LPC18XX_PIN_P(1,0),
-	LPC18XX_PIN_P(1,1),
-	LPC18XX_PIN_P(1,2),
-	LPC18XX_PIN_P(1,3),
-	LPC18XX_PIN_P(1,4),
-	LPC18XX_PIN_P(1,5),
-	LPC18XX_PIN_P(1,6),
-	LPC18XX_PIN_P(1,7),
-	LPC18XX_PIN_P(1,8),
-	LPC18XX_PIN_P(1,9),
-	LPC18XX_PIN_P(1,10),
-	LPC18XX_PIN_P(1,11),
-	LPC18XX_PIN_P(1,12),
-	LPC18XX_PIN_P(1,13),
-	LPC18XX_PIN_P(1,14),
-	LPC18XX_PIN_P(1,15),
-	LPC18XX_PIN_P(1,16),
-	LPC18XX_PIN_P(1,17),
-	LPC18XX_PIN_P(1,18),
-	LPC18XX_PIN_P(1,19),
-	LPC18XX_PIN_P(1,20),
-	LPC18XX_PIN_P(2,0),
-	LPC18XX_PIN_P(2,1),
-	LPC18XX_PIN_P(2,2),
-	LPC18XX_PIN_P(2,3),
-	LPC18XX_PIN_P(2,4),
-	LPC18XX_PIN_P(2,5),
-	LPC18XX_PIN_P(2,6),
-	LPC18XX_PIN_P(2,7),
-	LPC18XX_PIN_P(2,8),
-	LPC18XX_PIN_P(2,9),
-	LPC18XX_PIN_P(2,10),
-	LPC18XX_PIN_P(2,11),
-	LPC18XX_PIN_P(2,12),
-	LPC18XX_PIN_P(2,13),
-	LPC18XX_PIN_P(3,0),
-	LPC18XX_PIN_P(3,1),
-	LPC18XX_PIN_P(3,2),
-	LPC18XX_PIN_P(3,3),
-	LPC18XX_PIN_P(3,4),
-	LPC18XX_PIN_P(3,5),
-	LPC18XX_PIN_P(3,6),
-	LPC18XX_PIN_P(3,7),
-	LPC18XX_PIN_P(3,8),
-	LPC18XX_PIN_P(4,0),
-	LPC18XX_PIN_P(4,1),
-	LPC18XX_PIN_P(4,2),
-	LPC18XX_PIN_P(4,3),
-	LPC18XX_PIN_P(4,4),
-	LPC18XX_PIN_P(4,5),
-	LPC18XX_PIN_P(4,6),
-	LPC18XX_PIN_P(4,7),
-	LPC18XX_PIN_P(4,8),
-	LPC18XX_PIN_P(4,9),
-	LPC18XX_PIN_P(4,10),
-	LPC18XX_PIN_P(5,0),
-	LPC18XX_PIN_P(5,1),
-	LPC18XX_PIN_P(5,2),
-	LPC18XX_PIN_P(5,3),
-	LPC18XX_PIN_P(5,4),
-	LPC18XX_PIN_P(5,5),
-	LPC18XX_PIN_P(5,6),
-	LPC18XX_PIN_P(5,7),
-	LPC18XX_PIN_P(6,0),
-	LPC18XX_PIN_P(6,1),
-	LPC18XX_PIN_P(6,2),
-	LPC18XX_PIN_P(6,3),
-	LPC18XX_PIN_P(6,4),
-	LPC18XX_PIN_P(6,5),
-	LPC18XX_PIN_P(6,6),
-	LPC18XX_PIN_P(6,7),
-	LPC18XX_PIN_P(6,8),
-	LPC18XX_PIN_P(6,9),
-	LPC18XX_PIN_P(6,10),
-	LPC18XX_PIN_P(6,11),
-	LPC18XX_PIN_P(6,12),
-	LPC18XX_PIN_P(7,0),
-	LPC18XX_PIN_P(7,1),
-	LPC18XX_PIN_P(7,2),
-	LPC18XX_PIN_P(7,3),
-	LPC18XX_PIN_P(7,4),
-	LPC18XX_PIN_P(7,5),
-	LPC18XX_PIN_P(7,6),
-	LPC18XX_PIN_P(7,7),
-	LPC18XX_PIN_P(8,0),
-	LPC18XX_PIN_P(8,1),
-	LPC18XX_PIN_P(8,2),
-	LPC18XX_PIN_P(8,3),
-	LPC18XX_PIN_P(8,4),
-	LPC18XX_PIN_P(8,5),
-	LPC18XX_PIN_P(8,6),
-	LPC18XX_PIN_P(8,7),
-	LPC18XX_PIN_P(8,8),
-	LPC18XX_PIN_P(9,0),
-	LPC18XX_PIN_P(9,1),
-	LPC18XX_PIN_P(9,2),
-	LPC18XX_PIN_P(9,3),
-	LPC18XX_PIN_P(9,4),
-	LPC18XX_PIN_P(9,5),
-	LPC18XX_PIN_P(9,6),
-	LPC18XX_PIN_P(a,0),
-	LPC18XX_PIN_P(a,1),
-	LPC18XX_PIN_P(a,2),
-	LPC18XX_PIN_P(a,3),
-	LPC18XX_PIN_P(a,4),
-	LPC18XX_PIN_P(b,0),
-	LPC18XX_PIN_P(b,1),
-	LPC18XX_PIN_P(b,2),
-	LPC18XX_PIN_P(b,3),
-	LPC18XX_PIN_P(b,4),
-	LPC18XX_PIN_P(b,5),
-	LPC18XX_PIN_P(b,6),
-	LPC18XX_PIN_P(c,0),
-	LPC18XX_PIN_P(c,1),
-	LPC18XX_PIN_P(c,2),
-	LPC18XX_PIN_P(c,3),
-	LPC18XX_PIN_P(c,4),
-	LPC18XX_PIN_P(c,5),
-	LPC18XX_PIN_P(c,6),
-	LPC18XX_PIN_P(c,7),
-	LPC18XX_PIN_P(c,8),
-	LPC18XX_PIN_P(c,9),
-	LPC18XX_PIN_P(c,10),
-	LPC18XX_PIN_P(c,11),
-	LPC18XX_PIN_P(c,12),
-	LPC18XX_PIN_P(c,13),
-	LPC18XX_PIN_P(c,14),
-	LPC18XX_PIN_P(d,0),
-	LPC18XX_PIN_P(d,1),
-	LPC18XX_PIN_P(d,2),
-	LPC18XX_PIN_P(d,3),
-	LPC18XX_PIN_P(d,4),
-	LPC18XX_PIN_P(d,5),
-	LPC18XX_PIN_P(d,6),
-	LPC18XX_PIN_P(d,7),
-	LPC18XX_PIN_P(d,8),
-	LPC18XX_PIN_P(d,9),
-	LPC18XX_PIN_P(d,10),
-	LPC18XX_PIN_P(d,11),
-	LPC18XX_PIN_P(d,12),
-	LPC18XX_PIN_P(d,13),
-	LPC18XX_PIN_P(d,14),
-	LPC18XX_PIN_P(d,15),
-	LPC18XX_PIN_P(d,16),
-	LPC18XX_PIN_P(e,0),
-	LPC18XX_PIN_P(e,1),
-	LPC18XX_PIN_P(e,2),
-	LPC18XX_PIN_P(e,3),
-	LPC18XX_PIN_P(e,4),
-	LPC18XX_PIN_P(e,5),
-	LPC18XX_PIN_P(e,6),
-	LPC18XX_PIN_P(e,7),
-	LPC18XX_PIN_P(e,8),
-	LPC18XX_PIN_P(e,9),
-	LPC18XX_PIN_P(e,10),
-	LPC18XX_PIN_P(e,11),
-	LPC18XX_PIN_P(e,12),
-	LPC18XX_PIN_P(e,13),
-	LPC18XX_PIN_P(e,14),
-	LPC18XX_PIN_P(e,15),
-	LPC18XX_PIN_P(f,0),
-	LPC18XX_PIN_P(f,1),
-	LPC18XX_PIN_P(f,2),
-	LPC18XX_PIN_P(f,3),
-	LPC18XX_PIN_P(f,4),
-	LPC18XX_PIN_P(f,5),
-	LPC18XX_PIN_P(f,6),
-	LPC18XX_PIN_P(f,7),
-	LPC18XX_PIN_P(f,8),
-	LPC18XX_PIN_P(f,9),
-	LPC18XX_PIN_P(f,10),
-	LPC18XX_PIN_P(f,11),
-
-	LPC18XX_PIN(clk0, PIN_CLK0),
-	LPC18XX_PIN(clk1, PIN_CLK1),
-	LPC18XX_PIN(clk2, PIN_CLK2),
-	LPC18XX_PIN(clk3, PIN_CLK3),
-	LPC18XX_PIN(usb1_dm,  PIN_USB1_DM),
-	LPC18XX_PIN(usb1_dp,  PIN_USB1_DP),
-	LPC18XX_PIN(i2c0_scl, PIN_I2C0_SCL),
-	LPC18XX_PIN(i2c0_sda, PIN_I2C0_SDA),
-};
-
-/* PIN_CONFIG_GPIO_PIN_INT: route gpio to the gpio pin interrupt controller */
-#define PIN_CONFIG_GPIO_PIN_INT		(PIN_CONFIG_END + 1)
-
-static const struct pinconf_generic_params lpc18xx_params[] = {
-	{"nxp,gpio-pin-interrupt", PIN_CONFIG_GPIO_PIN_INT, 0},
-};
-
-#ifdef CONFIG_DEBUG_FS
-static const struct pin_config_item lpc18xx_conf_items[ARRAY_SIZE(lpc18xx_params)] = {
-	PCONFDUMP(PIN_CONFIG_GPIO_PIN_INT, "gpio pin int", NULL, true),
-};
-#endif
-
-static int lpc18xx_pconf_get_usb1(enum pin_config_param param, int *arg, u32 reg)
-{
-	switch (param) {
-	case PIN_CONFIG_MODE_LOW_POWER:
-		if (reg & LPC18XX_SCU_USB1_EPWR)
-			*arg = 0;
-		else
-			*arg = 1;
-		break;
-
-	case PIN_CONFIG_BIAS_DISABLE:
-		if (reg & LPC18XX_SCU_USB1_EPD)
-			return -EINVAL;
-		break;
-
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (reg & LPC18XX_SCU_USB1_EPD)
-			*arg = 1;
-		else
-			return -EINVAL;
-		break;
-
-	default:
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
-static int lpc18xx_pconf_get_i2c0(enum pin_config_param param, int *arg, u32 reg,
-				  unsigned pin)
-{
-	u8 shift;
-
-	if (pin == PIN_I2C0_SCL)
-		shift = LPC18XX_SCU_I2C0_SCL_SHIFT;
-	else
-		shift = LPC18XX_SCU_I2C0_SDA_SHIFT;
-
-	switch (param) {
-	case PIN_CONFIG_INPUT_ENABLE:
-		if (reg & (LPC18XX_SCU_I2C0_EZI << shift))
-			*arg = 1;
-		else
-			return -EINVAL;
-		break;
-
-	case PIN_CONFIG_SLEW_RATE:
-		if (reg & (LPC18XX_SCU_I2C0_EHD << shift))
-			*arg = 1;
-		else
-			*arg = 0;
-		break;
-
-	case PIN_CONFIG_INPUT_SCHMITT:
-		if (reg & (LPC18XX_SCU_I2C0_EFP << shift))
-			*arg = 3;
-		else
-			*arg = 50;
-		break;
-
-	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		if (reg & (LPC18XX_SCU_I2C0_ZIF << shift))
-			return -EINVAL;
-		else
-			*arg = 1;
-		break;
-
-	default:
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
-static int lpc18xx_pin_to_gpio(struct pinctrl_dev *pctldev, unsigned pin)
-{
-	struct pinctrl_gpio_range *range;
-
-	range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
-	if (!range)
-		return -EINVAL;
-
-	return pin - range->pin_base + range->base;
-}
-
-static int lpc18xx_get_pintsel(void __iomem *addr, u32 val, int *arg)
-{
-	u32 reg_val;
-	int i;
-
-	reg_val = readl(addr);
-	for (i = 0; i < LPC18XX_SCU_IRQ_PER_PINTSEL; i++) {
-		if ((reg_val & LPC18XX_SCU_PINTSEL_VAL_MASK) == val)
-			return 0;
-
-		reg_val >>= BITS_PER_BYTE;
-		*arg += 1;
-	}
-
-	return -EINVAL;
-}
-
-static u32 lpc18xx_gpio_to_pintsel_val(int gpio)
-{
-	unsigned int gpio_port, gpio_pin;
-
-	gpio_port = gpio / LPC18XX_GPIO_PINS_PER_PORT;
-	gpio_pin  = gpio % LPC18XX_GPIO_PINS_PER_PORT;
-
-	return gpio_pin | (gpio_port << LPC18XX_SCU_PINTSEL_PORT_SHIFT);
-}
-
-static int lpc18xx_pconf_get_gpio_pin_int(struct pinctrl_dev *pctldev,
-					  int *arg, unsigned pin)
-{
-	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
-	int gpio, ret;
-	u32 val;
-
-	gpio = lpc18xx_pin_to_gpio(pctldev, pin);
-	if (gpio < 0)
-		return -ENOTSUPP;
-
-	val = lpc18xx_gpio_to_pintsel_val(gpio);
-
-	/*
-	 * Check if this pin has been enabled as a interrupt in any of the two
-	 * PINTSEL registers. *arg indicates which interrupt number (0-7).
-	 */
-	*arg = 0;
-	ret = lpc18xx_get_pintsel(scu->base + LPC18XX_SCU_PINTSEL0, val, arg);
-	if (ret == 0)
-		return ret;
-
-	return lpc18xx_get_pintsel(scu->base + LPC18XX_SCU_PINTSEL1, val, arg);
-}
-
-static int lpc18xx_pconf_get_pin(struct pinctrl_dev *pctldev, unsigned param,
-				 int *arg, u32 reg, unsigned pin,
-				 struct lpc18xx_pin_caps *pin_cap)
-{
-	switch (param) {
-	case PIN_CONFIG_BIAS_DISABLE:
-		if ((!(reg & LPC18XX_SCU_PIN_EPD)) && (reg & LPC18XX_SCU_PIN_EPUN))
-			;
-		else
-			return -EINVAL;
-		break;
-
-	case PIN_CONFIG_BIAS_PULL_UP:
-		if (reg & LPC18XX_SCU_PIN_EPUN)
-			return -EINVAL;
-		else
-			*arg = 1;
-		break;
-
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (reg & LPC18XX_SCU_PIN_EPD)
-			*arg = 1;
-		else
-			return -EINVAL;
-		break;
-
-	case PIN_CONFIG_INPUT_ENABLE:
-		if (reg & LPC18XX_SCU_PIN_EZI)
-			*arg = 1;
-		else
-			return -EINVAL;
-		break;
-
-	case PIN_CONFIG_SLEW_RATE:
-		if (pin_cap->type == TYPE_HD)
-			return -ENOTSUPP;
-
-		if (reg & LPC18XX_SCU_PIN_EHS)
-			*arg = 1;
-		else
-			*arg = 0;
-		break;
-
-	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		if (reg & LPC18XX_SCU_PIN_ZIF)
-			return -EINVAL;
-		else
-			*arg = 1;
-		break;
-
-	case PIN_CONFIG_DRIVE_STRENGTH:
-		if (pin_cap->type != TYPE_HD)
-			return -ENOTSUPP;
-
-		*arg = (reg & LPC18XX_SCU_PIN_EHD_MASK) >> LPC18XX_SCU_PIN_EHD_POS;
-		switch (*arg) {
-		case 3: *arg += 5;
-			fallthrough;
-		case 2: *arg += 5;
-			fallthrough;
-		case 1: *arg += 3;
-			fallthrough;
-		case 0: *arg += 4;
-		}
-		break;
-
-	case PIN_CONFIG_GPIO_PIN_INT:
-		return lpc18xx_pconf_get_gpio_pin_int(pctldev, arg, pin);
-
-	default:
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
-static struct lpc18xx_pin_caps *lpc18xx_get_pin_caps(unsigned pin)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(lpc18xx_pins); i++) {
-		if (lpc18xx_pins[i].number == pin)
-			return lpc18xx_pins[i].drv_data;
-	}
-
-	return NULL;
-}
-
-static int lpc18xx_pconf_get(struct pinctrl_dev *pctldev, unsigned pin,
-			     unsigned long *config)
-{
-	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
-	enum pin_config_param param = pinconf_to_config_param(*config);
-	struct lpc18xx_pin_caps *pin_cap;
-	int ret, arg = 0;
-	u32 reg;
-
-	pin_cap = lpc18xx_get_pin_caps(pin);
-	if (!pin_cap)
-		return -EINVAL;
-
-	reg = readl(scu->base + pin_cap->offset);
-
-	if (pin_cap->type == TYPE_I2C0)
-		ret = lpc18xx_pconf_get_i2c0(param, &arg, reg, pin);
-	else if (pin_cap->type == TYPE_USB1)
-		ret = lpc18xx_pconf_get_usb1(param, &arg, reg);
-	else
-		ret = lpc18xx_pconf_get_pin(pctldev, param, &arg, reg, pin, pin_cap);
-
-	if (ret < 0)
-		return ret;
-
-	*config = pinconf_to_config_packed(param, (u16)arg);
-
-	return 0;
-}
-
-static int lpc18xx_pconf_set_usb1(struct pinctrl_dev *pctldev,
-				  enum pin_config_param param,
-				  u32 param_val, u32 *reg)
-{
-	switch (param) {
-	case PIN_CONFIG_MODE_LOW_POWER:
-		if (param_val)
-			*reg &= ~LPC18XX_SCU_USB1_EPWR;
-		else
-			*reg |= LPC18XX_SCU_USB1_EPWR;
-		break;
-
-	case PIN_CONFIG_BIAS_DISABLE:
-		*reg &= ~LPC18XX_SCU_USB1_EPD;
-		break;
-
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-		*reg |= LPC18XX_SCU_USB1_EPD;
-		break;
-
-	default:
-		dev_err(pctldev->dev, "Property not supported\n");
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
-static int lpc18xx_pconf_set_i2c0(struct pinctrl_dev *pctldev,
-				  enum pin_config_param param,
-				  u32 param_val, u32 *reg,
-				  unsigned pin)
-{
-	u8 shift;
-
-	if (pin == PIN_I2C0_SCL)
-		shift = LPC18XX_SCU_I2C0_SCL_SHIFT;
-	else
-		shift = LPC18XX_SCU_I2C0_SDA_SHIFT;
-
-	switch (param) {
-	case PIN_CONFIG_INPUT_ENABLE:
-		if (param_val)
-			*reg |= (LPC18XX_SCU_I2C0_EZI << shift);
-		else
-			*reg &= ~(LPC18XX_SCU_I2C0_EZI << shift);
-		break;
-
-	case PIN_CONFIG_SLEW_RATE:
-		if (param_val)
-			*reg |= (LPC18XX_SCU_I2C0_EHD << shift);
-		else
-			*reg &= ~(LPC18XX_SCU_I2C0_EHD << shift);
-		break;
-
-	case PIN_CONFIG_INPUT_SCHMITT:
-		if (param_val == 3)
-			*reg |= (LPC18XX_SCU_I2C0_EFP << shift);
-		else if (param_val == 50)
-			*reg &= ~(LPC18XX_SCU_I2C0_EFP << shift);
-		else
-			return -ENOTSUPP;
-		break;
-
-	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		if (param_val)
-			*reg &= ~(LPC18XX_SCU_I2C0_ZIF << shift);
-		else
-			*reg |= (LPC18XX_SCU_I2C0_ZIF << shift);
-		break;
-
-	default:
-		dev_err(pctldev->dev, "Property not supported\n");
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
-static int lpc18xx_pconf_set_gpio_pin_int(struct pinctrl_dev *pctldev,
-					  u32 param_val, unsigned pin)
-{
-	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
-	u32 val, reg_val, reg_offset = LPC18XX_SCU_PINTSEL0;
-	int gpio;
-
-	if (param_val >= LPC18XX_GPIO_PIN_INT_MAX)
-		return -EINVAL;
-
-	gpio = lpc18xx_pin_to_gpio(pctldev, pin);
-	if (gpio < 0)
-		return -ENOTSUPP;
-
-	val = lpc18xx_gpio_to_pintsel_val(gpio);
-
-	reg_offset += (param_val / LPC18XX_SCU_IRQ_PER_PINTSEL) * sizeof(u32);
-
-	reg_val = readl(scu->base + reg_offset);
-	reg_val &= ~LPC18XX_SCU_PINTSEL_VAL(LPC18XX_SCU_PINTSEL_VAL_MASK, param_val);
-	reg_val |= LPC18XX_SCU_PINTSEL_VAL(val, param_val);
-	writel(reg_val, scu->base + reg_offset);
-
-	return 0;
-}
-
-static int lpc18xx_pconf_set_pin(struct pinctrl_dev *pctldev, unsigned param,
-				 u32 param_val, u32 *reg, unsigned pin,
-				 struct lpc18xx_pin_caps *pin_cap)
-{
-	switch (param) {
-	case PIN_CONFIG_BIAS_DISABLE:
-		*reg &= ~LPC18XX_SCU_PIN_EPD;
-		*reg |= LPC18XX_SCU_PIN_EPUN;
-		break;
-
-	case PIN_CONFIG_BIAS_PULL_UP:
-		*reg &= ~LPC18XX_SCU_PIN_EPUN;
-		break;
-
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-		*reg |= LPC18XX_SCU_PIN_EPD;
-		break;
-
-	case PIN_CONFIG_INPUT_ENABLE:
-		if (param_val)
-			*reg |= LPC18XX_SCU_PIN_EZI;
-		else
-			*reg &= ~LPC18XX_SCU_PIN_EZI;
-		break;
-
-	case PIN_CONFIG_SLEW_RATE:
-		if (pin_cap->type == TYPE_HD) {
-			dev_err(pctldev->dev, "Slew rate unsupported on high-drive pins\n");
-			return -ENOTSUPP;
-		}
-
-		if (param_val == 0)
-			*reg &= ~LPC18XX_SCU_PIN_EHS;
-		else
-			*reg |= LPC18XX_SCU_PIN_EHS;
-		break;
-
-	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		if (param_val)
-			*reg &= ~LPC18XX_SCU_PIN_ZIF;
-		else
-			*reg |= LPC18XX_SCU_PIN_ZIF;
-		break;
-
-	case PIN_CONFIG_DRIVE_STRENGTH:
-		if (pin_cap->type != TYPE_HD) {
-			dev_err(pctldev->dev, "Drive strength available only on high-drive pins\n");
-			return -ENOTSUPP;
-		}
-		*reg &= ~LPC18XX_SCU_PIN_EHD_MASK;
-
-		switch (param_val) {
-		case 20: param_val -= 5;
-			fallthrough;
-		case 14: param_val -= 5;
-			fallthrough;
-		case  8: param_val -= 3;
-			fallthrough;
-		case  4: param_val -= 4;
-			 break;
-		default:
-			dev_err(pctldev->dev, "Drive strength %u unsupported\n", param_val);
-			return -ENOTSUPP;
-		}
-		*reg |= param_val << LPC18XX_SCU_PIN_EHD_POS;
-		break;
-
-	case PIN_CONFIG_GPIO_PIN_INT:
-		return lpc18xx_pconf_set_gpio_pin_int(pctldev, param_val, pin);
-
-	default:
-		dev_err(pctldev->dev, "Property not supported\n");
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
-static int lpc18xx_pconf_set(struct pinctrl_dev *pctldev, unsigned pin,
-			     unsigned long *configs, unsigned num_configs)
-{
-	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
-	struct lpc18xx_pin_caps *pin_cap;
-	enum pin_config_param param;
-	u32 param_val;
-	u32 reg;
-	int ret;
-	int i;
-
-	pin_cap = lpc18xx_get_pin_caps(pin);
-	if (!pin_cap)
-		return -EINVAL;
-
-	reg = readl(scu->base + pin_cap->offset);
-
-	for (i = 0; i < num_configs; i++) {
-		param = pinconf_to_config_param(configs[i]);
-		param_val = pinconf_to_config_argument(configs[i]);
-
-		if (pin_cap->type == TYPE_I2C0)
-			ret = lpc18xx_pconf_set_i2c0(pctldev, param, param_val, &reg, pin);
-		else if (pin_cap->type == TYPE_USB1)
-			ret = lpc18xx_pconf_set_usb1(pctldev, param, param_val, &reg);
-		else
-			ret = lpc18xx_pconf_set_pin(pctldev, param, param_val, &reg, pin, pin_cap);
-
-		if (ret)
-			return ret;
-	}
-
-	writel(reg, scu->base + pin_cap->offset);
-
-	return 0;
-}
-
-static const struct pinconf_ops lpc18xx_pconf_ops = {
-	.is_generic	= true,
-	.pin_config_get	= lpc18xx_pconf_get,
-	.pin_config_set	= lpc18xx_pconf_set,
-};
-
-static int lpc18xx_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
-{
-	return ARRAY_SIZE(lpc18xx_function_names);
-}
-
-static const char *lpc18xx_pmx_get_func_name(struct pinctrl_dev *pctldev,
-					     unsigned function)
-{
-	return lpc18xx_function_names[function];
-}
-
-static int lpc18xx_pmx_get_func_groups(struct pinctrl_dev *pctldev,
-				       unsigned function,
-				       const char *const **groups,
-				       unsigned *const num_groups)
-{
-	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups  = scu->func[function].groups;
-	*num_groups = scu->func[function].ngroups;
-
-	return 0;
-}
-
-static int lpc18xx_pmx_set(struct pinctrl_dev *pctldev, unsigned function,
-			   unsigned group)
-{
-	struct lpc18xx_scu_data *scu = pinctrl_dev_get_drvdata(pctldev);
-	struct lpc18xx_pin_caps *pin = lpc18xx_pins[group].drv_data;
-	int func;
-	u32 reg;
-
-	/* Dedicated USB1 and I2C0 pins doesn't support muxing */
-	if (pin->type == TYPE_USB1) {
-		if (function == FUNC_USB1)
-			return 0;
-
-		goto fail;
-	}
-
-	if (pin->type == TYPE_I2C0) {
-		if (function == FUNC_I2C0)
-			return 0;
-
-		goto fail;
-	}
-
-	if (function == FUNC_ADC && (pin->analog & LPC18XX_ANALOG_PIN)) {
-		u32 offset;
-
-		writel(LPC18XX_SCU_ANALOG_PIN_CFG, scu->base + pin->offset);
-
-		if (LPC18XX_ANALOG_ADC(pin->analog) == 0)
-			offset = LPC18XX_SCU_REG_ENAIO0;
-		else
-			offset = LPC18XX_SCU_REG_ENAIO1;
-
-		reg = readl(scu->base + offset);
-		reg |= pin->analog & LPC18XX_ANALOG_BIT_MASK;
-		writel(reg, scu->base + offset);
-
-		return 0;
-	}
-
-	if (function == FUNC_DAC && (pin->analog & LPC18XX_ANALOG_PIN)) {
-		writel(LPC18XX_SCU_ANALOG_PIN_CFG, scu->base + pin->offset);
-
-		reg = readl(scu->base + LPC18XX_SCU_REG_ENAIO2);
-		reg |= LPC18XX_SCU_REG_ENAIO2_DAC;
-		writel(reg, scu->base + LPC18XX_SCU_REG_ENAIO2);
-
-		return 0;
-	}
-
-	for (func = 0; func < LPC18XX_SCU_FUNC_PER_PIN; func++) {
-		if (function == pin->functions[func])
-			break;
-	}
-
-	if (func >= LPC18XX_SCU_FUNC_PER_PIN)
-		goto fail;
-
-	reg = readl(scu->base + pin->offset);
-	reg &= ~LPC18XX_SCU_PIN_MODE_MASK;
-	writel(reg | func, scu->base + pin->offset);
-
-	return 0;
-fail:
-	dev_err(pctldev->dev, "Pin %s can't be %s\n", lpc18xx_pins[group].name,
-						      lpc18xx_function_names[function]);
-	return -EINVAL;
-}
-
-static const struct pinmux_ops lpc18xx_pmx_ops = {
-	.get_functions_count	= lpc18xx_pmx_get_funcs_count,
-	.get_function_name	= lpc18xx_pmx_get_func_name,
-	.get_function_groups	= lpc18xx_pmx_get_func_groups,
-	.set_mux		= lpc18xx_pmx_set,
-};
-
-static int lpc18xx_pctl_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	return ARRAY_SIZE(lpc18xx_pins);
-}
-
-static const char *lpc18xx_pctl_get_group_name(struct pinctrl_dev *pctldev,
-					       unsigned group)
-{
-	return lpc18xx_pins[group].name;
-}
-
-static int lpc18xx_pctl_get_group_pins(struct pinctrl_dev *pctldev,
-				       unsigned group,
-				       const unsigned **pins,
-				       unsigned *num_pins)
-{
-	*pins = &lpc18xx_pins[group].number;
-	*num_pins = 1;
-
-	return 0;
-}
-
-static const struct pinctrl_ops lpc18xx_pctl_ops = {
-	.get_groups_count	= lpc18xx_pctl_get_groups_count,
-	.get_group_name		= lpc18xx_pctl_get_group_name,
-	.get_group_pins		= lpc18xx_pctl_get_group_pins,
-	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pin,
-	.dt_free_map		= pinctrl_utils_free_map,
-};
-
-static const struct pinctrl_desc lpc18xx_scu_desc = {
-	.name = "lpc18xx/43xx-scu",
-	.pins = lpc18xx_pins,
-	.npins = ARRAY_SIZE(lpc18xx_pins),
-	.pctlops = &lpc18xx_pctl_ops,
-	.pmxops = &lpc18xx_pmx_ops,
-	.confops = &lpc18xx_pconf_ops,
-	.num_custom_params = ARRAY_SIZE(lpc18xx_params),
-	.custom_params = lpc18xx_params,
-#ifdef CONFIG_DEBUG_FS
-	.custom_conf_items = lpc18xx_conf_items,
-#endif
-	.owner = THIS_MODULE,
-};
-
-static bool lpc18xx_valid_pin_function(unsigned pin, unsigned function)
-{
-	struct lpc18xx_pin_caps *p = lpc18xx_pins[pin].drv_data;
-	int i;
-
-	if (function == FUNC_DAC && p->analog == DAC)
-		return true;
-
-	if (function == FUNC_ADC && p->analog)
-		return true;
-
-	if (function == FUNC_I2C0 && p->type == TYPE_I2C0)
-		return true;
-
-	if (function == FUNC_USB1 && p->type == TYPE_USB1)
-		return true;
-
-	for (i = 0; i < LPC18XX_SCU_FUNC_PER_PIN; i++) {
-		if (function == p->functions[i])
-			return true;
-	}
-
-	return false;
-}
-
-static int lpc18xx_create_group_func_map(struct device *dev,
-					 struct lpc18xx_scu_data *scu)
-{
-	u16 pins[ARRAY_SIZE(lpc18xx_pins)];
-	int func, ngroups, i;
-
-	for (func = 0; func < FUNC_MAX; func++) {
-		for (ngroups = 0, i = 0; i < ARRAY_SIZE(lpc18xx_pins); i++) {
-			if (lpc18xx_valid_pin_function(i, func))
-				pins[ngroups++] = i;
-		}
-
-		scu->func[func].ngroups = ngroups;
-		scu->func[func].groups = devm_kcalloc(dev,
-						      ngroups, sizeof(char *),
-						      GFP_KERNEL);
-		if (!scu->func[func].groups)
-			return -ENOMEM;
-
-		for (i = 0; i < ngroups; i++)
-			scu->func[func].groups[i] = lpc18xx_pins[pins[i]].name;
-	}
-
-	return 0;
-}
-
-static int lpc18xx_scu_probe(struct platform_device *pdev)
-{
-	struct lpc18xx_scu_data *scu;
-	int ret;
-
-	scu = devm_kzalloc(&pdev->dev, sizeof(*scu), GFP_KERNEL);
-	if (!scu)
-		return -ENOMEM;
-
-	scu->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(scu->base))
-		return PTR_ERR(scu->base);
-
-	scu->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(scu->clk)) {
-		dev_err(&pdev->dev, "Input clock not found.\n");
-		return PTR_ERR(scu->clk);
-	}
-
-	ret = lpc18xx_create_group_func_map(&pdev->dev, scu);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to create group func map.\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(scu->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, scu);
-
-	scu->pctl = devm_pinctrl_register(&pdev->dev, &lpc18xx_scu_desc, scu);
-	if (IS_ERR(scu->pctl)) {
-		dev_err(&pdev->dev, "Could not register pinctrl driver\n");
-		clk_disable_unprepare(scu->clk);
-		return PTR_ERR(scu->pctl);
-	}
-
-	return 0;
-}
-
-static const struct of_device_id lpc18xx_scu_match[] = {
-	{ .compatible = "nxp,lpc1850-scu" },
-	{},
-};
-
-static struct platform_driver lpc18xx_scu_driver = {
-	.probe		= lpc18xx_scu_probe,
-	.driver = {
-		.name		= "lpc18xx-scu",
-		.of_match_table	= lpc18xx_scu_match,
-		.suppress_bind_attrs = true,
-	},
-};
-builtin_platform_driver(lpc18xx_scu_driver);

-- 
2.43.0


