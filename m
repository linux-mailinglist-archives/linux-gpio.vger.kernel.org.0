Return-Path: <linux-gpio+bounces-36919-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPo1JxEJB2qcqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36919-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:52:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDD54ED07
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF89030923BB
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F82347AF6D;
	Fri, 15 May 2026 11:18:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2127.outbound.protection.partner.outlook.cn [139.219.146.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8583AE715;
	Fri, 15 May 2026 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843910; cv=fail; b=iKlB3k7EJHbxp4KVEmSQi+v5vjk9Mi/gopgLCIPG86Wv19SmjyqW6vo9ygvRHn+Ka43HlvirtQK2jnsp6wK9TQtn5bwxtLLMm4JhwZl7lMS74jPimdoXvMLlfq+MzWOgTHFj4z2CSZwERANh2GuE+5kLWTan56lRuLbhKt8BhIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843910; c=relaxed/simple;
	bh=cYQvBq8G/4Hw/FNbr1AUKiZDLgV6u5q9BagVrArSj8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i9RNw46ZeH1QD9mKVqNziRIboc0RorZGc8zNz/PN9Kit6zomQz3k9c6JVQa7wtHwnYNbHp0cQdhgCje2VMq2027+imbTV4fpr3/mc9yB9urK2D+KOyM509hef+krvADznomv/XanDCmfPds5kmGEQVaUi1qkgzWBn1e9nLkfT4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KX7/5Z2mVsmkWTICzj8YAHxi6cS15VyrofyqHOtcc4K8LKuPeA+vtRSUC9SfpzhTmGk6OXD5Tq8EwusWZXKPAwcw/7GqsLQD8Ko9gFT3a2yp36arbsdhbIlO4c9NO3J5WXpVkGqeh9z1FoFvqCsWAKoVHkSA1A8t9knBed3i4jd6/WtUQ8N6xq3FZnXiS5G81wv5Rig2RWv5WE9IYgi/Km9IGna0FoJIaqDKccUqKdaTH/Gq/7GO7OTZf+vpPPGJ6vsJm5NM3eIZ6cUWE2O1AjkgqRnhO9D+uCsFb7dG4P0jSsuCJaaLO+aICDx/xhxPp1SnRl5yTDTYDcWV6/zACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rC8/r9WVNfkbCCHDo2YXlEauTOMzBt7D+g29IODGXRo=;
 b=Y0qm/i974hc/ztBoEUVWU+hSy6E1ptsZpl8wpKYPl7rpP5G+gNs0pPr8eB/Qk6ck45vgiEMKVt/iT7vXvHhwH6eaBW6Au6AJQCrmy/loSqGnHUh+J1XsYi6EY9EN2HDxuE+u14j2r95KN1+nGmMvIe1mOrZtdTEyQHR+T0cFPMUDv7mZBTsWnzzDBCKGhtM6feVohnXKHEJZKvXr4KKDCdy9GycOrKb2mnAOnBxiKF/Qc02GibzswqpUnlKyrJA3fTectU+bKohvzbMZnFC41IUcKuT0BIVRC1BNnvjTn756Rvbk963jWOE6oTzFbYhH95wJbwEz77mPzWB+0XN2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0547.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Fri, 15 May
 2026 11:03:36 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Fri, 15 May 2026 11:03:36 +0000
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
Subject: [PATCH v2 1/3] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
Date: Fri, 15 May 2026 19:03:18 +0800
Message-ID: <20260515110322.2883310-2-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515110322.2883310-1-thomas_lin@lecomputing.com>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
 <20260515110322.2883310-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0033.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::10) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0547:EE_
