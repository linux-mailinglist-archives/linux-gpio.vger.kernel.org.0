Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8F6327A5E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 10:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbhCAJF1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 04:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbhCAJEA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 04:04:00 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8899FC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 01:03:19 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id q14so18502653ljp.4
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 01:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=gzxCVL+nyodcUSCU9VZAZpLakwe/w50q0cyfOXq54xY=;
        b=ZHUFfp2IK9gllxOuG1MLe3/yFCuCVf6Rt1dzYQjCW6fB0DsV3A9CddVWKZEZteJrc+
         /N7RGfW8KJHyFycLitpkrkMtclDQ6boIeedGTMkPoPS+Rn0QwakbKBH/pWDloaP6fEY8
         EYjUR9AJ2AOzFkPdeYCNwGTvrB9PoFSPfKSarX6RB+fkfZ5swW+Ac9zpdvyE1eaLJw2p
         Q7YdcSqtN5luoVeNLABnwl3RPxIo5fCVcJbtPLySVCevCZ44uq56skpiTScWp469ySPo
         kwBsTm0SW/Fra67f3caKqpoQUo/Zt0DBuvC7X7gYFNYniYoHaeRmuGg/oyTSIxyz2wmL
         rNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=gzxCVL+nyodcUSCU9VZAZpLakwe/w50q0cyfOXq54xY=;
        b=f3wlU9RRaHtNFkmpCIQgs8YTH4UAMe+pm+LBCrRUK36J462NIvLGOz28o3WB5K9myJ
         guQcHvUc3ciNrjmaYbSCcibGFNzhmiP+Xu9ISsT17bmIDwnOBhcxTp/UXKsgrL+cHrpE
         KSU342bq4k/QcfOkgSm7IJaKRmrV+CJwzmLHBx9Q6AssowLGD+smdI3VqJ1C/h+ny/Oc
         NhYMkTqHUbuOiifDqacONLVdSt4ZgQEspTLvvfZaG47VoiVQCKBb/pZMW8NlNSunMMTm
         ojr7opYkEff7WkbYWthqk9yL8SOnIcY0O04evLH8LWmgOX2UkmKR0Q7THTBSXO+JJRsf
         9GSQ==
X-Gm-Message-State: AOAM531mpPyjTbSNKATHBGWzFLnnh4h2O2wPygo9vzx7GPdltUptseef
        5yJXvKBfqqcj4uumrZaWYXhMb1AInLMPln1h935zxfLwT7A=
X-Google-Smtp-Source: ABdhPJzl9vwfVcM7lZPrUpqhZ6r0aRYAekXp0Ghs2HqGwlAIJhfdHwZkuwqYtc4pK0cwjK4stRX7Npv7BAkeSs9IzLo=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr178381ljw.74.1614589398090;
 Mon, 01 Mar 2021 01:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20210219174633.8646-1-michaelestner@web.de>
In-Reply-To: <20210219174633.8646-1-michaelestner@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 1 Mar 2021 10:03:07 +0100
Message-ID: <CACRpkdb1i=TXMWW5wNbxERBUAAsQp+QhoCcgsPTVte0vH5CQnQ@mail.gmail.com>
Subject: Re: [PATCH] Signed-off-by: Michael Estner <michaelestner@web.de>
To:     Michael Estner <michaelestner@web.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael!

Thanks for your patch!

Make sure to send patches to the linux-gpio list and Bartosz
as well.

On Fri, Feb 19, 2021 at 6:46 PM Michael Estner <michaelestner@web.de> wrote:
>
> Delete unused else if iteration.
> ---
>  drivers/gpio/gpiolib.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 97eec8d8dbdc..1fe38fc99b8f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -612,9 +612,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>         dev_set_drvdata(&gdev->dev, gdev);
>         if (gc->parent && gc->parent->driver)
>                 gdev->owner = gc->parent->driver->owner;
> -       else if (gc->owner)
> -               /* TODO: remove chip->owner */
> -               gdev->owner = gc->owner;

As long as we have not resolved the TODO I think this needs to stay around.

What makes you think this is not needed anymore?

Yours,
Linus Walleij
