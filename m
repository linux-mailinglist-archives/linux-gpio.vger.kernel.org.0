Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D2E2A2894
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 11:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgKBK5t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 05:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgKBK5t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 05:57:49 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAECC0617A6;
        Mon,  2 Nov 2020 02:57:47 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id b3so10808056pfo.2;
        Mon, 02 Nov 2020 02:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O5Ngz5hzNc85BqmbB6OWKGFTJb0A/tXXjeqyQrAVgLY=;
        b=TYWIWBFgnXJvpmb/1nKkKAqAm5inoJds6DQvm/YYANNVo62D52SgKUZatxw33JKwuy
         cypQiofSgks3Qz97U5YFUKaekYQivi1XC848ZQKI6JajYpnBHBSipqIPdQTqfMfyoX5K
         MaaEfER6qLdyts5ktkewBdq9ruI3Ar+5xCHAC/+V/hLByC6aT3WoJpQDL5yv7yaJ60sa
         UTwHw76MuIFBbL/YGUaz/n/GiftSyB3FhNiYbLRQObmN7vRJOAfMd4k6ZjZXd17f5st/
         PWpvtX15dhIe38DxJyCiBoirpwjEBF0qDg651pqlSktwVGdDWXxkjG0n2sLS1IXONb2/
         JfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O5Ngz5hzNc85BqmbB6OWKGFTJb0A/tXXjeqyQrAVgLY=;
        b=F83KYe37VJdmv4s5yCCy6U2TEcBXDYaS5gbF0Mkdk1LclUy9d+F1uUNCvMZQf/o/S3
         zmg1EuKWURT8Zg+oASvPZ32uLhu3ie5WIm3tyWCuy8ZCi9XEaiFxxMPxntJ7kRr/lTsX
         xdufqclmm1MyY8/nSjy/LFCnId18BFyDP6YlhJv2lTJAo6nN9mIJ4GWNf4o7Qz1J6hEz
         tzF2YjnZ0wvzIb1BbhkXMg9JQSqAnTr2ZFWJxAGZiZbXsfUd6H+zU/E0gUDk/SaALWeZ
         SHvsufEwScovb94Zx1W8MeDpOx6VRtpP2HOVcZGt+HMkY4ww8qLHSqJvAgvLSI4CKrja
         hFJw==
X-Gm-Message-State: AOAM533nGX25Be+AttFAQIMQ+EBNQMjaou9z4KbHB6lws8uJeQubv+6I
        dabKzYlAjxub9KyfU2YkhZHlX7i6tmWPFCcyADk=
X-Google-Smtp-Source: ABdhPJyt6hLxBnJd3gzN+EOmIDhkeIQ5RMrREj7qU9SiTwy9omSTWY1Vu/33LDt42Z53oyqGhKMJDx9V2yhu/9RjD18=
X-Received: by 2002:a63:31ce:: with SMTP id x197mr969773pgx.74.1604314667279;
 Mon, 02 Nov 2020 02:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <20201026141839.28536-6-brgl@bgdev.pl>
In-Reply-To: <20201026141839.28536-6-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 2 Nov 2020 12:58:36 +0200
Message-ID: <CAHp75VfNy4j73nFd2nGSsuGdn0Yat_ENGaaARP_8R9CQKHnnZg@mail.gmail.com>
Subject: Re: [RFT PATCH 5/7] gpio: exar: unduplicate address and offset computation
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

...

> +static unsigned int
> +exar_offset_to_sel_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
> +{
> +       return (offset + exar_gpio->first_pin) / 8 ? EXAR_OFFSET_MPIOSEL_HI
> +                                                  : EXAR_OFFSET_MPIOSEL_LO;
> +}
> +
> +static unsigned int
> +exar_offset_to_lvl_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
> +{
> +       return (offset + exar_gpio->first_pin) / 8 ? EXAR_OFFSET_MPIOLVL_HI
> +                                                  : EXAR_OFFSET_MPIOLVL_LO;
> +}
> +
> +static unsigned int
> +exar_offset_to_bit(struct exar_gpio_chip *exar_gpio, unsigned int offset)
> +{
> +       return (offset + exar_gpio->first_pin) % 8;
> +}

Answering to your question...

It can be done line this:

static unsigned int exar_offset_to_bank_and_bit(..., *bit)
{
       *bit = (offset + exar_gpio->first_pin) % 8;
       return (offset + exar_gpio->first_pin) / 8;
}

static unsigned int exar_offset_to_lvl_addr_and_bit(, *bit)
{
    return exar_offset_to_bank_and_bit(..., bit) ?
        EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
}

...

> +       unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
> +       unsigned int bit = exar_offset_to_bit(exar_gpio, offset);

unsigned int addr, bit;

addr = exar_offset_to_lvl_addr_and_bit(..., &bit);

-- 
With Best Regards,
Andy Shevchenko
