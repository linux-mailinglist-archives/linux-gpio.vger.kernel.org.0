Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6426D562FB8
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 11:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbiGAJUD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 05:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbiGAJUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 05:20:03 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2710151B2B
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 02:20:02 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id cf14so2143781edb.8
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AfzDKE12Yxu08Hj4MWZdUW/67hvHuToIIu6zzIovkbs=;
        b=nCfJA//B+GZXjcW6dcSAo4FSYV8cVsLDihaNkccw5VQLeJgqMgUkXs1kSjc+Pzmt0O
         pwWxpb3+lTrLGPS5+qG/4Aq7fFrnrh8kUJ4+BqBuOjttqVbcxh45osYYZwJcMCn58RU9
         q4UcA9AkEQT40/28RzdboFcaygq7SwDZhawmAZB4OrLPRNqidmOrSiEtlGex8vwUxdHq
         p5e9ykBMJZjfpDcJzH0HVUgsBYjCAmIyYfyd1UKwzd1pmWyrCx5NNGlRIFiObvYveHg9
         Qp8FQwdQASk9aZ06ZUG5mvATJa0Ym11tVce47xTUEBGZwXnI2dNXSZYfaOKEf9zwG1gy
         jOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AfzDKE12Yxu08Hj4MWZdUW/67hvHuToIIu6zzIovkbs=;
        b=c9pMCL10Pv2bjwsxy1ZwVDtWtcYg2rJg4PxaMgrQ1MkCkEQvaBVgsCB4iSw/jV8BcC
         fIyyhxUpAnd5CKcfJiuG1bsA6I6CXivzwN4pLpN0ym7Iq5j4wUOYV/TimIV1sAd+/opu
         amjMJ2LWTFK2YzB7q2134hCuFuaKtZCURxCv1T2WvwUDADulNOJ1Gc+vxmLQ9ZOmBdh5
         bXmwihBQvLzbgzU+7gTgYagNRPiDqBRlfbW9WHINfscfzwe04aIoJ+Zk0jRNv69d4duS
         ZzM12bCr6w84v8O4DiFa3Su+28X4RI5AxTOJuxUcUt8EXPZ2xnjcfhG/qZ1rzlZdRSuU
         w33Q==
X-Gm-Message-State: AJIora/2iZuHkDbwBmdp0v8DS/zkJo0RTNKphSQ+JDbp79wKsImsy1JX
        2K1ggVXrn/eIufzn40PxUARtf/+f4vDBbOLGkCxSJg==
X-Google-Smtp-Source: AGRyM1vf33S4z200yRk29HCwdi0LNRIcuc5xfCK4YImSgyKfPsESSL1D9B6PhCgdX91R/ESo78u9LdCmIeoxR85x6UY=
X-Received: by 2002:a05:6402:18:b0:435:9a79:9a40 with SMTP id
 d24-20020a056402001800b004359a799a40mr17116574edu.328.1656667200759; Fri, 01
 Jul 2022 02:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220629170420.2712077-1-l.stach@pengutronix.de>
In-Reply-To: <20220629170420.2712077-1-l.stach@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 11:19:50 +0200
Message-ID: <CAMRc=MekF1V5q-pD_+yL-Ai6gd1KGKW+go0Putd9E0wbL4yahQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: pca9570: Add DT bindings for NXP PCA9571
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 7:04 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> This patch adds device tree bindings for the NXP PCA9571,
> a 8-bit I2C GPIO expander.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
> index 338c5312a106..1acaa0a3d35a 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      enum:
>        - nxp,pca9570
> +      - nxp,pca9571
>
>    reg:
>      maxItems: 1
> --
> 2.30.2
>

Applied, thanks!

Bart
