Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2157307A91
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 17:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbhA1QUh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 11:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbhA1QU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 11:20:28 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B952AC061573;
        Thu, 28 Jan 2021 08:19:47 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o10so5452367wmc.1;
        Thu, 28 Jan 2021 08:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vnF/8n1joNx7ZvClg7mI0UIu1XccpzjX5uAACDp4lRU=;
        b=sdCAOEFG4JHJZBMrUHhd3c9eVxJBPDjMe5gk0ezOJGkbrh9swpDyW6VO6/PQkBkv1E
         KHeIEVwutZLuuBerq0xXP6x2QZRDRjuAW60a4OIe2ujBVbjteXwHu5ID3ssTf3oSSnWK
         YnGIwCeSZWK2E8lgl5hWCsb/RYgZ8R+RjnxDPzOxFuEr7Ib6rLXYrRI+rZtw3hGoOugl
         A8DVhpDp7kgyzKpVMP8dytOQchHBpAXWzqJX7P8IXgRFqqwxAhMJFiAZcsEcZicKtxpD
         obuzBMk2ddb4nL23a6eqdTDzsNBIJuvNR1fPBrhX/aG9v9KqFngONHq6WZTHD+I9Nawn
         5Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vnF/8n1joNx7ZvClg7mI0UIu1XccpzjX5uAACDp4lRU=;
        b=AFEXkukwO0GLn54zbAj6LH/MYgEdBsKGjzewdEXeHwlFN1gu4ZslpvuvXWTPeJsN2m
         RIhN76K9ckjTO6EgBrl5dsz24pmBh0WB8fjfBsNuqDTMH/xBU+owb3GIm3F9LwVWC0+A
         PyLtEFjocxF0cDZIwIn2vtN6NFG/J+3xfe1mt4F3ZF0e3j+Tzz/xY45EsSjwty9N1nuP
         DAaGvOLsMmWqF8pEiINBuaToEe37ZXliiQ7cgGghsplPpGllvCGI2e+Z1zZyyP0YZdnN
         8KhwW9zenjHo+2bjZBaKhD8SHWLa0POTVw9im0/eAEw8H/seW6WfZvB+sVb631UmhYMl
         F2Gg==
X-Gm-Message-State: AOAM531TwlWq/pp1STS6Bd6kJIkaSSaMi/B96tQ7I/dB9tNbe/mWyObG
        EvR6rKNQC5qhwiTiV/YOSVo=
X-Google-Smtp-Source: ABdhPJyO2/k4X024ZvXWDo1LFXX2pbu2yvZzgWV0d2SMNi8MpjCw0ZTODMvlwBsvDhgi/jEJoCLwkg==
X-Received: by 2002:a05:600c:154f:: with SMTP id f15mr48443wmg.46.1611850786555;
        Thu, 28 Jan 2021 08:19:46 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id i6sm7552163wrs.71.2021.01.28.08.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 08:19:45 -0800 (PST)
Message-ID: <a0c121fdfb2893ec89425534387212524e4ff7cf.camel@gmail.com>
Subject: Re: [PATCH v3 1/7] gpio: gpio-ep93xx: fix BUG_ON port F usage
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 28 Jan 2021 17:19:45 +0100
In-Reply-To: <CAHp75VfBb5+K9cSAzj9EBD+KtswkHSNMZWoCaU=bKvOO3fXRjw@mail.gmail.com>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
         <20210128122123.25341-2-nikita.shubin@maquefel.me>
         <CAHp75VfBb5+K9cSAzj9EBD+KtswkHSNMZWoCaU=bKvOO3fXRjw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita,

On Thu, 2021-01-28 at 18:11 +0200, Andy Shevchenko wrote:
> > +/*
> > + * F Port index in GPIOCHIP'S array is 5
> > + * but we use index 2 for stored values and offsets
> > + */
> > +#define EP93XX_GPIO_F_PORT_INDEX 5
> 
> Hmm... Why not to use an array with holes instead.
> 
> ...
> 
> > +       if (port == EP93XX_GPIO_F_PORT_INDEX)
> > +               port = 2;
> 
> Sorry, but I'm not in favour of this as it adds confusion.
> See above for the potential way to solve.

well, I was thinking the same yesterday. It just adds another
level on confusion into the code, which even the author got
wrong :)

Array with holes would be more obvious, but one can also embedd
the necessary values into struct ep93xx_gpio_bank.

-- 
Alexander Sverdlin.


