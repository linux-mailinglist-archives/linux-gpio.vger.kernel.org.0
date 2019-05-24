Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A512927B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 10:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389296AbfEXIKY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 04:10:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43214 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389245AbfEXIKY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 04:10:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id z5so7831347lji.10
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RcI5nX0zsFocv6c9Dh5dsyELmuugz9pu4xszs0C7sEQ=;
        b=TuplLlJStenwIfjMi0SPcifzNyONWCjOAlzsqNaVJLUf0JuryBZSSfqTfFouJIuKzD
         0YC70wD3x8HwBrd+c6N7bKprIw/j7WEBdykVkNvZ5kfd1Q1dAik3xDID7CXPN47G5nKV
         2aBSa3fo6+2pNul3KMaZQtmWsojWbkfJ3TU7f/MQ26mY1/WEdKrxO0X3tLBuaN0kuqw1
         +YegxUN9DJ/Twi84rwuicS92wlXlg2Ir6jLEZ5BElnExtPPOot/MYLcJ94OvTDN/UACH
         l3GMGETArM3mdVdYN3y3YkrYU4j8JovLoxeuYk9/NgH+4yLCITdjm01+eKqcIJUoU543
         lETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RcI5nX0zsFocv6c9Dh5dsyELmuugz9pu4xszs0C7sEQ=;
        b=oq1jgs6B3akD2wSMUP/9L0RqvM3WIemb6MRVqW1Q/DtZ1rAgaZzhxSHOgoP9aDYrOu
         0ChzePLxIzqOJZqqwA/ZtLtLiGf5FjrJUaTfg/XVBCeRszbm3p0fzcoYVaXP3Ca5zHkX
         Z6ZVDlW2ZI/ltHTMDkmtVkOguyFnnI2lMd4oTmxGjtXnS2Vu5OAXbcjRbBd2C+qsXE/f
         38Op3Eel8LqtscgbJlIEgiqGInmVxuyf8MjFKBHiSL8W3R7mUlwerzxZf9ooS+KDHTqv
         ezyj8yf+iLWNJJA6y4iMWm2/aKZJ/UhvH5eguaNgIvjnVQHWzXRlrvbRovbabA1oKOdC
         UDSw==
X-Gm-Message-State: APjAAAX6rR0rkDQ0gCt53PfmTpgmdXmChEQIElTbJxj947cVFhDWegeG
        FgDs2dtXxBe/fGB0kJEPNZLdnKSe1EKo0GkfJQ1/RA==
X-Google-Smtp-Source: APXvYqwVNWAVXwkUBL7c8AEmHQLOpoFiD7Z4FJzo1VkNZyw8J0vlNLuTHQZ22OQHfGXFRXfI0eoS6GlJNewBVqn8NeY=
X-Received: by 2002:a2e:9cd1:: with SMTP id g17mr11514251ljj.191.1558685422051;
 Fri, 24 May 2019 01:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <1558683125-31882-1-git-send-email-amelie.delaunay@st.com>
In-Reply-To: <1558683125-31882-1-git-send-email-amelie.delaunay@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 10:10:10 +0200
Message-ID: <CACRpkdbRuveWT8huqpvo6vrSqyF2_g=xcHF+YjAs6AH4xcA65w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO
 is not defined
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 24, 2019 at 9:32 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
> not exist:
> drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
> drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
>      pctl->gpio_chip.of_node = np;
>
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
