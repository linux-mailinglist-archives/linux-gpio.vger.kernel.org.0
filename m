Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8514E1FA89E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 08:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgFPGNr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 02:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbgFPGNq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 02:13:46 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064C8C03E97C
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:45 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g12so7910852pll.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d8HNtFjVL/HPLva77WTnFKUW0Kvfs2vTc0BrF81DdWI=;
        b=v8pnncAeJ6EXVXBVIROBwY85MaUJaS+3cYpbNNYYzPLk/7pselZhTcoIxYzjCeyVv8
         z7rLz6dynrZeFhSyjXXuzxJss8D71TgLPxY1wSvVrGHHBe36mvLVuJbyV7oeqmPxZPF4
         3bBf2ru+qoskK42o6IV1MKU7khzwkAlxUiF86aroPb9CUN8SmEpvlRuPhbKl/aZW/n7x
         AWmFqLqQFiPnl3Li0QE+BVRXmEQzG3QuSiiUUYtPhE0RXGhRnX5RUcHPWqrprYghVulQ
         elANL0qhyySKvw/JSPWezE64h1v8gJgRUsY4bf8AXuO5qPZruWEfPRgNNcA9UaNhTmde
         rX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d8HNtFjVL/HPLva77WTnFKUW0Kvfs2vTc0BrF81DdWI=;
        b=pW1Xg2AM4jfCmXiLQ2hNbKNsG1BkUuQgzQ1+NTD/fO5R6Y9dGnFSg/NsVwWnCm1EF4
         4cdByAoZ83EsSaPXH4nGY6mpnVUMw2pWIQa8qVJKYPU8I1apETvMeq+L+97u6lDI3Yml
         Suj4kDqflF5nNDoFmzPfaRsL9MnnVFm0AXmPDUfAJAba0rxr5vc4DLlHEavDnIhxL9eM
         MKwGHGKmhPsdKOUfEKOiWW/8WYPiElLNM6Pm2/fkvHFalh04QLghWwYkfBYpgtgxXdL4
         YnDp5bH7Duv/niexXG0CMs4fI6zbJAmWbTI2jWbtesgx7EoQcfh8tQpUzXmbpzZglInU
         LQ8w==
X-Gm-Message-State: AOAM5314KEfcg9hlKzBbftklz8Xy2MmpYt+0KjWRCrcdK+Z59RTDBDnx
        +DVqEv5HPHhuPv7ERr78N5H0Lw==
X-Google-Smtp-Source: ABdhPJxCaVz3G+/geS1NzlugB57rAw/I7PZ2XURXxDE8DMjhkDv5DK9XyvrD63NMIlJN57XPvBQpCw==
X-Received: by 2002:a17:90a:220f:: with SMTP id c15mr1308713pje.129.1592288024596;
        Mon, 15 Jun 2020 23:13:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id i26sm15642032pfo.0.2020.06.15.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 23:13:44 -0700 (PDT)
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
Subject: [RFC][PATCH 2/5] irq: irqchip: Export irq_chip_retrigger_hierarchy and irq_chip_set_vcpu_affinity_parent
Date:   Tue, 16 Jun 2020 06:13:35 +0000
Message-Id: <20200616061338.109499-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616061338.109499-1-john.stultz@linaro.org>
References: <20200616061338.109499-1-john.stultz@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add EXPORT_SYMBOL_GPL entries for irq_chip_retrigger_hierarchy()
and irq_chip_set_vcpu_affinity_parent() so that we can allow
drivers like the qcom-pdc driver to be loadable as a module.

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
 kernel/irq/chip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 41e7e37a0928..ba6ce66d7ed6 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1478,6 +1478,7 @@ int irq_chip_retrigger_hierarchy(struct irq_data *data)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(irq_chip_retrigger_hierarchy);
 
 /**
  * irq_chip_set_vcpu_affinity_parent - Set vcpu affinity on the parent interrupt
@@ -1492,7 +1493,7 @@ int irq_chip_set_vcpu_affinity_parent(struct irq_data *data, void *vcpu_info)
 
 	return -ENOSYS;
 }
-
+EXPORT_SYMBOL_GPL(irq_chip_set_vcpu_affinity_parent);
 /**
  * irq_chip_set_wake_parent - Set/reset wake-up on the parent interrupt
  * @data:	Pointer to interrupt specific data
-- 
2.17.1

