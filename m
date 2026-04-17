Return-Path: <linux-gpio+bounces-35214-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJD9CzV24mnh6AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35214-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 20:04:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2957F41DCC7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 20:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF0F03038A0D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 18:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50814340D90;
	Fri, 17 Apr 2026 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d40N19+N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB931E83D;
	Fri, 17 Apr 2026 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448806; cv=fail; b=o2b8YXriHNFvWACnppThaMdQu0qDHE54r8Y3orDgu7IGC3JJ3O53dQQK1Z8q8DjwMbfZhix5QwhC6BqSLNg9WqjzqEkGHAX3U7psI0e0CzvXwFG/dMbv29plqthENW2iNiH9GdaWvKNpZTN2bA/3sDz3rPjb/b9TzhDINm1YBPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448806; c=relaxed/simple;
	bh=F/+vxcqA+vNCvVCw2lNqBOf2akPTmJ2tV40HFZ6aH30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h2Cmd77t+48UIvp26wnDtwA/JoP6gS7iYwxk5yI2GFnmtqHfIh0uav5zoKYQb/rlFprs8/x/oXhAA5IP3rNHfovSCv3BX0DhnD854HR0EIpbNNrulgXafJYT2Eg5iyc4rYsRFj7v0ryNanY3z6KZeVlGb+JM0gVbjiW57ESpK2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d40N19+N; arc=fail smtp.client-ip=52.101.52.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjATjUQGXjLUhj0M8LcZ+7yjGnedPrtXBWX9qiMPbdhZwfZHVZGIPbLMwVhU4nfySCFoi7OkHZdwEeHkLLu8R4l+lrWhFS/oTgg1HHfRhhPKbSDTV32likJPuipG9q8Vj3Z+39bVf0Jx4zNz7YBRTxl5ZU155fSv1Inr4K0fIOFk19QoqKNd6cwxZQTFpAP6UYGN69Cu3/m3qFQXnfahVDPBDkSe5eXG3VdZXlCFTVgq1kTnAgmoc3BIY7Nk4lnFVMbGjXQuDZeIX4tyqUVTqtY2MefeyWyAdPIl29mg+fvYiXLDT4Cp9DXgCqkggyORCX/g5EykgXut2b25/4T2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yO75ubrudtPr9DnNOTwe9S/UAQ8T4cAy84+gi+KCi0=;
 b=DKG2cUfuPF+zYYkMmI7B2EKM0CLFpvZWeiZqGPUrVncF/tG1D/T+Wp9cZomYaTBfxnUHyMmS4UyrVULJtnGTr7ZV8Sozstdhuu/4XJ7nH10+ppcH4/dGM4QfOyZzUk1thKv+qHzHzCNcdcHWHFUyi2TKL6poek4miskPxqh5lEK2DRh58a3R0OylBDRELay7SOetCfwEztk66JjdwUbf8/3qiY+5iN4KcFFqc4p3LkL0jPvTmkJ+4XLtgToH3e+wauAYDId7hGvYRwHTHJ1qoQPrX/s3SaG90SBRdfqU5pzcny4gOyw3x7D6xsXZei71JjjUeVMmNeA7MJib50bPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yO75ubrudtPr9DnNOTwe9S/UAQ8T4cAy84+gi+KCi0=;
 b=d40N19+NOGH/68x7dFfsdu8MIUkSfD2Jd6EXnI510Jw1c7dufHIVpHKEj6x7EwUw1Iwlcfz3mo4kWboyb7SuR88g/34Lckv8hGvHtjKa5pbWVSdB7bL1Z06HBLAH9se6IOf8CVwkOG1UH05pyinkX/6gmeW8rkWewFoi3VwcLa3FdcVfH5hMECUKkP/ET/YImhsVeycGf60UQmLi08dXn2MJDdZfbupY2yrLQaFj9t2ZYupyaCNaSdUI+uDpwCVMK0WAC6AbSERNpYX4y//5srtLhocCOIrsAVORVbefXoT9CRU2KXK5xu3kVtFaqOkbFQzOjNCO8XQW2qjTM6Kw5w==
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
 18:00:00 +0000
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
Subject: [PATCH v2 1/2] gpio: pca953x: drop bitmap_complement() where feasible
Date: Fri, 17 Apr 2026 13:59:53 -0400
Message-ID: <20260417175955.375275-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417175955.375275-1-ynorov@nvidia.com>
References: <20260417175955.375275-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:408:e7::16) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: c0bb62b3-0a72-4cc4-09ea-08de9cab24ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kvufyD/Mni1d2WatGzhdJzGJP3BpyguI0Zce3ahDBTAkrBxvs+eylElPZs53GTBW861XGPk1pAOADHGd0+VML5xcFK4CthI8hPvreSJnU7tfB/BXRS5ZPz65FkmCXPWDJQtIy1f5SJIVjBZIK6Y7CqzAD7WjGclpy0xE0Wc2x12sq50x/QK2QECzxyhgLlBkMcFlKNb8DhgXyE2baaYNCsypiYIAPk9hFEof4JYt9RrnKgGhN2KumjrbNSOZg+wS0Jl9FFGegZ6QdCzWCfAdZ0FnoOj/4jk1+nD4cctTTm0Lm1CNMp0t7IV2tYAUZc2YxpfJLk6iPf00za6qKdjSJVgM0AbuNkeVDWyFKnLvPgyQKa1v7hNuaUq4pmoFcmwQj6hP+RBXT1ZmcBaAMH+Lq/9qupNevDjGjBHhxMR+Ft9AzSeQsJcuvEGaHbXOShsS8o5ktnvCz73nyJecZBtc+9GPBXB9lpSwku4qx+af5P4iY6GTC0UyRpVhHaGUVe3l/6cCxhXTg4hnRohdR1jc0PmxRq2OXn/lro8yPkhEqZu89QI5hbOFjC75PYI7u1neUFp7vud1fWiUVq/ocGbRQdPyiD5BfsLLohWJiDQQsma4SsoV+4ek+QnbOR3m3XkJ7tLKg/LCK/CudrRsl0C7uedIQ7bJYlkzDTNYylUXQvQ3I5BMywvnLpP7BJUHHdVAbGXAaEbcu38qbNUU2x6ag7ZO74I4fmlCU9X8Jw1Y5B6E/5ksijbUr3VuN+v2vwJU7MRFFXYx7DQp1VIEtZPURQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UyHIUwSu0W58zZwmt7viHsrkTUbaieTDM3emSSIHiwDlL9f4SfwBiXPX21iN?=
 =?us-ascii?Q?+dfZCbK6Sej2apWnlV/5d/mfKIFUkVItXtsio3LhETi0YmX//DpPLnSTb07x?=
 =?us-ascii?Q?moho5DPlz9D4h2NF84mbYsL+gmrCk9FDQPvhJSDgNs8Uit7hcgf8ycIt7a5D?=
 =?us-ascii?Q?m9xQEDOLRiSaXww220D4IWVdgel976ZdhU2oW8f/KifpQs361caRxA+be0Gm?=
 =?us-ascii?Q?moPqH6ltV35Rie4VJWIsngtAt7tRWDwQUUfcxDWgadSKVASChoxZlBYmv0k+?=
 =?us-ascii?Q?QF5PbMu3b2Sa078l0C0cVOqcg9T+/SqdtcPMCw0Ts9FdBdxLqHNdBNSup9Z2?=
 =?us-ascii?Q?cq+0k/bTYFvP9tin7nmh1rOfAXi6T5ip4mMMreT0QsnxMCJIoxoeeNaSFE4h?=
 =?us-ascii?Q?EXAfVBjq3USNTJldlreqCwKZGle5AeRPxY8P0ikuBWPfiJqShZ4oe/LoQPUO?=
 =?us-ascii?Q?CnfzGIX+/JAgiHXObBx/5qOubmYFa6i9Tm04kxaeVzh0gL4ubh/hvlPOMPkR?=
 =?us-ascii?Q?AqWg45lwNlHxhcO7m8XViLEFZq/DlEVWYhR0R83WPNG5XDot+bNOu2EAy446?=
 =?us-ascii?Q?g862L4rn8WygyfHrl+R0qMbro9bMIFfIJvvYkKScDfNnPVUstt+p/cALJ+QP?=
 =?us-ascii?Q?6NqtXgu4A2+GyiSTSy6CMqD4ASmsrGisQK4lFtoucYb2fUblOKkoVhtQNVGK?=
 =?us-ascii?Q?7LBzYSun0WbxPt6EU1jz4Ul+snj7mj+caQAAVW5EqFrfKOeF77NhoYEdaspj?=
 =?us-ascii?Q?vHrtJnUSLowf5/H6aTDlkDn7p4vPUcFXaNbklcefkflYPQ6dEZBUwnOnqcJv?=
 =?us-ascii?Q?N76YFID8R3ufxRYfIPx4v0BZMFA70eZOzX4T9r78LU67CvOo3xf4WiD310d9?=
 =?us-ascii?Q?n6PaCSRREaNXLPa7nIEw5g5PGi84fBMZ/ttFnoLCuVgs3TLle4vr7cegFvNo?=
 =?us-ascii?Q?aJDtI0UKdmSYnyjUcAZ+hcgHys8Ck0gQTvcHMj0ucKQirqCnxMnlC6FCniF5?=
 =?us-ascii?Q?662GaRDc8hglhlw2yVlW18yJXiIBDGPwFhAREvR1KpInsLbbS5o80LtgkdgO?=
 =?us-ascii?Q?7ZCBYrBZVwSohWiSmWtLQFmA4bJLSYaP6/Ftyz3poCZ5UffEhEA7mzMqjvZD?=
 =?us-ascii?Q?wqJxt+7u+ZJREWoEPdMfF7YnHJTsBP+wA+4ClizB/fwGGshIF+0esHAYrJi5?=
 =?us-ascii?Q?XR0cWTd7QToowhNi6i9LjpAfpM6RVEKh9QQ1fGuNv4/Vmdh9QYZuReT0FNEt?=
 =?us-ascii?Q?PkkQckZonq0mmuZfbH4U3wwaujQBVkmVEIfcoTzt7FaZqiP299V4GHqHqSOi?=
 =?us-ascii?Q?Hv22bXh6c1JF1LVFUg8hHSD39dzDUK1a1mO189BE7wBod2b21qkjBQQd92ED?=
 =?us-ascii?Q?syi0K9vxjgVe8z8/jpFIkkkHbgS8Zw/JRLbzNEUDYDyjq/jvbvGbkZ/lpCLZ?=
 =?us-ascii?Q?PQ7wtSgum5RLUUsauKfA+peR7zVoTHBLyqqXuqLyDcOn+f9dhuCg+7gBusWI?=
 =?us-ascii?Q?NH/KwfOOCWGBwHU/xFP88yf3i0HZuX34SXDEeubN4iwxKhRG81b6OL8+1o1G?=
 =?us-ascii?Q?12UgTEk+GhdGYR8tKZpnABLQKp7nS39lKvyCOkxuEMEFB6zkRaW/YjrqUq5S?=
 =?us-ascii?Q?O80gS1BMAcwMM+E881D6zBP8E0yP8qdhS3YUdTa6sHFAOg4c96xWgAqLmBNf?=
 =?us-ascii?Q?bs0qo0BFGoFoPRyc6chDVJB/AiEaIUOJ7rKYR9RONHUUcj68v+8kJ9eVdaHi?=
 =?us-ascii?Q?nPkdxBGy3+6Okvnn1+Ykqi/kMmGDB0DZzmIm30VqqLB4TBPzvg0P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bb62b3-0a72-4cc4-09ea-08de9cab24ef
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 18:00:00.7313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhewajTZmqkH1qOKvgBH9258lJ9LUXyDmQcpUxjqiHHWtRZu5gO/loM79r0Nydv56xyqWvPmLCPIdjhi5E7Xpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,amd.com,gmail.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35214-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email,intel.com:email]
X-Rspamd-Queue-Id: 2957F41DCC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver reproduces the following pattern:

	bitmap_complement(tmp, data1, nbits);
	bitmap_and(dst, data2, tmp, nbits);

