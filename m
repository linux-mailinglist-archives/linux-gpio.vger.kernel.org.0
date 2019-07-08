Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97EDA61E92
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 14:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbfGHMko (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 08:40:44 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33720 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbfGHMko (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 08:40:44 -0400
Received: by mail-ot1-f67.google.com with SMTP id q20so16045233otl.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2019 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m9Xg4Qn8tFnQxXrHl7OVjLR7fOy3SQFQX0fconzTi8c=;
        b=gtLtQGC2EpIv4b/GrB8wnBa+rpWBpDeQfQ1b5nD/XLMnH4YNOvW5wnU4t9Mu173Lu4
         x9TmbKsvuTJnL9XB1LjokqOIfWLfJhDCxBb3Bd0HUpZW5OLIqLxsDwR+InajemXD9Bxs
         9knn8OoqthnJ3qFFAkuo4+SmiPqk41oUBll/e6WN3CVEvSj3p/CLhZO6LDDXwCATPGj7
         St306kz5TwY0bTpfeS8FBMSuVh4iENDYDp3A7cp9Vsht0MpKDtPG5oOF5vnyGRQkPxfd
         f81bZKFV6U1RcxdyZWHVedzee7SXmxQ0ADbiQLHCqUjzL9U0in9Te0kptn/2fB3eiWpR
         DHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m9Xg4Qn8tFnQxXrHl7OVjLR7fOy3SQFQX0fconzTi8c=;
        b=QC3GHumvwLzcnfPWQL1MA6/uWD86ug42NDAug98Ex2o2ImDW2Jo15BE8/S1ckD5c2+
         082JD14SvgS19Evlc6Ou1F5eU49qzc1Yw/4oqFiuyLv47oR1MKWNFd84NAtDdIApPOlb
         TQuHYNv8Q6sU71bl5XNZ9NnsWceYJIycQPSBEsrkhvfLjvF162pPJIcfZT8JmtkZEAlW
         s6Ltto+aPyCABXHgxSqbZWyFbzeWJBdN1jCdHS1ArPUfvGdOpPszO+PBL2rGsvptyH98
         IcFqWxofLaCYyPG9s5zppyae+2LqSwqYFvNiXVYcCIQD5NY6LNtHRwBZLekBT/fIvaMc
         MJXA==
X-Gm-Message-State: APjAAAWvQS63KOxrxmJqt/rB/ov4v5r1TbooHYOaIzhhu/lOEJmDjvNG
        65qnQFkVlUeENo2T9Tu/Zyc/8BPRHGA4hoUBa5QJ+Q==
X-Google-Smtp-Source: APXvYqxa8WvfWz+f/PLMCb8cNku0Qczyz5yFtAv+JmsA4QL3EN72u8+PQd+QQ0TiSD+bjLhMmJPC5pck47jXa56ec1I=
X-Received: by 2002:a05:6830:1681:: with SMTP id k1mr14111089otr.256.1562589643485;
 Mon, 08 Jul 2019 05:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190706133422.3372-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190706133422.3372-1-nishkadg.linux@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Jul 2019 14:40:32 +0200
Message-ID: <CAMpxmJUX5Oe6yDyRbfyDOkxQyeuabbceF8Dt0uBOQA1TRjD2-A@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-of.c: Add of_node_put() before break
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 6 lip 2019 o 15:34 Nishka Dasgupta <nishkadg.linux@gmail.com> napisa=
=C5=82(a):
>
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a break from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the break.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index aec7bd86ae7e..c9325efc1783 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -154,6 +154,7 @@ static void of_gpio_flags_quirks(struct device_node *=
np,
>                                                         of_node_full_name=
(child));
>                                         *flags |=3D OF_GPIO_ACTIVE_LOW;
>                                 }
> +                               of_node_put(child);
>                                 break;
>                         }
>                 }
> --
> 2.19.1
>

Applied for fixes with a slightly changed commit message. Thanks!

Bartosz
