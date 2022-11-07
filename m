Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F99B61ED1F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 09:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbiKGInK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 03:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiKGInJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 03:43:09 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C551571E
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 00:43:07 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id g4so6137919vkk.6
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 00:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=knUpwUAM3+p7skXFoDx78GMBVeh/7EUTUIx5+aKRA1s=;
        b=JbLMQB1v6s7uZj79F0JI07xsfq99smvwLWCWoVTQGBfiM1mMBRpTjxm9Lc7O1aYKeH
         g1cgLh73yOeBVLAFq1iCy4ClaCdTg124uPysH4kN79Ua4D9s56ObY+OffZJ1fpgwx+kI
         EYC8cFNd5VJPxC8l9dQufhvW1/wopLMuK53oLSfj5yu4rycdpRv1nMSZaAUTELoeuD+9
         Ta/t68g3+3sSH3Ax6/A2QyMogEUyGZVoxnepxG/X67CuWMXws2iMGAMrDO1oUTfBalBQ
         Sa8nCmYN+AiwZFd8xoA8v/FW+LIUnQ012RBY5WfbJNNC89BIV6thTYoefSJGfFFm4aMn
         mC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knUpwUAM3+p7skXFoDx78GMBVeh/7EUTUIx5+aKRA1s=;
        b=gPqaA3PJ7+PrzsN5b8l/6ZBFuM8dY/5uexDoDHRrkjm7m7fCqMqbNzlUyKr1nLyf1j
         NEaZU3/a77iw6+pEFHIQl3PbGexE1qKpPx64gPuzMQdGan4i6ccv+t3PPNeR0aVFPh+N
         QjAzSl+VIJi+mEiZdQXgYcFCfl1RVREGjPf25RqxOMFCMSWYQ2E3v2K0DAg8LJXvXJmb
         6DDrRqILEcFAX6X8osUhpgW6N1i2RYGJL2K/4CV5374OV9W58k+hGM+FddyA9JqXx0t4
         rRN6FUoVnVDKRmjgf2c+3YYvJasTIBakjTceGBwEzv6JQz2MNO2GtnffAh0r0lxb4/ER
         W19Q==
X-Gm-Message-State: ACrzQf2uUW7iyGmpP78MTKrjV1bT/t9ENwGeBjtjK2TMH1RWCdWmT4He
        3mZ83mWIaJFhQ160wULoVcGDMvuGwH0bPutOPTkHboQZx9I=
X-Google-Smtp-Source: AMsMyM7lqlp+xHV6aTRBajNo+dZgKYxTAaPq9qMnEjDfHbHNzcR+qm5eP0IfpuDXMR1fbs53khL19ekYYm01hdPIqF4=
X-Received: by 2002:a1f:34d8:0:b0:377:142f:3e2f with SMTP id
 b207-20020a1f34d8000000b00377142f3e2fmr24913694vka.27.1667810587017; Mon, 07
 Nov 2022 00:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20221103202817.25567-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221103202817.25567-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Nov 2022 09:42:56 +0100
Message-ID: <CAMRc=MfWs_cNR2EtTP-L1j+1fxPshJuBOcF0X7qXRb8MPWuboQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Add Generic regmap GPIO conversion to the
 TODO list
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 3, 2022 at 9:28 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It's actually preferable to use Generic regmap GPIO over other
> simple approaches. Add a TODO item for that.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/TODO | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
> index f87ff3fa8a53..76560744587a 100644
> --- a/drivers/gpio/TODO
> +++ b/drivers/gpio/TODO
> @@ -124,6 +124,13 @@ Work items:
>    this with dry-coding and sending to maintainers to test
>
>
> +Generic regmap GPIO
> +
> +In the very similar way to Generic MMIO GPIO convert the users which can
> +take advantage of using regmap over direct IO accessors. Note, even in
> +MMIO case the regmap MMIO with gpio-regmap.c is preferable over gpio-mmio.c.
> +
> +
>  GPIOLIB irqchip
>
>  The GPIOLIB irqchip is a helper irqchip for "simple cases" that should
> --
> 2.35.1
>

Makes sense, applied.

Bartosz
