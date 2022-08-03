Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEC5589247
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Aug 2022 20:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbiHCS3y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Aug 2022 14:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236751AbiHCS3x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Aug 2022 14:29:53 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728D039B90
        for <linux-gpio@vger.kernel.org>; Wed,  3 Aug 2022 11:29:52 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o22so7080953edc.10
        for <linux-gpio@vger.kernel.org>; Wed, 03 Aug 2022 11:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oA6nNFqtAx3x5LsiqpTHLf6wHToLYzY4zhs6wkSQF94=;
        b=IypyMFSvUUDb3PAPYmqoU3Wkk7X2fWIhSBfvG5jIvQinuZlmeTgRHeumtg7FRDIIoL
         DhL8pY+9yVeOgAo9uQ5Fbx9B+LuX/1gh/dDUzwK2IQzmWOUq8b1nk8tn5KvZCLyZcWHh
         zZG8quFv4NfTj94XDMzUtyGBCrOvuuvGBMeexMEBnBBYUMMg3XTGsOTFXYPaNCZnVOvh
         1DDufM+r6yNCFoHJ4UGElPMfd1a8/5WBtn6njSuSoo41aF1YOPo8bCLZBWmScM+3kIBW
         VL0lQL3hCFNXTObnWCvvyFM1Gs5TW2hJ5QYpIZVVhmu0EFYcoPnbQBlmHUQhbXv2Zo0n
         1JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oA6nNFqtAx3x5LsiqpTHLf6wHToLYzY4zhs6wkSQF94=;
        b=iBY/Ra7t4vC/zoY2UZpR30HO2VA0+NluWxYI/olad4STpJm8TFCt73N/4QyPSNrFYi
         Q5anHM1FXXemBPHLnec6vSohiU/qXZNap4kF/ZTBmI5yrv9xMvhLAV0CYD8qcVwkaETx
         2/m2uNiCvHcl1utH8M4RIInJzvniv5Vf+AxFez7gln2DxcKx7DI1YervwIZN0sxijExE
         pKOtVh9hjr/dEhlJuU7cTpqGROMl+v7TQwbc/fe4Ulq0gBc3nilKWOaTGu/w2zoBEPKK
         1m9GPGn9FN0SS5LTt2yTG0Q+DFJg89GnmSCVbvmogEwZP95HAQ+xZkpvob7fb9hW1aoV
         G2jA==
X-Gm-Message-State: ACgBeo211c8baOKikN2mq6o5UHDmHHJVl3ybtmSLdV4O1zoUhl+BuZv4
        LdxwP7zpIQIld/c218NOEzjmp5aBV9hKcq15ajEN+A==
X-Google-Smtp-Source: AA6agR4EcHyXPdpWatp4j51d3xayGtGdDP+Dg+Ts3yOBOxNea2vH1uz6+/hIXQUfrYTYAZ/AJMkjcIbnbAigRDbJbuQ=
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr13607335edd.158.1659551391085; Wed, 03
 Aug 2022 11:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220727164251.385683-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727164251.385683-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Aug 2022 20:29:39 +0200
Message-ID: <CACRpkdbNr1Ja23wj99NmExG=w8_C66cT1HcmtAuwVhAbrGrEnQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: fairchild,74hc595: use spi-peripheral-props.yaml
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 6:43 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Instead of listing directly properties typical for SPI peripherals,
> reference the spi-peripheral-props.yaml schema.  This allows using all
> properties typical for SPI-connected devices, even these which device
> bindings author did not tried yet.
>
> Remove the spi-* properties which now come via spi-peripheral-props.yaml
> schema, except for the cases when device schema adds some constraints
> like maximum frequency.
>
> While changing additionalProperties->unevaluatedProperties, put it in
> typical place, just before example DTS.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
