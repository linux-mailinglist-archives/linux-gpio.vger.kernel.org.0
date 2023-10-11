Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9764B7C60E8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 01:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbjJKXMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 19:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233849AbjJKXMq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 19:12:46 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0019D
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 16:12:45 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5859b06509cso264794a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 16:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065965; x=1697670765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SUsXcVKQn8A+B+wkybfUBsU0p3cLnFC4FwTHNb3kWg=;
        b=Ie/9FT9rO7sD5nm73t4qjjqYeGqISckKD1SqVALlJSd+tMoAwrPeQIYkNcl+cqjw4S
         rkXbZmKFA/F5eMKk15Qd4uovBWAmyBYWQvoMQxCs5vGCfSgAToK+tp0imQRHdioyDqHW
         wvNw9t9M5F+AJZbrWGHz7VtAlfBiuq3UtcMNR7EnyawbpChIJ0AnUKw1suMazUqnCl9M
         K7lCs4gZZOAUQ4ODVg8aqh10Ue9v4xCi25+Z4Gzj5xUd69N5eKXpeuhUchjKqhM6tjsm
         8r/NhG4YBHm0Jr6MZ+zBQVrLLnVHH9FX8VeLgPhViL3qxGw/ThdTyNCa/9UrSCyu92X2
         MZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065965; x=1697670765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SUsXcVKQn8A+B+wkybfUBsU0p3cLnFC4FwTHNb3kWg=;
        b=Z5hTakt8G5qEr2pchJCFIOHDgVeQLLUTEi6avnRHjYUGUraO22I7criy16WLHfrMlz
         obDktndBClOPkrWwywCOIeCyoiCHD76ThWR0kMPkNl7TH01I4NgNc7AnLNyDq4XxS7Y4
         7/6WgqyBvzOpfEMRGg2gcJ6TWxGNehNrLb8Xota14/Y3VDqgQkEFoYDl19TWYti3K72l
         K2oPobTKpwxu1VOLMOeXAe3FdfoZJEsAAS1qJ+b2Y4puw/G2vdaO+iT49KEmLT1qcQnM
         vw3mLwJq1OWwWGnsJDYB6ywqyqrghll25cNHi5ScIhCUt6+HqnYIvfBrfxq1iOMLbCHK
         qOAA==
X-Gm-Message-State: AOJu0Yy+1KbwK7ZNYN7TLKYN4hic9mtmJVwVg1Od8/jdHYkQOh7Q3iZt
        Ytq9HC+UsglyAbaUGlkIt+0clJK1xBQPKR43zHqpeQ==
X-Google-Smtp-Source: AGHT+IHaJTcIj35kPFbipbN/CrQTdHVJTofe7kJ9Oof6VmcGMyPjSqNPDoeQzoD/zw9b5RjGiSgpqynUtZsW+Lj2se8=
X-Received: by 2002:a05:6a21:3d88:b0:171:a3e8:8c05 with SMTP id
 bj8-20020a056a213d8800b00171a3e88c05mr5927440pzc.53.1697065964759; Wed, 11
 Oct 2023 16:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org> <20231010224928.2296997-8-peter.griffin@linaro.org>
In-Reply-To: <20231010224928.2296997-8-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 18:12:33 -0500
Message-ID: <CAPLW+4nO8kfUbQ6wJDjG_Ft0HAu_j3gAvcLLHU3BAHnALqaULA@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
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

On Tue, Oct 10, 2023 at 5:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> where more than one pin controller can do external wake-up interrupt.
> So add a dedicated compatible for it.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wa=
keup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pin=
ctrl-wakeup-interrupt.yaml
> index 1de91a51234d..7cddce761c46 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-in=
terrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-in=
terrupt.yaml
> @@ -29,6 +29,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - google,gs101-wakeup-eint
>        - samsung,s3c2410-wakeup-eint
>        - samsung,s3c2412-wakeup-eint
>        - samsung,s3c64xx-wakeup-eint
> @@ -99,6 +100,7 @@ allOf:
>              enum:
>                - samsung,exynos850-wakeup-eint
>                - samsung,exynosautov9-wakeup-eint
> +              - google,gs101-wakeup-eint

Maybe move it on top, to keep the list sorted alphabetically?

>      then:
>        properties:
>          interrupts: false
> --
> 2.42.0.609.gbb76f46606-goog
>
