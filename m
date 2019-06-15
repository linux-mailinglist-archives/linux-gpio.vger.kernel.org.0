Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A684D46F2D
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2019 11:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfFOJII (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jun 2019 05:08:08 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37873 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfFOJII (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jun 2019 05:08:08 -0400
Received: by mail-lj1-f195.google.com with SMTP id 131so4716065ljf.4
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jun 2019 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vayDdK/vaesz7L05p0dkZXM5UoCyNlQN49Uoqkipvlw=;
        b=fWTGzFthId9hzVyOtgiaLMjIvqa6ZwEXSRdzOHrCr7pRT60A9Xw6me5yQuXvKPy3sH
         04iSCrBPln324GOkoEuntvOOuj1CjuSsnnjxMhKKkxAJvpr8sfvP5Zm4nEc/foZqa1hG
         WPU68e3+OWeh7rqmvIGT9YS6xT0SbBLqb6MemZsAj6cH2LuQWirffy0CMPTDjRL0s0t3
         iDgo3D/6jkqIGtfPnvmA5szG9SgxGczSRHnibNBEwSzGF947YLRKY5v92sqixTz/blf9
         ozamKszRE1ID1EnYxgHbp9RxFHJDwPCV4/tY95DXj/Bkr7NecURtcTyhKtmVstUQ67p3
         OVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vayDdK/vaesz7L05p0dkZXM5UoCyNlQN49Uoqkipvlw=;
        b=NCDDNEGw/aPqHOI8JORc11jUFBfSmBRiT3aRCPQ48HvPjDTMwBEAIHXIChViknWD+E
         F5WcJEn54OtXQSaLv2NweRtHlZZxkguikBTsn/GTga8zXUYcybuI3p2Fu+ecwN367QJr
         zSZi5/dezsdG6bsD/DFp1XK/oYLGZxfEDJ/u1HY9VYRqkMTJOqja4+D8Ek5bJbIWx7jJ
         R8eM8T2ou00zqEv/spPbq7C166Oouw0Cx4ThmrlXtPhTfBHeiDoyZX7sXhMiLDqR2HgJ
         cPpUhb2ndBzyguUeYnBPFzgiaerTfaL1M//QfFeBS28sIuMUjD89xhTwvFNYBgQAwD82
         kNKw==
X-Gm-Message-State: APjAAAUPZ/FtWg1bmZbSSY1V5jm6lSa3uXWI8gJkwAKvojxosXwsI+CT
        +d/58H81Ux3ls+v7rMCP8UzsztKNfjyW9XI5ReKq9w==
X-Google-Smtp-Source: APXvYqxxpPX0MFg86Ybf9Btur1w6L41hbpJT1a9eqVSP6PVSeEyKabLCfrQuRI9zJM1kbI+LqUsQ9tji85rSyc7toy0=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr31572361ljg.62.1560589686938;
 Sat, 15 Jun 2019 02:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190612193115.6751-1-martin.blumenstingl@googlemail.com> <20190612193115.6751-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190612193115.6751-2-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 15 Jun 2019 11:07:53 +0200
Message-ID: <CACRpkdajXRXRFz=XpbEzwUb-crhBxNQ4f-m9rfdY6+HcG0+_gA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/1] net: stmmac: use GPIO descriptors in stmmac_mdio_reset
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     netdev <netdev@vger.kernel.org>,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Martin!

Thanks for fixing this up!

A hint for a follow-up:

On Wed, Jun 12, 2019 at 9:31 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 4335bd771ce5..816edb545592 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -97,7 +97,7 @@ struct stmmac_mdio_bus_data {
>         int *irqs;
>         int probed_phy_irq;
>  #ifdef CONFIG_OF
> -       int reset_gpio, active_low;
> +       int reset_gpio;

Nothing in the kernel seems to be using this reset_gpio either.

I think it can be deleted with associated code, any new users
should use machine descriptors if they insist on board files.

Yours,
Linus Walleij
