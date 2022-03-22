Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 039074E3994
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 08:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237407AbiCVH3d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 03:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237397AbiCVH32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 03:29:28 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB9B119
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 00:28:00 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j18so13998609wrd.6
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 00:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=38s+vFh4hN6ma2OSEAh7532IeRnJs07vXfLx/FtTkeI=;
        b=vucamHCLCQ2IfBbc8GHxp5tlFQuyNU8dW3Bij+q2zvk5mWjPWiFriQ0nCNUerHF76w
         etA07VHJUUuBtndKIekxQRZ3AoouuVRcGZiyWY9dz8NelgiXQagbIQH2dKUxde1wutWF
         yK/y3ahbHCff65xR17gXHvDjSvg2ZEc9/QlsEFO9g8cnvYfX0wy1OoljQtfTxLNXdHyS
         5rh4+RfVULw2BppPS+qAy7AAfLROY8MXidF6g3uV0V+BjsvZgdVUAAh4Yl3Q9/iJpvHu
         Knf9mCXbrTb9dSUAvTMZ7OlurxJn8q/nSiNyp/Df6Ly3jgtwmRScxgViIr6wOY1taXXi
         qX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=38s+vFh4hN6ma2OSEAh7532IeRnJs07vXfLx/FtTkeI=;
        b=QFM/6/6CrA5tzKob0md15XIYlI5wsTo8ZeFO3zPrsmCnpTmkH8HpDRs1iOPYrcIvAV
         6qXIB9NIdGMXaS2LXBuditRkxM0pWXisYnJjMH/6cH9WORJBzXn+Jymk8DI7sM0euhX6
         W/jjaSqCYqEw+wpjSfgZlbDEaGaFFiV/MfwGthcHYZd2HET+MKvsYjigUC1gnT1I+h60
         GZJHhtDkfX3DWbYR18tSvLH94Sxg2tgnBX4V9eEMZx5zOecvI7cRXPl0qv6iq3YlSuki
         rqPmR4ZpntpP37LZDj6rkdO9JGWOCnKeodlqfW3xv63yAJa7dlC2qyllz+rvKeTi02ey
         Kfsg==
X-Gm-Message-State: AOAM533d+1nuM2KApmoIyrKutseRRqxLsMt3fF9U7geG7kpPF+OPu3tZ
        WJFuwxHGbKXMu1xKd5QJeJ41vw==
X-Google-Smtp-Source: ABdhPJxw76tp7UaWDyAzzlAXHenQ+pVHhGiPNLiCsPef6Wq5fjJ0xKBS3IZng/PGd8GOGsaF9wcHnA==
X-Received: by 2002:a05:6000:1ac7:b0:1f1:f9ee:7c57 with SMTP id i7-20020a0560001ac700b001f1f9ee7c57mr20441117wry.52.1647934078865;
        Tue, 22 Mar 2022 00:27:58 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b0038ca4fdf7a5sm2053486wms.9.2022.03.22.00.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 00:27:58 -0700 (PDT)
Date:   Tue, 22 Mar 2022 07:27:56 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        - <patches@opensource.cirrus.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: Fix pinctrl node name warnings
Message-ID: <Yjl6fP2Bylv6ud8W@google.com>
References: <20220303232350.2591143-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220303232350.2591143-1-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 03 Mar 2022, Rob Herring wrote:

> The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> pinctrl: use pinctrl.yaml") resulted in some node name warnings:
> 
> Documentation/devicetree/bindings/mfd/cirrus,lochnagar.example.dt.yaml: \
>  lochnagar-pinctrl: $nodename:0: 'lochnagar-pinctrl' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/mfd/cirrus,madera.example.dt.yaml: \
>  codec@1a: $nodename:0: 'codec@1a' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: \
>  pin-controller@1c0: $nodename:0: 'pin-controller@1c0' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> 
> Fix the node names to the preferred 'pinctrl'. For cirrus,madera,
> nothing from pinctrl.yaml schema is used, so just drop the reference.
> 
> Fixes: c09acbc499e8 ("dt-bindings: pinctrl: use pinctrl.yaml")
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix lochnagar-pinctrl nodename in example
> v3:
>  - And fix lochnagar-pinctrl nodename in 'required'. Sigh...
> ---
>  Documentation/devicetree/bindings/mfd/brcm,cru.yaml         | 4 ++--
>  Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml | 6 +++---
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml          | 3 ---
>  3 files changed, 5 insertions(+), 8 deletions(-)

Requires rebase.  Doesn't presently apply.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
