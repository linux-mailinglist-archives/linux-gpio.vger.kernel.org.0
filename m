Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6DC31DA00
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 14:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbhBQNMi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 08:12:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbhBQNMc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 08:12:32 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E277C061574
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:11:51 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id lu16so7166451ejb.9
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NtvdjTYbySiNjrsVpyFySMUuVb1afNFhISqViVmBgCg=;
        b=UFQJ2DV6yQJ9Fpq3/STJYGQg3nqzTQx4CAG8B+8oxRiUuWDbWNi14tOFrghQIn86te
         IATc0Hdr5dTsQgrCyoguRgI1fWpEPwGLeFtfoX+3YJds5oz1ZXrybUFfQ5eR8nMIjj0V
         EuE67jbkmxhdTidTtjkqee86vs0y5TmMsN9uERWtDa4LuR0uK94J9x6Le6XT9tJQIbLM
         CJ3PRMgNMc3D5alYfCguJJsu7bvYa4Vpnus/5sdtmc3UeUMaMefFhvpxL46G6oXQ+dRF
         tKiwoFTcsThTB7MldrhMg/eI/L1ns6bRcy65ddX60xfxZ6bp7QE3XtQLNFXCo+at2cUS
         rNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NtvdjTYbySiNjrsVpyFySMUuVb1afNFhISqViVmBgCg=;
        b=pVTI9mA2fCbdZXP0opkVPIDjNow6sBoG+9uqeUG3/OlM7uz5t/STsBSG2oi3rrA1iu
         Pn7unvNSluIwmyUt501dDwCEDpfwm2emX6ybuLTPPXPlJQ+X/2F7Q+YN07b+84Ghmzs3
         d2B61ru1jBEvgp6XJWw4xiyNuSD8Dxuj0ZI1NaE2nLeQHo3uiVyA/UvhG6y8+6INMb+O
         aUeYkvA2NxeIqK6PaA57D1LDl0PQl6Vlew5i2Es2lqys9QNYmF9z9WtaczLpZyh0ie94
         YuuEbTrxnlwdUMFD8kml1o8MdKjlpVydjoqpBFNycnrgafil9WAi3GtMAuoqAneUrAEk
         WYlw==
X-Gm-Message-State: AOAM532r5Pt5jaOC/ntliQdDAsXLMkCUR6p547QY+1aKT5B9slKUmuAm
        v7mh2FaPuVGZrp/mnnuO78Nqjf5HM6DCJzbfkmRavQ==
X-Google-Smtp-Source: ABdhPJx8z7WQbRDy4NQeny9eHwcxPfgmGj3TQUmc1YqXNOzgaqWJRokte1yvfzNzrejarmcO65RQXLcPYI6OErRZQt0=
X-Received: by 2002:a17:906:9b86:: with SMTP id dd6mr11677778ejc.516.1613567509649;
 Wed, 17 Feb 2021 05:11:49 -0800 (PST)
MIME-Version: 1.0
References: <CALHCpMg7-OHSiBHOObUSTtH6gSLhg9yfh9u=E6tGnTLbhJVucw@mail.gmail.com>
In-Reply-To: <CALHCpMg7-OHSiBHOObUSTtH6gSLhg9yfh9u=E6tGnTLbhJVucw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 17 Feb 2021 14:11:38 +0100
Message-ID: <CAMpxmJUerjnWQhyHo5A62OBLmdTGQTy2SfFz_nnfAi29iqcPKw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pcf857x: Fix missing first interrupt
To:     Maksim Kiselev <bigunclemax@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 16, 2021 at 9:16 PM Maksim Kiselev <bigunclemax@gmail.com> wrote:
>
> From: Maxim Kiselev <bigunclemax@gmail.com>
> Date: Tue, 16 Feb 2021 17:00:58 +0300
> Subject: [PATCH] gpio: pcf857x: Fix missing first interrupt
>
> If no n_latch value will be provided at driver probe then all pins will
> be used as an input:
> gpio->out = ~n_latch;
>
> In that case initial state for all pins is "one":
> gpio->status = gpio->out;
>
> So if pcf857x IRQ happens with change pin value from "zero" to "one"
> then we miss it, because of "one" from IRQ and "one" from initial state
> leaves corresponding pin unchanged:
> change = (gpio->status ^ status) & gpio->irq_enabled;
>
> The right solution will be to read actual state at driver probe.
>
> Fixies: commit 6e20a0a429bd ("gpio: pcf857x: enable gpio_to_irq() support")
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> ---
> drivers/gpio/gpio-pcf857x.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index a2a8d155c75e3..b7568ee33696d 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -332,7 +332,7 @@ static int pcf857x_probe(struct i2c_client *client,
> * reset state. Otherwise it flags pins to be driven low.
> */
> gpio->out = ~n_latch;
> - gpio->status = gpio->out;
> + gpio->status = gpio->read(gpio->client);
> /* Enable irqchip if we have an interrupt */
> if (client->irq) {
> --
> 2.27.0

Applied with the Fixes tag fixed.

Bartosz
