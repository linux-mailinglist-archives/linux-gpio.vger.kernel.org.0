Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657F4230417
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 09:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgG1H2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 03:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgG1H2b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 03:28:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC05DC061794
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 00:28:30 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t6so7080676ljk.9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 00:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AZ65ABF9GRXpc6cSYiiHamCyWdfzzDVO2I2z4LBGsiQ=;
        b=DO3x8bu4PJ6sQzue54jzP6DVYYpREHRUQV+ey4rEM1BMtiGpYXR65u0cB3MNb0d0f+
         x/qzo1SZGSh21eHvcewWEa5ZnxvOg7XB4KSth/deIMNar5sJ9/dG1mVsTXQ7pvVmt04t
         SIMa0soXicEGMo25JlLXBLRwm5WETwHRB+yDwfADHg7rlcEVOoBQWAup7BXvfOtbXPCy
         Mp5xlBX9l+d+hbd5mp6uvEiwXo7lIg94AiLDSrYR86ho+sopKba+/ns57AOeCdqOflBB
         7ESBDsk4R0Tv0Gu+Z+a+YV68XUxPjoLI3xt9JTFcYTWzYzyGUlnTB1EJj4aJuyGVCiwN
         HgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AZ65ABF9GRXpc6cSYiiHamCyWdfzzDVO2I2z4LBGsiQ=;
        b=sOr2SpjWFQ3uDl4Toihej1AVjRQSSaYUJrnnNWLr5VHfd023rWKJ7NB31dncwH+Bqn
         uAgWPLIyKa8LWmX5kh1pzbmMf9yf8yaMMKLzMU4feVqkkJLeJRL/StsPkkhxBx5rTjvH
         7Feb09sU7OagPB6Z1AvErWn0/9yrrIUOfORgaiOYhY76J9QN0ENNBMUvH59G7MEQ7cUl
         MWO6klU18bnMgM686n9wK+VyOxWj/MEYygFRR4M+bC7NpPUopYGPvl9WZfTr4SQKFlmX
         JzP3ZA54/qce+YjQ4ePKB+16ynk61jQTV/Uy6g94YddgGAx1OLPpMUdDb/LMdJBMfXKi
         trKw==
X-Gm-Message-State: AOAM531Sh4regnyjlQfipWTKelHaowyWV538zHj1OOg8duzXyqP7T4/x
        j0Gc9geZaYmPhYwngBLc5Tss2/BVPRJNUsJ25K/UrQ==
X-Google-Smtp-Source: ABdhPJzB7AOGoUePISHrGYOMvRjpJtqCvYyuYtajzPRrmzVJ+BSu/WHx4JBBoR1U1JKxhQ7vwdvtW8t63+DSbtfcRKQ=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr12462714ljj.283.1595921309406;
 Tue, 28 Jul 2020 00:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200716100638.112451-1-linus.walleij@linaro.org> <20200727211331.npttctrjmkfhezhn@mobilestation>
In-Reply-To: <20200727211331.npttctrjmkfhezhn@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jul 2020 09:28:18 +0200
Message-ID: <CACRpkdaWGH4H5JnsmydMfvvEFzynU-wEdRWoxM2Ynv8KWPTDJQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: stmpe: Use irqchip template
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 11:13 PM Serge Semin <fancer.lancer@gmail.com> wrote:

> Hmm, the GPIO-irq-chip setting are initialized after the GPIO-chip has been
> registered by calling the gpiochip_add_data() method earlier in this method.
> That means the IRQ-chip won't be created by the GPIOlib, which will introduce a
> bug. In order to fix the problem it's better to move the whole "if (irq > 0)
> {...}" clause to be executed before the gpiochip_add_data() function invocation.
>
> Though I could misunderstood something...

Ah what a mistake, thank you so much for looking through this patch and
spotting this! I sent a fix.

Yours,
Linus Walleij
