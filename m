Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3429A30F49A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 15:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236581AbhBDOHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 09:07:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236608AbhBDOGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 09:06:11 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BC3C0613D6;
        Thu,  4 Feb 2021 06:05:30 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d16so3587822wro.11;
        Thu, 04 Feb 2021 06:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HxcLWfCCoZU6CkJHv1PF9ouLeoC8IwwQJ08D7Owp1l8=;
        b=vK60m1gJ/d3CWplK39eve3ORp3DH2CSHD5ABnTETrxLylKlcr7KXNYO3VHJXk3ZleI
         rSH40FdtQ4CNBcf322rqcAILrVzd8bRjdgjH1Ezev/kiFwsuICxaSiRsAlAh5O5YXltk
         OC1la47AnO54hTcl+I7Fywo2iQs+23VdrPjRrpIjj07KiB1WlRH4sf8J9r7+GmSmLgaC
         K4zrjHksjNlt5JK9Rn6ZcZihx8vwBHoTgeRjXna/5FwsvU4/01wqvZpmDqlmBnHzmmBn
         hFxQjeHzTg2AQAQQzAkokfQLonLwoJdODbEGDoC/8CudGEvutUk1JITlcLl8138htUWn
         YJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HxcLWfCCoZU6CkJHv1PF9ouLeoC8IwwQJ08D7Owp1l8=;
        b=VgPmsJ3qKtT8GsmRxPZB/J/fOTg5KCG0p0/Mx0IylAU9Eg+ngbcjkS/dfQORWFl9xI
         i6SqcHkaReWlw132KPAoAnQXekLBvmcv1dH1EIKpImtyw6dvS1Z8k3rclepIAG4v6DbD
         70zDHXTQ786hs2XAVqEob73YKVI1BBXIT2bIPBmonfB+i2gP3mM4nxthhqYtU8KLG9pd
         T/QJf2tSTwjhCizBnP/HXxa4GyTrfSsc8e8ygfWSqp56DpMz6/6FIUuR5lQxHRD5ICm5
         UmbruGCLKX4Ukf5pmBlZEBNrbpSD87Lb+Da2SRSVVStWV6DFSJY2ioU0La8K9Y+G721d
         zW+Q==
X-Gm-Message-State: AOAM531nyvx/izheqYtO1cGUkykDOK0KIO9YuO78WwLsvjg8CoCyka0K
        toaOL09KAj1ix/bapU+5SLQ=
X-Google-Smtp-Source: ABdhPJywPRuHSbrU/6olDac/dpsdLY295WkrDZFGur7gLMqm3zflWMM3reEIe7mXuQmE1N9v13ZUyA==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr9415894wrb.378.1612447529542;
        Thu, 04 Feb 2021 06:05:29 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id k4sm8947939wrm.53.2021.02.04.06.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 06:05:28 -0800 (PST)
Message-ID: <2773b77f3df3f36ab1570d2db07b386cac7cb761.camel@gmail.com>
Subject: Re: [PATCH v3 1/7] gpio: gpio-ep93xx: fix BUG_ON port F usage
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     nikita.shubin@maquefel.me,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 04 Feb 2021 15:05:28 +0100
In-Reply-To: <639331612446874@mail.yandex.ru>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
         <20210128122123.25341-2-nikita.shubin@maquefel.me>
         <CAHp75VfBb5+K9cSAzj9EBD+KtswkHSNMZWoCaU=bKvOO3fXRjw@mail.gmail.com>
         <a0c121fdfb2893ec89425534387212524e4ff7cf.camel@gmail.com>
         <28201612442592@mail.yandex.ru>
         <164d778019f68dd024cb42f869e7d967618514cb.camel@gmail.com>
         <639331612446874@mail.yandex.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nikita,

On Thu, 2021-02-04 at 17:00 +0300, nikita.shubin@maquefel.me wrote:
> >  I considered your offer of using array with holes.
> >   
> >  It looks pretty ugly to me, couse it leads to bloated arrays:
> >   
> >  static unsigned char gpio_int_unmasked[EP93XX_GPIO_CHIP_NUM];
> >  static unsigned char gpio_int_enabled[EP93XX_GPIO_CHIP_NUM];
> >  static unsigned char gpio_int_type1[EP93XX_GPIO_CHIP_NUM];
> >  static unsigned char gpio_int_type2[EP93XX_GPIO_CHIP_NUM];
> >  static unsigned char gpio_int_debounce[EP93XX_GPIO_CHIP_NUM];
> >   
> >  /* Port ordering is: A B F */
> >  static const u8 int_type1_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0x90, 0xac, 0x0, 0x0, 0x0, 0x4c };
> >  static const u8 int_type2_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0x94, 0xb0, 0x0, 0x0, 0x0, 0x50 };
> >  static const u8 eoi_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0x98, 0xb4, 0x0, 0x0, 0x0, 0x54 };
> >  static const u8 int_en_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0x9c, 0xb8, 0x0, 0x0, 0x0, 0x58 };
> >  static const u8 int_debounce_register_offset[EP93XX_GPIO_CHIP_NUM]    = { 0xa8, 0xc4, 0x0, 0x0, 0x0, 0x64 };
> >   
> >  Is this really the thing we want ?
> 
> Even in this form it's less error-prone than to have two
> index-spaces, and hidden conversion from one numbering scheme
> to other.
> 
> Alternatives that I see are:
> 1.
> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html
> 
> 2.
> Embedd the necessary values into struct ep93xx_gpio_bank.
> This option can probably simplify the handling of the names
> for irq chips as well. 
> Thank you very much for your comments, and how about a 3rd option ? :
>  
> It also makes easier to add 'struct irqchip' in following patch.
>  struct ep93xx_gpio_irq_chip {
>        u8 irq_offset;
>        u8 int_unmasked;
>        u8 int_enabled;
>        u8 int_type1;
>        u8 int_type2;
>        u8 int_debounce;
> };
>  
> struct ep93xx_gpio_chip {
>        struct gpio_chip                gc;
>        struct ep93xx_gpio_irq_chip     *eic;
> };
>  
> struct ep93xx_gpio {
>        void __iomem            *base;
>        struct ep93xx_gpio_chip gc[8];
> };
> 
> static const u8 int_register_offset[8]   = { 0x90, 0xac, [5] = 0x4c };
> #define EP93XX_INT_TYPE1_OFFSET        0x00
> #define EP93XX_INT_TYPE2_OFFSET        0x04
> #define EP93XX_INT_EOI_OFFSET          0x08
> #define EP93XX_INT_EN_OFFSET           0x0c
> #define EP93XX_INT_STATUS_OFFSET       0x10
> #define EP93XX_INT_RAW_STATUS_OFFSET   0x14
> #define EP93XX_INT_DEBOUNCE_OFFSET     0x18

Makes sense to me.

-- 
Alexander Sverdlin.


