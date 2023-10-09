Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13DF27BD40F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 09:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbjJIHJu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 03:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbjJIHJt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 03:09:49 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C126FA4
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 00:09:48 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4576946ce96so441022137.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 00:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696835388; x=1697440188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhLRpwsuxmOsvcZ8fYOZy3OVA1IUIC5Nv3spoy9OsQY=;
        b=wYUiuaHCIt12QIXTNzhdt5t4QDYrHUIyDySxqGu8Dp15pVnX+Rbr9RiPTOhab6RAYk
         /7i8gp8cF6A7smr8CG+ppsSLrqDAidC+t0d7fEuUslJnLkWnajXL9RggEOVAdE7obDM8
         X+0cJVoIanT8pK+ZIkDKKdEjy4HDe1roINYe+1Q2/ZZpCRZ3mDIIqRAW7LcWA7/M5w9I
         s9PGPJYZwdyluHYGyZqF+cM55whXnyBlHB6PWHkYdylP0PtXac/4M+HHvUXzbA/spJG4
         4Q7NravOUjQ3rjC3FMqQqGKT3PwkhXO/tIAhr6v7ncWqaLrH1yFwR5icfYP90RPlmjYu
         UdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696835388; x=1697440188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhLRpwsuxmOsvcZ8fYOZy3OVA1IUIC5Nv3spoy9OsQY=;
        b=IOO7EX5rFvFi1aTFXEQxvpR8oQjqr3qQgJCUezINuE4H0/8Kegokv6EOmcmAOAPdUE
         sgyMhGwU0Wgwa9vzOZlCQq1JsKaGBPnD4AbyuIyR7IerNIV+U7KQ4A0MQgOSp9JO/gGB
         nUY/2ccixvwnkXg61bydhY0lE1p4xAh//ZNQ283q+eB4cAotT8m/dFDPhad2gYqiW3V7
         tWrlFNa4ZCIXqjgtxoLkKcTVJS5yi283XW4A7EfsG35+CyzFMZ717I563ybc0ZoSTGPV
         vWZ2no5yeB48c45ZnhxWEcwjikbgRwWRAr6q/YcQvCBY4JOIkzl3KOoaVIHcUNxokUuE
         JlGA==
X-Gm-Message-State: AOJu0YwXeihewv63fpz7nxjvGIPzgwlM2eQHAHmwS6mP5eL7DzghgvpG
        sATcze39yvuC26pot6q5LVX58+Wg6QeMJe6CrGJmvg==
X-Google-Smtp-Source: AGHT+IFVM96RtaqXDXXuEbO13aoAbWj6cTZzjGKLV4l0Aye+LflqahSU0J82oWNmTnQq4Qz8tRzJ+5XZbtX86Rgify4=
X-Received: by 2002:a05:6102:f09:b0:457:79e5:50df with SMTP id
 v9-20020a0561020f0900b0045779e550dfmr2089711vss.33.1696835387451; Mon, 09 Oct
 2023 00:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org> <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Oct 2023 09:09:36 +0200
Message-ID: <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 6, 2023 at 3:46=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> These gpio names are due to old DT bindings not following the
> "-gpio"/"-gpios" conventions. Handle it using a quirk so the
> driver can just look up the GPIOs.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 531faabead0f..d9525d95e818 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -512,6 +512,10 @@ static struct gpio_desc *of_find_gpio_rename(struct =
device_node *np,
>  #if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
>                 { "reset",      "cirrus,gpio-nreset",   "cirrus,cs42l56" =
},
>  #endif
> +#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
> +               { "i2s1-in-sel-gpio1",  NULL,   "mediatek,mt2701-cs42448-=
machine" },
> +               { "i2s1-in-sel-gpio2",  NULL,   "mediatek,mt2701-cs42448-=
machine" },
> +#endif
>  #if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
>                 { "reset",      "gpio-reset",   "ti,tlv320aic3x" },
>                 { "reset",      "gpio-reset",   "ti,tlv320aic33" },
>
> --
> 2.34.1
>

I suppose this is a run-time dependency only for the other patches?
Can I just pick it up into my tree?

Bart
