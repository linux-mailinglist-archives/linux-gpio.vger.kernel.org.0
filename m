Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D03456EC6A0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Apr 2023 08:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbjDXG5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Apr 2023 02:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjDXG5M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2023 02:57:12 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D7730FD
        for <linux-gpio@vger.kernel.org>; Sun, 23 Apr 2023 23:57:05 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-b95c3b869dcso13000885276.1
        for <linux-gpio@vger.kernel.org>; Sun, 23 Apr 2023 23:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682319424; x=1684911424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4rVcZshumczn0J8QZMiSz4nWQLMGsW4QsA9geh1PPA=;
        b=buZlt30e78vPJkSEFmf8lmXCZ1uZX9dH3B5V9mONRspwdpPld+xXEwYDnWh4FRw+dh
         eE7czF6607e7Zrk47RdSjzH0zBxmjP6kZk6KL7BlIaNkWE3roUolFQd5IuMPQcatsqyf
         iS+NgU7irDe/Jjfk/721+Mv2JUFHLpfU+/WU7/vbhNhdtRllmyZn3S5wxA2fdnu4FhrQ
         cLh63TFk8ded/NY9BP5JyVakpP6ywbilYcKGfbCZDvCs7p3IVdDxvW2xeJX+YCcL3thg
         1SyEGzIF0JXMTOcXPff7TvAPOi6X+DMPMFLoVjr9+EA47UUPzTBduFwOk5UGY2It5snO
         Kx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682319424; x=1684911424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4rVcZshumczn0J8QZMiSz4nWQLMGsW4QsA9geh1PPA=;
        b=DsDwX5uKufUcaa3YsOsXd9dai4Q6Otnf0vpmCmGXy8HgjVYS1tJC5c2NdK1bYb0gvp
         gwNe8BfwqznhZIir1KRtFotLyqKOy3FPeJ83r3Lt8U8zSjFXvfwV07DGO2a6N4zLS7Cu
         UMnqSUR0CYuttPF12m/pPR0adxgaY2BTXbFEUDiWLaDdL6RqsCk1UgZuW2IxMhL9mbJU
         4C1tt84Ul1wZBA7bsB9w1tPiVDiUmTeaEI1Bk/X/4saf0IjytFHVvaDflTFYw456ZAW+
         OqLXt1WNneT5O9kB/EjLOIiG2WLZvDmy8Ej4oBhEJIEIyvoR8ccPUpgaN9ZDHykQ5I34
         58CA==
X-Gm-Message-State: AAQBX9f681993Of/FigncARNVoixsqkN5YsuAjcQ1+Kjb7pANZXJzumw
        GXxEdSm+UTCPNTFNmpgOmbtbohJw665uqFs3Rsp9U/8Iw5EVTrJj
X-Google-Smtp-Source: AKy350YffJqK0pT1GhwDQLtpmeVrNxrfczJZxesqoD2mDLwyV6kJjwD/cHNa+DE68cImGXsQZkh7jhIMdbgpyOugyqo=
X-Received: by 2002:a0d:cac2:0:b0:544:9b15:e197 with SMTP id
 m185-20020a0dcac2000000b005449b15e197mr7959752ywd.20.1682319424426; Sun, 23
 Apr 2023 23:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <KL1PR01MB544800D7E51C9209A9BD998BE6669@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
In-Reply-To: <KL1PR01MB544800D7E51C9209A9BD998BE6669@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 24 Apr 2023 08:56:52 +0200
Message-ID: <CACRpkdZ8CVWb6=-sgK3BdW-ssivY1oz4cc_mYoXmyrBMLxsX=A@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mmio: restroe get multiple gpio mask
To:     Yan Wang <rk.code@outlook.com>
Cc:     brgl@bgdev.pl, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Yan,

thanks for your patch!

On Sun, Apr 23, 2023 at 11:07=E2=80=AFAM Yan Wang <rk.code@outlook.com> wro=
te:

> Simplify the code,should not modify its logic.

I don't see how it simplifies the code, it seems to me that it is
making it more complex?

> Fixes: 761b5c30c206 ("gpio: mmio: replace open-coded for_each_set_bit()")
> Signed-off-by: Yan Wang <rk.code@outlook.com>
> ---
>  drivers/gpio/gpio-mmio.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index d9dff3dc92ae..c2347ef3a4df 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -271,10 +271,14 @@ static void bgpio_multiple_get_masks(struct gpio_ch=
ip *gc,
>         *clear_mask =3D 0;
>
>         for_each_set_bit(i, mask, gc->bgpio_bits) {
> -               if (test_bit(i, bits))
> -                       *set_mask |=3D bgpio_line2mask(gc, i);
> -               else
> -                       *clear_mask |=3D bgpio_line2mask(gc, i);
> +               if (*mask =3D=3D 0)
> +                       break;
> +               if (__test_and_clear_bit(i, mask)) {
> +                       if (test_bit(i, bits))
> +                               *set_mask |=3D bgpio_line2mask(gc, i);
> +                       else
> +                               *clear_mask |=3D bgpio_line2mask(gc, i);
> +               }

The intention of the change seems to be to break out of the loop
when all set bits are handled, by successively masking off one
bit at a time from mask. So this is intended as an optimization,
not a simplification.

I think for_each_set_bit() is already skipping over every bit
that is zero, see include/linux/find.h.

So this optimization gains us nothing.

Yours,
Linus Walleij
