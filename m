Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F33299051
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782657AbgJZO7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:59:02 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55506 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782166AbgJZO7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:59:01 -0400
Received: by mail-pj1-f66.google.com with SMTP id c17so3386605pjo.5;
        Mon, 26 Oct 2020 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TLSHbhioE9cljVgZe+YM0q4q9fYDpBKMSDpW1tyko6g=;
        b=T/XqxigoRwx/4fumiWp/blg9ENJEJA0b3dw5kAs2d4W4iMcMibniB1RRucsFJGj7tw
         OpWabRWC6yFNS3tXGZ5zBHrEeKh6HyVAhfTzn1BVWnLdHHZSP/eZZOkvgivviwLuh3ST
         7kNgvnZ2OVEWQJLN7CLMi8fzphzDvAgArAz/eQHYi8yb+40dJBkVuP0eVWeUhIViKY97
         ToNOZwo9QrVBDz2kMEsk6HBaZqoyq1tCkS2TYM+i4bZvu73hXq5iDfLAgVMJhpsk1p6u
         AV3GaGGRqD6vBjXMtiYhILKJdE5OpRzlPLV/vCcIl6r0y2YF0r6DSVf2bXwYzc4WdjD1
         fGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TLSHbhioE9cljVgZe+YM0q4q9fYDpBKMSDpW1tyko6g=;
        b=IrbCN4uvUZKvX9OydElxZ45l/aSIs0oOSlTunaWrY7KPQgijgYrJYWdOyYhjeFHxi2
         ROI498yOsge6kVu9t4OxCB671O1VyHBE4FebeRK/hEbyZQuqwtBqzljBxUxr6fl4RcQF
         2hPIsAFTvVan1GsBAJSAdd0qYoVi6LLfgASzG+oGjvSNkAUoCjL57UkGb2h/EO7j01Dk
         aq+1nMVZMCD6oXXB7A/3DEMccZTINOxFmGPW3HrmdBWDuMMHH28b0+TS7KK3bEmjWFjs
         gTllT85oulE62gp4zJDNGupmetN7P365PJWkaLF15pj5ATHejLt3cZHs9TMnB1aaMHQW
         E00g==
X-Gm-Message-State: AOAM531V39g8wWB6LpuUPBwFMBYC21JfgHPP45eIVhl7gU58wKgCNHVg
        38wca33B48ZtTnqdYAgxz1twe15AFoULwmqdeAM=
X-Google-Smtp-Source: ABdhPJz94RWvg8Kqz2GBbjcM43P/Xx/59xLjVJj4ZfFn6r1htEcLnOImSK1rye2KodbQ/EzBq8C8lR9zh9lDwweleI4=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr9008317plt.17.1603724340873; Mon, 26 Oct
 2020 07:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <20201026141839.28536-7-brgl@bgdev.pl>
In-Reply-To: <20201026141839.28536-7-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 16:59:50 +0200
Message-ID: <CAHp75Vch3maRrBrpuzgAB5k2Kc-tO+SnVMUopb+_7U-UYPd2QA@mail.gmail.com>
Subject: Re: [RFT PATCH 6/7] gpio: exar: switch to using regmap
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 4:23 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We can simplify the code in gpio-exar by using regmap. This allows us to
> drop the mutex (regmap provides its own locking) and we can also reuse
> regmap's bit operations instead of implementing our own update function.

...

> +       if (value)
> +               regmap_set_bits(exar_gpio->regs, addr, BIT(bit));
> +       else
> +               regmap_clear_bits(exar_gpio->regs, addr, BIT(bit));

A side note: perhaps + regmap_assign_bits() ?

-- 
With Best Regards,
Andy Shevchenko
