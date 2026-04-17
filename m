Return-Path: <linux-gpio+bounces-35202-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /lwXImaq4WkywgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35202-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 05:35:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E3416A01
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 05:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D48F230427DF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 03:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08554481B1;
	Fri, 17 Apr 2026 03:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgTE3UV7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F832E2DF2;
	Fri, 17 Apr 2026 03:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396889; cv=fail; b=Qej75PCEg4BRnzBy0fCD8RA0QFbE7JddnClRnojYRyBXwwIZMFNaGpIBw6MZ3oKuxYynzgGhu1RKP+eYJrI9K8+/0pdqi9Rbo5WtmxE7UsmII9Jv1pqbMCLaTEprCDw+iPEOh0EX+X+SK6LqYtO3X7qutD+tUt07khjrQbifISk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396889; c=relaxed/simple;
	bh=0OpOb1vOyAe2rm7wks3SXtGu59WZNRtjYbZFRaRxoqc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OoDBYrLuYlmVvfizAIBmu6CThm6tddqbWjByZYTkFA6V3L/AEd37nJ4sc0Ib/YBTcuDIDi9gAoCIslYXHnQ/p7hoe6H+nVruKGPa1zxicWCQrUItlgrm3a2t8ygC+oTcGQNeEKsQcCM0qeG/3ftIhxhEzb93zUxreb5EaFsIBXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CgTE3UV7; arc=fail smtp.client-ip=52.101.57.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egUrqwBKDJElVLX+J+0PKqKgv+UKNnnzFTkjIq+PuHtdggdQysUiylZqN6hW/Pvn4UQbhXPXAL3iQ7la7ugrKTO+wtqIRnfVj2DGJeBYM8JQW1hammc45sQQ7c0rL11SdNv2SONJprgwvmQ9d+M0qdk91zTcIvEFNohk4bPRpUvskZjhV3YtWrn2ZFFT4r5yeR7hIzLxk+zXwog4bm/Qo2tdWuEySLGwuIs/pEovfi3Nq0DS7Seeu94Y6zI4SrFz/xVcz2M8B7W8UL/blexnxQhVSAdvOp2UQ72dWE+PY2qaBdw7F5bIhiTRZ+ZDgpTHnoMbK4MlaW3xlSR6pKBd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCER12a8AX4KI+qktc+coveVq7UcxKaCuFiBXc8NcHM=;
 b=qQggyPqMZQXoLyzw+5MDhk7TRJD18Bvgv4v/ol/Wp8i0wk3eqAaODqmErEplQTTQFaNgQkKlyustAnITOOyUdGYlH6bVqpcBsIRuc2o8GUyxWpN167OqeYoa1tVl51vmck/RkNpHXNjpRUI+6aaNj4RqswCcNOyhxVtuCPHhW/B/mdCma4ccdYvJKLeY56T4oNRKteKeDVizg4A75eGVQq5Hrv2rc01TuDMA/Jxh5/ugDASq6/s0DJWNw79cyjt3AeqotGzKHtz3ipUptxRypa5iCkuSq+a5o3AF/nTZTn68vUA6A/F3Jlqfn6ZktsBcMZfJaooo89aciJYSU3ZhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCER12a8AX4KI+qktc+coveVq7UcxKaCuFiBXc8NcHM=;
 b=CgTE3UV7pPNNsImIRks+qkS7eCOo/pq6DvkdkUEXQbGYnu9MaPi768Bs7SKp2BYWT6+UoUQGBv9QinOYTbo+wVWpn4L4dyZ7+TFs0tWx5MFX66zHhgSApIKfndS5NO4AwHRLWkgHe5XgoNZvQ/NE5xDf9xkgrdtS4Ff20tPlNVqMptiTKDBCG+d8q7oX/xeEBjG7ZKAWfvUm1chT4a+kmKnRB7t3+rS83/nsD96p07eoywHl5qoq5DveRVdc+ghnOkGMeAnfc4ARAwNn/ARKfdssl+bTX0f6mBlsOYlXgPK/GqLxPbUSQLKhxfVfMR9HI98tNcS8/XwLVF+1RLNN5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 03:34:43 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:34:43 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH] gpio: drop bitmap_complement() where feasible
