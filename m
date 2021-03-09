Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0765332A7C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhCIPcY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhCIPbw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 10:31:52 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14081C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 07:31:52 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id v9so27756373lfa.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 07:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ytPSd3A3o1b3+2MlI23BkWVwBk2Qohz+v6T0uxCz9RU=;
        b=ZsDiIRRw+LQemQRHuo0zPr0x7lYYY1RnmWzkwLTDWTgoiy/WPSeXg/JaqaTrpgMG3q
         ikEXZC1G7CHl5BS1bfjXkICij2hiQ6WpSSM+Metl62wF5PagNLwgLpOJJ0GyWXw+7Mq0
         yZGh8DBCJF4pOgqHWr5Fwp+ga3e5eloGHFvzTJjeok0tMOwbfseR1tixEGwIuy/E2mEO
         REWCX0BsJOOBHq5W1AlXu+5NKi0y/LPYDmdZ4KJZ4sYnjc9oO3tmpALL7C4AQpar3ng8
         5dVI2dneZPzIGcGroTAYeGXc8nPkUdXN4CCe30O7y30/+9hokigEsxJTr7Vkhw7VftM8
         RYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ytPSd3A3o1b3+2MlI23BkWVwBk2Qohz+v6T0uxCz9RU=;
        b=sgH7bO9tDcPTyoVFF3gkpVim9WP4qynYl1EMNp5qY6Ag17mp31ZyLaF4rO6RMf0eSX
         +KOAqBSolAbwqBrh3WAmlrNU0SFLtpRZriPjDgMlp88LAc2zSYbEBFU28qQ6fDSNdsZl
         9oKtTUnQ/xXG76Lek7Ev6P2RNn+HSt3a14QiUhptaH66CdMgoMOtwdvZhAlLjhs2ZLmh
         xXLxkrK+VPokrqC0+hiqWOQBm6TGWzaee4SHle2TmdVNRvluRjIr8V7Gxugt61xH7DDj
         +i2UgOjX+RaWsXtSHBiATOQ4MLMd+u+vMpi8Tj+6UYhl9UPYNdRqrStvdJNqi0mvv9FR
         jAFw==
X-Gm-Message-State: AOAM531d4lKtoDBV+8QlC/pVjckfZjiWwhrla0XKka9qRWUtWzHrhRuY
        kaQRedt1ak89YTHg4Bo7tgqoz6HB4iLxKn+1PyUzCg==
X-Google-Smtp-Source: ABdhPJw06MbLp34uxhYaAr5Kj9oirKrQg5zi5+BhFUpssWilBUXjFuULwcGEpI0qogMy5JAEwzC+K56ofZWkxv+pUqE=
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr17314789lfg.649.1615303910617;
 Tue, 09 Mar 2021 07:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20210309093736.67925-1-andriy.shevchenko@linux.intel.com> <20210309093736.67925-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210309093736.67925-7-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 16:31:39 +0100
Message-ID: <CACRpkdZaFv7c-mdxF+0T7ceU7ucjtE9-70nBune1iNj54moHXw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] gpiolib: Fold conditionals into a simple ternary operator
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 10:37 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It's quite spread code to initialize IRQ domain options.
> Let's fold it into a simple oneliner.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Definitely due to my coding style. (Not so fond of the ternary operator.)
Allright, it is so much more compact.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
