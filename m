Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6C47724E3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 15:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbjHGNF3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 09:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbjHGNF2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 09:05:28 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BD999
        for <linux-gpio@vger.kernel.org>; Mon,  7 Aug 2023 06:05:27 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so4588920276.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2023 06:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691413526; x=1692018326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCHsXc+lT27JE6Z6+8ylge5LujDr0uIa0UFtHeUGk2Y=;
        b=Ut8sOt7lpFeoV7uC5nic5YMi0GUeC8HpWsn9X2ZvHUqogbJC59sug1OCXgBIO45szT
         zu/yDK65dLYqv6f+km1qpewpLLAyHgB83sO8QJplPf6Hb+zQxEgpYnezxw31ErxCfwYd
         DG1K/BD7UexEi2CLbm33TPIAEV+JP9uckCAnXOKFdFxQCTLDT9vDW0yo5WN6ssAjMwB6
         jQausBUtY12YsJG/lvlFmGhmKUqnRUZYXZJAg6WdrWcdht+kmstTdnIijp5oZIEpsXDt
         nq9gS+ZIoUWmVgbHZ6Clm4PxrSxeiApl2AxIg5A46SblXoW3BcU9kQkBbE2yZj77FvnD
         FVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691413526; x=1692018326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCHsXc+lT27JE6Z6+8ylge5LujDr0uIa0UFtHeUGk2Y=;
        b=lduSv00uRypxZSmGVLVS+JSWCrG+lRdMM/8Z3E8yuW7XYVo/YrhuI8sCEwxANU7yUe
         7+dTK1rDppD+j+sVlFPJhGNTu4xrflkjCtujSXZDOYFKf5J0EHGklhnSfNY8KFdUPpSi
         pZKVz3oDAptHVxGjYABLu3hLp2PIqUyZU0ILc2Qhw8aD7IjFG/JreGhuwk9lqJImKyER
         yeCHS4IS+EBLIUmNhBXeTfPCSk2d1nwXcl+f61ak6QTE2AuTNkDtOdR9UFSagG2TANl0
         NZABjMTGoy5iBwVovfBOmpdzLwMJg66ZmZVOl6QBhkKFSIe62b141Pwsyi3Crkzd9He1
         7efA==
X-Gm-Message-State: AOJu0Yy3EJsz7X6giF90xoe8lmmZtKiSeoqZ3fetSUqDrpse47Lx88Wl
        OMQEaJJbnwOYCxkuxDJwIuNlS3alDPlnhlxQCgAXRQ==
X-Google-Smtp-Source: AGHT+IGLxVHYBN4YJi+z5+HalzYdVADQ/IRYzWidcu2Ji/atGqIFAXQgU8cOxoHK1pmjGmBx4BMj8ebAiBn6KY0iG4o=
X-Received: by 2002:a5b:5cf:0:b0:c39:9e09:2c71 with SMTP id
 w15-20020a5b05cf000000b00c399e092c71mr8293260ybp.41.1691413526341; Mon, 07
 Aug 2023 06:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230726150225.483464-1-herve.codina@bootlin.com> <20230726150225.483464-25-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-25-herve.codina@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 15:05:15 +0200
Message-ID: <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256 pinmux
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Herve,

thanks for your patch!

First: is this patch something we could merge separately? I don't see
any dependency on the other patches.

On Wed, Jul 26, 2023 at 5:04=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
>
> This pinmux support handles the pin muxing part (pins RP(A..D) and pins
> XP(A..D)) of the PEF2256.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

So it is a bridge chip? Please use that terminology since Linux
DRM often talks about bridges.

> +++ b/drivers/pinctrl/pinctrl-pef2256-regs.h
(...)
> +#include "linux/bitfield.h"

Really? I don't think there is such a file there.

Do you mean <linux/bitfield.h> and does this even compile?

> diff --git a/drivers/pinctrl/pinctrl-pef2256.c b/drivers/pinctrl/pinctrl-=
pef2256.c
(...)
> +struct pef2256_pinctrl {
> +       struct device *dev;
> +       struct regmap *regmap;
> +       enum pef2256_version version;
> +       struct {
> +               struct pinctrl_desc pctrl_desc;
> +               const struct pef2256_function_desc *functions;
> +               unsigned int nfunctions;
> +       } pinctrl;

Uh anonymous struct... can't you just define the struct separately
with a name? Or fold it into struct pef2256_pinctrl without the
additional struct? Thanks.

Otherwise it looks neat!

Yours,
Linus Walleij
