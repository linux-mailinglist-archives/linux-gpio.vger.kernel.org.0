Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5044630F3F9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 14:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236273AbhBDNhl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 08:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236385AbhBDNhd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 08:37:33 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B86C061788;
        Thu,  4 Feb 2021 05:36:48 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id 7so3589476wrz.0;
        Thu, 04 Feb 2021 05:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=i6/bNL7HF1iysG21qSzvFJ1UcbOS4/QnqxxVysWkLuU=;
        b=UxD0a1lDoSmq0j3gyV+VewxgLUPZLnSVo0X+4W+gBeRF1M/LB7WycJ425L0kJsdjvV
         nO2YKPHBbzX4gMH+gDIRb355VPuETYaTWSfc7AUmGaofrMlsQOsQmSO4a4fIpkQ/4W5v
         L/zISmHYjpNtJPqmfGXMtCVbnLNlj/2HPhiGlhTeKkr5SZSndZUhr0jvkrCmPba7JX9Z
         K9eGxkMxf2qd+47lNN+thrHQ/wlN3xSB38sw6m5tP+usZs9jT3q/nAMHHmxEhUoJEvBu
         i6OMsx4qWLprLu2424I9ahf4eoSNELsw6bCxN2DuQxikVpzhZaJC8IEWma0cEPpp+Lgs
         cxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i6/bNL7HF1iysG21qSzvFJ1UcbOS4/QnqxxVysWkLuU=;
        b=XMM7paZ0uN0o2ttNnUJuwdJ3YYtGNyzO7B+XSCXJDtR2IFmm9cYJZzAcjIqUr7k+KO
         fKFKiBGHZ/EzubcgT85ZKaI6lEUz1u0H2OpgghZTQbwKQDIWxQ271XxANSR7LdnAmVf4
         vecDgHhOf+QALxJU+x35eizwBxhW5NlzUKCIT6Yp5JrF9sDIM9nV+L2oPjsbk/6lzIez
         zBRdl7r0+ex0Rom3yKgVfnXais4rJSpw5VZDsNio5/e4meZWu3Nk5rR+kzHLjUedKTAE
         pjH88m+3bJsVdyDNrgzL9izcMs2zHUGxViPSkybsc+RxU8xiP5T0/gJzO0DMHD9R1ebB
         gG/w==
X-Gm-Message-State: AOAM532R7Kz+RF8W2Vm/zpjzBEGRuyvajcCSfw59DkOjeaLEtFUA37LH
        NOMBUtDo4fJSE9HtEtpJd4k=
X-Google-Smtp-Source: ABdhPJxrbWdFxZJl51XjeEhG+ltbbvljSjn6Y67jLdF39+NBwKsnOYIziLPvuvmZgWQqU9l0kMiy2w==
X-Received: by 2002:adf:f743:: with SMTP id z3mr9523620wrp.165.1612445807699;
        Thu, 04 Feb 2021 05:36:47 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id 35sm8993637wrn.42.2021.02.04.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 05:36:46 -0800 (PST)
Message-ID: <164d778019f68dd024cb42f869e7d967618514cb.camel@gmail.com>
Subject: Re: [PATCH v3 1/7] gpio: gpio-ep93xx: fix BUG_ON port F usage
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 04 Feb 2021 14:36:45 +0100
In-Reply-To: <28201612442592@mail.yandex.ru>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
         <20210128122123.25341-2-nikita.shubin@maquefel.me>
         <CAHp75VfBb5+K9cSAzj9EBD+KtswkHSNMZWoCaU=bKvOO3fXRjw@mail.gmail.com>
         <a0c121fdfb2893ec89425534387212524e4ff7cf.camel@gmail.com>
         <28201612442592@mail.yandex.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nikita,

On Thu, 2021-02-04 at 15:55 +0300, nikita.shubin@maquefel.me wrote:
> I considered your offer of using array with holes.
>  
> It looks pretty ugly to me, couse it leads to bloated arrays:
>  
> static unsigned char gpio_int_unmasked[EP93XX_GPIO_CHIP_NUM];
> static unsigned char gpio_int_enabled[EP93XX_GPIO_CHIP_NUM];
> static unsigned char gpio_int_type1[EP93XX_GPIO_CHIP_NUM];
> static unsigned char gpio_int_type2[EP93XX_GPIO_CHIP_NUM];
> static unsigned char gpio_int_debounce[EP93XX_GPIO_CHIP_NUM];
>  
> /* Port ordering is: A B F */
> static const u8 int_type1_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0x90, 0xac, 0x0, 0x0, 0x0, 0x4c };
> static const u8 int_type2_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0x94, 0xb0, 0x0, 0x0, 0x0, 0x50 };
> static const u8 eoi_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0x98, 0xb4, 0x0, 0x0, 0x0, 0x54 };
> static const u8 int_en_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0x9c, 0xb8, 0x0, 0x0, 0x0, 0x58 };
> static const u8 int_debounce_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0xa8, 0xc4, 0x0, 0x0, 0x0, 0x64 };
>  
> Is this really the thing we want ?

Even in this form it's less error-prone than to have two
index-spaces, and hidden conversion from one numbering scheme
to other.

Alternatives that I see are:
1.
https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html

2.
Embedd the necessary values into struct ep93xx_gpio_bank.
This option can probably simplify the handling of the names
for irq chips as well.
 
> 28.01.2021, 19:19, "Alexander Sverdlin" <alexander.sverdlin@gmail.com>:
> > Hello Nikita,
> > 
> > On Thu, 2021-01-28 at 18:11 +0200, Andy Shevchenko wrote:
> > >  > +/*
> > >  > + * F Port index in GPIOCHIP'S array is 5
> > >  > + * but we use index 2 for stored values and offsets
> > >  > + */
> > >  > +#define EP93XX_GPIO_F_PORT_INDEX 5
> > >  
> > >  Hmm... Why not to use an array with holes instead.
> > >  
> > >  ...
> > >  
> > >  > +       if (port == EP93XX_GPIO_F_PORT_INDEX)
> > >  > +               port = 2;
> > >  
> > >  Sorry, but I'm not in favour of this as it adds confusion.
> > >  See above for the potential way to solve.
> > 
> > well, I was thinking the same yesterday. It just adds another
> > level on confusion into the code, which even the author got
> > wrong :)
> > 
> > Array with holes would be more obvious, but one can also embedd
> > the necessary values into struct ep93xx_gpio_bank.
> >  
> > --
> > Alexander Sverdlin.
> > 
> >  

-- 
Alexander Sverdlin.


