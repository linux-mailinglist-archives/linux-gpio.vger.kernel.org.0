Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E8A440EA8
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Oct 2021 14:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhJaN2G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 09:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJaN2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 09:28:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA5AC061570
        for <linux-gpio@vger.kernel.org>; Sun, 31 Oct 2021 06:25:34 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c28so31048844lfv.13
        for <linux-gpio@vger.kernel.org>; Sun, 31 Oct 2021 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RHLzzgJYzP2mhb/hKup/pFLdCAVZKM8EKLp5ChLweAQ=;
        b=cAWbr6RydbcHzRzLN2DfbEmJqnV/D+DrirKthJdZKiAmlH109FG//x4w/PMZgp6C/q
         Yydrgrw7OGoRHZZwE4nMJMcrAMiOiC+hReYqs2jDUqDfxlR1dELHryjVyJA4kr55+TX0
         +BHgttTryLSWgWQxgZwJKxG104CMhMVnKRl/MxRlziEOBYvj93dLKceAHHWYBA7NMY2m
         YyvPK2R+Mqk0OOgYDrcLzB9j7c/Q+n9Os2zx6Si0UX05pGKMs7qs06fCs5fUkSZNLJwe
         9NzrehlNqnAIwJf3CWGdNw7G73atyGwwpLfjC1lI26JvIccPhXwEZ1fXuvSfzDqzfAsy
         +KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RHLzzgJYzP2mhb/hKup/pFLdCAVZKM8EKLp5ChLweAQ=;
        b=uEO7SW1fw+T+Rxjl7ppdStdXQif98sO3PW4VoLS94U9PJgF6lAuKlp0zDianXSUAti
         06wHC8QIoXFPkHGHkI1LYUsCTA8e1gWIV/V+4uvn5rgM2xeIgq0K2AT26aOieGprFAdv
         Fpqx/1dOLEu+x36UAUHAWGTZ5WvW8KBevDBj1ka1Eissc4/ZwpRctF9IhPnCM/3TQSJf
         A5uB9x2LyA7rAuWvNnRtr+npp7ipxdyb/f0WipoDIhHoNgVfOXrk5Jqvu6GVRw5Fo0/a
         1EJCszSvzqsWnHQWWUfdyGGx6/82L4SCqP5Q6IJMIzs56QEgp6VXpM7XXDXNof39Yx/5
         uzLA==
X-Gm-Message-State: AOAM533yDfaXu8MHn1f5Hyyc4gLam2kKAIiWNPvFtz4O7CLnl7ItGcJv
        D9sH1EmRsqvUYMenmKh3EIjoZczCtCJbfXlMPEX1uFcF4zX5Ng==
X-Google-Smtp-Source: ABdhPJzo4Yk0FZkTkusHsRUwEeSiAKj3UcMsSSxhi1r2q7FjQ+qTJpwXr3N2x0U6zSK4xMNv04Z3eqFtRtiLQbDaxsQ=
X-Received: by 2002:a05:6512:acd:: with SMTP id n13mr21823017lfu.60.1635686732670;
 Sun, 31 Oct 2021 06:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211014123342.174711-1-jonas.gorski@gmail.com>
In-Reply-To: <20211014123342.174711-1-jonas.gorski@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 31 Oct 2021 15:24:56 +0200
Message-ID: <CAHp75VeTU-+rLnuVoKqh2yc8t3Wt0MsePs0yASjRKx50E0MfLA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: fix parsing of ngpios property
To:     Jonas Gorski <jonas.gorski@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 14, 2021 at 3:48 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
>
> of_property_read_u32 returns 0 on success, not true, so we need to
> invert the check to actually take over the provided ngpio value.

> -       if (of_property_read_u32(dn, "ngpios", &num_gpios))
> +       if (!of_property_read_u32(dn, "ngpios", &num_gpios))
>                 chip->gc.ngpio = num_gpios;

Just a side note: I'm wondering how many of such we have in the
drivers and why we can't simply do it under the OF GPIO library's hood
for everybody.

-- 
With Best Regards,
Andy Shevchenko
