Return-Path: <linux-gpio+bounces-37234-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLm3GXpvDmq8+gUAu9opvQ
	(envelope-from <linux-gpio+bounces-37234-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 04:35:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BF959E1F8
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 04:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7216E302DB44
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 02:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773C2375AC4;
	Thu, 21 May 2026 02:35:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn [139.219.146.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B804374E64;
	Thu, 21 May 2026 02:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330912; cv=fail; b=bnGE3Z03Tn9Lx82zm19ntZBK5IwR5z4WNOHLlgfax+3TSW1USXdm3PtAhg4Br9BnWxDRt7whczy0TUslXo31x3KZ58Xyn0N62tDx2u12ulDPp2gr6QZ/XL0aBQQn7kjxzPOF4qUjdNuYMdzX2zVOHGyAJE3k93wQjpIEncLdsc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330912; c=relaxed/simple;
	bh=gLDO+cmN6R4pNZ3I7ONTTGeZd1UMSzgeYADA68M0Fmg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=tY7T/3sSHPIWTLcE2nqeH9QO98+qgTF46/LuptPwEgAxvjhZG25tK+4TR6yt0hfLheBGBcD2WgEXoEcjEFq46NrM4DehZIq7aCPue6lv7Pmu2HWfVUaVLJm4nBG5mRXeNPhWa6sjCrSfDyXcjUn09/WfC30Xc+wG1MxME6nZTnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IislDfHpDpX8g/yub3WdT1gCr433zr2DHPiFre9E+tVCCDd/HHxh2CKHzzX6ObNEqzYQ8bDQn1NhOckMXpenJReS1xO9+LgzFWKzauqjnqLZ+moeUpa46cLlnD5GxS8HJ8zYjvFlC3sLyQPKenAk38Bvh9XckwvVRofbfqnPrHtDaZwlrpvfjfblUxpqCsw7zEbFxSP+NP5GVp/f7b9+xBSdKYdYPNEkp6KkzjJzz8g3GoqbrR9oF2FSD4iU5XSmlI8N5kyeN0SHQEiN/d+v2CzZDYZFEQBTYEN49A2DGqL6UxD3lqFCHY4Z1zhsmik/2eofLIEmLLfIOt6xFkSXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7xfMxi4N5z6cofjge4zYz6z6SluWZPZjVUXOvkcT4g=;
 b=BsCLl2L9ijb9L4954e/cqnoH7VrZvJ/XVrftEZaQTUQzjio2k8qag2a5DOSxf87Au1nEZTlEWmYLRaj09l46EJiWf0eBqL5Ahy/MjonNBZ3L9Nosd6zG2v+F2wYf3EtYceNpyBVCl49utKfrBc6U62iyhF91fDQp7JJRTzn/cwkftDLBH0NFY+icmqBwKvQJD0BpnhxIVOAKAn1GOfBYRTTSGwBlQVA9LxZb6AT4cuvWJsWhwSuUwFEf4yQvqhSrvew1Ptf8HlJK1HWwgBi/2rzyzdYenEjSrF/y8vxyR7BEk/khKGTm9+Ql05Ig/mycQq+thIUNTvhNdbFvKXC8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0596.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 02:34:55 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 02:34:55 +0000
From: Thomas Lin <thomas_lin@lecomputing.com>
Subject: [PATCH 0/2] Subject: [PATCH v5 0/2] arm64: Add LECARC ACPI IDs for
 DesignWare GPIO, SPI
Date: Thu, 21 May 2026 10:34:48 +0800
Message-Id: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEhvDmoC/yXMUQqDMBCE4avIPhswgaTUq5Q+xHVsV0QlW0UQ7
 26sjx/D/DspkkCpLnZKWEVlGjNsWRB/4/iBkTabXOVC5Z01AzgmNpFnyZOaGJ7hAQv2jaf8mhM
 62f7F1/u2Lk0P/l0ZOo4TMXIipHMAAAA=
X-Change-ID: 20260521-lecarc-acpi-ids-a6967e1ec5b5
To: Hoan Tran <hoan@os.amperecomputing.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org, 
 Thomas Lin <thomas_lin@lecomputing.com>, braden_zhang@lecomputing.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779330894; l=1492;
 i=thomas_lin@lecomputing.com; s=20260518; h=from:subject:message-id;
 bh=gLDO+cmN6R4pNZ3I7ONTTGeZd1UMSzgeYADA68M0Fmg=;
 b=TvGNfFQbXZMgtJ554VxLZ16yzYBimuXcmghNRAGUhbXNODWEg0guDVJ1WMDgvvFMd4WxhHiqv
 LO2KuFN5ldlA1L+0BhqQSxOJKZizyTzUzJbMH0my+g43IuXgLOrun0+
X-Developer-Key: i=thomas_lin@lecomputing.com; a=ed25519;
 pk=d7V8RTvs1pxSx8mPaXNAe9XWo7K/eHkcVBWTjw1rwrQ=
X-ClientProxiedBy: SH0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::32) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0596:EE_
X-MS-Office365-Filtering-Correlation-Id: 5879d04b-a1c4-405d-5dd7-08deb6e18b3d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|52116014|38350700014|6133799003|5023799004|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LpGg2mYnJXoihN7muJsl/ao0e9S1tlmVXobTOdfR3DC18fqDGxAJ3ojWEX4XYL1dD9c6tZ0EGfFBRUI3ChYnPJ2LUGwS7m048b+NmiFnYI9+42bH+ehsa5TXdwS/PMhQ78YzYD+p+9Yzmq2HhiUyQNf7w2wp5WOUlOMsxjV5dAXmmVUkfeTgTOWIaa9832WC9ik6fK1tRcICBvDs1PU2UU+IvUcg+lmIFS7IOOjn+N7YtdLW/FuD4ufZ078YNbEY51vQ7khnbtXKqNqXWGC5wLon9MsJhy/FL+rgZKesS1n8ja/YNtIpL/7D4DPaaXRFM45yRMHLTq8qIuRu/qPSolNCyg9EXERPOCcfEd/ZlYWzEugQpD38Jvgae3ak7Vbd2m5cAU4/ekPiK8YB5FQFaf760izcn7jT5JzPWJmiuUPN2av7UpwTBGr1vYdw5loEB6Mjw2oBaSKKdpObU0Plc+GbHCUsZ7Nrx3NpZVlm2Opx1b1YF6M0VBhFJG0+SCt5e5+TO7iGXYkqIqSX6XVP4Yftv23GgnJaiyNgqe3Gx+6P57qjXv4qGpqo0YU382Cg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(38350700014)(6133799003)(5023799004)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlVmVEZLK1NObUJ1K1JUbWppcVBnVnpEUFh0SG1nSDFUL0ZIVXl0blNER1Jx?=
 =?utf-8?B?WHNQUFNLbElMbjdFUTRtdDgwNmpvTThpUG0yUk1DZWxnNDJmWUZHbDJDNTMw?=
 =?utf-8?B?WHZyVVc2L3JpeEhmR1hNSkZKbFMvLys0UVgvNnd6RXlIOUVJOG5Uc2lUbTlt?=
 =?utf-8?B?MGQ5TGRIcXQ4QjkxSCtKWSthanppMXpLWm1XUllWTEQySnd4Q3Z1Zk1GNXdW?=
 =?utf-8?B?U1lyc3k0Y1cvb21BRFNpeVVqUWMrZnpFRXBUVDNFN25vU0pIbmtSUDZidUU3?=
 =?utf-8?B?SHF3NEpjMUdTMjBCUEFFUEVvd0p6azltTWk1cWFBUUw4MzJRS2ZubmlmKzRj?=
 =?utf-8?B?NlBLSjh1VURxeWppM1FUdG00YmV5VzBuNGs2cGlEbHNBK2dEVmRaTkZabEVW?=
 =?utf-8?B?NlRUVUVQbUMwZXRDQk1QOEYzbUVqV09WUW9WdFh3d3VDUjNNR1IzSEJ3ZFpG?=
 =?utf-8?B?dlIxdTYxU244bGJHbVE4NFJlMUhhWSs4a0ZCeFlJenZiU2piVUhVTnRFUjhO?=
 =?utf-8?B?UXJUTnNrcWxBTk1qeVRXdFphb1JCVUk4TVRrM0xHTzVQSS9uZzJUcGNTUTdR?=
 =?utf-8?B?SmJkdHlGeWhEVGhMTkdxU2gwSFRJaGl0U3V6Ylg5Njh2NzBtRlkxN1NXbjJI?=
 =?utf-8?B?UTdWUUdhRE1jZGI2ZEFFZGx0Wk9nQTFhZEZIQ09iUEVEUFBnZVRzOUxoTEd6?=
 =?utf-8?B?U3Nmb1YyZlJQWUVqQkMrQ0thZGYyNkFDN2R5YVpjbisvdWhGL2Y0TFVhR1hW?=
 =?utf-8?B?YThtQnA3M3FBaHdMUjN2OFQ4N2szbWxnVUF3dC83bHJ0TjVWaG9UOUZ1R2lB?=
 =?utf-8?B?UElzVDZ2b1hSMEU5alNJZ1BzNy9vMWVmWkxZckRzNlRlc1dwamdIekNGQVpa?=
 =?utf-8?B?Y2ZzMkRYMWkwR2xqSG13dEg4VWlDMldmYmErTUNZSHBNei8rSnk0L1ZFUVhl?=
 =?utf-8?B?cUxIbzR4ejBLWnllS0d4R3pXaU5FWHlLZGdFQVdaUlZLaTllSHBDenlPK0x5?=
 =?utf-8?B?ZnVrQmxNcDUvT3YvbTVDUlZseTMzUEMrQ2prY3RaRk1KOVZjWW9zRnR6NmNZ?=
 =?utf-8?B?dmFRT0J0RXRVcmp5Q0dEaFdKUG5VUHhmTHdvMTBBSjU5aWRHZDBKK2RoTnVx?=
 =?utf-8?B?c0Y2MHBGMGdVS25FRzhBWFBJdFR1OEpvREZ4eCtSdkdicjUvQW05b1RGSkNm?=
 =?utf-8?B?dmdobGNOc25ZVCswd0VJTUNSaHVmWjRmRzVGbFZtN0RyWW50aGRqdmZBbEdi?=
 =?utf-8?B?TzVGbEtrbHBBTUovVE8zajY1RWpuZm5idDhzR3BpOGM3ckFVZ0lWUmF6Qm1j?=
 =?utf-8?B?OWsvelVqM1k4eDQvRS9IOVhmc1ZpMmFZYlUvZ1diNy85Q3RERHZGRHU1cVd4?=
 =?utf-8?B?NlV6SGV5c0JvNU8xTk9KNG9HTGFJUzZFK0d2eW55NnFUUEF5L0p0RTB0cEZn?=
 =?utf-8?B?bkdERXFUTnRvTWxzbUw3NUJjbTkzYlZRUkd3Y2Nra0IvVTFPL2NqSTlDR2hK?=
 =?utf-8?B?VnlkRWhzTmJXZ0p3MzJldnViU0lxdHhKaVRZcTRuTmRvdU8vTVNVVG1xZUZ2?=
 =?utf-8?B?dGhydmgwbXlrT29teHFycEQ2UE40OHVjaEFyTzFnWFhET09IdDBKdzJjMWpQ?=
 =?utf-8?B?Z0ZTYktSSXptMk9vdURwdkZLNFI1UHc0TkIwTElFdjIyL1pCV2V0Uy9HakFQ?=
 =?utf-8?B?TUR0WjFPdVVJalVKYTBVU1d6NU1ycEdmMHlQQkdUZXlnVlptbDlwTU9ERElh?=
 =?utf-8?B?WlVVR3B6K1VKNmN4NjQ4KytoOTlBV1RvZU1TZVBNcFZsRzRhajE3KzZNcE94?=
 =?utf-8?B?UlV5RUZnTnNTandUc0w1UVNjOHlEbWZaUHRBcGgxL3d1ZTcvRGcyOG1WRFZZ?=
 =?utf-8?B?NXFaQlpPWlNzZkRvWkEwUWxHN0xGVTRXYnBLTmdjNXR5bmQxbXdJbjlTS1ln?=
 =?utf-8?B?RUhTc21Nb2Ywek5yR2kwblVqbUVSVWtXalVvbHNJQWhuMEdLb0UxTEM0QW02?=
 =?utf-8?B?SmJCeGtjV25mWXVzRk1VQzhNdEluYndFTzRGZm51dXZWQnRTR2d4Y0pBVUVv?=
 =?utf-8?B?a21iY29YY2krRHVDVTN1SjFJcE9WcnBXczJlN1g2b284cW5yaHBZU1hMRlRH?=
 =?utf-8?B?bitGOTZNWWFnaUdVbW9HYXJFR2diQTRJSWlONFdSVUFMSUR5ZlFpOWZHWGlo?=
 =?utf-8?B?UzNyWmxFOWNqaXV1NlRIUWZFVklXa25FOWR1czJQdUV4V2tycXUrWnFtZ214?=
 =?utf-8?B?bTJqWVdOMWp0N2kvRGhOZFhIclpTeVRBU01wK1BEaDZDZ3lJVnpXV0hSWHVz?=
 =?utf-8?B?YnRCY2tGSVhFa0tPaFN6bWc3YU5NZ1ZOMGJXYjJ1VFJLcjlUZlhndWhhU2R5?=
 =?utf-8?Q?35fv9Z0haPBiQOUs=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5879d04b-a1c4-405d-5dd7-08deb6e18b3d
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 02:34:55.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/LsUXm5zfEevcnqwG1cDdHyRrnaIm+ialDuctPmriM9UuQ+2aCXH3MlduMIxJVjCoYl/SSIzMEvaYSzrI7gvFTi+hnGsSUbTv7kDSFWeig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0596
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37234-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lecomputing.com:mid,lecomputing.com:email]
X-Rspamd-Queue-Id: 09BF959E1F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds ACPI identification for LECARC SoCs that
integrate Synopsys DesignWare peripherals.

