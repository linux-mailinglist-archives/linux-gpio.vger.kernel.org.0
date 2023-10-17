Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398017CB86D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 04:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjJQCcU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 22:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjJQCcT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 22:32:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD828E8
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 19:32:17 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-27d8a1aed37so543116a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 19:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697509937; x=1698114737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trHmVVa3HVQtG4Xt2doqvC4B0sQ9SbK5P7sWmT0onTo=;
        b=Govb0Z/u4covux+X1yFkUr7/NBoiwPJ9CmtzIkLGTBlixGituoiSBzhgnoGI/bX17P
         nW4kUiYyec2FbLFc43vRfWbo23b8+zqQNVISgLXERwNW4kbu9GZ7A5+ZqK+hor9+WYBu
         8Rq2+Ed2ay52cXzNP2vYb7F3fstOpIVMCiij5S88bEULwgvHeDUXgPM+sBJAcMrQrI2e
         r/s7Yuuttsa/i2pmEvBdoajWP4hmE6KhwGhfN7OmawYUf6/SKbypnqXbspOTDkIPhS3w
         ZA89Wr3me7gERgE8IXYSxfcGtS9QV/bMCgK/TzSyseAzcOLZDsOYXS34zwgjicfp0VX+
         gnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509937; x=1698114737;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=trHmVVa3HVQtG4Xt2doqvC4B0sQ9SbK5P7sWmT0onTo=;
        b=Bu5pTTXqvT5O78zFZZC+NwVqD7nP6foLcsPCvkPFNqAb70SD4rgJQihHktaUOgc51m
         m97P7hzX0buFUdkCGieJ3pz40q15y+NVCFCkdlUUQPvZDHUBLY+4F+A3i+rzUZEsfPd0
         ND3F8H3e9F69b39SSXi/wWI3tzITlsW+rZb1o6ByTF1fNxYdYo8RigwapXWRWDxXkPaz
         uQ2j6FJ53xxz0g+Z11EUctXr7Xl0FJS6Z6OaPnhU2yH5iDZ8/o9Tj/j+fTmYUE4VGRrU
         miEKzgBhy9KIBgdr/a+ckHdgW08/XvwJagslEPE2Bruw0AFbP8Pgx5Rx0ae8R72LIhhQ
         2WYg==
X-Gm-Message-State: AOJu0Ywfrhc1Amalew/v2SXjJsoj86hYy0wXg4G2/6JHjzEwmU5GFb8t
        UwODCFobGBByLn1B2TwGqR+l0g==
X-Google-Smtp-Source: AGHT+IGdPnaBYT7c8lIIVrIXW+cFRIDzNmwPorn8Hdp88GfjSDfiCtDs/2w9Fxd3AznDtYhsuNugYw==
X-Received: by 2002:a17:902:dace:b0:1ca:8e79:53ae with SMTP id q14-20020a170902dace00b001ca8e7953aemr1081353plx.1.1697509937071;
        Mon, 16 Oct 2023 19:32:17 -0700 (PDT)
Received: from octopus ([2400:4050:c3e1:100:b992:c10c:3bda:e666])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001c9bca1d705sm284757plx.242.2023.10.16.19.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:32:16 -0700 (PDT)
Date:   Tue, 17 Oct 2023 11:32:11 +0900
From:   AKASHI Takahiro <takahiro.akashi@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, sudeep.holla@arm.com,
        cristian.marussi@arm.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, Oleksii_Moisieiev@epam.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [RFC v2 5/5] dt-bindings: gpio: Add bindings for pinctrl based
 generic gpio driver
Message-ID: <ZS3yK/f12Mxw9rXe@octopus>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, sudeep.holla@arm.com,
        cristian.marussi@arm.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, Oleksii_Moisieiev@epam.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20231005025843.508689-1-takahiro.akashi@linaro.org>
 <20231005025843.508689-6-takahiro.akashi@linaro.org>
 <20231006132346.GA3426353-robh@kernel.org>
 <CACRpkdaLsfSBEG-h9ZNT2_Lm8tW8AZO7tedDVNeuZoQAqSkyjw@mail.gmail.com>
 <ZSTgTC4cFFpofYAk@octopus>
 <CACRpkdYD6pkccYoy90AfzV3KT7oYkBPD2_4ZW-AXzT1eUVpchA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYD6pkccYoy90AfzV3KT7oYkBPD2_4ZW-AXzT1eUVpchA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Oct 12, 2023 at 09:25:20AM +0200, Linus Walleij wrote:
> On Tue, Oct 10, 2023 at 7:25???AM AKASHI Takahiro
> <takahiro.akashi@linaro.org> wrote:
> 
> > > We can probably mandate that this has to be inside a pin controller
> > > since it is a first.
> >
> > Yeah, my U-Boot implementation tentatively supports both (inside and
> > outside pin controller). But it is not a user's choice, but we should
> > decide which way to go.
> 
> OK I have decided we are going to put it inside the pin control node,
> as a subnode. (I don't expect anyone to object.)

While I'm still thinking of how I can modify my current implementation
to fit into 'inside' syntax, there are a couple of concerns:

1) invoke gpiochip_add_data() at probe function
Probably we no longer need "compatible" property, but instead we need to
call gpiochip_add_data() explicitly in SCMI pin controller's probe
as follows:

scmi_pinctrl_probe()
    ...
    devm_pinctrl_register_and_init(dev, ..., pctrldev);
    pinctrl_enable(pctrldev);

    device_for_each_child_node(dev, fwnode)
        if (fwnode contains "gpio-controller") {
            /* what pin_control_gpio_probe() does */
            gc->get_direction = ...;
            ...
            devm_gpiochip_data_add(dev, gc, ...);
        }

2) gpio-by-pinctrl.c
While this file is SCMI-independent now, due to a change at (1),
it would be better to move the whole content inside SCMI pin controller
driver (because there is no other user for now).

3) Then, pin-control-gpio.yaml may also be put into SCMI binding
(i.e. firmware/arm,scmi.yaml). Can we leave the gpio binding outside?

4) phandle in "gpio-ranges" property
(As you mentioned)
The first element in a tuple of "gpio-ranges" is a phandle to a pin
controller node. Now that the gpio node is a sub node of pin controller,
the phandle is trivial. But there is no easier way to represent it
than using an explicit label:
(My U-Boot implementation does this.)

scmi {
    ...
    scmi_pinctrl: protocol@19 {
        ...
        gpio {
            gpio-controller;
            ...
            gpio-ranges = <&scmi_pinctrl ... >;
        }
    }
}

I tried:
    gpio-ranges = <0 ...>; // dtc passed, but '0' might be illegal by spec.
    gpio-ranges = <(-1) ...>; // dtc passed, but ...
    gpio-ranges = <&{..} ...>; // dtc error because it's not a full path.

Do you have any other idea? Otherwise, I will modify my RFC
with the changes above.

-Takahiro Akashi


> It makes everything easier and clearer for users I think.
> 
> Yours,
> Linus Walleij
