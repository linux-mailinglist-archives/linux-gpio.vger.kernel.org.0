Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7538834A78E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 13:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhCZMvx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 08:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhCZMvv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 08:51:51 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A672DC0613AA
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 05:51:50 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id j3so6141562edp.11
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fxmCVjpEm2Cg5qM2jfpujijvIZLf8mlit0UdHPBMjRs=;
        b=weB8+GoKMXwVZOXI6pTn8uncqjU0tD4Nf+7nc+rnAWQYT3d7T4z0Vx8EOT3komKlzf
         pzF29j1UTQn9lOGi+tqjme75WXZ6SYf8GfUEC1PI4UdIH5cxryKdAX1FUU0Du8Y0mUgT
         zNTYcv8nhTR2zYpvX0MfPhp67kwPycOiabeqbrZfLELlwvklxSVdUsYSPPitqa0muW54
         N8vzfpPIs3JY8XsyYkwcjHfBEb6GhQ++Uxjo1gLWIA2AmAvG5X5PkaiyB0+8a8KXTeKZ
         YOMeOSu9q4DMFbUKdxWh0IWvZB4APLmz4mzpkEl5ZoifCTOG1vclbYwoy10JeXNIy4fR
         e69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fxmCVjpEm2Cg5qM2jfpujijvIZLf8mlit0UdHPBMjRs=;
        b=OhKePlfK6UDkG/xEkYmaec4UK/SrxirVVkjH4vXueo31TCIOoTSe2S9e9aL3YfD9NJ
         KhTBHU1jNJ7YsGrOr7NZNWAbiAKGOCBRmgTvCMWmHe2cgNvfGWN84Wv80U9Dw5l7lIId
         Zp+IsNTx86z5sMHpt/1FKIaXQNR1PkkpydJe2UpErGdR7IDp14zzc2KPkZylseOYjQhN
         390SnUsNGro7UZk1Ofje27+O1dICVfS1o7PUM62EVPG4KnzbW5M85/c8Qgdz/MOBWSFr
         J/XIlY3jIY9eB1OhimTFiRt91ESrkIA36n56OLDvy4V09xBunT1j6hm/SNsLxaYt9Zsy
         gZjw==
X-Gm-Message-State: AOAM532+i4VhrYp8d2EgFMfhSlLCYMoO9II9g0eDe9OnpJLQEXpSeeez
        WBR7qOKmeP4sBbi5CC5tEsTvp7h7MRTZ3azrKEAsc7ojNdE=
X-Google-Smtp-Source: ABdhPJyX9xlglRzGUs+LJ547h4c2yjSqEDLMcDAE8XLdqaLR4NhhWgJ+iIajaauFMCaFbc6vbRB6erq8mfUh2xLdyyU=
X-Received: by 2002:a05:6402:31e9:: with SMTP id dy9mr15143375edb.186.1616763109376;
 Fri, 26 Mar 2021 05:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210326081535.1679507-1-linus.walleij@linaro.org>
In-Reply-To: <20210326081535.1679507-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 26 Mar 2021 13:51:38 +0100
Message-ID: <CAMpxmJW6UtORuHoVrRJ4qx+O2vL=MVVMxwqxzJqQgCmRUnbUCw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Mention GPIO MUX in docs
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 26, 2021 at 9:15 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> There is now a GPIO multiplexer, so mention this in the document
> about drivers using GPIO as backend.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/driver-api/gpio/drivers-on-gpio.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/driver-api/gpio/drivers-on-gpio.rst b/Documentation/driver-api/gpio/drivers-on-gpio.rst
> index 41ec3cc72d32..af632d764ac6 100644
> --- a/Documentation/driver-api/gpio/drivers-on-gpio.rst
> +++ b/Documentation/driver-api/gpio/drivers-on-gpio.rst
> @@ -96,6 +96,12 @@ hardware descriptions such as device tree or ACPI:
>    way to pass the charging parameters from hardware descriptions such as the
>    device tree.
>
> +- gpio-mux: drivers/mux/gpio.c is used for controlling a multiplexer using
> +  n GPIO lines such that you can mux in 2^n different devices by activating
> +  different GPIO lines. Often the GPIOs are on a SoC and the devices are
> +  some SoC-external entities, such as different components on a PCB that
> +  can be selectively enabled.
> +
>  Apart from this there are special GPIO drivers in subsystems like MMC/SD to
>  read card detect and write protect GPIO lines, and in the TTY serial subsystem
>  to emulate MCTRL (modem control) signals CTS/RTS by using two GPIO lines. The
> --
> 2.29.2
>

Applied, thanks!

Bartosz