X-MS-Office365-Filtering-Correlation-Id: f929a994-4b85-4f29-6973-08deb2719c82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|18002099003|22082099003|921020|56012099003|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info:
 oiSfsDNJN5RwdlN5dKeiCVYY8IthDpRrrVDIkz7g7/AnpJRadfCML17quB6wSjlEmbeh/nkFPoc9oS7urfXB2wOKJHVUHVogPkAPl7gW3xOjxBRP63W4+TgCNC2fvS+LS7DgGTUj/KchylMWZn7+3dvRQqvQG+lmaZbt2pSOEnCzy9PjuX8Gf1luu1Wz6Fwxhq7XNUkTFwMNsqlnzzIjXsmmytROMJeln7WsDU85FWeC8ayaEFUziX+MyCBN9BE8Kool9ZuEwTGgiCsUt21GhIXCPU1mouvvQ7m6EdXnB5f0AJNM6PKeIYXCRiRbjMyYs0OoHRJRhezCr82/X/YzrO9Fd7n3Roa5LN0jiUjmQOTiBvcb/jwQ0JzHJNoLRoV1aw8UJo8E9PMd0l1ocEBGB+E68X7OGlexh6lV4KO2oQVDq65Q3psEuhjsveD5JdpQjhlhMTd+quAKgEuJ9pR8yfoO3IvbXzbwE6f8Yyj/JsgJKdX5P+IXkccaFIQj6eAnxtV2W8kRKXV5dx9IDxyIPtWH8dmvO394dxdYLwWajUHwPkJxOTd3TGHGG+SdCbK+zQDPNaRksUSbxWpDwx2RFQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(18002099003)(22082099003)(921020)(56012099003)(38350700014)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yZvQ8qXPMoF8MiKIP7mzc/YtiizvUqNhSCxXOhrIZEDY+IgSXUhg89ZvT8WM?=
 =?us-ascii?Q?33SDX/bOHsru5w3tRu8pYjnu8BJMS3Uyd9ihuL7deq02RpeCtfwYaFUXFEWZ?=
 =?us-ascii?Q?QPKLGPCYB/tJe6IcKxyGEFDUBMtoD70m/KzLfbtqV5tPQoxQumJCOOKe75qR?=
 =?us-ascii?Q?lnpqzop4oVPDQPpgcwlqJzlDAKsosZ4rFltrZMBvDhsrDFr0DfKk+/c9nKRR?=
 =?us-ascii?Q?LcjqG+cfVCMkD/rWLg8I17MYIx2EcpQO2U8I5+wupd0dK9CcZD6d9a9V27IY?=
 =?us-ascii?Q?tOh36RmRQSpZMsFBHNyjPi1UDGExLEtQLyACVyFzxQUDJyPq1cPwxFvM9FGJ?=
 =?us-ascii?Q?3QMH20JPQwjsjHLc9p5TZJr3+iF4dUkh3Br7tQU6hFXN4R90C2aeq/CpI82z?=
 =?us-ascii?Q?G+vDDTxIscQyOcgKJpY4MyvhG4t4KgQMdWSyIjf7eywUrEZAUDqiPUayWdI4?=
 =?us-ascii?Q?8wEOgV/MHmS3YMZkVCcQuU5gpIZJejdisvKJhSUBO89II/2buQAgnnZJlbl+?=
 =?us-ascii?Q?BabpqyjlDZnYJArw5lTbejdt3o5+UTqlaYJNu3SPNwUQMGTYBf57Dl+LE2Hh?=
 =?us-ascii?Q?0T/ymaj9LIwWojmdwxdtVFRVWfT+4ugTqtGQmKIb7e7KwSqP4R9n+U9V9gIK?=
 =?us-ascii?Q?mTZt8thoaoJWgBzz2DwBON3kCk1ydZMFCB3vC2zZQIxdgnilvwrddhHk6pSP?=
 =?us-ascii?Q?+zhf9GFNXcpEuuI/6E+stC6TWf+T+0wopJhlhQAMOoDCC/Z+EcmI2BBsMnqH?=
 =?us-ascii?Q?8EvKYHxA+H7jaY94SrtARHGDer2EVTAmyDgcxlASl96Xg6v9U+aenE+JcPkP?=
 =?us-ascii?Q?qzVK1YhqWyYXwUIH61W0M7pd8iRYCvVOYPsFUhuF3ld8RHwEd03YFcc0UfzR?=
 =?us-ascii?Q?Jj+QVAA5TfGTMgTO8Fa/VoBfNQORI2UZC1ZcMPb6nhmFx/4pkt9f4xoJ3w2M?=
 =?us-ascii?Q?YzKNZLI7iy9A0uGIpFtC/NS60tSNeUFHmOg5uFuA1490u7I6epp5qWyWWzqn?=
 =?us-ascii?Q?clYw8miYaQD2Yq+N1Uydkp7nUW5f2SeTDbplgsbldKu3gUjciN7V84XnfFQS?=
 =?us-ascii?Q?5yVop/ArBNKGKgczJBpLx1CmofYnFSVInX+zqkdH4IXg4hjd7IF+btC9B+m9?=
 =?us-ascii?Q?LTXwtRG2sMEsVS8cOqEhjS0Cz0zDC1pvI/uFS6dSEYhR75UKEgVbm6YECbuZ?=
 =?us-ascii?Q?lD8/MptQn+9Ct4Nlqk6Kf/6KONFAWPvh3eBCI6hjwCXHnZwGjACPkbCkneeo?=
 =?us-ascii?Q?NpvJd/uB+CeGH53LwbF2uR58nKvvwBwtYeJ10Tqsh1otrGif196GJHEkSNsc?=
 =?us-ascii?Q?0Vr7qqlTicX0QMyx6x0kNksitqxC0klGq7i4zNEk5dZtVfNpoR14nc5sGLx4?=
 =?us-ascii?Q?8fGTEQus8x+O1PbWC1eCQQ+POYdghkr8lcWQYGvRzzHJ2Q9nY95ynSCU2H9b?=
 =?us-ascii?Q?re8gW77p5TSm7k7jByL+mFG9dXlNJtuM0CHOtvk9oKSInW/4fE+IetI4sHD3?=
 =?us-ascii?Q?fNrE1pd8RLnszkeYgQLAH3nBUckQ1QDEDAqzAyD5mhqHajum9KcfJdnBcBwO?=
 =?us-ascii?Q?WsSbbRI5ZVIN11y1KbbCs2C36EcVqHGnzBPxrpxXzOHhcYEzYrds6Zh8HMgo?=
 =?us-ascii?Q?nJm9bdwraaQSt2eYiqdNhca27oY6H7eFnAJUZ1TJ7uXzZl84Q11d5eKjELGx?=
 =?us-ascii?Q?/+vkc9mlsOgWuFlMaYpO2gfbY5X0g/SIRFMnXgpPyzxkJwtxKEsKBSbrFpMe?=
 =?us-ascii?Q?mKCT7PKcUiFVZbfDrJqDGZmsx8c6k38=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f929a994-4b85-4f29-6973-08deb2719c82
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:03:36.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWtrVkGZRbmJM46fWJE4HBjGU7+RUjvsGms8pwsRCwHBhPNKocji1vBBW3IioZG5W/YrMqvludp76BQxpVUxXXdDwsw3riJZPumel3F0fAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0547
X-Rspamd-Queue-Id: A5FDD54ED07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-36919-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lecomputing.com:email,lecomputing.com:mid]
X-Rspamd-Action: no action

Add ACPI ID "LECA0001" for LECARC SoCs that use the DesignWare GPIO controller with V1 register offsets.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
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


