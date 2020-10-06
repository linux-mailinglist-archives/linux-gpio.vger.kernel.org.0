Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F32284933
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 11:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgJFJRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 05:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgJFJRE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 05:17:04 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF42C061755
        for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2020 02:17:02 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 184so5552114lfd.6
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2020 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJLzHv0wuJacnG9Sh9U1ShbjHWOtGBELHGoUNl8bafc=;
        b=SXuncFqHvfgYJL5MPFXDjZGh2aszphyV47iMX5OPrSaNAL8OQ62EOJXuvceEzdBhLt
         btFWreu3ieO2j+Bhr6E9zbFfvt4KvwLd87RzabWZ4HqMiJcY/WAs1urPXpwlHXrJr1K3
         MgQUy/n99ixget6V1d5zTNPxFOqeTmN37X3hO9TfxVt2IX2xNqpaCPOcX+9w6fEWUrK6
         plUxx/xUeAnz1df3zALqDqvEGXhQFe9dvTmKneCyBjfEk0rJUPpe/Bwez7cQbKqXDaP5
         ds5RFMSHVH+Gp4n3lk0p49QQKiEQnrP0sY852SpdvNE/WVcc2lzH2dQISMaKWhlRiQ/D
         +b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJLzHv0wuJacnG9Sh9U1ShbjHWOtGBELHGoUNl8bafc=;
        b=hwsTszRntAi1p2esX3B77gI5IwgqgGdeuJ/VzJi1AwkLMidywmv2PPblgUr1eAoDh5
         VqVfvMf7rdotfkPvwsRPMz4n0YvhMcaQsD6cfTTUcRoksOnF3n5tA7V4LWHsQyQKgTEs
         yuJzcVO0uEuh4JzE351ARPb/VhOLfHRfsL5hxxAXULKPJkzvH+7zQ2r6dBc97Z6LBz5g
         vf+OnHJTVamIupwGMWPr1BTMtMc1U66ZCOkN9vYuuzawpiaYH8m4xpITZQoYwqOiGLnQ
         SeD0YyKvJtj8/gIqV3fxhUGPonkjNUEoK+8+PfKurEJZUCNhSOmOfJh7H3NYBgwd1b2x
         qMEA==
X-Gm-Message-State: AOAM533gSDLoWJoAmqkGNGjL+2xb8kG/uzQnj4AIz2NyCVBfut47udl2
        acWu40qht0Zeb4gNebC98VcZUiYhhTEyk917AV51Mw==
X-Google-Smtp-Source: ABdhPJyB9PujX1YNzhC20h5uPujSf/VGlXD0DfrFxVzgse9nwilSQf+1ZsevcPteK3A5FbeBS8g7saVIshrrTtC1/Oo=
X-Received: by 2002:a19:e55:: with SMTP id 82mr148521lfo.571.1601975821003;
 Tue, 06 Oct 2020 02:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201002124235.nhjzq7i4gpkzwgbs@Rk> <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk> <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk> <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk> <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
In-Reply-To: <20201006083157.3pg6zvju5buxspns@Rk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Oct 2020 11:16:50 +0200
Message-ID: <CACRpkdaK-WpQdKu-tBOyvB1HLZ10ivjEPrVFqGjPSvLJuPXG8Q@mail.gmail.com>
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 6, 2020 at 10:32 AM Coiby Xu <coiby.xu@gmail.com> wrote:

> Disabling the glitch filter works like a charm! Other enthusiastic
> Linux users who have been troubled by this issue for months would
> also feel great to know this small tweaking could bring their
> touchpad back to life:) Thank you!

Oh you found the bug :D

> $ git diff
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 9a760f5cd7ed..e786d779d6c8 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                  pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>                  pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>                  pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
> -               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
> +               /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>                  irq_set_handler_locked(d, handle_level_irq);
>                  break;
>
> I will learn more about the glitch filter and the implementation of
> pinctrl and see if I can disable glitch filter only for this touchpad.

Yes we certainly need a quirk for this of some kind, examine the ACPI
quirk infrastructure in drivers/gpio/gpiolib-acpi.c to see if you can use
that to handle this.

Yours,
Linus Walleij
