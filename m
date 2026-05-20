Return-Path: <linux-gpio+bounces-37188-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHbvGj19DWosyAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37188-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:22:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A0C58AA42
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B421323C0EB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08873AFCF8;
	Wed, 20 May 2026 08:45:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7A36AB49;
	Wed, 20 May 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266723; cv=fail; b=jOb35hevNRBXPUXhaOpJShCA3nkJcYmrf5Cwx/9ZhG5jlNr3Tpltbll2XLNU9lJ9GTd9obPOIXEpKD5byXXqBuVtbV1dDRyMznFRqtVH+pRzy6BHtUfZisRO3vVCUn1FAJWuT+VIWN0Ev7fcSLCxsCMEIgAxjLDN0ZIu8iwrn5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266723; c=relaxed/simple;
	bh=7G1rzda794mJ6nOPSBbreEn6FwFW8IKBQv6/EplPHDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j7fxpvuoBzskFqZEjxdnPwto4mJ6oISowPT7ZzdvnhTtmT3awOUSMQFKnmHSIOivXMKI1Tx35qBe+4247KP7nTZvwMBLLhC89mwpDA+sDdepIg7/Vpql0lchP6AYRtPP4U2iFxeCV2izPuA2wreO0dLlvG2sibHSBo71Xjd/sqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCQ8y1aLUXGHKdjn1ccKytMwjKL3TcZNP9fF1jHO6gihYhnUEgomO2DK91wCUMl9wFof8At17d9CDGEW6La4ADJ90V+gBt+BQP7fPFgJAKY2QJ2liwwPYWzUckdjcj4YP+ovbzmEYXWSEZaq4SNzDRRfqhKA9eJb60j+uG1vmPPRvcECfAjgAVogwuU+0yCoE85jznaneFNn+A88WnGD4MfX77yBv3buyFJKkyLFt4Rnv5JIflT0NEGzd3YQMyKysxAFMioUdwqJxo4PiF/O/6lDcyRjim4DstmhK9totUWWeFzgWFqqaRcPLH9LCp0yOFr85/TwfuNtCX1VP32OMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQjQ2G9e5OQyuaJVeMpWCYgkY1ZibpbOZC9b7XLeN6I=;
 b=jX7f6tfQYSADyriHNiHR4ai9LmbQewjg+hhVq4mb9f5mJZ7caikMKPlEyztSFWhKYHqlJzLq7pLYP4BLO+EQ7qnwD9FW7jI3RZgZHfdm2PsDtGWj2jKQnQT1GIBpX9F145J2xqpfhJqY/VW5zxi9XcWa/nneXad3r0eYFipUeQ0SUyg9/QM/grTyMSCzCz4NMgIMNEl3qry7TDSZwPWNbZWxq+cHcI2IYBK8oW2pnvV8hxxoFSjK4avt2qnbnQ+zZlI72s8nflpcIKqGVksgPoHikobnTRl9n4ortKniLKCLopG/G4YB4PiVbXXBITcQoL6olzkE5f/U1Q//7Vw/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0755.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 08:11:54 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.21.0025.023; Wed, 20 May 2026 08:11:54 +0000
From: Thomas Lin <thomas_lin@lecomputing.com>
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
	Thomas Lin <thomas_lin@lecomputing.com>
