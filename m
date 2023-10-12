Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5117C6507
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 08:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbjJLGCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 02:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbjJLGCQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 02:02:16 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB7EBA
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 23:02:14 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-27d1f57bda7so346873a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697090533; x=1697695333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+44WqOGvvnQF1tRBe3p68MStU8EWKoC7C3wElDjRa1k=;
        b=N4KcRbJs8l6nyaLL8yi+0IJfZPXFOXcBvjQ2+aKm1qddpB1mubaj54GvVuJ3vcnFYg
         AbLjPHPdnKgR1qyhxjNc61FVwMz6OeLlrl2Tlk1cylBMIlJMm+XkKXvr+UN2V9e1JGXL
         0BAbE1ISJGw6Cggd3YhocH7905ITOsap0M+zJZ4lRQQMroE9rLlrv3m1GGhApUTe4gVR
         3nyMyH51zI3dxBJyWi9EQoRko1pp/hVxYUs5b4+EEGmghRaW6u7g4mKLCwTKfXtlUZlc
         oXXzkogwJr4wINohAPw5ovpvUHk40USjhJI8XmGbmU7dTU7/GFCrCURc+VJmrg1T4qff
         4juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090533; x=1697695333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+44WqOGvvnQF1tRBe3p68MStU8EWKoC7C3wElDjRa1k=;
        b=npNGJ/QSwRFeCQFQXNAKspQCsJ4P9OwX/2n5WiZ/eWqwu5wUBY1LKTcyib9c22QrK/
         3Br/KGwZ4mJBwGExRFgOwfJKl5SPfWPfKoxBMrn4EjmVw9wLdzzn0iIVE5RK2BGik2fo
         TcUCXi75nQ2CtssJx/onbn2sxJd/lsEcsxu/euBPjGTwMnl5bOeiyZiSVHRC+vgXE2IS
         EKbmhmDXqj7kc5LzjFo3+yXpMLhsLXGlwP7wktVvefn57z2mYrIccVPht5erGAGK2YW4
         YMZObLTiu7lPSmIJo+uRFkvf5WaOpbHurTmjIMtQ3zZKN5Cdo5KRA3JbW4AvHUXDXxJw
         gV3A==
X-Gm-Message-State: AOJu0YwRtggQ+fgLsBQX/t95CbNfkXjHKI+vv90j7z76hGXURFLnSgxA
        cbh6Jc1L9d4yrVjqtzDVANt9GjEPe0Iuy2GRB0wbAQ==
X-Google-Smtp-Source: AGHT+IFdFgVv/LOVxR9G3F6/MvkmcUviTbxuwDLT13rcSWpGFB1soPlPNHvMCUGDirrBkuMLzVO+GFyrHni85w0FE0g=
X-Received: by 2002:a17:90a:9106:b0:261:685:95b6 with SMTP id
 k6-20020a17090a910600b00261068595b6mr22023938pjo.13.1697090533614; Wed, 11
 Oct 2023 23:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-21-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-21-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 12 Oct 2023 01:02:02 -0500
Message-ID: <CAPLW+4n-n7POjbi0Fvtdp9kM8tiyuRb5vdmu6Z9Y4fNhtLL4Dg@mail.gmail.com>
Subject: Re: [PATCH v3 20/20] MAINTAINERS: add entry for Google Tensor SoC
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add maintainers entry for the Google tensor SoC based
> platforms.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..149a0c364309 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8836,6 +8836,16 @@ S:       Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
>  F:     drivers/firmware/google/
>
> +GOOGLE TENSOR SoC SUPPORT
> +M:     Peter Griffin <peter.griffin@linaro.org>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +F:     arch/arm64/boot/dts/google/
> +F:     drivers/clk/samsung/clk-gs101.c
> +F:     include/dt-bindings/clock/google,clk-gs101.h
> +
>  GPD POCKET FAN DRIVER
>  M:     Hans de Goede <hdegoede@redhat.com>
>  L:     platform-driver-x86@vger.kernel.org
> --
> 2.42.0.655.g421f12c284-goog
>