This can be done in a single pass:

	bitmap_andnot(dst, data2, data1, nbits);

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/gpio/gpio-pca953x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 52e96cc5f67b..1fef733fe1f0 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -877,11 +877,9 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
 	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_high, gc->ngpio);
 	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_low, gc->ngpio);
-	bitmap_complement(reg_direction, reg_direction, gc->ngpio);
-	bitmap_and(irq_mask, irq_mask, reg_direction, gc->ngpio);
 
 	/* Look for any newly setup interrupt */
-	for_each_set_bit(level, irq_mask, gc->ngpio)
+	for_each_andnot_bit(level, irq_mask, reg_direction, gc->ngpio)
 		pca953x_gpio_direction_input(&chip->gpio_chip, level);
 
 	mutex_unlock(&chip->irq_lock);
@@ -1005,8 +1003,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	bitmap_and(cur_stat, cur_stat, chip->irq_mask, gc->ngpio);
 	bitmap_or(pending, pending, cur_stat, gc->ngpio);
 
-	bitmap_complement(cur_stat, new_stat, gc->ngpio);
-	bitmap_and(cur_stat, cur_stat, reg_direction, gc->ngpio);
+	bitmap_andnot(cur_stat, reg_direction, new_stat, gc->ngpio);
 	bitmap_and(old_stat, cur_stat, chip->irq_trig_level_low, gc->ngpio);
 	bitmap_and(old_stat, old_stat, chip->irq_mask, gc->ngpio);
 	bitmap_or(pending, pending, old_stat, gc->ngpio);
-- 
2.51.0


