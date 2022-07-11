Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F6B56D7E5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 10:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiGKI27 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 04:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiGKI27 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 04:28:59 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A556171
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:28:57 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31c89653790so41180227b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sq0T3pmYrggKzaAZQ525vBiaqhos/ZjofwdiLff4/10=;
        b=Ow1XJzi2yxTb2BhtBRN+iLQASh5PRfLYD9bkD4DJe3TJqjNVgEjKoNb7olcFNXpANH
         MouRa7zQ4IoiEIFKbZFpCEESG6nouNLQubGWGNpL+hI9n2DicNPf4/AsoY+OplxGKKJz
         l3RlakAp02549mB2RdWKo/a44AuOcwZezC29ioyUqXB+ZFbULnBV5RM15wXof2eVyAQo
         Yf5c3n44k6nYvIIDchJY/rThsYfaEDdKdPcUCjNKZkiTF677NHfvGCRfm8eyQ8kQoDTp
         +Nz2RUg0cmNc6VXTZ6t3Ls42Ju4e+S7T+F30pnvtKmSZi26W1olnHAa9CU7hzXFZEKBN
         wupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sq0T3pmYrggKzaAZQ525vBiaqhos/ZjofwdiLff4/10=;
        b=d63NmavOQbcq6L/Jg5+VfFljHoj83g4C1MIzd8+aTurwiJAyL8b0X7jJ3nkmQ0vMl9
         LL4gQCjG4XfGUGwhjiVMrHuABiZrWReNaCv+XPFG9ApRsyG0Tk8Z4+tHwfNfFGyPgPTx
         Aqrt+r3g+F3nDr0oQPhEUlwt/QjglCkyk6bypJQP6SGufTlX8i6L92i/qhqh0KL4V4OX
         Fkg7QGU3Nm2iaJYjLbmZ0aRe2Ui43wMq6Ez8T557+1ST5zWEGPqsMqcnnCj1TDqGRIX8
         27igXPWNkTmY2M7L88Mm8leh8YLDR5mMru4gBnlqqRoiNCK2tbjYHf5qzQZSyElhvi6w
         w+dA==
X-Gm-Message-State: AJIora8GkQd4WPJ3TIhSzoHCaKi3pJGF8sHUVbhTI0+fdbw5BpKu/I0F
        RgdwFytapcqhV1ycvnbCijSXnxl3JBWR1UNCRxqM7w==
X-Google-Smtp-Source: AGRyM1sNtoCySgFWemY3HN32rjWfOR08gEjoVoKY6pgX03sL435RclFbyXFLrjPoyyIrEUst9cT/adWsEkKpY3X3gWU=
X-Received: by 2002:a81:71c6:0:b0:318:38d5:37f3 with SMTP id
 m189-20020a8171c6000000b0031838d537f3mr18041709ywc.268.1657528136964; Mon, 11
 Jul 2022 01:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
In-Reply-To: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 10:28:45 +0200
Message-ID: <CACRpkdaQSvE_ANtt_A+rsbK8CT_Bn4v1Z6wm-21_RTyAh9G2DA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add pinctrl driver for MSM8909
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 4:55 PM Stephan Gerhold
<stephan.gerhold@kernkonzept.com> wrote:

> Make it possible to control GPIOs/pins on the MSM8909 SoC by adding
> the necessary definitions for the existing Qualcomm TLMM driver.
>
> Stephan Gerhold (2):
>   dt-bindings: pinctrl: Add DT schema for qcom,msm8909-tlmm
>   pinctrl: qcom: Add pinctrl driver for MSM8909

Patches applied with Krzysztof's review tags, will stay in unless
Bjorn gets upset.

Yours,
Linus Walleij
