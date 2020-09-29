Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8D827C79F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 13:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbgI2Ly5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 07:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731495AbgI2Ly4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 07:54:56 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53643C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:54:56 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y11so5164003lfl.5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qBPOXwqR11FIHvfThBaUZC6jwCYvheTGv1CU9grIcyc=;
        b=kPeNIHgFK720QSLLjMtJfaCzuL9cumPpDAyvNYtba32dQREDDhojxXqJ/8eTRRldhY
         cB3rBQrFOThsKYbRcstrf4nWG2F8+lFPEeq482iKudrLYl5TMyzaSfad1NnKqvY6hGWF
         oHpOfQZineWmt5DHzJ+6i4+myqcayZVYdc65kzorjd5tQrq+w7E0YLFGAxAOkBfYkIFr
         bDvnoZzmuC/WV/Zw/iKSyXy8HWXkQ5v4A+fZxT3Uv7f9179OswZoZ8SWd/dvdKwqb2n/
         +dIMirAQ0IdgiE+8h9tpFRck0YGlT8pmlzAX+GodXGsKgb4lpX3CmDy59Jm5KChDY5dx
         PeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBPOXwqR11FIHvfThBaUZC6jwCYvheTGv1CU9grIcyc=;
        b=sTUw9CskirVylkwb2BU3zUdIkY0RBkbl+LYRuyZeSPbxy5MWKpfPNd5ilq2y0AlbO6
         4/O8sh0tum4KiM6i/u64DG1jev7eCmQ1oduX8rRuABrjCSwoWpiRZfbYZRsobc7aXMZ4
         lTmd8HuEaPzJ/9ZJQvLdQIGm0oRk1GvrxLJACHdnjyxZVoRcqd7thezkXm90drf3sdYz
         9Kl2c9/5ytQC5VvgL9FboCNjZRH3pwuTR9izJQL8rlZOHFLMyaSff6mp4su0sNNbdlai
         +PIw4kNRchDPK17gwcun0VIEoKNcfEdKN9On3pJLq/3RndRdHGyIGXm7eeZ0s+oe6RiA
         GaBg==
X-Gm-Message-State: AOAM532vDV+hnYUGxcDZaDDhlAmPSt3H2orKaon2lc7xT6jLaE9De05x
        aKt5hvTb27hgHoqT9HxGddkWxbVeye5HYDLHSd4Dbw==
X-Google-Smtp-Source: ABdhPJxIDyRyq0NdkRAPuDSSQ4EIJ47R+V+1df5ulwgAX0ti7J3CkGDapTCIlcPwsFjl0iHkGeF8Pg0wHVW/xXsPz38=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr1001845lfb.585.1601380494732;
 Tue, 29 Sep 2020 04:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200920195848.27075-1-krzk@kernel.org> <20200920195848.27075-4-krzk@kernel.org>
In-Reply-To: <20200920195848.27075-4-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 13:54:44 +0200
Message-ID: <CACRpkdZi_k=SeMPHADeErE3pn9ytb0dFTfVEb7mJYedg75dMbw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: gpio: gpio-vf610: fix iMX 7ULP
 compatible matching
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 20, 2020 at 9:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The i.MX 7ULP DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
>
>   arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
>     compatible: ['fsl,imx7ulp-gpio', 'fsl,vf610-gpio'] is too long
>
>   arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
>     compatible: Additional items are not allowed ('fsl,vf610-gpio' was unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

This patch doesn't apply to my tree linux-gpio "devel":

$ git am --signoff
./v3_20200920_krzk_dt_bindings_gpio_pl061_add_gpio_line_names.mbx
Applying: dt-bindings: gpio: gpio-vf610: fix iMX 7ULP compatible matching
error: Documentation/devicetree/bindings/gpio/gpio-vf610.yaml: does
not exist in index
Patch failed at 0001 dt-bindings: gpio: gpio-vf610: fix iMX 7ULP
compatible matching

Yours,
Linus Walleij
