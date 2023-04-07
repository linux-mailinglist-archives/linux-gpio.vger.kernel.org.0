Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6022A6DAD29
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Apr 2023 15:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbjDGNLI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Apr 2023 09:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbjDGNLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2023 09:11:07 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874607692
        for <linux-gpio@vger.kernel.org>; Fri,  7 Apr 2023 06:11:06 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id y69so5587145ybe.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2023 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873066; x=1683465066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8dHsb5zeq0taA3BZ22wsmPN3jNuj4ynCop/YpYKFSA=;
        b=mD9/MesNQhagc/BLkXuFPoE3QGBWcfZIdlrOYWPi5YzJGmbCWVmuEYCXePdVKgNJWK
         QFQX8yH2WMu9a7oqR1JQQHjoPMdCKQuRiZonLLQ/WE44QTTa0E048xFHeoX/uXyAJB51
         jcURtaO4atl7iDgOV1zE1X+O1aUJ4VtGHU43pBxAb3zc05OgWIk1rQIcrPRj84vctFs0
         et2O0yV3BGs9zFvbzsZdvW42iuhU97ZOI7/BDGMdYYvhtOkX68WGG0/Tcwagf5E5ib/h
         wsCt54sxQmO1aa2QQNtZkFjCQZZzP+3QweCIntyKwXWnkd2auUhfF+CPQGoopHd/xyvC
         YCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873066; x=1683465066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8dHsb5zeq0taA3BZ22wsmPN3jNuj4ynCop/YpYKFSA=;
        b=QJJW5M+BlJMEL+XsSJqLxWV+SHSVkxawB3NhCgoQ1gdoATsB9ae4LTZH25WPCtMLrx
         kxADPCvZWg8fT0JCFpxpfpBLOqyLCX6N7izhSnjwhasOGzZWq1wXzAz4VJXM6MenmIjY
         TY3uS4+nMifTStQCQALUaX6N7jgU25Ux+JegH5XAleY8Vhfkzx2KKxeAmG/a+tH2vzjd
         nfhVmzAKIWCsKv3Fl60p3bAh4izuT3hX7s/fXnawmsiSaubSDIAvNsMa7Wcpc97RBOF8
         RFzp0uie3N3eo7UTFen60irZjjOb05eHmrVddi7lGjrZsMvPxSiOel9Mj8YUeie8xmE1
         Ny4Q==
X-Gm-Message-State: AAQBX9cUCgJ2hveWVXzLGih1ldYTDXeuX39jyiEWnjtSjIlmhcIKAi/S
        5bCnMh3jv9yqfPjSkATsdquI7gK/yWx03IkEWwTg8g==
X-Google-Smtp-Source: AKy350bpnn3ouh2EF8DyBoSaNLL2iIUmYRmZHLZCAsB7j1oUL6EPcr61V+BVgxQLimgY6vnce0rga7L0+KIG6FMoQ0Y=
X-Received: by 2002:a25:d114:0:b0:b68:7b14:186b with SMTP id
 i20-20020a25d114000000b00b687b14186bmr1499326ybg.1.1680873065744; Fri, 07 Apr
 2023 06:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-2-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-2-1883c1b405ad@baylibre.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 7 Apr 2023 15:10:55 +0200
Message-ID: <CAFGrd9qMuE=kuXK-A+xN5CZfu-8umG61JPNzmgHbbMsdo3OQ1w@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] arm64: defconfig: enable Mediatek PMIC key
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
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e4cb65889ae6..91fad635e565 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -406,9 +406,11 @@ CONFIG_MHI_WWAN_MBIM=3Dm
>  CONFIG_INPUT_EVDEV=3Dy
>  CONFIG_KEYBOARD_ADC=3Dm
>  CONFIG_KEYBOARD_GPIO=3Dy
> +CONFIG_KEYBOARD_GPIO_POLLED=3Dm
>  CONFIG_KEYBOARD_SNVS_PWRKEY=3Dm
>  CONFIG_KEYBOARD_IMX_SC_KEY=3Dm
>  CONFIG_KEYBOARD_CROS_EC=3Dy
> +CONFIG_KEYBOARD_MTK_PMIC=3Dm
>  CONFIG_MOUSE_ELAN_I2C=3Dm
>  CONFIG_INPUT_TOUCHSCREEN=3Dy
>  CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm
>
> --
> 2.25.1
>
