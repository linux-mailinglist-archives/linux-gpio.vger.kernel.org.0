Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2285767FDE
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jul 2023 16:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbjG2OBE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jul 2023 10:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbjG2OBD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2023 10:01:03 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDBB1707
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 07:01:02 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4864cc561aeso1017181e0c.0
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690639261; x=1691244061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZVAQTl/KJwMx5MiWB8LXWVD/Og4xmNjpD5ZpeSnK7c=;
        b=ln2TgybqxMOQuiLgVhRhLYsqCFV+8HwlugaM1KqCgC8XMYyjTTJNTczBAf5RteyRiu
         EnUxo6Gpx7MnahdGEifLBxDmjnoVDHsU27yOxV0EIgSw/JqfZgF2ut6XolsFdcpXFgY/
         NLRO6vNtbqi4z7Wb2HqwcIQnCUk/VasMlHM5rjHx0EsvjMseLj2EFhhA3Ge2jCMmxm1p
         JwExs0c8Fz+1a7PfrbKqaeukn5dPUJ5eMgKPTD1GYc3f3LXY6uta9uVlq9eSrmmni1iB
         pTg1bU2dZouz/HV0Hh7D1+Qsgbzk6Lg2vxhW0bCyG6Ok0JRfsIhDE5Sl1s+eJc6EU1R8
         skIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690639261; x=1691244061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZVAQTl/KJwMx5MiWB8LXWVD/Og4xmNjpD5ZpeSnK7c=;
        b=cMuGcLOQFmtymfQT9hkv0mtCP0lKiONRWaBgOWtgrEtzrOCVXciFosKwu4sVM5/PzI
         07+qvtdbzn0kCgckNp9ES6VfOidwbqqu6tl2xUNmKp7p06twohhhhjpag5ADHIs5Zofa
         8UsVrBgWgtCOfki0z3oej1Xeei2J+6dgz8VvP9tySOkw/Bh9YZtm54xEeev+fcwT2egm
         TO+ehmFjOi1WbNFIE7myWjWe9Atu5z1V7hG8SNd9PrXDm2HTvd23a9kWlmuHw2cIJ5HN
         ZVYY1agFN4lewYSIc54xTGB19p5Ro6eHmv8bv5K6P0Q8kJyd7XNn+JjEgCs/T6i9HfOk
         cHvw==
X-Gm-Message-State: ABy/qLaieH0Hzb/39HgoZf/Hj0o7p+1YIL5z8MVOqolQtCgIeOC8eKEL
        S1QO5BQhkxX112YYsIHt9D0SU4ZxfQHcbhCcGu68DA==
X-Google-Smtp-Source: APBJJlEi2RKDbITIjmlsevHI7wqEnXUgQewcF8UvMqd3GbsnOxKtGzuN1hsrPvplsPt4ahSEpNWCfRcs3dx1OhXil1E=
X-Received: by 2002:a1f:ed83:0:b0:471:1785:e838 with SMTP id
 l125-20020a1fed83000000b004711785e838mr3717737vkh.2.1690639261551; Sat, 29
 Jul 2023 07:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Jul 2023 16:00:50 +0200
Message-ID: <CAMRc=Me3PAf7vuBS9MbLDh1t2MMWiTjA1CTW38UyMLmioYEowg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add gpio-line-names to STMPE GPIO
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 24, 2023 at 8:35=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> stmpe2403 supports up to 24 GPIOs.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Add min/maxItems
>
>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/=
Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> index 22c0cae73425..4555f1644a4d 100644
> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> @@ -28,6 +28,10 @@ properties:
>
>    gpio-controller: true
>
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 24
> +
>    interrupt-controller: true
>
>    st,norequest-mask:
> --
> 2.34.1
>

Applied, thanks!

Bart
