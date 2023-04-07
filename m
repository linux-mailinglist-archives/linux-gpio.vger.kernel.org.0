Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003EA6DAD39
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Apr 2023 15:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjDGNMd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Apr 2023 09:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjDGNMc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2023 09:12:32 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EF47ED5
        for <linux-gpio@vger.kernel.org>; Fri,  7 Apr 2023 06:12:30 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5491fa028adso298802307b3.10
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2023 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873150; x=1683465150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogQ5usDGrCKMp6sdTMfv6hF4yE9d0BXCPBRsX3VFOJg=;
        b=P9gZnXO27CwpgcUfdKWvFIDMy/W3wouPPvS5NhKMlQ31/HlgFF6HmqZAW4LxrKdDm2
         MCSHoLXRiNShIve9a/IAvQ2YjsHF3NUtLutP+Qmhs+M5YaGP1dJu5AHhWqrp/B/LTnQf
         O5mEL7f7/cbD7pR3igsBtPcLMaSbFHoUAlAOTbIE/4j2CoWpjL7mrRh3Se61Aafz9k9H
         YjLK9sMIFV1yQkY5PsSntO4Y7X13C/RXAFiMnsC+tus+ViauzcfMB4IyaiZoJDqYBiZ1
         GbDdUY1PwLSY0mdkDv1eReYn/2IKX0kdWWPdwQchrLGIGJt2O9iAQ8eKfBIG43X6YCuS
         dz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873150; x=1683465150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogQ5usDGrCKMp6sdTMfv6hF4yE9d0BXCPBRsX3VFOJg=;
        b=jDlK6B+nY9XVhXU60Gre8UZhfvkxD5RhNaPqfcjYqUYX6yUlc2LGNWnWAfpWYl+xmb
         E5onBulK9qAYPW/GiH+NhRTK66+hQXJDIC2A7h1LYqlosUI0XVFgHkLcgzV+mXGszxMi
         sQhpv+5DVg4hbm96juMX6Apxe80+go0RSsYXpSkp50YzRwE4xMFc87IpD+qEnc4q/BAp
         R3TuuNXG+AZy30w/VohyYb380mDLqEJyBPiuUZfyKHRqm4+EeNIY9qO6pj77i57CsmdA
         O4DwEHaOqr4gtxdYKKHPqjS9BGPK8ODjFcJ5bei3F4vEI17KhdjLG8nF2GYMO0sK2HS3
         HmBQ==
X-Gm-Message-State: AAQBX9f3xiuYBA8XHM1/l5ihAlS/Sr7enmP/eDXe1QosbUpza4q319A3
        gUl6Tf7JSqoPWXcOEY/9BpbXhsPVE2FrOPAdnMwCUQ==
X-Google-Smtp-Source: AKy350a6iLgXjWlIFd9DThiMyVaE47Ir0ycsgta9477LJp6DoDsN83S7+YnAB9ANVsDi2u6A+bcIz6yJ9JbuVxehUZE=
X-Received: by 2002:a81:af65:0:b0:544:b864:5532 with SMTP id
 x37-20020a81af65000000b00544b8645532mr1033760ywj.3.1680873150121; Fri, 07 Apr
 2023 06:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-5-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-5-1883c1b405ad@baylibre.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 7 Apr 2023 15:12:19 +0200
Message-ID: <CAFGrd9oKiyJE_313MEKLf_PeWreg8gs92Mntos1C13_B-m4Ykg@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] arm64: dts: mediatek: add mt6357 PMIC support
 for mt8365-evk
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> This power management system chip integration helps to manage regulators
> and keys.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boo=
t/dts/mediatek/mt8365-evk.dts
> index dd7da86420cf..a238bd0092d2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
>  #include "mt8365.dtsi"
> +#include "mt6357.dtsi"
>
>  / {
>         model =3D "MediaTek MT8365 Open Platform EVK";
> @@ -94,6 +95,12 @@ &i2c0 {
>         status =3D "okay";
>  };
>
> +&mt6357_pmic {
> +       interrupts-extended =3D <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
> +       interrupt-controller;
> +       #interrupt-cells =3D <2>;
> +};
> +
>  &pio {
>         gpio_keys: gpio-keys-pins {
>                 pins {
>
> --
> 2.25.1
>
