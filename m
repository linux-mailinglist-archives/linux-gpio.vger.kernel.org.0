Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CF65B1C27
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 14:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiIHMG2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 08:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiIHMG1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 08:06:27 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C17F56ED
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 05:06:25 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id lz22so16677430ejb.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mB6AQyh13kd0fv1CGxxiucrKpWB/h+yUsb1SZv9l46E=;
        b=unapOnR1kK7iUZNBAb5o1dPcTSMZ6VOVMADB0J5vo33KG2CroOuWxyx4VKka734RoB
         u7/GjTFrNJ7hYTPtRSl3Rnj0Qgf3JcHAjcdk7hsTC8ynyuOanh1sYvIZK5GIE6QeB3Kp
         q9U4L/dJIQB8fjdbMBEQT7Wb/D5XfduP9eV0IgRgeTIPz+r7PJFmeVD3414YOAbfAO1p
         uyLDQRHfFUv40LFN4zpRZhE476Cx7aXIDWJbHSSevcKRv5402+3T1JUKs60f3z4PDsAd
         ZFO2a2yLO9Mm3uUXGe+Q+V6s92Rde0qtg36WSq1PeqJGoHhSYR2gwWh0KvAnW/q+r1+A
         z/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mB6AQyh13kd0fv1CGxxiucrKpWB/h+yUsb1SZv9l46E=;
        b=i98OegvyfLCQu+h9AsnXwzAlyuOR6+1iJr8wJX6C9x/KF1Oabl53ehmfCXVR+vnZV0
         GWd80ePSgHi2tmgMiE/Tw/Dwypk7zv/PVM5Kf71rED59akTY8Nw6p4Hrhs3TcGvF37hI
         u/9zO9AnddJG+7wTd0QjTLYy8/324Mdyv7+7p/TiFYg0LCC24v3q5LnBtUid2TQ9XXOH
         GRXGr/HmGcq8p4/wDvhm0dZt4ZoM1m0xt/RzgIeJtXi2tSx9KFjNw1Ay2og44aIts5yY
         ORqzj3FJV4C7gRNxgv9kDPTylC1vFk8xM5rsUyAd6wN//y/D4z/9LGIwYebmJVe2t0G5
         d5nA==
X-Gm-Message-State: ACgBeo17fl3FtkqjkZRCGJ4VI1Xa6WUgIGCqusX+6Rs+bj5zofIMhm+l
        MyJ2t7oAxpeF5T4u/cA873V493GsfTN1qe4c7JQR55pQm/qmXQ==
X-Google-Smtp-Source: AA6agR5Dvp9OGuNPCVVVdlWorrgfzjwjqrxmFgJ2bmJ8ExZhH/gRUWkLPsiNeopT5RN5umZ2ObvhevyfM5mjumeQ5DQ=
X-Received: by 2002:a17:907:1690:b0:770:80d4:ec4c with SMTP id
 hc16-20020a170907169000b0077080d4ec4cmr5162914ejc.690.1662638783999; Thu, 08
 Sep 2022 05:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220829133923.1114555-1-martyn.welch@collabora.com>
 <20220829133923.1114555-2-martyn.welch@collabora.com> <9db9dcf8-6299-acec-c09e-603afde9a239@linaro.org>
 <CACRpkdb1-LXwLdV3qLMc+i_VaLoJ-mTs=+0QtuJtNaQR_xVpxQ@mail.gmail.com> <97b256a7-670f-c681-424d-854d15145d24@linaro.org>
In-Reply-To: <97b256a7-670f-c681-424d-854d15145d24@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 14:06:13 +0200
Message-ID: <CACRpkdY5sOz6a1P23f2hs8UL__O2cBtDdMcHt1nxSX59ZOBzaQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: gpio: pca95xx: add entry for pcal6534
 and PI4IOE5V6534Q
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        kernel@collabora.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2022 at 3:34 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> If you have specific+fallback compatible (e.g. diodes,pi4ioe5v6534q,
> nxp,pcal6534), you can always introduce changes in the driver because it
> will match to the specific one (diodes). You could even introduce
> incompatible changes, if you insist, and the effect would be the same as
> adding now two compatibles in the driver.

I know, what I mean is that this binding should probably have fallback
compatibles for the TI, Exar, Onnn and Maxim compatibles listed in
the bindings, I bet they are all compatible with some nxp,pcaNNNN.

We could fix that, perhaps.

Yours,
Linus Walleij
