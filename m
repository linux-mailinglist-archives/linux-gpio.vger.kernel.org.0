Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEE1724815
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 17:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233338AbjFFPoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 11:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjFFPoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 11:44:05 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E08F100
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 08:44:03 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1adf27823so59878671fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686066242; x=1688658242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEL7N0xABt5lwW2BNneMngEG2im8DPkGRrkGXcmCmFE=;
        b=c/fuJoG3OR34YXhbhDyWdahDHUtp2lekJSM2rGS8cebvmkCSQ8M21Tl3KggiFUjavX
         EBM6soblQ3QChwIj1aXGCBfDcwugHnu9uN82wGL5RkFCp5LmCYF80HVNNgJ606znzKi+
         HO8709GveI2WjuX5Ba0zecziWsvHu1ttXTC0/Xp2Htd2YYQLtmdW6jqYZAd6ZRu9A4Ta
         GdjZL7oFfmtefp33c2mQp31w+rejk73z4oZIarbPQcu48elAaMC1+cqz0fcMvhBTvdY7
         DA+o15dxtHixvT0fD/Oa9mCgENB7wXqw8WU/AWO1k9lWm/pjA9lES4BAr3v3phMqSE5X
         LtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686066242; x=1688658242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEL7N0xABt5lwW2BNneMngEG2im8DPkGRrkGXcmCmFE=;
        b=QzswyaU8l59c6nFZxFw+To1B6OpfqWCfXSn2dS8P00QpppV/XXtgA9533YHEzn9mZt
         2HxE+IWfqfn5Vtui2Ymcf8TWENFiIKY0TEpKmjZDYLkJC3uheMdFJ9F1VGvUceoDIl89
         tvgNuotdAIgpXlwFN3dJFJDKscJn+Q7u6FX+KXQS5oxPQZZtqPowXPiVmJmB+y7UZAxH
         lpf8Vhni8inBflKrDlzwaRPI6lEEp9wqMK1dK05sCaeYdAA3fnJpHdFLawlSkbqOiCyo
         oFnS8dhS4vz8ndb63WymU8KoXlaUQEYCxSzVbrAgxPFySGEZD1ngfuaHk8rFKFYGxSb+
         B+zg==
X-Gm-Message-State: AC+VfDwryoPDjOzyXnMsxl0nY6UAp375M97gGSK5gcZgI45KECRkAlcf
        LWWcpsaByVmLrqjt7blHuG2ud2CU+PSuwUiYXcgEuqcrQQFy9aAZ
X-Google-Smtp-Source: ACHHUZ76TwCC8/bPVQTChMClfy288Z4nIeiy2u/xVeHNdL8bJyzAkjbnddDdlXZN6+kzn/yz/jf9nMLqajSDRF1SSqo=
X-Received: by 2002:a2e:854b:0:b0:2b1:cf7c:a892 with SMTP id
 u11-20020a2e854b000000b002b1cf7ca892mr1280324ljj.30.1686066241847; Tue, 06
 Jun 2023 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <ab68df6b056a3b381d1d53cf1502e814812c4f96.1686045675.git.geert+renesas@glider.be>
In-Reply-To: <ab68df6b056a3b381d1d53cf1502e814812c4f96.1686045675.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Jun 2023 17:43:49 +0200
Message-ID: <CAMRc=Mf7hm298NjPrSKYHQosB=M3Y3CaPi+DVt56D_yrYSCU9A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-delay: Spelling s/curcuit/circuit/
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <linux@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 6, 2023 at 12:01=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Fix misspellings of "circuit".
>
> Fixes: c7239a3da1628767 ("dt-bindings: gpio: Add gpio-delay binding docum=
ent")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-delay.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-delay.yaml
> index 7c16a4e1a768ef72..1cebc4058e272660 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> @@ -11,7 +11,7 @@ maintainers:
>
>  description: |
>    This binding describes an electrical setup where setting an GPIO outpu=
t
> -  is delayed by some external setup, e.g. RC curcuit.
> +  is delayed by some external setup, e.g. RC circuit.
>
>    +----------+                    +-----------+
>    |          |             VCC_B  |           |
> @@ -30,7 +30,7 @@ description: |
>                             GND
>
>    If the input on the consumer is controlled by an open-drain signal
> -  attached to an RC curcuit the ramp-up delay is not under control
> +  attached to an RC circuit the ramp-up delay is not under control
>    of the GPIO controller.
>
>  properties:
> --
> 2.34.1
>

Applied, thanks!

Bart
