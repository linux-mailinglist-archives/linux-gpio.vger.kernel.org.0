Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2A1263BAA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 05:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgIJD5T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 23:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgIJD5R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 23:57:17 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6488C061573;
        Wed,  9 Sep 2020 20:57:16 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id nw23so6621953ejb.4;
        Wed, 09 Sep 2020 20:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+D12hGVwScuYyxWOHUH1+5ysjpRMewwxlzMDyf/Wpc=;
        b=ncxUvo1acHcF8r+VD2TvqZtMAGKG9IUqN1MWUk1S8vuZQK2tJYl7rtKPRfWM3FE+cW
         MjCQyLN1I4qJztPKyBb6+giQbVg4l5QQvwL9Fkf0cLUfHeoT4oDB7PTS/r8VqNhM8gDW
         zjFmqgjyrFFpY6fQj8givVovWGzUH6JrowmPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+D12hGVwScuYyxWOHUH1+5ysjpRMewwxlzMDyf/Wpc=;
        b=RuzmfWFl0nIQ3QHWKfHaV8W+DkJLQx1bERvc+lFkdeAzp1pjGzSIFSrt83TMpoSfqL
         sUCEBPaZoyZJhzqICzpCvqBeeOeTfcB4zSUaej6cGCYhDr9dvtGeS3mNY08rPZPYPE97
         IryaGLurDtSBnbv5S3GSvRtf6jbTl8TIx9lxuNJ1r79KZTMeCWr2xTMIK3aES4FeAiLp
         62Z13OQLiaomoeiSvfgxgd2x06IV3PU5A3PxajmWPkOVVsC9VwqJu0ZhW+ARIYl+tgL4
         3lUugXRH4aVEvBmZoKKKTPMP0J4fiEbG444x29e/n3b00jNdXmYeNned8TSZGHYgXjA2
         7cHw==
X-Gm-Message-State: AOAM53157TOjVDyBwT3MrgfsfSDxmQFIwwVXUR1CSK9T3j50D3Xx5xVs
        vFbtpg612LgRoXeFvMGXyPTMWik76xTJYH2MVPM=
X-Google-Smtp-Source: ABdhPJyxgIT5FVRYlESJqvho8jAdaQREuczgbp6vegxqirYKG53fie1HrraaFgLNUkCqk3UFhiPiQF4GMbPtQBShrUQ=
X-Received: by 2002:a17:906:b6d5:: with SMTP id ec21mr6513096ejb.396.1599710235338;
 Wed, 09 Sep 2020 20:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200715135418.3194860-1-jk@codeconstruct.com.au> <20200715135418.3194860-2-jk@codeconstruct.com.au>
In-Reply-To: <20200715135418.3194860-2-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Sep 2020 03:57:02 +0000
Message-ID: <CACPK8XdOTorJcNSON--LZU8XkWLh5kwXc8fkGWOBmXVnFiCnSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio/aspeed-sgpio: don't enable all interrupts by default
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Jul 2020 at 14:06, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Currently, the IRQ setup for the SGPIO driver enables all interrupts for
> dual-edge trigger mode. Since the default handler is handle_bad_irq, any
> state change on input GPIOs will trigger bad IRQ warnings.
>
> This change applies sensible (disabled) IRQ defaults.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index 927d46f159b8..23a3a40901d6 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c

I've re-ordered the lines in the diff to make it easier to review:

> @@ -451,9 +451,7 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
>                 /* trigger type is edge */
>                 iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
>                 /* dual edge trigger mode. */
> -               iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
> +               iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));

You're changing the trigger mode from dual edge to single edge.

> -               /* enable irq */
> -               iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));

And also removing the enabling of IRQs. This part makes sense, as it's
what the commit message says.

If you think a sensible default should be single edge (and I would
agree with that change), perhaps update the comment to say "set single
edge trigger mode" and mention it in your commit message.

Cheers,

Joel
