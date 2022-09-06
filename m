Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0F95AE909
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 15:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240265AbiIFNFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240253AbiIFNF0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:05:26 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA15256BA9
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 06:05:23 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id e18so15072628edj.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2022 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ltZ8BwCHA90N0xCiPXsqAnq/msG5Ej+1muFCDaHgJe4=;
        b=b9b7dMVsDGRCa+Dg2UBLc5bOvgetSb0j8960xT/NsMM40+4MfpDHoagn4aPCP3yI8C
         kiUmp4b8bSzpIBX6SqCr0v3ybBepUFBpMVlhMe3RbFlEFdArF/k58Hb9eA8BvPkyrSQQ
         nyBB0XwLtdPvKvlC1mv4WUW615OKPoDYEtYrWC1tT+U71Kla37e4FH5MbrCp9fGOHSnb
         o3/LKqlVUCZdcB9sHkWkYL00CYu0puPQbneHkR8ZoPuzE0y/k5AXdjksB/jG25cosVPh
         l4OexWY+mIOq4QRvjtEQYl+tOe1JLYbMCQuUX9hyenNsZg/mEfXc9cXY+6fuY9Fb+Gb8
         R4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ltZ8BwCHA90N0xCiPXsqAnq/msG5Ej+1muFCDaHgJe4=;
        b=RnzEpdTQOQj3d2vS2TpDHahtlVvyB23zcvAvp206lC62o8w83yPVK7Ax9nyfsxiST0
         1vGt+2tIjayFtJBcc5EG+Pa2XNDrMLmZ/a7wRhyZtCdCDWiMQ08BUtCPyX7KIVX9WPyZ
         WK6bMoUtcE3NGrf293gBnZOEvwjuy85g5rbBtuM7NGdpPfn4rleEmrE9vgwBjc9saq2g
         kdO+PeE6vsnt+v+SpCgFj+niresOdgZsV/wRGF4l1Nn/zy0UEaMCuFAwK7oE2eXk1JHy
         LlDw1Sa3hQcskyXIOfC8gY0ZA2oo8kTxfVJjh4FWmMjBmZn6D4Y7p9hzRKg5zlHuHQXs
         xVCA==
X-Gm-Message-State: ACgBeo08oMYwujfGi7oV46JoRA5xr84Mjhu8Q0yN5wCD5048m3JY4kam
        kmCxV9ya5ryZpXrFrfX9MBEgnNsDWJP46TN5j8f6Qit/xXxxgQ==
X-Google-Smtp-Source: AA6agR5Y0OQbpE8LPvwngeTpVjo1MXu0GVzRm5PijsMKSHrtxR2t4yXmEa2b/2REUUx40TXBMu6O34BmLuOm2H17LGo=
X-Received: by 2002:a05:6402:51d1:b0:448:bed1:269c with SMTP id
 r17-20020a05640251d100b00448bed1269cmr30094274edd.205.1662469522275; Tue, 06
 Sep 2022 06:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220906082820.4030401-1-martyn.welch@collabora.co.uk> <20220906082820.4030401-2-martyn.welch@collabora.co.uk>
In-Reply-To: <20220906082820.4030401-2-martyn.welch@collabora.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Sep 2022 15:05:09 +0200
Message-ID: <CACRpkdbw2vq0QHjihWeiFBpUXGKaL2nB9rD16gcmsgEw0nuSqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: gpio: pca95xx: add entry for pcal6534
 and PI4IOE5V6534Q
To:     Martyn Welch <martyn.welch@collabora.co.uk>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martyn Welch <martyn.welch@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Tue, Sep 6, 2022 at 10:28 AM Martyn Welch
<martyn.welch@collabora.co.uk> wrote:

> From: Martyn Welch <martyn.welch@collabora.com>
>
> The NXP PCAL6534 is a 34-bit I2C I/O expander similar to the PCAL6524. The
> Diodes PI4IOE5V6534Q is a functionally identical chip provided by Diodes
> Inc.
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> ---
>
> Changes in v2:
>  - Enumerate pi4ioe5v6534q as requiring pcal6534 fallback

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
