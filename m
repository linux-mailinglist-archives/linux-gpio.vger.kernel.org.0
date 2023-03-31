Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9CDD6D1EE7
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 13:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjCaLXr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 07:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjCaLXq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 07:23:46 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E601D86C
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 04:23:44 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id f188so8519360ybb.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680261823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TmvPpd2YmgmpZIHsxp1gukcZ6IkVkvn2jIN3kBi1i8=;
        b=sTIfTWSObIn7UMlmphrTSYvN9Y7arYi6CRjrwIvqEAI9HkX9Exwa13txK+uYbpM7v3
         l6J4vkOqq8a0i3booWaeIUu92m/13ZKH2zw0OnWjp2qz2/hGDwkQeo9u2FnZnTxFWsxE
         9P7yyDufLYI6/2Q2hVxULgawDVnW3549Q1R+UtZSFfXLvjtNR6wvhVIjY3uC0C87RLam
         hX+jLrZKivu8A7dWkLaZPlBNwjfq5Cle2ETuJ8QDD5u6ndQPqq2STdtrm9yOoRXgMqZE
         Pd8H77fN3eDjuTD2iMiOpP6dJDo1FgaiTZm+w2XLGm3TDUzPGtd+RFL/46DdUX/uY+il
         RK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680261823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TmvPpd2YmgmpZIHsxp1gukcZ6IkVkvn2jIN3kBi1i8=;
        b=jF1U5d4Oohzz0JgsjKYu1fYstUtwbLKR/xV29OzyuqTq3aft4n4dF4gtHaJT2Z6oMB
         R90vvQgaeE/26qzZoEurQrJlpgJD6aYnWEkjGsKPIVm0cQy/j8vuerOM92usuiSaw8Qn
         WomkI7SLN2tV0tdaFoSN3N8X/gUDK3+100p/TAFzGrQS26y4/Xz5WOm25g0J12o7JGFC
         4U31qgctDWRfgT4YROA2XwBX9/EBDvR2RzAAvZATwMsijM+vexq4js3st+rmMHvGEsSZ
         Bp2Lq78Z3dV/jrWZ9IQl7ZNNElpsPNOFZa5GY5mA3EKMdNbE7BmI6Ofka5NWH6WizV8j
         F4nw==
X-Gm-Message-State: AAQBX9f6NZzc5deeFpmb4+2mgn98dWvyvGoNb57DmVVmwYHwGVl90W6w
        L7VvrAX07Yru5EYmdUhvPsHoJIX93LcrQQu6qKPAow==
X-Google-Smtp-Source: AKy350Y1O6fb4CGhMXuQEcYQBTT1/oazAxitXaSHy0j76q36BAoNePcj7hYGMpWDOiNCG1ARjEL0yjdg1OiNTqnv+G8=
X-Received: by 2002:a05:6902:1181:b0:b6c:2224:8a77 with SMTP id
 m1-20020a056902118100b00b6c22248a77mr17804559ybu.1.1680261823120; Fri, 31 Mar
 2023 04:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-10-0003e80e0095@baylibre.com>
 <7b6be990-9e90-8e44-7c5e-f8b7a2701ce7@collabora.com> <CAFGrd9qMEtHVT+P-mBNxh6g1jOm5ifArSxi1bbGnrKgxCf7zSQ@mail.gmail.com>
In-Reply-To: <CAFGrd9qMEtHVT+P-mBNxh6g1jOm5ifArSxi1bbGnrKgxCf7zSQ@mail.gmail.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 31 Mar 2023 13:23:32 +0200
Message-ID: <CAFGrd9oYMXgWVxQHfn6hT0chx6kg+4UhP4Q=v4f+gF_NahhNdA@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] arm64: dts: mediatek: set vmc regulator as
 always on
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
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

Le ven. 31 mars 2023 =C3=A0 13:08, Alexandre Mergnat
<amergnat@baylibre.com> a =C3=A9crit :
>
> Le mer. 29 mars 2023 =C3=A0 15:25, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> a =C3=A9crit :
> >
> > Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
> > > From: Fabien Parent <fparent@baylibre.com>
> > >
> > > MSDC1 IP block is powered by VMC. Make sure it is always on.
> >
> > Why always on?
> > Can't you just set mt6357_vmc_reg as VIN of mt6357_vmch_reg? :-)
>
> I'm not sure to get it. mt6357_vmc_reg & mt6357_vmch_reg come from
> PMIC and are supposed to be independent.
> You suggest to link them in the mt8365-evk dts file using something like:
> &mt6357_vmch_reg {
>     vin-supply =3D <&mt6357_vmc_reg>;
> };

Additionally, vin-supply is supported by fixed-regulator and
gpio-regulator, which is not the case here.
I think it isn't doable.

Regards,
Alex
