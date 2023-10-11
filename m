Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEEA7C60DE
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 01:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbjJKXK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 19:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbjJKXK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 19:10:56 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB53A4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 16:10:55 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5855333fbadso270765a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 16:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065855; x=1697670655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/jasr9MC8Q6p4ZHn0V5Ncug2TkCqML9WgvcfMCVqZc=;
        b=rn5XYdpXBJmRRxzLl64pOttL81Znkyvc86DtKfvm77gnnEK1y3GCexHtg24ZtaNfwC
         5kC6okwJQ6Kr1w52vg8THyT8T1L/bRs3s59hHR7N/zYScOTeJUteUeJp07DUw4IM/V94
         GqOoz/E6LzU08J/nvRQLOVmiYcRsRPq06yEkgXubs3bT0HomCcFPbjmpbqmOoq7tKVmo
         VXneyDRSRYs97RiJ+jJtTl8YtpEVT7pRLLJ+ac8PlFEg6oqrnqRi4unckdzVZZJesB6f
         W/ceZ+orIlLpE3zo9v5Vmna5m+X86ialW+78PTDRZkre7jubvuILSRzvpeiE2vn0W75Q
         TRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065855; x=1697670655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/jasr9MC8Q6p4ZHn0V5Ncug2TkCqML9WgvcfMCVqZc=;
        b=r2qMLUfReMtnlYNdEcJY3i1TjS4h901p3rkvgin18dg7JHFiIutz9t9au6NEsQbTQo
         vwH81iPzJSxurT7gyxy0lokawhzWSRn1uqE3pEfMBjUkJ2FaDVK2/cI4Tgvu3BjbGFfM
         cxMzeGz5Tn9nLYBYuwkPpEOoTYiIqtuFNMXyIerGfTCcZI6i95voxKm9Wiw4vAxL1ZSF
         qv9+qqPhYq/6AfB5I09FmoHLToQFnh+ZNBGpJ7FhTaiUCYT76M4qfH/YBLr+XwzEHHGK
         zT2y8tyc7xsjR00tkoKNUPNhkIPK5T4CUia70eJ4tXwXuwB77rSA/EO+U2CSk0/a/blF
         3SJg==
X-Gm-Message-State: AOJu0Yw8ZlVlmzc9o3MWJJDVGccBkXMpt2FTaxMOPwQ3EYY+DuXmk28P
        1ez/JT/moh17FzZEkSSwwXCmzPxgnAPunA5hRe2k2w==
X-Google-Smtp-Source: AGHT+IFIp8h+HJuF+A0hsmsQVC0HXjBDyrJM8tEfZ3SsW5MlLdmWSUbNrzXCF7aVJEtvzszUcBZLzs/De5VMD3dWoVE=
X-Received: by 2002:a05:6a20:5485:b0:161:25e5:8de9 with SMTP id
 i5-20020a056a20548500b0016125e58de9mr24576989pzk.48.1697065854855; Wed, 11
 Oct 2023 16:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-7-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-7-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 18:10:43 -0500
Message-ID: <CAPLW+4n=dBdpwPP5bgww6wGE1bPd32k=OT4R8ZUOt4BUvjVPGg@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] dt-bindings: pinctrl: samsung: add
 google,gs101-pinctrl compatible
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
> documentation.
>
> Add maxItems of 50 for the interrupts property as gs101 can have
> multiple irqs.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/pinctrl/samsung,pinctrl.yaml     | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.ya=
ml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 26614621774a..6dc648490668 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -35,6 +35,7 @@ properties:
>
>    compatible:
>      enum:
> +      - google,gs101-pinctrl
>        - samsung,s3c2412-pinctrl
>        - samsung,s3c2416-pinctrl
>        - samsung,s3c2440-pinctrl
> @@ -58,7 +59,8 @@ properties:
>    interrupts:
>      description:
>        Required for GPIO banks supporting external GPIO interrupts.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 50
>
>    power-domains:
>      maxItems: 1
> @@ -134,6 +136,24 @@ allOf:
>            minItems: 1
>            maxItems: 1
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-pinctrl
> +    then:
> +      properties:
> +        interrupts:
> +          description:
> +            Required for external wakeup interrupts. List all external
> +            wakeup interrupts supported by this bank.
> +          minItems: 1
> +          maxItems: 50
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.42.0.655.g421f12c284-goog
>
