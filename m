Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103542CA64F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 15:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391467AbgLAOvF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 09:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389791AbgLAOvF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 09:51:05 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B12C0613D4
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 06:50:24 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id qw4so4591147ejb.12
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 06:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u11hnNgXTS9zHw9F1VKspmTAQsvSEt7QVrPJBjDHu6g=;
        b=M6aCuNhUcEkKmxd2/vopzwE3KJ+WxtGAgKPzeagXFjrrmNAkATleXsRB/oZM/db+dt
         ls2r4BhXUW2CdPXcopCP75b6Lc8PeGrN6y2MV1V+OEikX1tCgtSTAaov149IlIMU1+P2
         1umLDMyp5eZZm8FyqysZpP8Z0FIHWVGSg5twL6zjAVagJTQeo5pjd5YF9csMisiSVwTM
         kTsWUlW2dgQ4h+H5/Y2oA5uQcayqKSuG+TVNxW2ltAM96/x4tHzSC86aFdA0ubYT4uXu
         ehUSpDUW6w5aASkXX2LO6oFFKZ17FdtCaKdq3F959IqbAUMydq6RsktatxMoU3Q6hVXK
         Qivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u11hnNgXTS9zHw9F1VKspmTAQsvSEt7QVrPJBjDHu6g=;
        b=BT5EYieRLw4FIL65709uIpr7H4dBGhD650+Q6qNu/bIKObP28T+pmzBElOY+Qd2eYe
         yOdoAJBWb+yYOxs6u4rs9PXwtw6lpzp44oFAKzHv2sdAg7sJ72QMJqdff5nPzTb0GD7t
         6CpKbDW7Vrjel/2o8iMTXdHgVb8AXMV5mWRSINtqL1+3aGGBMP9j5d7nzLujH6nKgCzj
         8xksj2njdNKdl4RBGfPR7X1MxZe2qMhbIu5C8H4JQ3I0vp7pr8oYukRFy+x0ioNG+9BZ
         g5EhiNYFh2+zNlYLyq6R6RR610qaEz2rNKgDDRZFnT6uXWQqyQD1c6sLuodYkjXg6bYP
         NLzw==
X-Gm-Message-State: AOAM532IE7bN2dfboR/+uLARvVPRv6isu/LsOIweoGKV85YUa5iFxb/P
        FiUHlMllsQKCBYKcZC+GZixZYcpw/pQOWWSA4aE6pg==
X-Google-Smtp-Source: ABdhPJwG0IqVrtCOsiapz9tOGvEqeMur8iwjMo+Odo3ubld5i/SHRYQZyOqybTSa9RuzGktyWVLOruBXRsHV2wJcHmo=
X-Received: by 2002:a17:906:15cc:: with SMTP id l12mr3193264ejd.363.1606834223625;
 Tue, 01 Dec 2020 06:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20201119170901.GA22703@embeddedor>
In-Reply-To: <20201119170901.GA22703@embeddedor>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 1 Dec 2020 15:50:12 +0100
Message-ID: <CAMpxmJXD+qiJLoEdFxmceVNyXPDfmvKPwG+SthOS8oHd2GqLuA@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: ath79: Fix fall-through warning for Clang
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 6:08 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a
> warning by explicitly adding a fallthrough pseudo-keyword to indicate
> that the code is intended to fall through to the next case.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpio/gpio-ath79.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
> index d5359341cc6b..678ddd375891 100644
> --- a/drivers/gpio/gpio-ath79.c
> +++ b/drivers/gpio/gpio-ath79.c
> @@ -123,6 +123,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
>         switch (flow_type) {
>         case IRQ_TYPE_EDGE_RISING:
>                 polarity |= mask;
> +               fallthrough;
>         case IRQ_TYPE_EDGE_FALLING:
>         case IRQ_TYPE_EDGE_BOTH:
>                 break;
> --
> 2.27.0
>

Applied, thanks!

Bartosz