Date: Thu, 16 Apr 2026 23:34:38 -0400
Message-ID: <20260417033439.318930-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:408:e7::18) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bec062-12de-4552-2677-08de9c324381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4b5010M8q6eGMVra4FNJh5mWqaeLqz++6Qyrk+gdpLl+cys8MAhzON6Q9Av2kxHQUaNKCwm/Oc8u/zZY98XdmmrECFpLOsCFK/0KeGY+XF1TiHlIfPethdzUSwYrq8qz6E1YxEhx9+2bLo8T5e9KyM60/WYaeux76XNSUT2DLBKBH6buee5JMgjoYM1ItteDN65laIORurqTvtYxNGnUnj8vxjwz4+jbAlf5nZAzG76hq6XCcisBXOXuhnrOfWlSbEC8rofjT4W/5y+EXDdUJu/PqE5ZyePl+tiHsO6wzq4sx4tSuaB8zZXIDbhU3YNWP4GYPbo0ir3ptzTpXzXKt7YErTJL6KPbRfwZ3A459SS+Pxj5HpHrVrp/v5axK4FmO28aYxwDY2pi02DbyRlCL7BiCFBxP2fZtLknW/32o8A5rbVy61lEUyGw22c8JR1wLjD8WD97losglnmaRnSF37iqiCmQI3bFhb328fwxjf1ZX+eEDmfg1xcSALmCVBACUcFxBkWP+HTtLcqD3/AnEr9rN7ZG3kht+2i8mYi5ekOuH64eO54w81+JYbK2PUddydzLTDK6uO2tzKkiO/BWjTaVI9JXmF9OQvo75oFtQKEeWb7GYa7+aI6UB6Y/MONhaDY8tGpT9/4dwb9pdvaEDqfgcp9cA7EEZ+L/BhSLn5aGXarGtxUTiBSf76W6r734DsaqEKGddvPyKzyftpDPB5rAuCT3XlDR+Jq7i5xDdNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cSmvakymKhZXjvcrQNatp9ZdEBgOruj+NqE9m0PxzNGzl8iHv36cqSkK3W/X?=
 =?us-ascii?Q?APtYcUYcBW2N4yYa3Rx8NGsRsbQupmURLh9xtATniQadpZsvnXhmUpxkkaT4?=
 =?us-ascii?Q?GoIyH10N4/aTzmylkY7PTbXTLefhgG0hkhfTqN/IcJUqMZQsmS/HOi6FvvaW?=
 =?us-ascii?Q?s+kEfND+yC2NwUsDWBIAhQbuX7fdorBRX88Jh6z0to5np4mD87z3/OBDsitW?=
 =?us-ascii?Q?F7ZKtcikffGCJ8Odp4JP3cUFGUR83yk1A6UYguKB3poRZKwMsAA5hTfjzk+I?=
 =?us-ascii?Q?omb/aXfEw3QtaxnplvnJpT1nJGIzwrlKLUDM1TnZZbRkwwnsWGFwNjd5UfaC?=
 =?us-ascii?Q?jCQKQWkivBKGe+WumF6N5drhUvjsKVK2HWMH7jaRcB/IAJL8jncdnkmmRjXX?=
 =?us-ascii?Q?h2DRIamVr5fdF5Xa9euxGyQVHWjkMTZ1dnmay9zlBEkvz9PSYEm0gJu5dH0P?=
 =?us-ascii?Q?JTu/IZCSZjKcBBHuTkQ0c1jgof7RSiLqJsC2Qf9KSHi01+lm+D5+O9ny+Lct?=
 =?us-ascii?Q?7sfHbqlnIFIsWofdATRsINCx7eP8ctU7UdyJjFOyKIK9Zw4JGaldt6oW91Z3?=
 =?us-ascii?Q?OJRnE4BJ1Vz7pLDYn2kg7z6jFdPj21oFD4dMpsdGXmgq5VOVYcEHTYgVsBr4?=
 =?us-ascii?Q?XVRN1CZeS6EOcbCyn2AscD+PEyIjqvEKolF5fxVO4e13F7arENvJo9ArwMKu?=
 =?us-ascii?Q?EIEv2qYLJ3F4jzjB4lFt9WiQOHXWGghtt77IqCOkx8jGMNZ4oqDWYJ2N+g8M?=
 =?us-ascii?Q?J4jKnApG8WE+GDLxFUHM6MNa9MJ4oE+HadAidm+dni843EUKN4nWgpwA5rbY?=
 =?us-ascii?Q?fildTHtUmWEvCre8CnSSZGO9Vkiukc0ahscdLjYsadZL/U/l5RxBF4+9hIcm?=
 =?us-ascii?Q?skbmmkktJeJyL6PS2sJ+fnEzZ2+8JauFAaOdVLmwfCfQDNIpd6QieYxJzxPe?=
 =?us-ascii?Q?6u9TuenIF6LQKwp5Dkn2Idyv4cQGWt93uDPEmrSOBGGs7mIFcsiUuDTRjGoH?=
 =?us-ascii?Q?cas8XX7R2fY/NZUW6nu2c8NHIAHqRcbPpn9ful9AcbPx1/Cx9MiKx+J190bQ?=
 =?us-ascii?Q?tcumjISFT1KBG4UhTqy3kgvubttwAiQdjC/Rf1lmgXYqKj3wy9NAznO5G2g6?=
 =?us-ascii?Q?73QkzBXcrdtS7+0y+mwUCf68pq8Js6oG/GxpQsMttcJQ+h368hOs32tuen5E?=
 =?us-ascii?Q?ALVQsXafIcBxSGzOrBev/JRTAtukpFPKLtRaTpQ31eYA+SaDjqyqahCVSCag?=
 =?us-ascii?Q?2tor278z88CjFHgVHtkB4qm4wds74zFqp/cPs5gdzlUZKkE/I5JQYSgPZ+Cy?=
 =?us-ascii?Q?/W1Z5EQ7UNUpyF3VPCly5UgGmUle0iCNnZZezs57H6JIb19QFcm9E3osHTly?=
 =?us-ascii?Q?F0Pazc8yB2UjyyZGN+STnSPh+aTfVch79tCLsK9qqrojOfyJ3P+t5p7C/b+M?=
 =?us-ascii?Q?9oRwsJhS/N2XLp+tEAygnx7mck+4EXEpYEbZx2a7AlJUBBnFj0vlmlsWYJ7V?=
 =?us-ascii?Q?rczitXaWHT3tp10S2m+1Azo2rSjhOGPONgL/so2bAON1VD8TH3kA1NnD3fgs?=
 =?us-ascii?Q?jTmUoYLnivTR3Sr3tIrrQgKV+ySD02GP8JyloErqSkdZg4a/ckvDMufZIbWy?=
 =?us-ascii?Q?lp1w/pU4w5rVIEmyg7LhJWhBu3S2BPQ1HxG9tjWPLFkzhmc8DZjXBtJCA+nP?=
 =?us-ascii?Q?cIuIV+bqJZPsdgvTWRmNm4Aj153mV+yk71rLlN6lyZCeY+7lWbpRWIj4CQel?=
 =?us-ascii?Q?1S/u3vlheKvMM9FI64b5wQkauB2BwLTZ4LR7QISFlKJCcunzyqWR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bec062-12de-4552-2677-08de9c324381
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:34:42.9183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDapGFg721j0sZX9IXd8ZQ/tNV/WfcBL9+5uREcx1z6SFGhy2WkXZygUElKzF41JGu0dxtgWA66ZZzyvXS9nWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35202-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D16E3416A01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gpio drivers reproduce the following pattern:

	bitmap_complement(tmp, data1, nbits);
	bitmap_and(dst, data2, tmp, nbits);

This can be done in a single pass:

	bitmap_andnot(dst, data2, data1t, nbits);

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/gpio/gpio-pca953x.c | 7 ++-----
 drivers/gpio/gpio-xilinx.c  | 6 ++----
 2 files changed, 4 insertions(+), 9 deletions(-)

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
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index be4b4d730547..532205175827 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -495,13 +495,11 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 
 	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, hw);
 
-	bitmap_complement(rising, chip->last_irq_read, 64);
-	bitmap_and(rising, rising, hw, 64);
+	bitmap_andnot(rising, hw, chip->last_irq_read, 64);
 	bitmap_and(rising, rising, chip->enable, 64);
 	bitmap_and(rising, rising, chip->rising_edge, 64);
 
-	bitmap_complement(falling, hw, 64);
-	bitmap_and(falling, falling, chip->last_irq_read, 64);
+	bitmap_andnot(falling, chip->last_irq_read, hw, 64);
 	bitmap_and(falling, falling, chip->enable, 64);
 	bitmap_and(falling, falling, chip->falling_edge, 64);
 
-- 
2.51.0


