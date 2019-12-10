Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5941185EB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 12:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbfLJLMX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 06:12:23 -0500
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com ([40.107.93.51]:57249
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726915AbfLJLMW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 06:12:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/924dGlmzSsKUbkEIQZrk/M+wlHqI1zTGwcWh7gMF3RALYfBqQl8MEmh3T9r3Qvj/Vs7KfKdpmUByuvqPxTm4OdgQoyqnEAihk2tE+fZDLqCV4KrdAF/4EL2eorvz/sY4mHQbwaZsq7zJO9xX1ehiiKDEcR7PTKvthGYaHdhII5CZhb8QDX5ZU+2b6h5n488fOWFT2WGRRCiv4FMVMIb1/NzrY0nq02sGs2uxx6nXRxQJM/B2Y0+A7TwqELZx1eJGBYcVH+tdXRoCENNWGqZ2g8cSvQ2XgpGUDWGVcouYOP6gZHWKIihtF0/8M8ZxhEolpQpoXEDzlqGEb0yIfXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URfawLSEXkGQGbpLHsV8ZsdnEVngNhvRhQXP7gJgttc=;
 b=OPaoAjYGwaIEPKnmtl2x67Ji4qMjsKaWCoD76Dsj13/7WWblT0UuaI20sse1eTnfizvhC1+RlpFQMpafnoJg/DOgDy1RwoU9pqd5LQk4XoKOYteMt6wHj0Jv76yn2xAEf8OMIzF1U8GENJweBTJC4vK01U8NFlKLx65IG7A7cYOeqtvlE5T3Ergr92PV25721407zYMPFHGdOzJlwv6JUC8Bjv86/xoyfqRmdOHIgyxsEITKHILFqfZS+3pg9S0S7v8sG4+FvS55QHOyoaeGmIiAxb7YGlDEXpOoWQcuuyAFUC7sUy2BPMpos+F94wD7B1TZV9tyVzfd9pEghrS+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URfawLSEXkGQGbpLHsV8ZsdnEVngNhvRhQXP7gJgttc=;
 b=Dl+YJlqMYDyCQeiNDpaTt2Z6mAbSqkdkNCPccGT3fHuO/VdoaMwD/vi0x2Pd85r+h7HcPRAoXf8Vc2b5R78pbCfLQkwuE2zpRE+dT6LWzAL3pIENLEnpqHaNACLleKbA7L3x8vXMVtXEdf90PA1v14JkGhbG2rUpkcL7ybAlisE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3656.namprd13.prod.outlook.com (20.180.4.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Tue, 10 Dec 2019 11:11:57 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 11:11:57 +0000
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
Subject: [PATCH v4 3/6] irqchip: sifive: Support hierarchy irq domain
Date:   Tue, 10 Dec 2019 16:41:11 +0530
Message-Id: <1575976274-13487-4-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-ClientProxiedBy: PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::14) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
MIME-Version: 1.0
Received: from dhananjayk-PowerEdge-R620.open-silicon.com (114.143.65.226) by PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Tue, 10 Dec 2019 11:11:51 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [114.143.65.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 807eb966-698b-429a-50c1-08d77d61c51b
X-MS-TrafficTypeDiagnostic: CH2PR13MB3656:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3656909CC0EFA8738F9502A88C5B0@CH2PR13MB3656.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(396003)(39850400004)(366004)(136003)(346002)(376002)(199004)(189003)(36756003)(66476007)(1006002)(107886003)(52116002)(6666004)(66946007)(6506007)(26005)(956004)(316002)(2616005)(81166006)(8936002)(81156014)(16526019)(186003)(8676002)(44832011)(6636002)(5660300002)(86362001)(6486002)(7416002)(66556008)(6512007)(4326008)(478600001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3656;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlMOvGtZpnZ+vd0WnuN2FTIMoG2GpdZV1caA84O5XpOPXg/BTTalQ/MrLTU9VzUI+yhucCpAxnFllsaqGUsSPe/oCJtHMw/wimZXO5b8ckpBYsivYtgMpuzL02vDYPA5UR3tliTCvNnR23QPrkBE6SqdfniCJUrivrRGHIPXRtWfaEt/uNIEIUeoz0xoThAZAZr6x5Inx7ccto5FanVxNDR3B0lzC07qUb57+vV+w6r1lsIhiUhN/tLTmu02AD9E2XYoL5qiGmGnHCVTHNZ13D1MHFwUeyptJPGiA7xtTZYN3Iix8mukJTS8xwv5lP+0wzpCSl/lam2SltsGhQYwcOnwjW1cjurya2CJDP0Ga2Ufv1pw7GhYVdS0xNA+a2Azm6GxOjHtfusdppWcU7PwKt9TkMRfFrwLtEJn9PCVmQ3HUnli+Xyi4nIKJi++M324
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807eb966-698b-429a-50c1-08d77d61c51b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 11:11:57.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCWMLczCMN1WS+ybokw/ini7TsULxp2byl0X0gH15Xci8FfwEiTeirgF1Nl7Et6H1ZYcYz+XWt/Y3HsaWXi+/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3656
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for hierarchy irq domains. This is needed as pre-requisite for
gpio-sifive driver.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-sifive-plic.c | 30 ++++++++++++++++++++++++++----
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index ccbb897..a398552 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -488,6 +488,7 @@ endmenu
 config SIFIVE_PLIC
 	bool "SiFive Platform-Level Interrupt Controller"
 	depends on RISCV
+	select IRQ_DOMAIN_HIERARCHY
 	help
 	   This enables support for the PLIC chip found in SiFive (and
 	   potentially other) RISC-V systems.  The PLIC controls devices
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 7d0a12f..1592ef2 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -154,15 +154,37 @@ static struct irq_chip plic_chip = {
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
-	irq_set_chip_and_handler(irq, &plic_chip, handle_fasteoi_irq);
-	irq_set_chip_data(irq, NULL);
+	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
+			    handle_fasteoi_irq, NULL, NULL);
 	irq_set_noprobe(irq);
 	return 0;
 }
 
+static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				 unsigned int nr_irqs, void *arg)
+{
+	int i, ret;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	struct irq_fwspec *fwspec = arg;
+
+	ret = irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++) {
+		ret = plic_irqdomain_map(domain, virq + i, hwirq + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct irq_domain_ops plic_irqdomain_ops = {
-	.map		= plic_irqdomain_map,
-	.xlate		= irq_domain_xlate_onecell,
+	.translate	= irq_domain_translate_onecell,
+	.alloc		= plic_irq_domain_alloc,
+	.free		= irq_domain_free_irqs_top,
 };
 
 static struct irq_domain *plic_irqdomain;
-- 
2.7.4