Subject: [PATCH v4 1/3] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
Date: Wed, 20 May 2026 16:11:34 +0800
Message-ID: <20260520081140.637637-2-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520081140.637637-1-thomas_lin@lecomputing.com>
References: <20260520081140.637637-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::19) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0755:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdd58f4-b2a4-41e3-6f31-08deb6477375
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|56012099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	a4yKFHHiD7ia0p1QwBGI+hqNQZ3w5MDwZLhXYTQyj82etu4CzEvOh92DIs8hsz/aq6S0CxbTN5+26KLhdK7JXjJ38CcN2ZmDFMHNb0Q2v0Zb8lD4H43mzg08tPJyHqWhvLTk8dP78Pj+O2TSluXxs5QU9WcHp2TkPAE/ydn3wFRCHdHaGWxWjruhxXKm5txZN4SdziliH1WSHVoIhJI2u0S4oSXLkgnb8VkXTd6jPAoS9SXIgLEFVojMY01Fw3gl1Jfq/XcLWlulH7Hvrp27nFtJN8jmqH67MdpeJGvw9YPR3ivNCttK10/NNWv8uDvhNFP7svM4hIprv+WOP1n7d2y3er4BGSKk1T/f03W0KTu5n8h1AMQIRuEaAIUq0Ya9lfmWXqpgfUHzgIY08ZJvrZath/DnFq4/FagCm5PeHrUoPfiG8ogrRwd+ben4z/jYQreogU4pOuIuK37HlppO7FJ2p2JCNZUzFB3peLwBX+OoN5FsB2qgsr6JuSA7D/HGMvwQiTYcGSePMRr0kNr2/VrOZBemDaf+/T5sQ3at1z8blg4dwcC8Sk6IOnqZEoUFU1wCRXZ5QN/xtaM4KKfAqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(56012099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1KpOfIlOsCw9aw4iJqw6Fi68BWxdtj48juNuShJW1boRpbdNiASkAqWqYgOy?=
 =?us-ascii?Q?5CjHaGEuznQNcVnpyD7Yj3r0RKdTKwfwlpWFwozbWp5zwYd2We0lGOcMdGrV?=
 =?us-ascii?Q?H/mpiFd8t46miN7aMHaOtQgHey2W3HDINTV2TAGYbGF+Q3lh5uJlcJln30v2?=
 =?us-ascii?Q?k9RHk6mhRvOowJZnStS0kzkgA8M5HMhhDyY88+2Q+5boX3ZVOmQGPSHLKruJ?=
 =?us-ascii?Q?/0LW3FrwC2fW4fmnGr9xkuKqeO8mqjBEaHteSzYEHyyU4OR1yQS3HKzalmKh?=
 =?us-ascii?Q?Exjtmltr5HMPEQoKo+TS2po+Z9FhidL/mH7cp9Lvytwjrzi+wGERoo0QjRRU?=
 =?us-ascii?Q?Nlh8jbkDqUlDbzKm6hb4GNmmYgVTuQuv2v67bXoz7WrEI4Jr9Uk3fq6isTRN?=
 =?us-ascii?Q?VTY/GyZ0uh7pTA/7jXWAflGyBQL7aTLjF1xOlrvAywoXj9MP05zmjnEhhlyq?=
 =?us-ascii?Q?EuQ2Vr5Le/ZNn8u7YZ3AcHqPR4BZJTJp39XbAHS15A6r99yks0w551SUPJ8p?=
 =?us-ascii?Q?VlFRTYq0JkDAqlZ8pXPup4zAi5DpBF7H8RsagHP8p23wwCNyoDGYAVCZ/+gr?=
 =?us-ascii?Q?6hvSRzhfOXolpmIVB+ac9emcSGAoIuD2p0HcyBZBXvoKEKxcPsB3oHuqQW2L?=
 =?us-ascii?Q?AkIyKTJrqlXd9SgVd0V893YSTfbV+iMicyJc0cSqd5E4QRIhoIdoE23ucSnF?=
 =?us-ascii?Q?M0saGaqLTwOg4WxQ698chjM16qm9ACMuAjAtwTvLOTVw5OQsAyvU4RItKn8Y?=
 =?us-ascii?Q?sosT+cBn5LBytIEEniNPUSEuiMpdl7A91ws4gMvt1ES4dIGNsLJg8IXHKUDK?=
 =?us-ascii?Q?2pkrls+fPaK7MoUAJl5JSg71/AoXlATNV4kmr8Hd0bABddbGHYBxWlA6+TMX?=
 =?us-ascii?Q?gUdMkX/VRNDF+hXoXZzBYjBOZixvDLQhoILP2KjyOLuvbAalvVgmq+eIUDdN?=
 =?us-ascii?Q?nX6XnNEE1jo9rVcwQUxC/q4ZOrzknqvw7nahXFatNT70iR79dXtizdz65jir?=
 =?us-ascii?Q?LhQt4IcsdiqSircg8JT1wTVTOxQbimUMmLl5soCgv+bZI4sncl2Ym8uUC9ns?=
 =?us-ascii?Q?Ow3cWX+g600/ntOQ8ctPqeYKjCurHDXgnL/jS5r2RA9y5KYE/yImVDe5P7Qm?=
 =?us-ascii?Q?Mz6jP/siatUN09gdYAYFPwmnJsa6EZ5w1Uyi+AfQ0zRH93SOA8dwdc8/Alkz?=
 =?us-ascii?Q?+66sOslgaIPFMCU1Cdg3bc5mqSqV37gji9zC5VSGC7d+kLqQv6lujOthGCsR?=
 =?us-ascii?Q?qEWa2jy2uQxd+z6d+2/7Qd3Ciw3+qo16aBCOj/TyZppwp3J8g6+uG0qiZsZo?=
 =?us-ascii?Q?jRPz1FTH+QxybnAxD2pbXdmJRPm36CM0TDkerRI7VYKjW+FJ5jAkdE5WAO7S?=
 =?us-ascii?Q?pSqZL4lEDpzlxMAEDx18sUPXJvegrDgh1tqJOQmbktY4lRbJEdmVttCyqiQi?=
 =?us-ascii?Q?xK7EM0VIr9V1i9rXEkhQoe3Lk8GM/2hNgoj6+iWa6wXovw+ZRwzO3jjPIcif?=
 =?us-ascii?Q?0DWYEXtBUvBrpRQr6ZMO+wcn4AvYTePeFew3uwmTa0uv2fUpdCWBAw6b3pHX?=
 =?us-ascii?Q?0ede0HvWNCtJDueIN+UsD6FJLnjYq9jgqb8v9mmZvA9DnUG2zc4p/e4LNByg?=
 =?us-ascii?Q?ZHIKb1Ns75FLCJiWoVcDtqilyXwiARLLdRMdBrpDAPQk3s0HIG7uzW5E6dNk?=
 =?us-ascii?Q?HVhoEkhbXXm0mvu0IliUhe0CqYXbGseUbhOQd5Z+mXlbOsJmxH4L5GVUBzPa?=
 =?us-ascii?Q?gDQ3bvY681SYQBfG37TKj9rHkctZ8K8=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdd58f4-b2a4-41e3-6f31-08deb6477375
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:11:53.0961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YYxlItRGg1gCxttnqQn8fHrGbCzxY6H6N95C5mTtv6qTr6zGGMSMiv436TXpjK6kjTwI+KifQWFeSQlS6w6kKNzMx8nBz5mEidZfNclDLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0755
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-37188-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 92A0C58AA42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add ACPI ID "LECA0001" for LECARC SoCs that use the DesignWare
GPIO controller with V1 register offsets.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
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


