Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B74CF79CF39
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 13:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbjILLG4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 07:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbjILLGY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 07:06:24 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A17F1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 04:06:09 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5922380064bso54575537b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 04:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694516768; x=1695121568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxeKap40n9N0Jct85TnQoxJYlNgRlyoVOdviavwIIv8=;
        b=hxq6TJF8HMyjqFW1Zxj5wQy1nlsOBDVUSQnjCPAO0BVV49/32UolcLMMwgtEfQWxyv
         h4KosWWVPrmcXDdlZOUVS+2dCFfDhBd6Em++i+z2reqCPZrd0ImmfnuMmnfKN6zIvugq
         2KTPCzv5M24UwOzFIOZx4yi1NQlTPeMw62b7O8oTRekmb/y+bYtpInRDkDnaMlfayAyI
         neLIU1iQKoa9CjJzkM0Yn0yqAc8Zo2ZeT1aCIRbGTx70HMWniIL08xkUs74lAjyCEAYU
         z2CnZW5bBcTDJjce7yw4JLl7STtIHtp5lb5ZOvZe6pCnSJwlymassacuIIjo37MwyAJ0
         rvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694516768; x=1695121568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxeKap40n9N0Jct85TnQoxJYlNgRlyoVOdviavwIIv8=;
        b=dczIyCdHdV2TuyeJynPjc9NiaY6kTG0FRqYDjXSukAR8lmIAPiGtiufWDaCkyEbUfa
         4pNUNRXHLbT9e2RSGnioQcdWUqRXhRENrVoL73NoOKYqjqGMQONHwYXm65mlg9dMlOYN
         k0vQ9j45CgqAc/Ite0J+CG5K7+p8Eyy89cIZCRzR5zbHRAVvQ9abISePU9ztiNXWNoYJ
         cV5R2AvYDx/YM3y3yLazsULY5vZtV0NegQ604Sygvyt5rOPcB8RTXrxAxlVM0H2bD64h
         eDhTLKugjjXQ8I6EjVgKqa7hV3r8jtAuXSC7XMstsRI2JA3hQCESKJJ1+ThMJLj5dSsZ
         Giiw==
X-Gm-Message-State: AOJu0Yzqzzys908IfpAwkXtQ10haraIxf61K/JVSaTeHWozZrtSB/4AF
        13Rnl0hXUfcOXu3e8LpjQLc6frbWKquzoy0f/AgrBQ==
X-Google-Smtp-Source: AGHT+IGyZPp4TVH1sBukbcNRmYX2EySx2o/za6wxn39EVFdbUk9RivbE+m6qOSfkNS/rkWMpLDTgnTAoDhF0TgN1JVo=
X-Received: by 2002:a5b:743:0:b0:d79:d23f:b49c with SMTP id
 s3-20020a5b0743000000b00d79d23fb49cmr10905306ybq.35.1694516768133; Tue, 12
 Sep 2023 04:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230912081527.208499-1-herve.codina@bootlin.com> <20230912101510.225920-1-herve.codina@bootlin.com>
In-Reply-To: <20230912101510.225920-1-herve.codina@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 13:05:57 +0200
Message-ID: <CACRpkdZ2svQJVG4wiJu90X6HhKudMuAerz12zw2nd84ekLaEJA@mail.gmail.com>
Subject: Re: [PATCH v5 29/31] MAINTAINERS: Add the Lantiq PEF2256 driver entry
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
        Simon Horman <horms@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:

> After contributing the driver, add myself as the maintainer for the
> Lantiq PEF2256 driver.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8b987f2c8633..dbc5867016bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11876,6 +11876,15 @@ S:     Maintained
>  F:     arch/mips/lantiq
>  F:     drivers/soc/lantiq
>
> +LANTIQ PEF2256 DRIVER
> +M:     Herve Codina <herve.codina@bootlin.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> +F:     drivers/net/wan/framer/pef2256/
> +F:     drivers/pinctrl/pinctrl-pef2256-regs.h
> +F:     drivers/pinctrl/pinctrl-pef2256.c

Just use a glob expression:
F:     drivers/pinctrl/pinctrl-pef2256-*

Yours,
Linus Walleij
