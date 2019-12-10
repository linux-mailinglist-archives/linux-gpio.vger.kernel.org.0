Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6D31185E6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 12:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfLJLMS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 06:12:18 -0500
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com ([40.107.93.40]:6238
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727018AbfLJLMR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 06:12:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZgKU5Qwaxa0Rq8RN0lRD2uXsA7jozOKb+Wc8i+VtfzRd1VJ4+EooB+exvKnzxrkq1QFmlZUNwfjw4knx6UZJ5QPQbqSf9LXz4jq5D8LfiZN3qnJDRe3rHyzWFH/ym7OKOKoVf57M5kmCN5YonjVoX/ia3ir1CvS0ZEmr7zmgpqLJWrOBDEywldweCq7pv+N5TOZ7qguCRbplph7GSJ9EuCqNOD9KluzGI3Vx4o+VPn1yDeTPU34EnQXnWlUSN3bWk1pdir9rr6xoWOsYuoRWvRW9a89fc91kxWf/iaDOqE4I8hZQQZ9mKPhb+tDn6/xkrTNYS36UVXn4CdomoZrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbCalaTn2X7HF4eRtvgddainZMNLa53BndvIrXNSIWM=;
 b=CU+vbEvlN974++ikVC9Bo61UmwUvinnCqq3q+SUV/bwc5NHqTvPA90yJbR8qFZe4JswuUb2XBObC2Fl92LpQq/FNI2KXrT+k/KTI1UlPDhgYSMtD54gbkN+xYOnpECGVXKHxbinxty7TA4iiUFNnH+DmW55msOpP/PxQLp5YFtgN3OepuJj8x2mkTqMd3U5CPfOV51a11ysCVvHuIKeqbcysnLhEmYqeU0I2jAKA2lHZ69IvPnO4Agh2a1FRCidmPXP8iqGOeVffD3h9gDOoAxA0xF5ZAw4s4SrXKqDWGTz670Y/lXtnQoankb33S+PRua2WvQwTAC1wmK/PxRInng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbCalaTn2X7HF4eRtvgddainZMNLa53BndvIrXNSIWM=;
 b=qQxbrYM3VMr8uChXawMgU/us8WnmKTrxnD5Kou57ZmgaTLzhc2thyh8WzZGjPRt5+pGJprOJD+jAYbE/oTgns42K1a2wi4FAOmTqvrcYsoAYNP600AK3x2IecsDJCnjP85EfuFK/YQgk0O4W9qe6j6+Sa3OM8ILKxYBxktrzF6M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3656.namprd13.prod.outlook.com (20.180.4.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Tue, 10 Dec 2019 11:11:44 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 11:11:44 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com
Cc:     aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, bmeng.cn@gmail.com, atish.patra@wdc.com,
        sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v4 1/6] genirq: introduce irq_domain_translate_onecell
Date:   Tue, 10 Dec 2019 16:41:09 +0530
Message-Id: <1575976274-13487-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-ClientProxiedBy: PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::14) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
MIME-Version: 1.0
Received: from dhananjayk-PowerEdge-R620.open-silicon.com (114.143.65.226) by PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Tue, 10 Dec 2019 11:11:39 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [114.143.65.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8228d1a2-39fb-4756-38cc-08d77d61bd71
X-MS-TrafficTypeDiagnostic: CH2PR13MB3656:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3656CF4A1F58D4DEAC4B415A8C5B0@CH2PR13MB3656.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(396003)(39850400004)(366004)(136003)(346002)(376002)(199004)(189003)(36756003)(66476007)(1006002)(107886003)(52116002)(6666004)(66946007)(6506007)(26005)(956004)(316002)(2616005)(81166006)(8936002)(81156014)(16526019)(186003)(8676002)(44832011)(6636002)(5660300002)(86362001)(6486002)(7416002)(66556008)(6512007)(4326008)(478600001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3656;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHRUh+TyfD8O0J13qczc8vdv91+bw/fvj0g6GLx42eVbjH5cal7IpuOajTg260yF4fRrEPC3NYakrCPUyyApA2SL8fkWDvqrISBa7KrQHseIUXE66CYHvvsDL2AzGgcEZlNDbaf48LYPKiU5EVhEMDqtet4KIQa8yFr60HKcWZMW+21aJ0ul9Mkinfi6OMLemu2DcU8U7XBIdLSy0qmsV6Z25fcgqy6zA55hdQX6ioonT5M9HQTVnzBDZxTIoIxxf9qLf3wQieFQJWAmtBnDqc+ZmdkriyOfUCLk8Oi1k5I1qlbStxVYWrhJpxH/rWqI2RdJbotlBwZ2hB7Fhb9IPDhVHBJvGxMY2HJWnJsNdSs8q+MIi4kh4Vs4e86AjqnsQQAlKcoBF9WKHRFvbtU+F/5zAxN+yg7t9z5b1M28JxX60hkaGnjeThzaZVfsgZ9F
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8228d1a2-39fb-4756-38cc-08d77d61bd71
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 11:11:44.1946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOvu+lzzAoOJBYfbEd7kZExGsJMSDwucYOHgIgptRG+Nf0PM0DHI7Ybl1BVy/7Gmv8MfgBlZnob8bO109oyhrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3656
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new function irq_domain_translate_onecell() that is to be used as
the translate function in struct irq_domain_ops.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 include/linux/irqdomain.h |  5 +++++
 kernel/irq/irqdomain.c    | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 583e7ab..cad9eb8 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -426,6 +426,11 @@ int irq_domain_translate_twocell(struct irq_domain *d,
 				 unsigned long *out_hwirq,
 				 unsigned int *out_type);
 
+int irq_domain_translate_onecell(struct irq_domain *d,
+				 struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq,
+				 unsigned int *out_type);
+
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
 int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 132672b..cf57d87d 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -987,6 +987,23 @@ const struct irq_domain_ops irq_domain_simple_ops = {
 EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
 
 /**
+ * irq_domain_translate_onecell() - Generic translate for direct one cell
+ * bindings
+ */
+int irq_domain_translate_onecell(struct irq_domain *d,
+				 struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq,
+				 unsigned int *out_type)
+{
+	if (WARN_ON(fwspec->param_count < 1))
+		return -EINVAL;
+	*out_hwirq = fwspec->param[0];
+	*out_type = IRQ_TYPE_NONE;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
+
+/**
  * irq_domain_translate_twocell() - Generic translate for direct two cell
  * bindings
  *
-- 
2.7.4

