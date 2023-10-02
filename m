Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABB07B4C77
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 09:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235701AbjJBHT1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 03:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235729AbjJBHT0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 03:19:26 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C2BBD
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 00:19:22 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-493542a25dfso5764957e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696231162; x=1696835962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJYpofyuAEv4jvR+QfJqDzbesTQIm4BiLwBiP1RFTxg=;
        b=FD2cCmBvfbdxp2rLmRGjB/OdFADslsSKGVp42pVAxaeWvBZszsCx24W/Kf/JZlwFiM
         jmXKHNwLPquWnloEZgDT0Qgu3/qLuEaLJGf5CWPSQbuTMXUNkS+nZgFEnc0EmtDMv4G5
         oNhdzAczo3SAKu/rdINO48fWzDqmTg+Q9/XMrkdDpWjON2s1IJKoIQ45rwG+k8rxsiww
         F3SptW+aY75B1Eu+t+YjUBtZU5vfD20WIJgOzRClGNdqUsJaE4kzA5/9wXqtGQDv8qgB
         x+kKLxexiMva5x3RVrzqAS9/gxQDPsnMt8KEDkeGDkHRACtzCVdT2nLSQNHoyjIx9sQX
         Ny2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696231162; x=1696835962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJYpofyuAEv4jvR+QfJqDzbesTQIm4BiLwBiP1RFTxg=;
        b=hwcodTcKRGPNigS6o2epCSZlA5xwWbcrWRErs7NZ7eC1tr/MlnBPr7q2kqZ38tUJlR
         ewEr869DRUYwBEbH69ajEG7wNaB7DNbVxMyVn7HiOIZTCvflWu1qbCVmQ5CH6DIeQfbV
         DTmHVkCrBOGzqpKhGwXcr3EksI+Xjhc9/oio79TKkcr9+zU7krxsKWGHfX/objAUTRgP
         l6/h7ZH4WcImmhPKnGEPQIBhf7MW/ahYB7DZ8BeL/emzBmKz5zgtVSNO/xw3dHGA3+Jc
         m+JxPWvbJoJYapHom1lq4KucOQPJy/0VS2Z97XsjyGL2/xuePRy1w5XUY8qQ/adoSYeU
         qTmQ==
X-Gm-Message-State: AOJu0Yziji8Fj5tC7I24OQdA2lb0o44y//I85l7jjOL6JZJIGtOWn0+M
        ThwnujP6j80Z8LibemwqxYNUi8gH/J/lWekT5mzajQ==
X-Google-Smtp-Source: AGHT+IFzc+4NII5E+Bbq2HSe+Tfh0b+oyGG0oCJoYCRjhheamRaNHC0qOW9XNPegrbm7tafeSUWThKV2MC2+atCwOHc=
X-Received: by 2002:a67:fdc9:0:b0:452:829e:ac90 with SMTP id
 l9-20020a67fdc9000000b00452829eac90mr9154479vsq.28.1696231162035; Mon, 02 Oct
 2023 00:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-pxa1908-lkml-v5-0-5aa5a1109c5f@skole.hr> <20230929-pxa1908-lkml-v5-1-5aa5a1109c5f@skole.hr>
In-Reply-To: <20230929-pxa1908-lkml-v5-1-5aa5a1109c5f@skole.hr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 09:19:11 +0200
Message-ID: <CAMRc=MerAnyZd08S61YEn6Gu0VmK+KmNyChbtBuCfBpaUGFvug@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 1/8] gpio: pxa: disable pinctrl calls for MMP_GPIO
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de, balejk@matfyz.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 29, 2023 at 5:42=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:
>
> Similarly to PXA3xx and MMP2, pinctrl-single isn't capable of setting
> pin direction on MMP either.
>
> Fixes: a770d946371e ("gpio: pxa: add pin control gpio direction and reque=
st")
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---
>  drivers/gpio/gpio-pxa.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> index a1630ed4b741..d92650aecb06 100644
> --- a/drivers/gpio/gpio-pxa.c
> +++ b/drivers/gpio/gpio-pxa.c
> @@ -238,6 +238,7 @@ static bool pxa_gpio_has_pinctrl(void)
>         switch (gpio_type) {
>         case PXA3XX_GPIO:
>         case MMP2_GPIO:
> +       case MMP_GPIO:
>                 return false;
>
>         default:
>
> --
> 2.42.0
>
>

Queued for fixes, thanks!

Bart
