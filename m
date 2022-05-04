Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40C551B141
	for <lists+linux-gpio@lfdr.de>; Wed,  4 May 2022 23:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358595AbiEDVoz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 17:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239888AbiEDVox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 17:44:53 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E183527C1
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 14:41:16 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id y2so4630174ybi.7
        for <linux-gpio@vger.kernel.org>; Wed, 04 May 2022 14:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0oiHzbsJqFX9OhI8V4cH2L2tOo6dNPXB6PDhxSDo53Q=;
        b=S/bjx5OcVouafwAfy0YKuRvxqmD69ijjZevEiYqdXHP+hEJ7OwavFW3Ov+lkelgXgA
         oZaitNbBLT8LJprr3zjadOUPDaeljx2mJgrJSOub4MZyW7ZddooUbNhoEu0ZBO4Hc90l
         hYlAen4k5/vwfECAfiUbf2ZZnoyufko52bOLrHWFyFIcY17y5gD3SteI17kVgVwmTQU7
         SRPFuSvVLpZuDdVYRuAeixhTmVJnF8UU3aVymGkJj2Rskx8v9UTI667gS4l1ANux6bKy
         xqhllm1BYrtJhsEzXdNwttDfhn7lPWRSX79ycLvvJelOPRMgk9vV8NzUIR6ujbBDEstE
         Khdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0oiHzbsJqFX9OhI8V4cH2L2tOo6dNPXB6PDhxSDo53Q=;
        b=1nr+3XjJLInv76mMAYV9s+7uxbW6liqJa2oB9+JhUSbe/hJye5UlQVndC4NwnH8Q8l
         DO3L7hY5eUwoc/Ql5jKkOVbxjSrdU3f7xrbnyQJiPgSIsr15e92Bm8+SoDGcZdEOHkAR
         eloCuKmqRhPFIY7XKiJQLC3N4/I+/d+eKAlSHUZo3dQUgH/FsDDzoGXD4VITV7jqnGjY
         MQSYI7bfIo59B5ttAg5ZPmUg+EKEq1Lvh+V8VqHgixMJ+zqwJFm7x7kbOviPpeuCggLA
         0e3+fagD6Hz54lN7v5wZ228Scb8l+DZykalcEadMXuuzea7QG70yfhxXD1kKm+5r18If
         14wQ==
X-Gm-Message-State: AOAM530o9wQW1qI2yklTAujswIoFwncmHmFQHdsSF/m/zu5N8Q7VNXns
        ROGMN4PKE5FZDXz3YcfASk4RA6Z+QcMfzdV+6GQmEg==
X-Google-Smtp-Source: ABdhPJyVIOngs+4hYpT+KP01cmUaWQ5B6063XyuvBo8CxmgOqn1Lr06r42GRR4e+pPfqvbzhEmlOo1AvI2lbJsukHuU=
X-Received: by 2002:a25:aa92:0:b0:649:6b56:5597 with SMTP id
 t18-20020a25aa92000000b006496b565597mr14164323ybi.295.1651700475736; Wed, 04
 May 2022 14:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220429061332.25135-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429061332.25135-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 May 2022 23:41:04 +0200
Message-ID: <CACRpkda_0feE4074c66m-gYRY7xzW87HHmsNLA2YyQRP6h4_WA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: tegra194: drop unused pin groups
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 29, 2022 at 8:13 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The sdmmc1_hv_trim_pins, sdmmc3_hv_trim_pins and sys_reset_n_pins are
> not defined as pin groups:
>
>   drivers/pinctrl/tegra/pinctrl-tegra194.c:1119:27: error: =E2=80=98sdmmc=
3_hv_trim_pins=E2=80=99 defined but not used [-Werror=3Dunused-const-variab=
le=3D]
>    1119 | static const unsigned int sdmmc3_hv_trim_pins[] =3D {
>
> Proper fix would be to define them, but this requires knowledge from
> datasheet.  Removal should not cause any harm and at least it silences
> the warnings.
>
> Fixes: 613c0826081b ("pinctrl: tegra: Add pinmux support for Tegra194")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied. These can certainly be added back easily when they
have a practical use.

Yours,
Linus Walleij
