Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDF541BB49
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 01:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243444AbhI1X6i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 19:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243397AbhI1X6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 19:58:36 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3172BC061755
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:56:56 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id ez4-20020ad45904000000b0038277ac82beso2497565qvb.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FyJ369ORhnTpgfvJUNNRTX2KSF/fWPdPTlu0VC0PyLM=;
        b=PaaG/yNgQ5UlgBkmQMFEj8x5onJx3t43YX9/gnMIOkLb7hb/2GHCo2NiDGbztXWhU5
         PfEZ+2dEaedybg8p1NuLLUGjjBsUjMjmQidENXeBsYaPdIxgl4NREIsuMiQ5ujBcKhAy
         e3DQhc8vYrDPZly86xqtzuaQ5jsETHOFRYEiQrMZ1HNZUgJNbiuZHQJMpQ8t2ZcBuo/s
         RhQ9Gm/FUQ99OUT1SsozOGpD2/jCyDK8nVab+7l8+wMDHLWJWlCwdiYntY8vl9o2VXJx
         DZabR5owhv031c4fsluZeHJvOXU7TyaOq7ESATZPsUeXaJjSQ9R/JHeWwVvRCNv3wiKk
         LLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FyJ369ORhnTpgfvJUNNRTX2KSF/fWPdPTlu0VC0PyLM=;
        b=GHZ5LGpPM67N0PCTnLOdgq1nwGOFW27Jp7G9FY7+LZ1PxmScmpydUKpYjzlkzb14+z
         mUhVY7XFKcAo6PCgGA0kzt3a3BXF689LQp1uxLVN6T4bbsfetjag/ZosLQ7odzU9uALW
         r5FozBvlQuZEhDo5gd9OmtAnnE4zsytNWjacH7dBcEL0vl7DaWwetVM+1yYn52ZbzR8A
         ObykWu2Lo5Klr2oTAabZfx5SjfvS0oTy4T8mFQoPXegIeywRiMVVVJiYiZbBKKZdri55
         AvVn0nrgvbq0Wpde3HteHl+c+Nz01M0b9lncoN6Y8tRWUQihXeqVfqTL714VJqWfhbDD
         w8tw==
X-Gm-Message-State: AOAM531j77c4kDnNVMPLRlO0u18eHZTT/AXqt0/76n+bluNMyR9kcNKK
        rRdPwFVfFv+jx2TbNTm8SgOPtxcxFSrZlnv0G+A=
X-Google-Smtp-Source: ABdhPJzXdWyTY8J1BvgzEXbunMmQb+HgazP0ODFQ/qBWC8/QD6yR11ln+gAIGqxBn3FgWiikx/7A/5W0r9/iRUFdbdE=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:ad4:476a:: with SMTP id
 d10mr8228907qvx.59.1632873415332; Tue, 28 Sep 2021 16:56:55 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:19 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-3-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 02/12] timekeeping: add API for getting timekeeping_suspended
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This allows modules to access the value of timekeeping_suspended without
giving them write access to the variable.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 include/linux/timekeeping.h |  1 +
 kernel/time/timekeeping.c   | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
index 78a98bdff76d..cdc84421d77b 100644
--- a/include/linux/timekeeping.h
+++ b/include/linux/timekeeping.h
@@ -8,6 +8,7 @@
 /* Included from linux/ktime.h */
 
 void timekeeping_init(void);
+extern bool timekeeping_is_suspended(void);
 extern int timekeeping_suspended;
 
 /* Architecture timer tick functions: */
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index b348749a9fc6..27873c052e57 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -57,6 +57,17 @@ static struct timekeeper shadow_timekeeper;
 /* flag for if timekeeping is suspended */
 int __read_mostly timekeeping_suspended;
 
+/**
+ * timekeeping_is_suspended - query for timekeeping_suspended
+ *
+ * Returns the true/false based on the value of timekeeping_suspened.
+ */
+bool timekeeping_is_suspended(void)
+{
+	return timekeeping_suspended ? true : false;
+}
+EXPORT_SYMBOL_GPL(timekeeping_is_suspended);
+
 /**
  * struct tk_fast - NMI safe timekeeper
  * @seq:	Sequence counter for protecting updates. The lowest bit
-- 
2.33.0.685.g46640cef36-goog

