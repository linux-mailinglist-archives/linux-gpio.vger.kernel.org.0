Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11FD3710E03
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 16:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241556AbjEYOIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 10:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241519AbjEYOIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 10:08:04 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6DCE5F
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 07:07:43 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f60e730bf2so6927105e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685023661; x=1687615661;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF/YLiXt+Wz4pi2y/9855PYbDqln/umnaCm1hvZD/nY=;
        b=FshkKSklE4mhKDuI6cA8Jo6KkrVTc+5WF31v25PXSvMB1rfjab0/nMv74UstUBhCfU
         5MtIhSo6Xux7Ezw1l2v1Y2BPsxH+4Zt/6PrKAFVHHQ+3XW8SGHgFxBwo6YZTJP0zCTHr
         NLdeggUhG/BB9v0f0G9+FXR7gaqibHnL22DUBB7yrt5lOkfaYu5Smu6x3RITL0I7OLlr
         tOFfnrhOtqGJvlRjuIuxAhOv1OJ+WR/Ce5iIHQHmXrQbfCjHCqp+5gFvHc7i9IiIh+hM
         Uev0MHBAymDNkVZy42ErzwArl0KTFA37qHyPxU9N81IgDPCsnn6hAI3U1QoJNldvDJo/
         TGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685023661; x=1687615661;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tF/YLiXt+Wz4pi2y/9855PYbDqln/umnaCm1hvZD/nY=;
        b=F3OTuIg5vPZhBJgeG4LCTEcoNVoDrMBLbfE7toaqyeW0noGH6lgCS6YGl4f7JUygmF
         cDYtpBg0DI3bTl1rPhUPWwDbNEvGHyp2x8gYuLwrhBUdRj69pIkA8b3OD0GhvMDm8ehG
         0lqBFeiim+KdlPwNbeRVWFfC1XmZQwLXoQEHRJXrEG7NivUR+v4cCUUv6OBZOjj66m2O
         dvDiMpRdfUEg0OVnDYVVdD+b8Xxe8Ebu7lW3aBHr5Y5/cg+4LqBmEATe8crCjSHsr9F5
         +JosO2yL3g+r2AGqbPWvyTW08Tf/LySzyOQ+OsamS932bXDBh+hZbr4sDQ/Tl83tVSOn
         cVDw==
X-Gm-Message-State: AC+VfDwkibKfuoFmGdPJ3l6oUZ9iK23hmLuwR/WY6eqVerfYgBowb9Wg
        jLbF2bLSEMKoUmvqg/jbihho2w==
X-Google-Smtp-Source: ACHHUZ4ixPjz/IrEBqNV7Mpn53Q4wlZCzaDBAs9Ux+XQ1aLD12RR5fr2BMAIeKn7BLlXdlrzhMvtcQ==
X-Received: by 2002:a5d:58d4:0:b0:309:5029:b075 with SMTP id o20-20020a5d58d4000000b003095029b075mr2584321wrf.13.1685023660991;
        Thu, 25 May 2023 07:07:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:28d:66d0:ed59:2d5:ca3d:ee5c])
        by smtp.gmail.com with ESMTPSA id e7-20020a056000194700b00307bc4e39e5sm1892289wry.117.2023.05.25.07.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 07:07:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 25 May 2023 16:07:39 +0200
Message-Id: <CSVF1AQBGQU0.1V5KJP08TCKLT@burritosblues>
Cc:     <linus.walleij@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <jpanis@baylibre.com>, <jneanne@baylibre.com>,
        <aseketeli@baylibre.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH v5 2/3] pinctrl: tps6594: Add driver for TPS6594 pinctrl
 and GPIOs
From:   "Esteban Blanc" <eblanc@baylibre.com>
To:     <andy.shevchenko@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230522163115.2592883-1-eblanc@baylibre.com>
 <20230522163115.2592883-3-eblanc@baylibre.com>
 <ZG0QmjZwvzWbNwA4@surfacebook>
In-Reply-To: <ZG0QmjZwvzWbNwA4@surfacebook>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue May 23, 2023 at 9:14 PM CEST,  wrote:
> Mon, May 22, 2023 at 06:31:14PM +0200, Esteban Blanc kirjoitti:
> > TI TPS6594 PMIC has 11 GPIOs which can be used
> > for different functions.
> >=20
> > This patch adds a pinctrl and GPIO drivers in
> > order to use those functions.
>
> ...
>
> > +#define FUNCTION(n, g, v)                                             =
       \
> > +	{                                                                    =
\
> > +		.pinfunction =3D PINCTRL_PINFUNCTION((n), (g), ARRAY_SIZE(g)), \
> > +		.muxval =3D v,                                                 \
> > +	}
>
> It seems you have used SPACEs before \, can you move to TABs?

Once again clang-format is not doing the right thing. Sur I will fix
this.

> > +// Used to compute register address of GPIO1_CONF to GPIO11_CONF
>
> This is good.
>
> > -#define TPS6594_REG_GPIOX_CONF(gpio_inst)		(0x31 + (gpio_inst))
> > +#define TPS6594_REG_GPIOX_CONF(gpio_inst)	(0x31 + (gpio_inst))
>
> But why this?!

Once again, clang-format... I will fix this.

Thanks for your help.
Best regards,

--=20
Esteban Blanc
BayLibre

