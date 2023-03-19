Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 501B66C050E
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Mar 2023 21:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjCSU6j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Mar 2023 16:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjCSU6i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Mar 2023 16:58:38 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD94316ADC
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 13:58:36 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id e71so10885155ybc.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 13:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slTlotxx3fcOIiVEZmXgPk8gsXyMX9Tm5yjiLh1yu78=;
        b=Esl4BDoUuM2GdiJWGFjVzUqn6XsO4j+Vy23XiW1cYGU7/3p294trptkJ/Ohnf7DKjt
         St61+kvqCPtQnB/W/OkK38195AvIe/FGFLCu6mchGB7UT1LPeEwNwl7YCOH5YgQ2aeBG
         3Ya5xRIKCUWOgKs/AdaObSzyOGS3GUmZxCXb7xg0BQTQZ9q6x5Id/ef/mv5AW1A0j577
         hxKxTUiXN9dX8iGAP3azmX05ZuDIKH2UcD+nAVnn++yZXVe8Lid7l2TUtQKQrFFKL8/C
         hfEo00yLT5ppwMmbHALhrxhS1Hz5d6fz4Xf6jD28Xt/z5BfunnCI615t3L6AAGGJEFIu
         asfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slTlotxx3fcOIiVEZmXgPk8gsXyMX9Tm5yjiLh1yu78=;
        b=nJ1rFTvuOpGX5VuAFoAeXvACfbZIGQMIF15bPmXkEosTcI1BaOPYex5Mva9gP3Kemg
         OeKye6OcPLgd2pKPYpWj4O3Hk70iFRtynsWlUMaDRZrR1TOpyybwjyGyFKdVaiHeTkmb
         6N1SaVB4gQvpJwaVYZFA3X5nmfGNSeB7Br0nX6/olHSZtWLYnIVk5p9BG7GZSuTqSkv5
         IuZU55SK4rTRS9jl1sXpJyAoBaM4L2oExmKUjFHsGIE8DN7lp/KAnnGwK4ajdS0e7TXt
         NGZOmOQOL41YS6Xf6JPxX3sIBnFeXHC6CAv0QDgMzDuW85kKln6lh6R/bhriV8rShAnv
         vXNA==
X-Gm-Message-State: AO0yUKUbio/wbrLYbnokJDE79HugTHypBj+AMV8XZc+Whfg1xl+xVjvP
        S5ESgsuMBlz4QH7P1dVXSJ/sBRYWbVqP3ky7P5xLZQ==
X-Google-Smtp-Source: AK7set9N7HBHhQUfyexxk65xztbNCbM/NotsRK4cg8qus2nO+Zgi2xnzAgTVdxSDjoFozWKrNI49lPoh5u52J04PEhQ=
X-Received: by 2002:a05:6902:110e:b0:b26:47f3:6cb with SMTP id
 o14-20020a056902110e00b00b2647f306cbmr3225716ybu.4.1679259515943; Sun, 19 Mar
 2023 13:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230315155228.1566883-1-nm@ti.com>
In-Reply-To: <20230315155228.1566883-1-nm@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 21:58:25 +0100
Message-ID: <CACRpkdYPZ6CROjdta2_3dSuoiT_7FJDAqvTD1LpKCyUB05U91w@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] pinctrl/arm: dt-bindings: k3: Deprecate header
 with register constants
To:     Nishanth Menon <nm@ti.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sekhar Nori <nsekhar@ti.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Tero Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2023 at 4:52=E2=80=AFPM Nishanth Menon <nm@ti.com> wrote:

> This is an updated series to move the pinctrl bindings over to arch as
> the definitions are hardware definitions without driver usage.
>
> This series was triggered by the discussion in [1]

Acked-by: Linus Walleij <linus.walleij@linaro.org>

As mentioned by the DT maintainer I think this best all go
into the same tree as the DTS files, so let's merge it all
through the TI SoC tree.

Yours,
Linus Walleij
