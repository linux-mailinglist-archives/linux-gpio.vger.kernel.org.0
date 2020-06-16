Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A891FA897
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 08:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgFPGNq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 02:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbgFPGNp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 02:13:45 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1B7C03E96A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:43 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh7so7910316plb.11
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h4JqKpoTJwOLVa4Di6JSd/Ph+43PAaMLhE3KrwrB/cQ=;
        b=aIIoFqiwCuM3dby19TgymneGR+eeoT1Wxy2TPpRkJqUdrynkdRP8+CNDZi8knMQXSA
         f6Bnkylgm0SyUXod2iE5akD5Gq/nK9BJ96sFopeuj+cDyIrPembwe8QM5m9mgdTOvT/p
         95P3wC7lRmPEoi2hm5fpeVSFDjBKYxmhYTmzVw3juKPimfKhaq0XCfwXn9MoK/NPKS8v
         fgds0I21HWcIzLuqkAxiS2DAXTEESOnA37rEYOfIy2DG1XAnGRh/eAXCdqoPN1mDr2EJ
         gAtL26MemRtwwpZCy39jr2cpC4DNJ+Q5ORFGwo52pyKJV0BZ9VXCJSBmyLvzLfGUCnLK
         4aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h4JqKpoTJwOLVa4Di6JSd/Ph+43PAaMLhE3KrwrB/cQ=;
        b=O1WSqaecZvC+rwU9DnH0ORo/GtScgBD7IzkGKspjB+FZ7w70U5XIvonlkdkc1StciN
         PHPB4Vc+JOEztkE6gaWZ7AjEGaCnNuwpk0lckCfapb3BC1JQoT4PtFIrCJ+O3OcsdvLl
         WmCKjMPOV8sM17CjWFS3pIFJIeI8UhnBTfeG3OnkB33dl9iTdzI4ijAiizclmloj/+Je
         AqeCfmEwKSApCOzCCAN6jm6O/S1msDdTNk531FwWA7WK2N+qFMvv7BQSlFD3fW+p1bso
         bkWL7tvUwQidCVk9hR+DxtP2q7XFPyFnOumF+EOTFh6VrWZ/9lqaF/EQ6+JVphelLNSS
         IHwA==
X-Gm-Message-State: AOAM531bSgXFM9Mws/BKIqFD4yguDCcQY7QeFDSFLEMbXqgn4B32w3Vz
        jVZMuMXUnIjPRmj1m0N+QPsixA==
X-Google-Smtp-Source: ABdhPJwzygD/WHkWLyQJ6iGsnCwTqfRIFtsc++PcBZQkjKRMfUmeu8vpzS8kFNaT35Xwy6HpTPU4IQ==
X-Received: by 2002:a17:90b:46ca:: with SMTP id jx10mr1362107pjb.3.1592288023527;
        Mon, 15 Jun 2020 23:13:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id i26sm15642032pfo.0.2020.06.15.23.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 23:13:43 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [RFC][PATCH 1/5] irq: irqdomain: Export irq_domain_update_bus_token
Date:   Tue, 16 Jun 2020 06:13:34 +0000
Message-Id: <20200616061338.109499-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616061338.109499-1-john.stultz@linaro.org>
References: <20200616061338.109499-1-john.stultz@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add export for irq_domain_update_bus_token() so that
we can allow drivers like the qcom-pdc driver to be
loadable as a module.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 kernel/irq/irqdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index a4c2c915511d..ca974d965fda 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -281,6 +281,7 @@ void irq_domain_update_bus_token(struct irq_domain *domain,
 
 	mutex_unlock(&irq_domain_mutex);
 }
+EXPORT_SYMBOL_GPL(irq_domain_update_bus_token);
 
 /**
  * irq_domain_add_simple() - Register an irq_domain and optionally map a range of irqs
-- 
2.17.1