LECARC platforms use the following ACPI HIDs:

GPIO: LECA0001 (V1 register offsets)

SPI: LECA0002 (requires custom init function)

Patch 1: GPIO – add LECA0001 to dwapb_gpio ACPI match table.
Patch 2: SPI – add LECA0002 and dw_spi_lecarc_init() to spi-dw-mmio,

Changes since v1:

- Revised subject lines to match subsystem style guidelines
- No functional changes
- All the comments from reviews has been fixed

Changes since v2:
- Wrap long commit description lines to 72 columns
- Fix code indentation in spi-dw-mmio.c: use tabs + spaces for alignment
- No functional changes

Changes since v3:
- Start a new thread for each revision

Changes since v4:
- patch to strip away conflicts

Thomas Lin (2):
  gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
  spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
---
Thomas Lin (2):
      gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
      spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs

 drivers/acpi/acpi_apd.c   | 7 +++++++
 drivers/gpio/gpio-dwapb.c | 1 +
 drivers/spi/spi-dw-mmio.c | 7 ++++---
 3 files changed, 12 insertions(+), 3 deletions(-)
---
base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
change-id: 20260521-lecarc-acpi-ids-a6967e1ec5b5

Best regards,
--  
Thomas Lin <thomas_lin@lecomputing.com>


