Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6576B1AC0DB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 14:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635165AbgDPMO0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 08:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635002AbgDPMOX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 08:14:23 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6D7C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 05:14:22 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x23so5419904lfq.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G6CEhETcd8usRI8VLfU+in8KCWPWepKIKRPbtnfPNv0=;
        b=IUAmD6aOdJLDttSTki6d2dDIHOgxr10eQCs8FE7f1lmn5Lrh6x8eqGBIkPRvMOqfrB
         7z5ZIlx4WcWBe0zujsas9ii6ojq9vNkV+E99E0v4QWTN5Q5a2AeEZ9jf6IDKzX19lCJ8
         gZzkc5+FzgVsKrDrHrvzgtsoMlWbFVhi/ne+2NUyHfKCZ+l9JDFiCOEU3wMRlWXJwMm+
         sVNf3VVd88aa5SCesUr4yuH05zt3rAGnN/TQ5BmvLgZbPlF1S1a3HwOax/mj4sqc0xhw
         CHrEtozUZ7ZZlpCz5FGkYhWba042iuTqB89df+bg/gIcO7bTGolt5az3MtrzvnU283vk
         m6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G6CEhETcd8usRI8VLfU+in8KCWPWepKIKRPbtnfPNv0=;
        b=g348MoEvY7eq65wuKFFaZmdfbcwbi/PYFKOYXjnrSKiwAes1EfpFq+fEUGJLsjyoaC
         X9fAo9+YD66Jffz/C5NfrdJJ0w7qwEr8E+b+ME4W79J2OoJyTOjrdVd8Iq8nkDLIjPPf
         1cFVfJ+rFTJr9iE5MdzP086OMMybBAE5XIiKpZi2uQIBn8SqLyCLpIjxPAxLoD1aboOQ
         9AiCGlGtdvzkRJL17wn1jkHTzbavIloPBJoBP+lDM/1oL1D4Vx42pU2pWYKZQAbk6G35
         BqdBKCZSoiKONX4NBx4LF0/P2bXVyAEgglzJL/DfJ3qGpGsmBErxoonc2TVBveGKjtuu
         z8Cw==
X-Gm-Message-State: AGi0PubrGxqyhMc/W51cYx//G9JAdQzBDLZJGRq2nfqJAJuO7yOy+IaF
        estqSWl+w+qUcYVvDXyzhJ04kwlsQnR3x4Ii0JG8ixFx
X-Google-Smtp-Source: APiQypK+xo6JoQWd2uVKJ6Gg1JINVkMUL70O6N50rNMEHprfhOyNYNDD1uhGLY6a1eRtdZkDXpXkcfAf133KyZA5JkU=
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr5739857lfc.217.1587039261356;
 Thu, 16 Apr 2020 05:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
 <20200415171516.cugbzhvjua6cygnq@mobilestation> <20200416105614.GZ185537@smile.fi.intel.com>
 <20200416110613.4yyrlcle4oiy46a7@mobilestation>
In-Reply-To: <20200416110613.4yyrlcle4oiy46a7@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 14:14:10 +0200
Message-ID: <CACRpkdacW7_Q7YW1WOazLaP_HKBbNKev3caJyKSNMBbXp7j1Zw@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] gpio: dwapb: Amend indentation in some cases
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 1:06 PM Serge Semin <fancer.lancer@gmail.com> wrote:

> Ah, Linus already pulled the series in. Next time then.)

Yeah sorry, I was a bit stressed by a big mail backlog and also a bit
infatuated with my new b4 tool.

Is it fine to fix any remaining issues with extra patches?

Yours,
Linus Walleij
