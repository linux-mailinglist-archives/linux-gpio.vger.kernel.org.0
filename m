Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56D61185EF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 12:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfLJLMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 06:12:32 -0500
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com ([40.107.93.40]:6238
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727039AbfLJLMb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 06:12:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+2opCtANSoc8kprSFZ533LKIgBcmC1VBoBF0QNuKjF2HvA6VRfpPpjLwOVZZ57bxw2rVZNsFNSZXPCTQJGWGnjEO/OJHdLCp0FskTJ7A/Sz3xKl0zsGMIQGnmFMSax5gqftJUp+tBkM25B5XuxMGxZQpyby8NyTzArQ7vE9ACd2esNmghJEUxZb2q5vSJeNhfvo0KUhQ4g7TkexXXkY+GwMBMX+z7JtQimXz3fvw2kHekISDV3pNi6vhPgW2bs5ElGi13dAy55sRsQNNKq88LmjnuKO+Vw9raVYeb/cxoKZRXrGUx/VaNOnYOlkMtlrplzzvvCIaM2z+wp+4+Nnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hn6YCoYCYA7GW3tXGIgknALyVvFhDXEMfvZIbFjHj5k=;
 b=nYIZXa+oQczylW8F8xK7O1V0TF0LdayGdcbJspQSATyQVsOqz1i43X33d0CAfSSAUk+2SecyLuU+NwvZTlpv3qy4yuOZ2vRUXZAO3T8yFzaTXcesq7EKm3n4/6FWPoJfcGdgr+aMweoeJxYGqFAvPXC1Dpt5WdQsqDiU58w3lQZBYYQdzp2ZlC4M8eMOBRj2ca5MWDUMm4to4p4qXID5t/6L0wTw5Q875rYjOSW9ZwMTWPgp9lhWznquRX7bcefMm/1MM0D+kpZ9yw3MFgTzRJWLlANTCtGZgFHQAMfTAWpzIIeHFGz4kUZeLuS/FBIQNFhG9iE90ELSJZgCB3HXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hn6YCoYCYA7GW3tXGIgknALyVvFhDXEMfvZIbFjHj5k=;
 b=F/5oyS0bTN9YU6LEiQ4KL5dq4cvaWwJW8jREl9MVpnHDuFknHRRzVZLvGxbQl6IvBm6lBBRR0ZRQ79xikKAf51kEH27ghDVONNWjw48cWiLqoZsU9OJK+uxpp6rWU4mCd+N5Md9kgpWQpG/kEz5rK22wr5XSiroClJCLIcc0kDM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3656.namprd13.prod.outlook.com (20.180.4.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Tue, 10 Dec 2019 11:11:51 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 11:11:51 +0000
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
Subject: [PATCH v4 2/6] irqchip: nvic: Use irq_domain_translate_onecell instead of custom func
Date:   Tue, 10 Dec 2019 16:41:10 +0530
Message-Id: <1575976274-13487-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-ClientProxiedBy: PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::14) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
MIME-Version: 1.0
Received: from dhananjayk-PowerEdge-R620.open-silicon.com (114.143.65.226) by PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Tue, 10 Dec 2019 11:11:45 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [114.143.65.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd1308c9-7003-4a3d-bb5d-08d77d61c171
X-MS-TrafficTypeDiagnostic: CH2PR13MB3656:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3656D1D7C7E3EC25111825E88C5B0@CH2PR13MB3656.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(396003)(39850400004)(366004)(136003)(346002)(376002)(199004)(189003)(36756003)(66476007)(1006002)(107886003)(52116002)(6666004)(66946007)(6506007)(26005)(956004)(316002)(2616005)(81166006)(8936002)(81156014)(16526019)(186003)(8676002)(44832011)(6636002)(5660300002)(86362001)(6486002)(7416002)(66556008)(6512007)(4326008)(478600001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3656;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gn0Pg3+5miRH+oWVWcR/qUVKxqPoWyuEKqdpcyAoHmbxOH70emsTd3MB3DHbdID9kQ9sBcUbM3yC04uVyVQYj8q0Y4ab+hiohhYE13PrSiyqFiZJkXvq3rVZRgeXyzWcGya0Twwb01z5jOZ+qAopZ4sdV9ocYOaWbriGfTRn4BzyyXEjqiKbyugCThpATNAzPKhEhcaD0Wwct7iCXqGtxo4JZOKTullznv3Qa0bRqnyYazLw0vyOn/vqG4WgiHIjVyMNurjuXodZaFVGawdvZjtweKu2ar8PTTM46WSAySVpTGQQmLKz3Y5ck7mO45kJ4UWaBwu2MebIge4/x+K4HRmtzZQ+8cDvTVdhmmCIv4IGWCE7bc3gZurVhbVEiQPBu60ju7UhM7ief+m9qG/B7XJVbmw4BpwfgT/pBMH6HoIQO7fp+C85QCk7k5h+ZYj7
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1308c9-7003-4a3d-bb5d-08d77d61c171
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 11:11:50.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 795WsnLWmXViWasT+OpUm88sRKYQ/WAeh630NBEbifHp/teK3ub5GE0+bpjK33nmthY+NJjExCMyb35vgMIvJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3656
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of newly introduced irq_domain_translate_onecell() instead of
custom made function.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/irqchip/irq-nvic.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index a166d30..f747e22 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -45,17 +45,6 @@ nvic_handle_irq(irq_hw_number_t hwirq, struct pt_regs *regs)
 	handle_IRQ(irq, regs);
 }
 
-static int nvic_irq_domain_translate(struct irq_domain *d,
-				     struct irq_fwspec *fwspec,
-				     unsigned long *hwirq, unsigned int *type)
-{
-	if (WARN_ON(fwspec->param_count < 1))
-		return -EINVAL;
-	*hwirq = fwspec->param[0];
-	*type = IRQ_TYPE_NONE;
-	return 0;
-}
-
 static int nvic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				unsigned int nr_irqs, void *arg)
 {
@@ -64,7 +53,7 @@ static int nvic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	unsigned int type = IRQ_TYPE_NONE;
 	struct irq_fwspec *fwspec = arg;
 
-	ret = nvic_irq_domain_translate(domain, fwspec, &hwirq, &type);
+	ret = irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
 	if (ret)
 		return ret;
 
@@ -75,7 +64,7 @@ static int nvic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 }
 
 static const struct irq_domain_ops nvic_irq_domain_ops = {
-	.translate = nvic_irq_domain_translate,
+	.translate = irq_domain_translate_onecell,
 	.alloc = nvic_irq_domain_alloc,
 	.free = irq_domain_free_irqs_top,
 };
-- 
2.7.4

