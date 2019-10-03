Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF61C9992
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 10:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbfJCILF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 04:11:05 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38105 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCILF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 04:11:05 -0400
Received: by mail-lj1-f195.google.com with SMTP id b20so1623094ljj.5
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 01:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YZavFxLBzGEeyG9QWkLSKjn8gSqENhIGofh7Iddum7w=;
        b=vs5jTZo2SJ1QezACbFB+MYWl6lzIcQJDbU3KafKeM1cG5GfhiBzYm7ycjiGVhEvy5b
         W5KjFnuzBUIDutLjtYBLAeeOfvjjDNNlPy7qI+5XsJx/uTKxfK8ZJdM5CVr7vVZ8bfFF
         taOIN/8x8fLJI8JOBi/iD2GSCusTzhP1j+JKxmu+VUYJjevgDn7FtEyh56laYh8VBVnT
         Fcj/IbpdyPZGOkYQxx2LBM2c87ZL5vlXvasAqVzmAwo6wAxNbDoz6eqYOtMjz6IfYB16
         DEeLUKaIUGvpxvkbRWRUStHDhv/h97ja7D6vAgWwGj5hvwug9Ueh6Zak4AdU7lC28wrC
         6Jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YZavFxLBzGEeyG9QWkLSKjn8gSqENhIGofh7Iddum7w=;
        b=k4de2+TO5MeeDYEI/P9T/XciDz8hN/JwteuUEvJAm+NF977EPbDHp1qelxOsg4ejDQ
         iwy3pDQb6V34FrnASJTDr6N01oQZr2977Vnl0kPgeEd6z2AWbst4WC/BeJhZ97TZ3/U5
         Dlpt3+tTOCoQg2DoXC8tBtcQuMT61j6AMefiwFxxpONQLM9ZfAQsSLdgo3SxCuCh4fL3
         mHKXsSF9WxiCPlEu42UcTEyTmjw9E/Ipj/In8xElJitN6UwAAdrOpZ/upG3cw/z6zgLt
         /+iSUvwcYDO5MRBYVn+Fjs1f5EAwWyBY6sZ/OX+nK0q2/pGRGWay9CUZJmmG3lscgowX
         LjZA==
X-Gm-Message-State: APjAAAU3v5gQUhYqluBUbunaCGK1DbrHjtFZnZ1UnApylUrWVEkrQLON
        JBbqTtLZ8xGKUMkwUn5MccMgS4i2/q/sqFP/gemCWw==
X-Google-Smtp-Source: APXvYqyyIBjvuD6lRw79lIY6+d2agVW7esb+jyStei9FEmReZAWYVbSNWa9Dw2DroFLkIXlHmm2vvNdX0lW+VJjmvOY=
X-Received: by 2002:a2e:63da:: with SMTP id s87mr5167256lje.79.1570090263168;
 Thu, 03 Oct 2019 01:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190918113657.25998-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20190918113657.25998-1-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 10:10:51 +0200
Message-ID: <CACRpkdaWtppOpbGb4Fj8cpgUkVw7ncyjiN1E1ytxUF3Zp_CfUA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: at91-pio4: implement .get_multiple and .set_multiple
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <Claudiu.Beznea@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 18, 2019 at 1:37 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Implement .get_multiple and .set_multiple to allow reading or setting
> multiple pins simultaneously. Pins in the same bank will all be switched at
> the same time, improving synchronization and performances.
>
> Keep the driver future proof by allowing its use on 64bits platforms if
> they ever appear with this IP and we end up with a mismatch between
> ATMEL_PIO_NPINS_PER_BANK and BITS_PER_LONG.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>
> Changes in v3:
>  - Add ack from ludovic
>  - add comment and amend commit message to explain the ifdefd

Patch applied, sorry for the delay, merge window and stuff.

Yours,
Linus Walleij
