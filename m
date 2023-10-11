Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 233E47C60B5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 00:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235194AbjJKW6J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 18:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbjJKW6I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 18:58:08 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF2FC4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 15:58:05 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-58d26cfe863so268790a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 15:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065085; x=1697669885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYWR/2v3Fd1MoRhNjm1nMoJPUsc+Tcv+RBee2GjvOUk=;
        b=ko1nE2h4dDYIDN3xlTNlKtALe+xg/TuF5LX+Ns3wgdFtOwsAsHrw2XtA/c+os166Z2
         9qmZiq2i4ZYXTaEFlC+Fg1/tIm7pLLpSEvWNy37/7IYIHImqGz4kk1GuCOfikGI/r8vz
         KsysDgrZoe2x3vjpz2GKr5xNlbssl3AQ7g9bZD42KKmxxJqjzGJwIe2TagOkH3O94U4j
         Zvlkg8FcsLlYR8cCEte0OVAfGRwJAXTk/hL3jgLUeIr8p/0fxwvyCM1yq/dhnQZLlTv4
         WI7jsPOB2JqayajjeMTr16zReIoFNmyP95LqyYi1OA0l61dmUm9rSN/zsgP0aMY4Mucv
         /dMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065085; x=1697669885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYWR/2v3Fd1MoRhNjm1nMoJPUsc+Tcv+RBee2GjvOUk=;
        b=p7NBKh2Db51dheRNHANZDsPTVmsZ2H1WlmnsuPaenYydFTS+uge7/wLn/L28e8bUC8
         ZjbcpQkbme3zUjGnetNG6PWLtt58BhQNtOrR2AnakkXSONS+kjWzgcjiORurKUAly2BX
         s7eq0JKk9RuD7YiQNAu3wAf5i5n4mDQxUmK1zEZ36Elc+a7u/68/sIIFPGlEZWUPv826
         OsLrH9FZlfP7ejj6JrXMBJn6hFpXnSnbgQ65sx/Ll33mLx/LNwH9ZIVz7NAe/WVux3Gq
         CYusTaBE3q6Y+Y9gIphCfbdDbIZXxMqXOwiNC+pnh9w/XDXni8T7ZwqFJWoA5aMMs05f
         cyYQ==
X-Gm-Message-State: AOJu0YzEvjJf0rIgnJIEsqEJjv8sKbWjnlTp7JR0LtDZ4JkOF5RV4a07
        styTB7C4jkyMMju5hbfWHBQLCO9yOKEsKJ1XnJ0FaQ==
X-Google-Smtp-Source: AGHT+IEJWmglU1/rKohd2ItY6wv1Qku3KrD7vpBLL7BDiUXScJ4VqWtMu4B/i5Qi0h72Dw0/+UcqwB+9IoDs4GWrwmk=
X-Received: by 2002:a17:90a:9f46:b0:27d:bc2:7c6e with SMTP id
 q6-20020a17090a9f4600b0027d0bc27c6emr2337631pjv.20.1697065084819; Wed, 11 Oct
 2023 15:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-5-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-5-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 17:57:53 -0500
Message-ID: <CAPLW+4m4zUFfRWMo+KC1ymGAgHtbLxyx6L99Qd0vJYQXmmCvbw@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] dt-bindings: watchdog: Document Google gs101 &
 gs201 watchdog bindings
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
> dt-schema documentation.
>
> gs101 SoC has two CPU clusters and each cluster has its own dedicated
> watchdog timer (similar to exynos850 and exynosautov9 SoCs).
>
> These WDT instances are controlled using different bits in PMU
> registers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 8fb6656ba0c2..67c8767f0499 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -17,6 +17,8 @@ description: |+
>  properties:
>    compatible:
>      enum:
> +      - google,gs101-wdt                      # for Google gs101
> +      - google,gs201-wdt                      # for Google gs201
>        - samsung,s3c2410-wdt                   # for S3C2410
>        - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and=
 Exynos4
>        - samsung,exynos5250-wdt                # for Exynos5250
> @@ -42,13 +44,13 @@ properties:
>    samsung,cluster-index:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850)
> +      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850 or Google gsx01)

Please stick to 80 characters per line when possible.

>
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos7 and Exynos850).
> +      Exynos5420, Exynos7, Exynos850 and gsx01).
>
>  required:
>    - compatible
> @@ -69,6 +71,8 @@ allOf:
>                - samsung,exynos7-wdt
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
> +              - google,gs101-wdt
> +              - google,gs201-wdt
>      then:
>        required:
>          - samsung,syscon-phandle
> @@ -79,6 +83,8 @@ allOf:
>              enum:
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
> +              - google,gs101-wdt
> +              - google,gs201-wdt
>      then:
>        properties:
>          clocks:
> --
> 2.42.0.655.g421f12c284-goog
>
