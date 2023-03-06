Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C326AB9DF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjCFJam (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjCFJal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:30:41 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C83E4EF3
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 01:30:40 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id l24so5935957uac.12
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 01:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678095039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhyyX7ZWIqaD4XJWfrQEGcT4OPAhV+9M2DUIH01bAjM=;
        b=BxIY+n3hZJbvFmPAco/8/4pLNRsYc7+UzkR+phx5GzbpAsGxD5K7OgaNt6P1WVoW4c
         tuuIERHPvirxACNyqAgKRi1L5QiI29VQ0xwtVt+gBCW1JNcDs6CPjgOGor/wmG8oYRJx
         d/FhsRdzxl1ls6x7HTQ6VptdpEXf82GXmGsFyFV2Zmk1Pqt6xSvI3Ur95y+TwreEwULH
         jQTdN9VO+MBy3JMmvLh9NtoShS0MYNe3xxRhVpAsP+36I6RAoV5741Y3TeLPKk9jbNJY
         IKnSsiGPhrHdpVazrnsj2OhIZ6YyCXr9hxbuwtlFZqkzNNwWoJ0sIHRmgOuIminBqOk8
         qC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678095039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhyyX7ZWIqaD4XJWfrQEGcT4OPAhV+9M2DUIH01bAjM=;
        b=SZWBlGWVqJy/n9ohSxgr0JjAL/7bp5uPbvXV3KirROVhTS99K05568Bf5mGg1PTwma
         /oZeYGxFzRZ3BRZWf/W+WJDSKuZUZ4rxlHYO5Nsy8mBxpAioVm/d/fylxbGeDHT0VgF5
         nj8LCUAUWPpsj7hp5Sxoa/FLM64f3d6Sd3UTRz7DYDTk63RStcjsxBLJ9yF4T5qSi5jS
         ysYgJeSh9G3IHs7f9pHjT0aOFEm7PQ2Vt+el5DYR7DJjtVkN9emH3nSugrgRUR1aJ5K0
         I11NNWeOtij3xYrGIFYAsx8WyVGe98v8CNKBCZHLCfTYUzWUaPL5dCmU7Irm/nQE5tAn
         OwHQ==
X-Gm-Message-State: AO0yUKW2EEyAagKVkDnceWWsfGOCJsf7NEIkyLPwJd17LeqqToZCYuCg
        EW4rRpjFQVg//z90Io8x3Y8iOd4f0vDIz2AlkinMBg==
X-Google-Smtp-Source: AK7set8CMBhXcjtepSzrjBUcNLPuzG9Y+Rwsp/XfbDsh+J892oVqowHZWGfFjH9unnRniQeDPRvXY57hqzaSglYRuis=
X-Received: by 2002:a1f:4a81:0:b0:410:4a2c:1e9a with SMTP id
 x123-20020a1f4a81000000b004104a2c1e9amr5791396vka.1.1678095039505; Mon, 06
 Mar 2023 01:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20230302125215.214014-1-keguang.zhang@gmail.com> <20230302125215.214014-3-keguang.zhang@gmail.com>
In-Reply-To: <20230302125215.214014-3-keguang.zhang@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:30:28 +0100
Message-ID: <CAMRc=Me3yVwQm8=CmUVM2gyYnFxntW47-OOPdmq1TzXTJB5ETg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpio: loongson1: Use readl() & writel()
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2023 at 1:52=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail.c=
om> wrote:
>
> This patch replace __raw_readl() & __raw_writel() with readl() & writel()=
.
>

Please say WHY you're doing this.

Bart

> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V1 -> V2: Split this change to a separate patch
> ---
>  drivers/gpio/gpio-loongson1.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.=
c
> index 8862c9ea0d41..b6c11caa3ade 100644
> --- a/drivers/gpio/gpio-loongson1.c
> +++ b/drivers/gpio/gpio-loongson1.c
> @@ -23,8 +23,8 @@ static int ls1x_gpio_request(struct gpio_chip *gc, unsi=
gned int offset)
>         unsigned long flags;
>
>         raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -       __raw_writel(__raw_readl(gpio_reg_base + GPIO_CFG) | BIT(offset),
> -                    gpio_reg_base + GPIO_CFG);
> +       writel(readl(gpio_reg_base + GPIO_CFG) | BIT(offset),
> +              gpio_reg_base + GPIO_CFG);
>         raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         return 0;
> @@ -35,8 +35,8 @@ static void ls1x_gpio_free(struct gpio_chip *gc, unsign=
ed int offset)
>         unsigned long flags;
>
>         raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -       __raw_writel(__raw_readl(gpio_reg_base + GPIO_CFG) & ~BIT(offset)=
,
> -                    gpio_reg_base + GPIO_CFG);
> +       writel(readl(gpio_reg_base + GPIO_CFG) & ~BIT(offset),
> +              gpio_reg_base + GPIO_CFG);
>         raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
> --
> 2.34.1
>
