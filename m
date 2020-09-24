Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4841227723F
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 15:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgIXN3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 09:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728000AbgIXN3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 09:29:39 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0DEC0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2020 06:29:39 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id e22so3378586edq.6
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2020 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ack5usJY82qok0CVPeYa04s1D7+5FOkh6o+EcGBMn0=;
        b=q+QmDSiB7buv9pXsU0KcGmBJ+0uS1iapTnt6Y4txLn3HRLB2SE14tTNaEgswDoYW8u
         +GRzeOoKS9+1s/KeNJ4g2Fl304MJTQaGv1SCbFa3Rw1If3IiKeguEmfljIroH7g0Y0Qn
         RXVUPbF3IVxgOCG0QAhuy9Xo7u6xJdhX79yaYrkssjEz660zA851RlJHtwDUlHBBn7+v
         4tSbFUX65NR8N9J3LPKL0SfUJAtFroJzN1YA5co2w4zwsBDT15w3H2vC5W1skoylZgMT
         GcX22g7xNjZ36zfnW7gtLZ+CiWVocq6YcIPm24XkqYEVuEG/beCbAMT54xKhp/HPvej6
         bb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ack5usJY82qok0CVPeYa04s1D7+5FOkh6o+EcGBMn0=;
        b=ZzJ1e/VIwLBqAEovHJtPtcR4veTCoPlHpRC/M4jhNnWhVQCW7xxg0TCY2h2VPTTSvs
         MuqMRHchKcTWmtwhmduDc/GuLTjy9nCGFIQQ3j7RX8npw6+GFCszQtFtF4aL0qEQfJad
         qG0n2awXNdyee7JQpl+s/F8HMOPiPcd4ieIDtKzMzam7VXIz8i+8Bxus2sbk86k4by94
         +2w+PuKsP0BjYj8lqsbYHYNMYD90YbaBv5/dQ1kCv9hgWEWfnfhOZtavLDHeft2ARnaQ
         4L5A5iUToWUfBLkEx2izDcuMn7ONuLbekIBLPTHR1c5Pbhd7F71Wp3/C7OtMGekFC20P
         ziKw==
X-Gm-Message-State: AOAM533oXR3JklKu3YDMIHafbCPw7CQZWkol7t+892pNdq4qNPoOB5nm
        6lW/4gG/YjvOMEB91UxZ8+owsLVGeWOBvvEzxR9F8AfBGpY=
X-Google-Smtp-Source: ABdhPJwl/j0ltBpCUcdDqAq6XNpida1G1b0/+2v2aXVXKTkMpJpPXN9ff9Q1ksZA43nB6zKjZTHie+7Koa73lbqo75g=
X-Received: by 2002:a05:6402:b0f:: with SMTP id bm15mr1046180edb.388.1600954177782;
 Thu, 24 Sep 2020 06:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200920203430.25829-1-lists@wildgooses.com>
In-Reply-To: <20200920203430.25829-1-lists@wildgooses.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 15:29:27 +0200
Message-ID: <CAMpxmJV0jwLAn3Xee_3zDiF_DQF-8uy52qxU1WAbr9xiVb0WLQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-amd-fch: Correct logic of GPIO_LINE_DIRECTION
To:     Ed Wildgoose <lists@wildgooses.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, fe@dev.tdt.de,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 20, 2020 at 10:34 PM Ed Wildgoose <lists@wildgooses.com> wrote:
>
> The original commit appears to have the logic reversed in
> amd_fch_gpio_get_direction. Also confirmed by observing the value of
> "direction" in the sys tree.
>
> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
> ---
>  drivers/gpio/gpio-amd-fch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
> index 4e44ba4d7..2a21354ed 100644
> --- a/drivers/gpio/gpio-amd-fch.c
> +++ b/drivers/gpio/gpio-amd-fch.c
> @@ -92,7 +92,7 @@ static int amd_fch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
>         ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_DIRECTION);
>         spin_unlock_irqrestore(&priv->lock, flags);
>
> -       return ret ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> +       return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
>  }
>
>  static void amd_fch_gpio_set(struct gpio_chip *gc,
> --
> 2.26.2
>

Can you add a Fixes tag with the original commit?

Bartosz
