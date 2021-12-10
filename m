Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7714703A9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 16:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242744AbhLJPVr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 10:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239316AbhLJPVq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 10:21:46 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98702C0617A1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 07:18:11 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id t5so30658654edd.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 07:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVfBZF4b7PCVXGGMXQB4an91HWPl0H694xX8OXVaV7E=;
        b=Ts5ywsiHxF2TIg5i2hVbjlLk9dy3fGgcAaUE6HahQhIRszjes9xv50m3bid5KWBuFA
         AocSKzQpm1irjtIDMUd+M2xlD+dCrurPG0yenzIy8UAhDi8E9b+TqOoFrQACAsJrC3Ic
         Vzpu8C9lGQpGUmctUGAqkfunlDq9i8lFwSDGyhPnRnV/tdUWPI0oMlRwjVVaA5496AqC
         hlaCi2np5KCvXLpgR19/gLS4StkFxTi009Nu2hnPS58XpyANt4G/PlBnKEGR7QZkr1yR
         lCkkXRKeWKGOdJkQfcawPz6lNO/n0pOnxV7TouSqmf8naoXUA7PgRrDwa61B0Hd0F6d6
         XUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVfBZF4b7PCVXGGMXQB4an91HWPl0H694xX8OXVaV7E=;
        b=BsOoUm7gSz5j9VSbYCjVUO5cUHqm20ho1MAqG495KzmEh7YZpjQW8sPyLVuKqy1qpN
         uGcbSHo64G2PGV3byWogejfuk6U4jpGEXbbvDp/0YLvzd34ijB24w+0JGgKEc2qcDkvO
         QBHu82mL0EtR8zjqOVcQgjNzTNzKJJcP/ZQAz2ao9GZSC1NfqHvKjMPfn1KfhQ2Poh+Q
         /AHWdPrhZTPzydM1WBGVb0ZkEFf5BTt4lYYecgHnyS4NuVVWc7LdfxORjA18hc+z8qJB
         q9dmsIl66UUwoedbPrVrKxxulWLFYyAnAQGsM5f8beiVDK6zLPEo3HqMlS6DL5s3FMGU
         Vi4Q==
X-Gm-Message-State: AOAM531YBpgDPsNssJhY9WcEZxS5TLsCjdADUNm15bpYVCENSjbDO7zP
        AiExslV/wesN9QfCbpqDeHW/Uyx93DaYX5TSmY3ryg==
X-Google-Smtp-Source: ABdhPJzTeRrBSoNTNmm2l3wySatjt5c3tDJAW1i3UEGpMsuLDID2SOY6ttzqfD6TlyxBzi9dYTmyMbvlSDkHwfNKv9s=
X-Received: by 2002:a50:cdd9:: with SMTP id h25mr38348547edj.0.1639149457727;
 Fri, 10 Dec 2021 07:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20211210135527.28194-1-wangxiang@cdjrlc.com>
In-Reply-To: <20211210135527.28194-1-wangxiang@cdjrlc.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Dec 2021 16:17:27 +0100
Message-ID: <CAMRc=MdXxh58zB10jXKO30JmLjXS+yna8kKDPGtip9BfQ9Pg7A@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: bcm-kona: add const to of_device_id
To:     Xiang wangx <wangxiang@cdjrlc.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 10, 2021 at 2:57 PM Xiang wangx <wangxiang@cdjrlc.com> wrote:
>
> struct of_device_id should normally be const.
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
> ---
>
> Changes since v1
> * Change subject log
>
>  drivers/gpio/gpio-bcm-kona.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index d329a143f5ec..9cb3587d1441 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -505,7 +505,7 @@ static struct irq_chip bcm_gpio_irq_chip = {
>         .irq_release_resources = bcm_kona_gpio_irq_relres,
>  };
>
> -static struct of_device_id const bcm_kona_gpio_of_match[] = {
> +static const struct of_device_id const bcm_kona_gpio_of_match[] = {
>         { .compatible = "brcm,kona-gpio" },
>         {}
>  };
> --
> 2.20.1
>

Applied, thanks!

Bart

PS: next time please include any ack/review tags already left under
the previous version
