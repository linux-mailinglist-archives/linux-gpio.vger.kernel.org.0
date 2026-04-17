Return-Path: <linux-gpio+bounces-35215-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJmGIC514mnh6AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35215-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 20:00:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E041DC2F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 20:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 055AB300C0DC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 18:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA894327C13;
	Fri, 17 Apr 2026 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oTHyRhF8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B76833A9DD;
	Fri, 17 Apr 2026 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448807; cv=fail; b=oqkDN6UeAxr4/aHrY/OvG4gCtqBj/AZ7iSHilvy68Ezc0z8MU9xlPSB7euOLzQGdUKu3mpfDsx4yh3nY04VODiO49RsHBP0geqftqLAJRcyI7agKcG5JBjp2AC7TBz3QLSBedU+B7uXf9TzpvXcABQ9x81fs17M5f4nIJmlqcjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448807; c=relaxed/simple;
	bh=voULv2+CEq4tkEA9D83K1pHYx5N2xqFRWG4tWnzR7Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P/SRMU1IcGVw1eRF8+muM3MKgX8BlohwMzDJ5JBV/q98+32PpzV+yxBJ+yDqVBpgmMlmUmKy9kOoj4DyxNKNzKjFRhW+w9errLRw0OkAq4vwYg1uKWnyR7Sii4yqkPoCaXGO15Z1Rx5XxI6idfZkKFEQAH86IyRntEFZIRsrpFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oTHyRhF8; arc=fail smtp.client-ip=52.101.52.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9U+ZZVzJVsR11yWLniWvoV90z9CHGLE42bsKLufTHG6dSoQImLtuM0uCEhzWbOZvlbmVymhaMkjn34Nm4OoeMdKzBGNb5Z2CWKKn4iIeyUxOUIOk/ehV/aPjmc3vi37hiqAFJNZZS+en7MEtfcHsDUNmJPdR//UaJO7dp9g7+tmQ+cBdexWiBO1TX7VlhD74LLEPTmEG0vRRpScBEOQtIF0F6ne6lUXHUEnNLal4QvDcThUiYSS8XFNrP8EZhhoUrF8Jk9BolaG4u2r6H5s9vBH0h54JUIY9qy+BN6IaCKP4X/5wQiyhNbZbL7awEYfwS5M+T1WiBPTUxrich3T2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLjCW5U8n35GeT+Xyq4K77tEnnrF+/ceRxnMD0mE40g=;
 b=lmBTtTAjk0jF87N2PLm6P9L2nlsDHm4E7A5GiXXP3KfKyf43zLVgh7OuGvJwy93jlZbl5WVkJIad6Tjc+Va5g/6tfz2bGOpdIClaXzzDntzH2Cbw0SpV6m8Vk6UAmE2tCsVNFxpdf9/WGxrrzpT5bp3EhkUOlkmRm0NbpOlN+WQLaq8qI9PHFQ9XUHRQgSM1GfuV2zUxLUaHbgEBMGmblbkE/0RNZ5HhU8QUK03A1J+el67dWKRYFJBmOdd/b40gXMQOy9iitFT25mw9JQFXFQFhDAf7b4ZNx2CiSHsOJ3FZdS9+kpiYAeX0N0oQqF1IutDU33VPiO7AautFFbUMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLjCW5U8n35GeT+Xyq4K77tEnnrF+/ceRxnMD0mE40g=;
 b=oTHyRhF8u/c3FP5PYA9UgGrT7hjQZRabq16BVUkTf4Kv+xI77cNF23kTPFYLskoNf9TGBeucUPyhbMwHShEsC6yxPzejteZ+WnxTIX7o40Qc73qxE4qtEaIz2McbuJ9TvG67pWNaqB7b1np+ZZlplWY1SJcat4aSzTLn6HIy+yc9S0bSEEA0a+PgyFoOoh4Dj6Tm4P4ixs+eH/rLJhjupaUO9UcF5b2sHj37nQ+dxwLgaa86supbam2n2sCcd4WVtPK1PTt4SOagUDyO/vOiYcah1iozB6nUaCsJe5WQSu+p167LtCXPJcz17zx9ZWeUamubTTlmjqGjRV0uKcsNCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by IA0PPF0A63E7557.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 18:00:00 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 17:59:58 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH v2 0/2] gpio: drop bitmap_complement() where feasible
