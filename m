Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202E37CA9B7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Oct 2023 15:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233904AbjJPNhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 09:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbjJPNg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 09:36:59 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5422311B;
        Mon, 16 Oct 2023 06:36:52 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1e12f41e496so2848087fac.3;
        Mon, 16 Oct 2023 06:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697463411; x=1698068211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRUIaXf9k/DIdXsT6g0H4xCygfKjx74subHfMqQgJpY=;
        b=n442ToXGz5orUI7U1bGMHu1m8FyFDNwOAWoURhMM8zhwDbzvN46JQdTeNfIWgsT35U
         DWwWIujfKBcRiyxH5hv6iPEoo+xQwXmXah98VQHD0J1duRZebTd4HP27MtYFHvOngNj9
         u/vUR1VsZbDSO7GG+Lvwa4WafK/z2t2v2KmwLavPDfrq0ele8lHXiISrsBMBp1Qt4LMz
         5p5+7SwY/DCwXu1wGJGIgDSVnfUXj4is68m6sCEOPHff7YsLqHt9Q4kSbbQYalwntAEW
         p2QgLTgsw279EBZ4D1ho0JmJSpz2zC3wTbryn5kOW6ooKeCpUfWoRW9ZyF4aqdfm0bbH
         hZZA==
X-Gm-Message-State: AOJu0Yx3nxqjlDSsJ2ADxLrTb8csr38G8mi8mxLhW0cT3h2BDy9dgFxC
        xZmVkwYStD5MmChSMvAYfA==
X-Google-Smtp-Source: AGHT+IEe4san7PMnmHiunNMgfm3nxMWqNytNcxP9iMBm33pTk2KyiFPmmXl06nI1WoeZ1jyKakgadw==
X-Received: by 2002:a05:6870:ad08:b0:1e9:8d44:a5cf with SMTP id nt8-20020a056870ad0800b001e98d44a5cfmr17432707oab.17.1697463411381;
        Mon, 16 Oct 2023 06:36:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o12-20020a056870910c00b001e126575e1bsm2015347oae.34.2023.10.16.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 06:36:50 -0700 (PDT)
Received: (nullmailer pid 2642681 invoked by uid 1000);
        Mon, 16 Oct 2023 13:36:49 -0000
Date:   Mon, 16 Oct 2023 08:36:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
Message-ID: <20231016133649.GA2641997-robh@kernel.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-4-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-4-peter.griffin@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 07:48:06PM +0100, Peter Griffin wrote:
> GS101 has three different SYSREG controllers, add dedicated
> compatibles for them to the documentation.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 163e912e9cad..dbd12a97faad 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -30,6 +30,12 @@ properties:
>                - samsung,exynos5433-fsys-sysreg
>            - const: samsung,exynos5433-sysreg
>            - const: syscon
> +      - items:
> +          - enum:
> +              - google,gs101-peric0-sysreg
> +              - google,gs101-peric1-sysreg
> +              - google,gs101-apm-sysreg

Alphabetical order.

> +          - const: syscon
>        - items:
>            - enum:
>                - samsung,exynos5433-sysreg
> -- 
> 2.42.0.655.g421f12c284-goog
> 
