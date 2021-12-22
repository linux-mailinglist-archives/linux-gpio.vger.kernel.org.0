Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A199147CF06
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 10:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238878AbhLVJSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 04:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhLVJSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 04:18:44 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E6BC06173F
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 01:18:43 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id b13so6026751edd.8
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 01:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWSjPah2c2AaRSP+2vHU6yInVlSDXI70ImIfpbXN8E4=;
        b=pxusAbbWkBP8vA3FVas18AbqOH3j0+P39gHD1PiNPE+veMjKeURYaGR2eFOeBB01PF
         8Fj+NJU2IougbIMEWqzIy+ekGrkV++QGSTrw2itZd6TzRtUkmHeuSg7WswBRKf9NQPYx
         eah3fr/rMVIakHtSBSAf3LQqOFDI4IzYO+PsqUT1BtypJ4FL+reEw8D6HK06IGC7M1y8
         peOyuf7CT5cb2Jti3eQ7JBlGp/xP9HfCtRopVV1SfHep7KQ9yOSOppztuoGgUw1gkxK8
         nOVDsUwekpzbqXxNCZKSBkPpCnUV4vWpGYpMSnpX7YFe6dnLU2ORnAiA0Y8iCdOcsjw8
         8Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWSjPah2c2AaRSP+2vHU6yInVlSDXI70ImIfpbXN8E4=;
        b=Et31u1OzpmiD7XvDgcpeoQ3dBxvn8DrzZX7u9pgNPOrUhdN98b8SKickI8kGTgq6ph
         qMwptMp6wX60d6XykjynKdrM0809EvooUWp55/NdrcN6LnS5/kRLT1EAPEkS9uG41W90
         xxmBk8YEu5J/PrVkR3yyaLu6T0lfmy4Jig87LbEKn+t1vKytEF2i2hr0Ed4yQi2doJtv
         5Z6Xgi3/RFTiUlWvnahxrd/YoEeG8hdPX4ZnitbY1gIUPiNRfQa2xsfNlbRt86kziFnt
         CaIcdjCJInpZpCXtOBNKIWc1QZc7O1omGNOVP8I9v3MvIe4cjQbor9aTBEnyczqjtqmE
         oK7g==
X-Gm-Message-State: AOAM531TcAX1jBzARILdDxZQb7tFjA2lLMoqCCeDUFuKQ0HW6wa5PoV5
        oaVeKwRBvJenBhTgHpluFNHdcc5vfZRgaQqpPKvrAg==
X-Google-Smtp-Source: ABdhPJwEJev27Pc2q/Iq5MO4SuuzrQ73ie5VYbxYb/YHRh5CcCGKaz0WlKP0N/rYQvL7TgMmI9IsLY1BsrhRpNwgHe4=
X-Received: by 2002:a17:906:2ac4:: with SMTP id m4mr1789058eje.734.1640164722465;
 Wed, 22 Dec 2021 01:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20211214040239.8977-1-steven_lee@aspeedtech.com> <20211214040239.8977-2-steven_lee@aspeedtech.com>
In-Reply-To: <20211214040239.8977-2-steven_lee@aspeedtech.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Dec 2021 10:18:31 +0100
Message-ID: <CAMRc=MdAgK7zKuJ=7cA2T-mSTJD3tWSW2aEB6G=0Tz4X+iHcZQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: gpio-aspeed-sgpio: Fix wrong hwirq base in
 irq handler
To:     Steven Lee <steven_lee@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>, ryan_chen@aspeedtech.com,
        billy_tsai@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 14, 2021 at 5:03 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> Each aspeed sgpio bank has 64 gpio pins(32 input pins and 32 output pins).
> The hwirq base for each sgpio bank should be multiples of 64 rather than
> multiples of 32.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index 3d6ef37a7702..b3a9b8488f11 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -395,7 +395,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
>                 reg = ioread32(bank_reg(data, bank, reg_irq_status));
>
>                 for_each_set_bit(p, &reg, 32)
> -                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p * 2);
> +                       generic_handle_domain_irq(gc->irq.domain, (i * 32 + p) * 2);
>         }
>
>         chained_irq_exit(ic, desc);
> --
> 2.17.1
>

Joel, Andrew: any comments on this? I'd like to send it upstream tomorrow.

Bart