Date: Fri, 17 Apr 2026 13:59:52 -0400
Message-ID: <20260417175955.375275-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:408:e7::10) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 983740ef-34b4-4048-b91b-08de9cab23a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IuqvcicLRzoVX1xrpQDhGKT02z9G1OYUFR9zR/QGApZ5wc83NbuySbBdT0T+2gvuy8gOYa3YtnTcSZvxsTaSUPECQtq5XOC2XWmNl0n8sNn5w+J/66UezE0cscyB+AFzVccVGRq2CATDSpyL+ABHsUjcz/H2ps3LFSFootYVwbL3iRCxv0V2jnpjq9IhsngH2PgJUMoNgiT9tNQJN0nfZTk25hndMoSO2Os31z8Q3dNljCfUagl2688u1RknZNY6dzWMN06Udl/TWCKxJZl0bm/q9K0wrhpxwczs+7aw9wPQiJ5ivM9Ao2x6UIrbEmHXhwwlojVDF5semY7ErNNJ3WJZSmvTbA8zU22eniYeKGpgZ/8Y3mkAoAA8fsLX+Bj0xivTDG/bfZucxSWoM7Lxbqtqeg+S//bRFg2ojiDqHZ0RcsA0IT8VkQP4I2zO2WXnoJaF4IHQehM+biE4ye3ydamBCQmouHwRALdedqBUZS37g75rNiPfVNTjbX3QFkBQsCHKj02yxVsBhLDqO267KEZzntGo1/YFUeBPYh5t3fgxqyAJtUNQ5L5PKGkpKD3S3ElvyqIk3A7slerAKy6Pbc7Kaxo1H0516yigDSInAya8DBZWjjMmaaSp2VBp7/hbOnZRqktlDw6Ci+wNzRpDYRJ34f66BR8bHnMAFRmAaPZCM3j/89629Qtp1OyAApwPC0JLCjYw7IewmurkuN4jvg5RMYUexRyI7njfpl7hqOyEAve8g4tiG/LNV/vgVRCqzUM8LK8tv7AtVyD7xuq1xQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7tR/CJFEBFxctvjau75ZMcIP9UActaODJzweElk3/0h+dopLxYlo5WInebTR?=
 =?us-ascii?Q?93p84W6UAo3A3SKY7j3gLc1JrGkW+kgFwNbVKX6l2BPOSJQQowhh7H9U913u?=
 =?us-ascii?Q?pspEYG8kF6Cra+X5ISDATKSXxM4G2k/D3G+RBlyv7C/IFMdY9Tag0QmF/QWm?=
 =?us-ascii?Q?VPC9wfpMCFImLevwh6X0kpMDkukfohPLy1cDVVoaLtb2PV1F35S4PJGnPega?=
 =?us-ascii?Q?KL+Mqzd/fcNB//ORLEHZdW+ESU/CF+cF68Wqk7ED0vqsVJtFRLz0PBBJNtxH?=
 =?us-ascii?Q?/eEnG4DjFdbpLUSzZCydRk+YSbj7VIdcrwcH3M8lXUlC0pf9dKllKf3Y05fg?=
 =?us-ascii?Q?c2gecKHpYtYyA2t+wRNP2zjwF/KiL3ocaLI29EFPBfbatVCiVrCj+jz9lGBg?=
 =?us-ascii?Q?c+X70pxf80WBR4QuX+xZHoNdWarxLee2KZN3b9WlkJs+LfXPxKR+oxaDPdFT?=
 =?us-ascii?Q?J4rJ3OjFeSeUyxDEOp9V06P0cS/OIaQ0/z982XgW9OEGZdgoej1n0dU99ym7?=
 =?us-ascii?Q?UUWSwKL4kH0k+v27jEDijMiO3RZnABYXcqoh8kDWU2VgnfP64I1E42XE1V+3?=
 =?us-ascii?Q?85KyPyw4+gUdx0pmHzW0C3WzWiM8KfpQ/dJzYkM/gYI863XFfWGN2mpDDW9G?=
 =?us-ascii?Q?G1ay+tqiua0upE8qdAl4Gf22UMvVE2FfV9L081OuG1XygKDZVuKfUVTfRtQg?=
 =?us-ascii?Q?Ean8/ONE2HEOLguCMJXgPm2FhFws1GoimobcXDqs2e7O78g6tkatG7HD074F?=
 =?us-ascii?Q?ogW1PBxB8RtDqqIp5xRCewkpl9t480iYpUl6X1/3DnMjCZDdCXYEO5sG6AWD?=
 =?us-ascii?Q?C0JKJuu+FK/jX8yU8LJGFQcdz4IcVPowc+xLlnQ350zQOUVqgXl87ptANmg3?=
 =?us-ascii?Q?FlnVB3CnUIia+38iFhDeJx3VO9faX/rQHqZp5AcDBHRlqRAUDU12O0SJaa8f?=
 =?us-ascii?Q?FhfVhz8sISCz78l+oUl6pPZIaplwDQnBgOVCxT+1759ypTY1D/PqU1GmF3lR?=
 =?us-ascii?Q?JsOdDm3SEhNAhYm+8XN09oCGBgqm6mQvGakgzmXkWAEPTzmuSeb3W02GVklE?=
 =?us-ascii?Q?OGKa+aujVgd1EBXfX9gCqgZgrK3wVNzqxlTeAfxVGrv7LM+v8ffJj14d/Scl?=
 =?us-ascii?Q?b9zJuXge7nUzPpQib/KU8/3tVyCtaXA3dRU4ExjJcQAbOiQrsN3glRs0Ujef?=
 =?us-ascii?Q?Zvmy1Mdass0itZeB3j7C/8GQttKy3ZQz7Y8Y7uR6UiIW5aC5baT1LGy09Bov?=
 =?us-ascii?Q?QjaZmKHFmp8cx9a8J23ZFK/Zwy754TuKdT7uCDx34Tn7z7BZw8OVYcaGDp6o?=
 =?us-ascii?Q?G4JaFMPbHag9xlL15uvpGB9ay2theqLWn72nHFFkIV0VNlAFoWBE4+oKIQwv?=
 =?us-ascii?Q?yACjh9ibytJHvhtzotqP5pNnUqb7Rk25+c1xS6oJ53jfQS9D2lSLmI16zVKN?=
 =?us-ascii?Q?Peh5PE32fjkdTuVjEH51w1wQaNZFw6jQzqyYLpV/smKftqgb+W0Ihu6Nw6sh?=
 =?us-ascii?Q?6fKHVLAlzU+bv1En/8r0nkIdrTcIL/EUq7XxGVldxwaNTO3HUJwGDVSKNZ4Y?=
 =?us-ascii?Q?fhohsJXnNDhp7uZMt37i4yjVSlpPlUCgpPjLbdwqKwWBwPZK1dhRmPN9/qdC?=
 =?us-ascii?Q?N+cCnzx2BlYjoEhpROEFJJl5tXGFU5/PBzprRZRB4mJuV2R/n34G3ggPpMaZ?=
 =?us-ascii?Q?hboOO/4LcMGBeAzK8BP9VMZG4W5vAlgzC3o+/pq7lcI1+OOyJ8ZWk3tnY2vQ?=
 =?us-ascii?Q?ToJkgF176DaZ0U3zktPfsUeHHIab6fk42X0JUDXxTmlI+PYCtdNZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983740ef-34b4-4048-b91b-08de9cab23a8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:59:58.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPc1w0JtTbbxRPPCInLZfTPSszOwEFC/scfMhWyJpTEDgssg6OWgwyfUIR3JkRVabDip/B/gssDkbafIxJCNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,amd.com,gmail.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35215-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F4E041DC2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gpio drivers reproduce the following pattern:

	bitmap_complement(tmp, data1, nbits);
	bitmap_and(dst, data2, tmp, nbits);

This can be done in a single pass:

	bitmap_andnot(dst, data2, data1, nbits);

v1: https://lore.kernel.org/all/20260417033439.318930-1-ynorov@nvidia.com/
v2: 
 - cleanup typos (Michal);
 - split per individual drivers (Andy).

Yury Norov (2):
  gpio: pca953x: drop bitmap_complement() where feasible
  gpio: xilinx: drop bitmap_complement() where feasible

 drivers/gpio/gpio-pca953x.c | 7 ++-----
 drivers/gpio/gpio-xilinx.c  | 6 ++----
 2 files changed, 4 insertions(+), 9 deletions(-)

-- 
2.51.0


