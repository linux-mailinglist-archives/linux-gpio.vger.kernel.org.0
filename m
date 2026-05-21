Return-Path: <linux-gpio+bounces-37236-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDtOJbFvDmq8+gUAu9opvQ
	(envelope-from <linux-gpio+bounces-37236-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 04:36:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 004DD59E22B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 04:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C602E3095609
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 02:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C09A375AB8;
	Thu, 21 May 2026 02:35:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn [139.219.146.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027B377034;
	Thu, 21 May 2026 02:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330917; cv=fail; b=JxcnycVMUTPG+DPNNA4nrAVk+xErcBMFdTdtxaocsEGRsde+X6xHEvr8fNnCbpWbA5M+RtZl068+xD0nBr6NH1gVON8HGItJGHf5uVQAguRxkYAcp7K+pfv1PbcvNCFuDorx5XlBgMJj9Pi7WcpZ2NoL7j+JsyinEOcjBr80x0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330917; c=relaxed/simple;
	bh=nwjVxwPVOKKOhsdRKChzMs95KlNSHqMqTyaTAeqtCSA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uxUL3OTWkpbBoFMquVuldUUwWX+qUaplHYkBm3XulBgkgbyhhlfP85XecfOKGj9yWMXfbczouFWIO63XS2b3RMmWJQfJ+psqFcu4VJqEGt0zHDGDhBnAz/hiZoFvLvoDHQrEpQPkYfBH2J43s5Edg/fwkej+PzEzXvHqO6wPG5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtV3x1DjsjaA1BNH6WEWEk6YMJ1eGJXmlcsvIUcBM/L3jASO/a2t+tyyejGSvmcKhzARzGbhbm+cR6472V3Wkh2hJbhBF78hmZ7razGkry5uj84LnMlpBvxJ9CVn/dmIcLPKypTEBLgXCgZnsHPAMBI1W/JNrRE/Up8JKZ2M8plIguBp0//S63cCJwf+I/HfKLHcm4rEpTMY36jSeZqospeC0CqdrpzdV4qvcnOFAMFMK4/YiY4t8I7b/w6Husie3PPsOYTjl6JnjALnYwYTTRcKe+Je/vOkMgqJ28v0MTwuhASUX9TaJEHcqDeJoQBJdtwc5jGVpBNb2Uh5qKgFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMB/v+jqRlTv7iUpT25X5LR+1Ha9dG53q4NiZTuZBZI=;
 b=iDPsLH4yp4YnenZibobLTgSVew2kDzYe8VkKCwSWi4iiLefSPIpXdMRqqyWcWlzecNn7WB9zURZ7+C7O8C08cZp/ZgMpX7POXaDHuZct9Td7Z80weN5HF1olYo+KgKgrOUE7mdamm11vkukcBL/n3ACUKKj2qr2p47tkfVSPP16hZfcED6epVgZSB86voCG4i59UHGnxf/q6LPhlPyr9lfscoD3g2RntA4+pTIVXlq5LP5GL0Ghodwjsvcj11WHZx6AYCb81skwys5iCE/YPTUPlkcX2G4JzLCy9raUj7JFDLABAa5D+107aNrkiqvWaW/j0E+rCikcIzNmO7HcDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0596.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 02:34:58 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 02:34:58 +0000
From: Thomas Lin <thomas_lin@lecomputing.com>
Date: Thu, 21 May 2026 10:34:50 +0800
Subject: [PATCH 2/2] spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-lecarc-acpi-ids-v1-2-ae0ae90b2817@lecomputing.com>
References: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
In-Reply-To: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
To: Hoan Tran <hoan@os.amperecomputing.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org, 
 Thomas Lin <thomas_lin@lecomputing.com>, braden_zhang@lecomputing.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779330894; l=2565;
 i=thomas_lin@lecomputing.com; s=20260518; h=from:subject:message-id;
 bh=nwjVxwPVOKKOhsdRKChzMs95KlNSHqMqTyaTAeqtCSA=;
 b=Qb4vO4NNS1QbQNMEoiFzmIkK/FLrcEMdpQS+/1iMk77nc/X3SRH56wfwscuJoTQsR3IzqmjvD
 N7VKuHaLiEzC501wLcg0sk3PK50d+wNtmHShcloqRGVV+runHm0rCF5
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
X-MS-Office365-Filtering-Correlation-Id: 9d34a703-484b-4877-8d9d-08deb6e18c94
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|52116014|38350700014|6133799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sOXFJl56nF/cge3gokL8zyBRpguhVtD5FK3Z2+wmy598jNOOUDQ3u8TiwiTMhJth4+avzKRdXQRFcCj51tXPICzRZQ6JFABt3VjBba/tVBBud0biQgCpp846/BtqRYsylYhpS7mm/7xPOw2JHVA+F0PYdthcO8HpHhQhOTZy/Vu2E30o3c6x3Fq36T/mkAibDreZGKO/ODI0JTMT2K4sgHTq32BnemM8wacPAh/B+xnhBBR+S+pSTBNqtt/NloDVnR2viOP681MNhQJH5cbAIB9iN+i4XOGHwELg7+0tjpGU1+WZn00eE78ygDJVxwhXMPSSeQKBfBR80aeIReUfxWot5CpWwFsBxInFot4Gz3ST4jkAGGxVdDmbzrAePNL+X9pCpQkyrPmUE4/wDysE/VtKPr2aPjcWWUxn0HazDhNybRKA/MKliPejYRkjNN4yyFo4wXBhhjRh0nMrpxL06N08PI7QEN8cxzUZSYkina1OWXjhWJssK5xpFaylUaNS8c65HycjYvmuCT0sQft0qo17TMvZUZ0wk1dk6erwGh88S6AbjyHRXOTzXD5Yd12T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(38350700014)(6133799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmZDMThISGJ6N0t5c2VrT2dzRk5pNVlyUEVweWxKVHFXdW9xVmhwdWFIcGdD?=
 =?utf-8?B?aVZkSDV5ajdqUGFxZjZvTWl5dHdJc0tkemlTd0ZtdGN3aWpPaVRYb3A4RGtV?=
 =?utf-8?B?OVlzRzJIVUtsWjlyanAxM2NxdkIyWGJEMUlkTnRQaXNEK1FsTHNJUkQrdFNr?=
 =?utf-8?B?U3N3ZXRwZisxSzB1M2loOGV4TkRsaXRYUFVmZ1oxbVlxVUpMelFQeHVsTmZh?=
 =?utf-8?B?a2xLOU5UTFFETEhyS3R5SVB2YjU0YmRJMUZKV1AxN1VNZ2F0TS8ranFEOEdM?=
 =?utf-8?B?U3B2MFVoRHczY2tHSGVlREhQTWhOYm9CWWkyaXBhVEJkN0hQcThxT1FuVHhr?=
 =?utf-8?B?aVB0WHBCVk1keVE3U2xyYVVkaW52WW9nMlU3dmtYeDkxZmF2SzNSMnd1WnIr?=
 =?utf-8?B?YTliSW5TK2tpRlBDY29PeDNnTmNiaktnUDNtVU9VaFBoWlJ2OGlRdkhnMFZJ?=
 =?utf-8?B?WWNhNUZyZjYwdDBEeHVobklmZ2g2NnU2aUcvUTNjUGIzR3MrT1lDZFhZWXFl?=
 =?utf-8?B?ejhIQ3VEUmJqMzlvSFRmLzBzVWh0ZFZuUC9nWWw4engwWDE5OGxTQVZKVGx6?=
 =?utf-8?B?L05ZQWZjdFFEbEsrR3lqQ1dyRU5URTBpMkVNTWVjOU8vbit6Qk51RTN6Z0ZC?=
 =?utf-8?B?SnorNW8xVHZLNXZ3MnArQW10RzI2N0oySFVyQW5rVUxiQTlEQ2cvckwwTzFH?=
 =?utf-8?B?SUV4Sjk3Rnk0Y1pNbEhoTjlqb3RZU05BQWlzY3pFMStnMDFwcHpHalF1WUxt?=
 =?utf-8?B?N3c0cmpwL0N5bnp2ZlV2M3NQUXVJeTdsem9XRHdzb2FsMTZ6VitJOERiQWtW?=
 =?utf-8?B?elZnaG1hZnJYSWVDd0Y5YVA5TGtGTVpNTUVqYjBMb25kaTI4VllpU3JiZUxr?=
 =?utf-8?B?YTc2WW1KUFRIcmVGdWFaMWVvb3dXM29ZUE9mdit5ZXU5UG42RWwrcTUvaElB?=
 =?utf-8?B?SnphSE0vK2NkbEtjMmVKTzlaeThvVTk3eFFwaGw5bzdWMVlWcGNyK1JhbjBS?=
 =?utf-8?B?aHo5WWczYnBHYk1yQjdXRDdGVEpuaExNNTdkc3BqeTVUTXBJT2xMeHhBUVVx?=
 =?utf-8?B?N3dlS1ZJMmR4WkhDb0x3TUdGekVYU2dNWXNIb0lDNXhiSkd4TEw1RzR2OEpI?=
 =?utf-8?B?Ris3R21OWE1KN2owTGtSNEVPaitjQUpwbFBqajZYc1p1UkxoTFlraDU1SytM?=
 =?utf-8?B?NkE1VXFqeHRxSlRLNU1ITDV1NWN0VkhHNndHWXBnK0tnZUtnMXpqZzduMkNh?=
 =?utf-8?B?NTE1eExWY1FET3VwSVlsNVZZL3c5bWJ6aUdsUWE1V25lb3RsR2l2QjV5RDFP?=
 =?utf-8?B?eUZNUkxkM1RaT1dsbks2SEJRamZLb0ZURkFwL1I1YmU5cGM3SjRuVTdRYmNK?=
 =?utf-8?B?bjRMTDZncmZLclk0RGxwTWpnTmxXRzY4MzVkQXJMZmg5Q055VlNySnZJc3RC?=
 =?utf-8?B?Ykk5UXNaRE9kNVhBSzZaZjJRam5mWk5XRFIrK1hhSmpKV29CczRqYkdNYTkz?=
 =?utf-8?B?WlhtSkVWSGtYd1NZT1JoaTNYam9hamYxR1RhTXlqeUtieFZqNzc5MGZlc2lH?=
 =?utf-8?B?U1JGUWJWSUdmOGNzYmFiSUp5YmVhVjN0U1hvZTYyaisreDRJMFpEbVV6bGtO?=
 =?utf-8?B?Tk1UdndSbUFWbTdCYjNmY2h2bHNtbHI4UlFzV21QNnloZlRCZXRmR3NCOW9n?=
 =?utf-8?B?UW1UVForY1BDZ1ZaSEVtN3dYS2c1Vjl1NFV5akczWVBjVWJXaVlCSVFiclJm?=
 =?utf-8?B?b0FiYlNSUmk0ZHN1OTUzajhqNS9tcnlFYlJPNE1zUHEzYyttc1daaUJxcHk3?=
 =?utf-8?B?RkZtYkUvR3M0eWR1NlVLbGhtQ0FCVjVmOVNlTi9uQWg4SnNvQkpjQko0NkNW?=
 =?utf-8?B?TG5odFJQY3lFQ0szVU5yOVRaTnBaV3M0NXhVYy9KbU5Cc3ozVkJPNlR5M0N2?=
 =?utf-8?B?R1BxS1A0WDd0bjZ5OTk0aVhWNHZaeVN5TlVxVjA1TDE5YkhlQndOWEJKeGRE?=
 =?utf-8?B?cGxvWmVBSU56UXFUZTM2UGc0OGFyMjFTWldaVUptanBRczY2Q1BNZTRqZktE?=
 =?utf-8?B?a1EvU1QxTC9ORHR1aXo1bkYrVmlEZFRSdjB2dWlZNzl1Mjh4ZkxDWnFBOTl4?=
 =?utf-8?B?Q2R6SUZDeitndnNoS3Q4emZ2NlJaSG9SRTN2OUdjbXFTVElrYU9HVjRWQkt6?=
 =?utf-8?B?SmRWVDNmV3NzbFJ0MzJiazlzM0psRnVZKzZ4QXlYdFRJYnVlQmFjQllQbWdG?=
 =?utf-8?B?TWdjYlA1RXV6MmJVMXpMZG81NE8vTitxY0JpVGRqQ2IvSkVDNmpmSGZKYmw3?=
 =?utf-8?B?aEZkbTIyMkZ1b2kzTWN5ZjM3aHRvV2Y4OXBQenJYb1pRdGh3R0IxN01lRjBl?=
 =?utf-8?Q?tzrc8EOZh3G+NODw=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d34a703-484b-4877-8d9d-08deb6e18c94
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 02:34:57.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ito04vfYZ/0j7/FrsTvdwBHQlLfOotv6i6AIeuvyMQoForIMPRC6BFs6TMvp4ePqvf6ybRL1tYTri+f0RcIWJQiQDLvso+VwrR7pH9eyDIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0596
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	TAGGED_FROM(0.00)[bounces-37236-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,lecomputing.com:mid,lecomputing.com:email]
X-Rspamd-Queue-Id: 004DD59E22B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This ID requires a custom initialization function
dw_spi_hssi_no_dma_init() that sets dws->dws.ip to DW_HSSI_ID.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/acpi_apd.c   | 7 +++++++
 drivers/spi/spi-dw-mmio.c | 7 ++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index bed0791c17fc..4d5a51d30adc 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -181,6 +181,12 @@ static const struct apd_device_desc hip08_spi_desc = {
 	.setup = acpi_apd_setup,
 	.fixed_clk_rate = 250000000,
 };
+
+static const struct apd_device_desc leca_spi_desc = {
+	.setup = acpi_apd_setup,
+	.fixed_clk_rate = 400000000,
+};
+
 #endif /* CONFIG_ARM64 */
 
 #endif
@@ -251,6 +257,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
 	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
+	{ "LECA0002", APD_ADDR(leca_spi_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 #endif
 	{ }
diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 1bfdf24c3227..4fc864d38cff 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -226,8 +226,8 @@ static int dw_spi_hssi_init(struct platform_device *pdev,
 	return 0;
 }
 
-static int dw_spi_intel_init(struct platform_device *pdev,
-			     struct dw_spi_mmio *dwsmmio)
+static int dw_spi_hssi_no_dma_init(struct platform_device *pdev,
+				   struct dw_spi_mmio *dwsmmio)
 {
 	dwsmmio->dws.ip = DW_HSSI_ID;
 
@@ -438,7 +438,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
 	{ .compatible = "amazon,alpine-dw-apb-ssi", .data = dw_spi_alpine_init},
 	{ .compatible = "renesas,rzn1-spi", .data = dw_spi_pssi_init},
 	{ .compatible = "snps,dwc-ssi-1.01a", .data = dw_spi_hssi_init},
-	{ .compatible = "intel,keembay-ssi", .data = dw_spi_intel_init},
+	{ .compatible = "intel,keembay-ssi", .data = dw_spi_hssi_no_dma_init},
 	{
 		.compatible = "intel,mountevans-imc-ssi",
 		.data = dw_spi_mountevans_imc_init,
@@ -453,6 +453,7 @@ MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_spi_mmio_acpi_match[] = {
 	{"HISI0173", (kernel_ulong_t)dw_spi_pssi_init},
+	{"LECA0002", (kernel_ulong_t)dw_spi_hssi_no_dma_init},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, dw_spi_mmio_acpi_match);

-- 
2.43.0


