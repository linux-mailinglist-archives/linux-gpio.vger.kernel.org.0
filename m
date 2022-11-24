Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3F76379B8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 14:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiKXNLr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 08:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiKXNLp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 08:11:45 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6651CB686
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 05:11:44 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id d128so1754117ybf.10
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 05:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6sZUIFlO8x1Xa43uNLk8rAs6S8DjACHNKRy4/UVqYxk=;
        b=HgJ07p9wRcZ9lJ7dZMsesJUuO2UNfMBSqyd60Q5t4rXWUTYOy/Yq6Clilp8g5taZ6s
         upuhVYpg6EdIPrTHcfAupugJKZCm6hALfErPfBuC3S3lt0uFiZxEyPWg/bKtsZBwEraw
         +1hXW5Pp7Y8Eg4HGo/IKGiJqtSnBeS7gbWnDl/qY6+XbSVtclDj6nMqUWES9mGOL8q46
         6CxmoWe158bg3HidWFXmBaxmqUQ/X9AMj2k0aFc/Pjy6RXGVFFjO+x0+7MlWNFGN00TY
         3bVh38+HVLWTJnHP4fuFyw+K+WwldDb9JTsfPHlC/+gVYh43htSuKxYpxqcf/mpRGoLY
         lXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sZUIFlO8x1Xa43uNLk8rAs6S8DjACHNKRy4/UVqYxk=;
        b=7f4c4lyROYhL0EkZpNd5b0EeNVf24Z6KZs3zvVo4ImVqVPLfwZY223hIg1HdE+9OM7
         gtpnlcfJOnwCsxjr6QnWrsMp9fR3+h/xQIDkoSucusGAW/RFwUsxJDip4DwJkKNhujaS
         vahfzmqbnC03oTkwbxYBc61DhRoixP21ua/UJeUy7RRn5jotYDCcvWfI4ZHP5dMCJtda
         5QhbstykIHkj4CmPCn6ohJ5vBazDcYM9Hwa+67gMk6zvyVuDltA0x9Z461w0umlEdjdu
         QLgPu7c/twXSZSWW5btU7t68R6gi/qaEPX2ibuBSjcKYEU8/gQ8ynGPFpyDmWWVpurta
         ubEw==
X-Gm-Message-State: ANoB5pmpUkmlhgSi6Z/p2wgoDOdmIl9MXJuT4T4/IKoWWk31yU9Vd7kS
        xQ905LPdIkKP+wzJYb+5DM95uMehehncOElx3mpykw==
X-Google-Smtp-Source: AA0mqf5iyhDMaOQc7d8eXjJ8N2Td81cJmadQhGFPAU1VJblReyZXEKQELwNMORZhWOVKOxkV56OmLkhC+3hw2xotRtc=
X-Received: by 2002:a25:c485:0:b0:6be:8e8d:639f with SMTP id
 u127-20020a25c485000000b006be8e8d639fmr29506226ybf.506.1669295504054; Thu, 24
 Nov 2022 05:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20221123152001.694546-1-abel.vesa@linaro.org> <20221123152001.694546-3-abel.vesa@linaro.org>
In-Reply-To: <20221123152001.694546-3-abel.vesa@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Nov 2022 14:11:32 +0100
Message-ID: <CACRpkdZtkHCkfUAcezSJvmei=HOezK6oyx+4C5kBrEtU+vAB-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,tlmm-common: document
 i2c pull property
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 23, 2022 at 4:20 PM Abel Vesa <abel.vesa@linaro.org> wrote:

> From: Neil Armstrong <neil.armstrong@linaro.org>
>
> Document the new i2c_pull property introduced for SM8550 setting
> an I2C specific pull mode on I2C able pins.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
(...)
> +      qcom,i2c-pull:
> +        type: boolean
> +        description: enable bias pull feature designed for I2C on pin

But what is this?

I2C buses are usually just plain old bias-high-impedance, high-z
or open drain, wire-or or whatever you want to call it.

But now there is some special i2c mode, huh?

The description is pretty much "it is what it is"... can we have
some explanation about what this means electrically speaking
and why you cannot use bias-high-impedance?

Yours,
Linus Walleij
