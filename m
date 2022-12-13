Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF9164B1EF
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 10:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235117AbiLMJM5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 04:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbiLMJMe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 04:12:34 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F521E713
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 01:08:31 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3b5d9050e48so183446577b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 01:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U9HKHwLcWNK2TqYeomjFMLG9DcMAqE0plssX7QVY4Oo=;
        b=aQcWGBzMP0IL//sgwo6ILKKOc7+49gwUtXWQxIhZV1XTRHtEFVQVHpZLQi9VOw5Dda
         dL7kAFJf/d7xjUGjGbQE2VgbnVULJ/iKI/Z31Dt/NTQ9ljlGydVoZn28A7RL/n0XYDYk
         NfecvBVbHyzbhTvzTXoWmO+pUzQc0fjIrBph21hQ4fLO/LrXI2O2tQUvquBF46pTKFul
         EuJeMB0K6ENAbEiciD3JJhCnNtxLKi2nOVh/38oHuWr+KK9Li9qLRnKn2SF8633+M2xe
         5igi14IgiTABHr0YXeZDLWubjEHKShnVdJ7GAm3+RoQtCtwdRwAMXRXzzguUk35+gkk3
         XYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9HKHwLcWNK2TqYeomjFMLG9DcMAqE0plssX7QVY4Oo=;
        b=03DDWIXCskxolZc6CTMABfnNBZXdwOEQq5xeqs2SaCTh8zpmWpjZKVa+jdSFUREx0O
         mr3zHpae6/y3Pk0YWkaarO1t3HQGVWxz3eHlXGkONgbZoA6QDoC8zEQK+CwfRVUv5v4+
         nvsMFlnK0jA7b6k3c7R1W6fqFVPqN8k6WHXpWDUZzT8Qeft1IOKSgoIXnRwqJGLZ74uj
         jNmB4ldHRftCSJjEbP33qp9notBbWCnHrC2ycau/TqJXCwBNRovvclGJhiti+6eo7NL7
         oSPsE/ky2/f27EMwFCRj4fJdUYWWBqsQGdSWJI8vLVI4V1Oe7iw/wVQXNqHbSGZVeSuj
         I2Qg==
X-Gm-Message-State: ANoB5pl0vhdCBgHLkJB99W5ZA6Nz/vRdXCO6+RknfnNWmSgbaTeC5s7O
        01TyulpplahZJQJZMc1hHK+leGwflNM+dWmSFXG9/A==
X-Google-Smtp-Source: AA0mqf6ulzUvt98Vy1YL6tZkKQhitarjNZx+hJ+UJrQPu3PVXgMkeEmRdS99eMQ1mVac7Kz+IOScp00u1hJUXSfqiaE=
X-Received: by 2002:a05:690c:1c:b0:3c8:b520:2fa6 with SMTP id
 bc28-20020a05690c001c00b003c8b5202fa6mr509619ywb.411.1670922510939; Tue, 13
 Dec 2022 01:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com> <20221212103525.231298-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20221212103525.231298-2-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Dec 2022 10:08:19 +0100
Message-ID: <CACRpkdYioW1GROHFxA1vuAEiXqHh6fAu5CXNLcTvW_w3mWjSPw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpio: Add optional ramp-up delay property
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 12, 2022 at 11:35 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> This adds a ramp-up delay (in us) for adding a delay after enabling
> GPIO. This is necessary if the ramp-up time is increased by some external
> components. Usually this is quite fast, but certain combinations can
> increase this to grater than 100ms.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
(...)
> +gpio-controller@00000000 {
> +       compatible = "foo";
> +       reg = <0x00000000 0x1000>;
> +       gpio-controller;
> +       #gpio-cells = <2>;
> +       gpio-ramp-up-delays-us = <0>, <0>, <0>, <0>,
> +                                <0>, <0>, <120000>, <0>,
> +                                <0>, <0>, <0>, <0>,
> +                                <0>, <0>, <0>, <0>;

Why would this be different per-gpio-line?

If this should be on the GPIO controller, this should be the ramp-up for the
GPIO controller output itself, not for the random electronics that may or may
not be attached to the line.

Otherwise the ramp-up should certainly be on the consumer side. And that
seems very much like what is going on here.

Consider a gpio-regulator:


Documentation/devicetree/bindings/regulator/fixed-regulator.yamlproperties:
  compatible:
    enum:
      - regulator-fixed
      - regulator-fixed-clock
      - regulator-fixed-domain

  regulator-name: true

  gpio:
    description: gpio to use for enable control
    maxItems: 1
(...)
  startup-delay-us:
    description: startup time in microseconds

  off-on-delay-us:
    description: off delay time in microseconds


There is one consumer, and if you add ramp-up and ramp-down delays to the
GPIO lines like this you have just created two ways of doing the same thing.
When there is a ramp-up for a regulator now the used can choose to put it
on the regulator or on the gpio.

This is clearly ambiguous so NAK to this approach. IMO the property goes
on the consumer due to precedence.

[Other context]
> Laurent suggest to add a GPIO delay node in DT. IMHO this increased the DT
> complexity unnecessarily. But comments are welcome.

If the consumer subsystem don't want it, I guess this is where you would
have to go in and add more DT descriptions for the electronics on the
board, which I understand is a bit frustrating, and it is hard to find the
right trade-off. It makes me think about the classical problem "how long is
the coast of Britain?" by Benoit Mandelbrot:
https://en.wikipedia.org/wiki/How_Long_Is_the_Coast_of_Britain%3F_Statistical_Self-Similarity_and_Fractional_Dimension

The DT maintainers will have the final word on it I guess.

Yours,
Linus Walleij
