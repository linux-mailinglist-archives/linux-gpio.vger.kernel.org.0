Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5669139DBD7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 13:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFGMBD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 08:01:03 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:37408 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGMBC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 08:01:02 -0400
Received: by mail-pf1-f180.google.com with SMTP id y15so12885909pfl.4;
        Mon, 07 Jun 2021 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xkWMYgreNs4FoJqpSjqW/hTbdY/R1Pbk1QYq7eymfWA=;
        b=Oqh+Ku4/AV3qvBUgClIWyUzJeaGXkXkmGeDC2fW27FUBL3lYEhkH99zj12DZtQziV9
         LsXstrZ105TdejRGo8EN07n9O9Mg3mp9+X97Zk2wobmjqQ0ysWzOsuPw2N67Sk3uHM82
         WUDF5Wqt/ozYFMii8ptV5Nl5cXHrp5gZzGm0H85zT/P8AwPkR8QMWycqkpd9wCR5J8Db
         5oyPM+82oOSVCul4/8PWY8RrQBQNp8lnH9NJ1asfAEDVwdK5cQtDrLX5bf11ABA1ouIy
         S0ibywqrI1ICrTMIFTyL+3MWyNUomC4nOXTI9EmVvj1RLMdjy6pG0fRfEUZZZV8moPu9
         8uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xkWMYgreNs4FoJqpSjqW/hTbdY/R1Pbk1QYq7eymfWA=;
        b=eSzWTqI+hqGA4Y6jeQQ75PZfvGIGoPErYGESxr9UWWRwoqrnZ+GXgohqKuSzwQ+t82
         N2FTcE61e5wfNuEASyvLS0nhdxTO7raTIgn7nlM0gTxysLLtQg7NE8c1WKfWpRuAtz3B
         tre+8QdDky6vAL6OSd218gm+vbb9a2JtRX+qUFEvOfhyhhnHmM/2DSQ2O6ASlPs/Hb0G
         TI1IIs1SeHHcw/2yinYfIVFlsNg5T8AIhm1Edg8rSGSJOpEuLgJjgFoMYXgWnkjDPO+T
         BldOh6PLNL9Q962IQPT72MempoKdbYgXAU4FHjgaoVI6OeTwrwGzaQ7cBxghqkPQ8qft
         pDYg==
X-Gm-Message-State: AOAM533zdeWdADvVuhTG+ddrENPRx22WxSJulh67sP+l/nSPdCoylizg
        u5UY++3JwIyNFlA9mUBASMC0HqwRdEEaEU286PZu8nR66VM=
X-Google-Smtp-Source: ABdhPJxBoHk1eWAy7Bm/ZDKhdzjoD0dMSMjIZvJM+vliwkEJxvZ1gu5g/w8Nf6rNzmvEJ8m7ufjYrUHWS8wEnFcxs2Q=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr17416326pgc.203.1623067081386;
 Mon, 07 Jun 2021 04:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210606225037.26130-1-chrisrblake93@gmail.com>
In-Reply-To: <20210606225037.26130-1-chrisrblake93@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Jun 2021 14:57:45 +0300
Message-ID: <CAHp75VchKgVwxKq5OP=LrLaDhg-_rpwYnYz2Op9PQm4+N9Tn7g@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: lpc_ich: Enable GPIO driver for DH89xxCC
To:     Chris Blake <chrisrblake93@gmail.com>
Cc:     ptyser@xes-inc.com, Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 7, 2021 at 1:52 AM Chris Blake <chrisrblake93@gmail.com> wrote:
>
> Based on the Intel Datasheet for the DH89xxCC PCH, the GPIO driver
> is the same as ICH_v5_GPIO, minus the fact the DH89xxCC also has
> blink support. However, blink support isn't supported by the GPIO
> driver so we should use ICH_v5_GPIO. Tested and working on a Meraki
> MX100-HW.

Thanks for your contribution!

> V2: Updated commit message, and added Christian Lamparter as a
> contributor.

First of all, changelog is placed after the cutter '---' line below.

> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Second, please utilize the Co-developed-by tag.

> ---

(changelog)

>  drivers/mfd/lpc_ich.c | 1 +
>  1 file changed, 1 insertion(+)

-- 
With Best Regards,
Andy Shevchenko
