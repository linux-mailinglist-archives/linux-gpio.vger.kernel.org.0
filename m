Return-Path: <linux-gpio+bounces-36798-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEtaLKE5BWrVTQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36798-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 04:55:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C153D321
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 04:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FBA3301C7AE
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 02:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113E130214B;
	Thu, 14 May 2026 02:55:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A590C2EAB82;
	Thu, 14 May 2026 02:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727324; cv=fail; b=jklGTjxJlxn69CiTyMG+UgCkrxPEjaT01yTqJwEzKJckJijpCK2fHdS+QUEsqgTjjIdXONVLalFOFEs+CDnIhkgof5BKgNsKQZCwqDuaoJwdebjnc6OYyHiFeVCRDcIcGY85Tr3q/6sixUh7HLzLUSfriyKf+OtaxExyC68Gsi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727324; c=relaxed/simple;
	bh=1Rjh2rH14R85QshcGFl2iguTptmSPG0ON7+NDbWYZ8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rY622dNYRPMsq80FY5YDZC7/HJ2ckllNtk7hPELkkUoYfKYjiKbzJJeG830G7vLTJniBvwr/epPIryejjKMUEnuvgGMq7VEj0t8Yw4CzmzbJyttPyLjK7DuDaHqDL4nv+/VpBM622elTzgPLafdHkpg9tgjbM9SdNnHXte4DEYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ+8cVOHAdIH2/QIw19LC0Bvg0lwk9gIwni6eSKWTSz5Op3MM+sMm+aJZBSlMXc6L85hMhwhaTcPKfwHczz1NAu+YAyDXJJVpLDjZAsdCwdOVP2Pth8cuxSdd/X32QePWiJ7XVBch+KaGByYcZ41gmQt0h4SgWhA2/YMhWfndP3j0YddgOw6+fLWo1NBWi2u1dk+EedfdVyrv6ofT272oPQuUeOKpJ/EkqiIHc8ioEJF0ceowjRfb0Z/SIcyArEKDBxWdzJcPxzw+J5zpXAPLm/Pn8XSn/FFqP3NGCec8qrNtPbbpDuoJuPupKYHzC8m6KDjmiEf168SEewS3YmceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dmshs2SLWvVFDOVZHg4FurLYDwNKlWmtZT8z6bQQR4I=;
 b=Ute2fmFfWsQE9pk7xNhYtelz+YSdrAMyWzIY3bIbtmaXVivI8Uq/zBf/ORFfvuQ4Z+r3awxHTm0rrDEQKIqQda+QlrRABzHDaRntaabBsnann3eiT/U7j2f4BmDlfKVHfeEVEWd4O4IrW5hN97lOchYlQhzk4jRgH4yEMNE5hShXN98F0Xg1P9JjadyEU0kwgfSUy3XlaoeaJFHgIcdRF/2Bz8zVsgZdVi+LN6302D0KXhvMP4Nz2ca02iUXRWKnHFtc74O9Lmx0r/SiB5y6201qF2zDzIxFn/97xJo5tQA4jgX1SAGHLhwoMsf11QqDdZ01ZtPRtuzmmnkLSKL+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn (10.43.37.209) by
 BJSPR01MB0754.CHNPR01.prod.partner.outlook.cn (10.43.37.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.25; Thu, 14 May 2026 02:40:33 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Thu, 14 May 2026 02:40:33 +0000
From: thomas <thomas_lin@lecomputing.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	hoan@os.amperecomputing.com,
	linusw@kernel.org,
	brgl@kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	broonie@kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	lucas_hao@lecomputing.com,
	puntar_liu@lecomputing.com,
	jihua_tao@lecomputing.com,
	stan_xu@lecomputing.com,
	lumin_liu@lecomputing.com,
	notics_zhang@lecomputing.com,
	braden_zhang@lecomputing.com,
	harold_wu@lecomputing.com,
	will_zhang@lecomputing.com,
	aurora_jiang@lecomputing.com,
	ryen_lin@lecomputing.com,
	andy_jiang@lecomputing.com,
	thomas <thomas_lin@lecomputing.com>
Subject: [PATCH 1/3] gpio: dwapb: Add LECARC ACPI ID
Date: Thu, 14 May 2026 10:40:10 +0800
Message-ID: <20260514024014.3376511-2-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
References: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::15) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0754:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec22a95-de9c-4429-5dfb-08deb1622b7e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b1sOnQzz4avjWQ3mrJWjXbRjT9kRUhC+yKw5e1wzAqSwFiEq5WWUsvjZsCeliUbIfj57TWmjs8cZpkiHeT4h1Y/ByYvLwIm6dcKhOqUF9P18VG6dJpbVIp9G6YF4oCgNFD9Dc5Uc+KVgNzi2oXSqLMO1OtiD2W4q9JTP02xiihLtgr6/xTl4/P5WzcIUeoLyQcDIAcGdryG7zsO7lafWMhjxsDp5ssyzseFa/PO+mBJXU2k+w8Deift9Lf6MHGu5gYZXadNNT+ev73HASs8iM2sUMZtyWnV2qIx0dE3mGuXAljjwA/qQAbbvGvSdNB9mAS6sqR0xrJv/JLpiJ6KqZXbEvzGzjXkBlw0jQxBySfygwi8pp4jc8xLojhHmSNQfhQaYywSl9LIBGbzgQmCdhlYA6Y9HXPWH6cZvcNJOqqxTLPQvBgbNrUIs01Q2mtxf0iOPz7xon2mny4uS92NhRO03aoOs1kAHbE2R9YaHmP0m7xkYuS7kQhvBfXH2gE7SzPkb3mfLl5nBrZhwNfNe3wiZF5x2QUByH4X/AUBbBGcANKmeCPZbb5bR65LQcSKNTqymBnQjsg/ypQXv1LxMUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6vl0qT7LlHxaK8FAqVhMAhWcGl4mTdZt7jfzhW1d3tmItdsRxeIbWRFVy//j?=
 =?us-ascii?Q?/9Ols7aMoratbsVt+KiAOzZ3RWihymyIoJ3jrNasejL118SuKYhvzYNSlLqm?=
 =?us-ascii?Q?mHFxCROxvd2qepujoZuRr8tKEjSYaynIfU3Mqk0g5EkrR9kCxTA/+J5JXeob?=
 =?us-ascii?Q?CO7N32fme8mC9lcIc02bX6eKRkryI5clYXO+kVUnZlfpyGlj7Hn0OH/QBl4y?=
 =?us-ascii?Q?ZLXJLf9rnNMgzNhlfTC960tuWz9XwZ93BR/gBd3S6lXUdUGaG1Nj/2mRUsHK?=
 =?us-ascii?Q?KLPJaeIoWT2fE6HBZFxWhehIqPb4YExhTaALIAFIwfFxtKb/4AHXL4hypQyd?=
 =?us-ascii?Q?JOh9xco2fRQ4UZwe0VzQiWpggcAa8ZrA1Y2DOSJDy9UCZB0cqZiwL0dCUtSF?=
 =?us-ascii?Q?hDRQXk2qCm2JpRK8H0Z5P9iG3UIaiWqxdXMPuAAPrgMuAITf70iuQPWh17zF?=
 =?us-ascii?Q?I7Evv4RBMGBTW4mjYTehXZXuahXN0oBjRbZiyODsKgfj9ijtxabpr6/UEoEo?=
 =?us-ascii?Q?vG/hBaUxy+0A0qzFO6L8di1S5W31BBu3fq0rZ7GMMwxwh8HU7gXZEIOb/O7m?=
 =?us-ascii?Q?DRwOmk5JvGHcI6B0y1Ua9g7Z9DGNnnXeT/G/Y3kNpVPpLvijckMeOw4Gxfx/?=
 =?us-ascii?Q?KWH7Uq5+PQv0AvvU+qoU4YCw02OwNyagt0Akvr9F/7+sbAFsnOn3FNLeVZ9Q?=
 =?us-ascii?Q?sgKLmGcYjXZVjRJhsZBTyHLU08++x2p2zKJVhyslu/JbFgeaeaO0LYBcjch2?=
 =?us-ascii?Q?7JvjdJTrKMLUyUiWLaMbiVAdw5BIwFwWITDlWQPf1PY041ITMwdCDKKG3JE/?=
 =?us-ascii?Q?4MWqBsDaA7ZfuqyxD0G0tet4YP/lutg9NeVpH5kPtIKNwuIho+tdilpXRzei?=
 =?us-ascii?Q?Gu9dIEHP7GeSqbF0m6m9BDDpzdtnnd0rnabUs9slya8ElOrpgLFx5CwVzl6G?=
 =?us-ascii?Q?v3O0UdDsIiri96G9QQS0v5zEthKKd524opnnz54Ts35R+fW/OYlXpoD8GGRb?=
 =?us-ascii?Q?jkblgfbDrIyyUXChQHaCWp8zm7oAozutSKBKY1l+vzGguYwlud3BZmBgeHJF?=
 =?us-ascii?Q?qrPkXLWdrMInyqV+gmSM0eNjMWVy33IJ7ijmxSIEFaTwbLAGCJR11+e7pFyA?=
 =?us-ascii?Q?+RkU49pGRisN6dtqxFYmgEEfhqC/MYOobB7m2XvRheeNDxPLXqN2HSPabzQt?=
 =?us-ascii?Q?w3OKrE6MDjTrBEzg5DScBVmPZBA4slKMIvcI4Yb6BfhxI5AHe3YcJCVDnE/+?=
 =?us-ascii?Q?h8fdJTauQaP0wUquPGFAr49lY00Yk1dbtNRZwsW/MJIFEh622iUk5fFcPkJY?=
 =?us-ascii?Q?L4o2Pt/l835nTJ2f+76oUK9fZJLCNU+PefP5658kYWR0yYgH3yW9/HSG1n5g?=
 =?us-ascii?Q?TqScxTRnB9klWpiLJ3BSWizoUfmreNnXcJnMSYvVKZq/mMmfXhKhY+SSUSnx?=
 =?us-ascii?Q?facEJ6Sq7WeLuEDTlHlPlHVa9pVI/hB38fh6AEbZoFrBtFXSyA7CkaU/I0C4?=
 =?us-ascii?Q?VFEbRkVfc1jRoF+AicSW4yX03u6JJMShFAMMH8AJCq1XpiZ7RLQqCxs8WHak?=
 =?us-ascii?Q?musTdw+3Q5POKlHeEgm2InAfcjv0Ua2nGOsM/hBm/bj3gUoLj0TVSFP4WqOE?=
 =?us-ascii?Q?puWTv8h7RGYcxLlHLW86LEeHZgtFZiRE5WW2dwAyWKUp9itEyVTS9h7JwB6X?=
 =?us-ascii?Q?hwUhaimfWj2OC/p9CP5vrvHAa3/YPaEH7xmKtq5XC36gYNSWcuC01DMsq5U6?=
 =?us-ascii?Q?rNIc0ldE/fPnRIkObES0ZJwadakRpEA=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec22a95-de9c-4429-5dfb-08deb1622b7e
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 02:40:33.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcMNeOUKAP0IyZnomHpYq8bzPNjNSt9knFdCmivmC6W7IPu9RAY4lrTvvERvGAuJDmkhCes9cMIhl2Dql20dMInxTsCQ2J9i+QdLKjFkq+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0754
X-Rspamd-Queue-Id: 541C153D321
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-36798-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add ACPI ID "LECA0001" for LECARC SoCs that use the DesignWare GPIO
controller with V1 register offsets.

Signed-off-by: thomas <thomas_lin@lecomputing.com>
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 15cebc8b5d66..c1f3d83a67c1 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -694,6 +694,7 @@ static const struct acpi_device_id dwapb_acpi_match[] = {
 	{"APMC0D07", GPIO_REG_OFFSET_V1},
 	{"APMC0D81", GPIO_REG_OFFSET_V2},
 	{"FUJI200A", GPIO_REG_OFFSET_V1},
+	{"LECA0001", GPIO_REG_OFFSET_V1},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
-- 
2.43.0


