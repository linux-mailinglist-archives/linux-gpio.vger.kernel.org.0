Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C393E60630C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 16:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiJTOam (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 10:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiJTOal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 10:30:41 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BF32E9CD
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 07:30:39 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id e8so752582vkm.9
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3YFEM9gB2RMWJBL1sxxmVsaNP3YGAtwbDm385W39O0k=;
        b=VkAFl+I/8Z+kFwL7hoLm7lXRQtUm9tnEA29StMergAxN/nauVMxfH+lpDlq0YPe/QI
         BH6ZTksmP2sLlweFivCc2+wLr9Cd0jp7I/kZbkfsKeXF9ZxAIAVmxnRP30JmqT2RxDtY
         PNx1Lis6YAVyjlgVmzSdvrIp7hyK1GBxixiu1Aw1LgtEZu+Z/8ni8470aFMpjtnza7e6
         y35CBRWxSSraaDusmNGsuhnaBKNEwvVTjxaVqVkoLrUsS+0JjbA4dseXaXJaXLolt3+X
         leBnGTjFLlHYIu4Je60ccfUWRLP3yp2rI7GUhXAvTmPmWHysM5tGpx6GxbFLHSrE2Ydq
         +A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YFEM9gB2RMWJBL1sxxmVsaNP3YGAtwbDm385W39O0k=;
        b=pmIFq0yZ9xB6vCWZ3ERgw01Wo5AU2VpZYnUQhbz12WzYpK2HnLGMkZnYCq4Hhigogu
         t5P2yqFfxsEgmUFbJpwzfEy4nQmFUTsRrIrUSA3xEkB39NUN0QZcsfbwh6cd8k6Ucx4s
         SOU0pzDD3Btb61UBn1yJOIed9RevcYlLQ+V0adzoMb38OEE4nsLORpxyplnxu+qdTE30
         kzkZcSZzuTqNEdMJghEAzJh/dw5Dai6cYCyM6MAInGrKISa+39dmWyVLSoUdJ+oXfkC0
         uvKl/1a9C1Ez/29LjdAgDuppY0BLfA7x5n8o/253qNa0G5l2xjtIbQD3O9BpzGBxM9D8
         JcyA==
X-Gm-Message-State: ACrzQf2xABd3rKYisCnpTxk4I8fcP1OJNiKon2TdkeOUSAe6JIH7Gc3B
        s4v7iN6lA3Aifq6jD8jYIi9lh/F99N1Zete1yBrQKw==
X-Google-Smtp-Source: AMsMyM4ENf4fSfgOtezBYayu23wgj+4XL9Ki/NH9RVsEbIX7euW6Yqiz0LDZntoloIqf/7fu85PEbklokSb06AN1fJg=
X-Received: by 2002:a1f:e944:0:b0:3ab:334d:2896 with SMTP id
 g65-20020a1fe944000000b003ab334d2896mr6815074vkh.5.1666276238103; Thu, 20 Oct
 2022 07:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221020014426.188667-1-xiangyang3@huawei.com>
 <CAMRc=Md6nseghBwfiRCL0KQ1BJ0WE7MH9QENf=HdJdnC1Xz1Fg@mail.gmail.com> <Y1FSRJC9s+7cvJI3@smile.fi.intel.com>
In-Reply-To: <Y1FSRJC9s+7cvJI3@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Oct 2022 16:30:27 +0200
Message-ID: <CAMRc=Mc-BvPRnORT+bm8LL5H3eG5-AOsN1fAaizXdhjZ=2E7xQ@mail.gmail.com>
Subject: Re: [PATCH -next] gpiolib: acpi: Use METHOD_NAME__AEI macro for acpi_walk_resources
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Xiang Yang <xiangyang3@huawei.com>,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2022 at 3:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 20, 2022 at 03:23:27PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Oct 20, 2022 at 3:48 AM Xiang Yang <xiangyang3@huawei.com> wrote:
> > >
> > > Using the METHOD_NAME__AEI macro instead of using "_AEI" directly.
> > >
> > > Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
> > > ---
> > >  drivers/gpio/gpiolib-acpi.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> > > index a7d2358736fe..064ba5150fd4 100644
> > > --- a/drivers/gpio/gpiolib-acpi.c
> > > +++ b/drivers/gpio/gpiolib-acpi.c
> > > @@ -512,7 +512,7 @@ void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
> > >         if (ACPI_FAILURE(status))
> > >                 return;
> > >
> > > -       acpi_walk_resources(handle, "_AEI",
> > > +       acpi_walk_resources(handle, METHOD_NAME__AEI,
> > >                             acpi_gpiochip_alloc_event, acpi_gpio);
> >
> > This line dates back to 2018 so why -next in your PATCH tag?
>
> This means "for Linux next cycle". It has roots in the net subsystem where
> it's a requirement to mark each patch either net or net-next, because they
> have a huge traffic of patches.
>
> > That being said - patch applied (unless Andy wants to take it directly).
>
> I think I will take it. Care to provide your tag?
>

Just take it, I will back it out.

Bartosz
