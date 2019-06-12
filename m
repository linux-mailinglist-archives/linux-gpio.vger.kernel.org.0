Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1706425E7
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 14:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439023AbfFLMc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 08:32:57 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37651 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436805AbfFLMc5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 08:32:57 -0400
Received: by mail-lf1-f68.google.com with SMTP id d11so4119942lfb.4
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 05:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RY94QzNQiSIY9OS6+U4U7Y5OtGWNMofbaKCtbejPZUo=;
        b=Gv4E4rBN3zXJMLR8rQaTB6Aq7wKMK+v30MeCaaYbUhvKZKSNXbISiVB1bxMqmXJHC6
         2xvdtmuC6gHizZEBoF/ZQ7Z089ktc4qL2tfqceiki04D0m8ek46ye21HR3nDMcoZy92b
         H+a5kSMnMZxv4D1gZ1us+OYM1zJPD6vlnkS0MGuWicXNrymcaHKEQOsLWfHnoq52H8I9
         +iBEheJo9VOdgvPF45EOBBsjWxiLYHC+N+qbPDLy4DOFxuf2KM6+yYtuunfrqNLcLgCU
         5l+KFD1tXu6y9BjDPLhTvOMwwXWY90YscmemdlcBztcTEctNvDIHlMaVoAG25CMDys/9
         lZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RY94QzNQiSIY9OS6+U4U7Y5OtGWNMofbaKCtbejPZUo=;
        b=tmEYRMPKPkCSvo1tkr9uw6d4anxJgLztaq/+ba5b3SjTMQOvM8HpIImA57KrAhDF8L
         jdc6SQR/k2oCQQipQj5MilNMq6MloRQiU2C1TOaVB0HBpUFyUcWfo91wNxz+X+qGvIX5
         CTgzkR4oG5P8yf+vIK+cx7rZMrmMLM37+n+tBLf3a5q255Tf3AeQjuzSc3mX92lDUC5k
         cnPg9VzxChH9ScaNKKCEV6Je57go0D7li+UI+TyPpChtzw189e/qBy5gVL7mr0Z5bFSz
         /sbsRJw0ih7Tw9actKNNmCbPEnjLQkUXeXiFPjVGW5TXUPLcu44qIAD9pDvEkHAlcvhM
         mLnQ==
X-Gm-Message-State: APjAAAVlWZfZWyvytjfDEquhVtFWC+Tdi78yy19wmAcltQl+rksuVb42
        T034JNK6pjEmRR7D3YGnVomPMkH54FaGLTKNMhTJeg==
X-Google-Smtp-Source: APXvYqziASDeIuDoNfT01AzUpb/Ihc11W5Iyq6Kl+XFlWwVNcjQGPwFkVZ5ya615zk2hSyIw7lfpZQ5Rn3VQtdnXGfs=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr39417835lfu.141.1560342775269;
 Wed, 12 Jun 2019 05:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190612063352.5760-1-tony@atomide.com>
In-Reply-To: <20190612063352.5760-1-tony@atomide.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 14:32:43 +0200
Message-ID: <CACRpkdam8pMztF9=yL2rWGFqjUnURf5x=v40x7UKVEwXwZ5anA@mail.gmail.com>
Subject: Re: [PATCHv3] gpio: gpio-omap: Fix lost edge wake-up interrupts
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 12, 2019 at 8:34 AM Tony Lindgren <tony@atomide.com> wrote:

> If an edge interrupt triggers while entering idle just before we save
> GPIO datain register to saved_datain, the triggered GPIO will not be
> noticed on wake-up. This is because the saved_datain and GPIO datain
> are the same on wake-up in omap_gpio_unidle(). Let's fix this by
> ignoring any pending edge interrupts for saved_datain.
>
> This issue affects only idle states where the GPIO module internal
> wake-up path is operational. For deeper idle states where the GPIO
> module gets powered off, Linux generic wakeirqs must be used for
> the padconf wake-up events with pinctrl-single driver. For examples,
> please see "interrupts-extended" dts usage in many drivers.
>
> This issue can be somewhat easily reproduced by pinging an idle system
> with smsc911x Ethernet interface configured IRQ_TYPE_EDGE_FALLING. At
> some point the smsc911x interrupts will just stop triggering. Also if
> WLCORE WLAN is used with EDGE interrupt like it's documentation specifies,
> we can see lost interrupts without this patch.
>
> Note that in the long run we may be able to cancel entering idle by
> returning an error in gpio_omap_cpu_notifier() on pending interrupts.
> But let's fix the bug first.
>
> Also note that because of the recent clean-up efforts this patch does
> not apply directly to older kernels. This does fix a long term issue
> though, and can be backported as needed.
>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Ladislav Michl <ladis@linux-mips.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Patch applied.

Let's see if this nails it.

Yours,
Linus Walleij
