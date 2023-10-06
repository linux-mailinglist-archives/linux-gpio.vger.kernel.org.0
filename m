Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03657BC095
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 22:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbjJFUof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 16:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjJFUoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 16:44:34 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED33FC2;
        Fri,  6 Oct 2023 13:44:31 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6c63117a659so1595281a34.0;
        Fri, 06 Oct 2023 13:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696625071; x=1697229871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVeSFOcC2dk0ctOlaTvU697lvAQuyZRAWFETqFvTV5k=;
        b=jbtKxs7I+IGJLCk5LvGgCUlu3Q3aNjekC6b7LF9OXSqp6dfWYny2lq00LKKDplAQKc
         zy/OJYhpIBObRtqMCvnNJdmofX8iLRrkbsXg/Nlteh5Qn7aoecLzb5VI9oMjFC1CQScc
         m/FHXI/qh8pAccsrKHyAiYD6DrlRfvf02Y5MjbhexdNjW340ejJ9N60TVa41elhnwqvo
         ssuSkQdY6c0hX34uduGy1eGMggnLoC4niuwsqcUMhLCnZPmAD8cCxsS4XUrSX0NzDnAp
         U4emfECJ85TL655r/9BwHy4qFjczIxNu2sr49lsptFBWxRfs8sb73bBa1H4ueKuYloqy
         OONQ==
X-Gm-Message-State: AOJu0Ywb2phqbEAz+fd7uBBZr84OUv91eWK3j880F0t49K8JwzllvOkn
        s6gIE2FDSRY+ofeVJjU4WA==
X-Google-Smtp-Source: AGHT+IEwEFUtgK5CZxwluzpBUXw0YyfFoQ+xTnFLszG5vqKToMmpIR0Khu/GYDeAFgRyI1o1TgrJ9Q==
X-Received: by 2002:a05:6870:5608:b0:1de:84a3:bb91 with SMTP id m8-20020a056870560800b001de84a3bb91mr10491581oao.16.1696625071080;
        Fri, 06 Oct 2023 13:44:31 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id br26-20020a056871b41a00b001c4ede43955sm877065oac.31.2023.10.06.13.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:44:30 -0700 (PDT)
Received: (nullmailer pid 267686 invoked by uid 1000);
        Fri, 06 Oct 2023 20:44:28 -0000
Date:   Fri, 6 Oct 2023 15:44:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 06/21] dt-bindings: arm: google: Add bindings for Google
 ARM platforms
Message-ID: <20231006204428.GA265726-robh@kernel.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-7-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-7-peter.griffin@linaro.org>
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

On Thu, Oct 05, 2023 at 04:56:03PM +0100, Peter Griffin wrote:
> This introduces bindings and dt-schema for the Google tensor SoCs.
> Currently just gs101 and pixel 6 are supported.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/arm/google.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
> new file mode 100644
> index 000000000000..3759d423d9cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/google.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/google.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor platforms
> +
> +maintainers:
> +  - Peter Griffin <peter.griffin@linaro.org>
> +
> +description: |
> +  ARM platforms using SoCs designed by Google branded "Tensor"
> +  used in Pixel devices.
> +
> +  Currently upstream this is devices using "gs101" SoC which
> +  is found in Pixel 6, Pixel 6 Pro and Pixel 6a.
> +
> +  Google have a few different names for the SoC.
> +  - Marketing name ("Tensor")
> +  - Codename ("Whitechapel")
> +  - SoC ID ("gs101")
> +  - Die ID ("S5P9845");
> +
> +  Likewise there are a couple of names for the actual device
> +  - Marketing name ("Pixel 6")
> +  - Codename ("Oriole")
> +
> +  Devicetrees should use the lowercased SoC ID and lowercased
> +  board codename. e.g. gs101 and gs101-oriole

Wrap lines at 80 char.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: Google Pixel 6 / Oriole
> +        items:
> +          - enum:
> +              - google,gs101-oriole
> +          - const: google,gs101
> +
> +additionalProperties: true
> +
> +...
> -- 
> 2.42.0.582.g8ccd20d70d-goog
> 
