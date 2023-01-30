Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33013681F68
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 00:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjA3XLN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 18:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjA3XLM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 18:11:12 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D7D7ECF
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 15:11:09 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4c131bede4bso181230437b3.5
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 15:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LDfQZoGlwUK+kzxRXSbyFi2jPNk3BphEmmNBP0GjF0Q=;
        b=OQ5btj3qyNunRkWa/eT2Rf1e2qqvSRm/L4uLNC8PepSZPzxTIskzOaRby8IxSTJK1a
         A4DJcRTNXP9feNHl9aBq3x7WgYKKrBMUhPFJnfmAVFoIPC834tDKXunaB9jtZTz7COHt
         0CEAmfvG6UfZMEo1bA7Vi/L8t9/tNunOZ521l7rvupZa9n0rxe/9e3WsAcas95BatZDb
         MIoeWvtgMjugIfsqKyMQ+ZA8rY0LX3Daz7lN92Ul91r1riwqf6MML/jEAbnuhIER77tt
         LeWz2X9ZYld81ddZiBXddfLmU2YIzWZ7r+qzxfr8K3QK7yj02Um4UZPadN7qmXoWkXP1
         U1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDfQZoGlwUK+kzxRXSbyFi2jPNk3BphEmmNBP0GjF0Q=;
        b=2c7ATXRK5rlr/RxX2ZKR/6CUTJaPhFUN3pdROGAQD7uRZdTJ9pqTew4BXFyueySZSb
         C50sU5ZixRXMDTQ2ZCqp45tBr+t96l4y3hmLXpkOs6XVQWcKa0KNORrqAvlcLuq46Vlj
         scb3bGCuBcc+GHfAd4ztSfTyMHu/jcVaINO+D7jQKzBbFjLV5Efs57u5JVLPUogsEZ8b
         VHV7/I+1yzje9D0mC4bvEW+Br5uX/JStL6rBx6RR2FdA4yakzZc3+rGTGlY45wuzs+S6
         1Rj+sXJcDcRABfKBRJASZRNLxcp9XkREKm/zo3ebMHxAv4BCri2+ZphiF5A4OAdK+TIu
         euRQ==
X-Gm-Message-State: AFqh2kpbAxuUy8UGP8COI7+7WFLo/dbBUTp5TPaOUWmAMVecB0BqGixF
        dOVfUGys+FeY3u1q2Kc32+tsxBIknka+aKm0Nhdsqg==
X-Google-Smtp-Source: AMrXdXtRz1bfZDc0Sl8udmgePKD2SUPlDJ5rqBwH5lFq8s8CAawhOWc+wuDT5y9DNmCpcoDn2Xrf/+ydTkvzsK2sjQE=
X-Received: by 2002:a81:1a0a:0:b0:4dc:818f:f9f2 with SMTP id
 a10-20020a811a0a000000b004dc818ff9f2mr5170823ywa.469.1675120268932; Mon, 30
 Jan 2023 15:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20230130165435.2347569-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230130165435.2347569-1-konrad.dybcio@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 31 Jan 2023 00:10:57 +0100
Message-ID: <CACRpkdZjAyLUg3V7ZTzeMfUOTrndLrRX_gTFdO+amSmZkzB72Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: pincfg-node: Introduce an
 overridable way to set bias on pins
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 5:54 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:

> We came to a point where we sometimes we support a few dozen boards
> with a given SoC. Sometimes, we have to take into consideration
> configurations which deviate rather significatly from the reference
> or most common designs. In the context of pinctrl, this often comes
> down to wildly different pin configurations. While pins, function and
> drive-strength are easily overridable, the (mostly) boolean properties
> associated with setting bias, aren't. This wouldn't be much of a
> problem if they didn't differ between boards so often, preventing us
> from having a "nice" baseline setup without inevitably having to go
> with an ugly /delete-property/.

I see what the problem is.

Have you considered pulling out *all* the pin config for a certain
reference design into its own .dtsi file, simply? And then not include
that to the next product.

This pattern is pretty common.

> Introduce bias-type, a bias-type-
> specific property and clone the pinconf-generic type enum into
> dt-bindings to allow for setting the bias in an easily overridable
> manner such as:
>
> // SoC DT
> i2c0_pin: i2c0-pin-state {
>         pins = "gpio10";
>         function = "gpio";
>         bias-type = <BIAS_PULL_UP>;
> };
>
> // Deviant board DT
> &i2c0_pin {
>         bias-type = <BIAS_HIGH_IMPEDANCE>;
> };
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

The idea is pretty straight-forward.

But it applies to systems already using the bool flags. So what do
we do the day we manage to have:

{
    bias-type = <BIAS_HIGH_IMPEDANCE>;
    bias-pull-up;
};

As you see this makes it necessary to author some really nasty
YAML to make sure this cannot happen or everyone has to make
a runtime check for it.

Another problem is that I was just discussing with Bjorn for some
specific i2c pull-up, was actually using the argument for
bias-pull-up with a parameter:

bias-pull-up = <8000000>;  // 8kOhm pull-up

Not to mention that other platforms than qcom use this and
qcom use it for drive-strength I think?

+#define DRIVE_STRENGTH                 9
+#define DRIVE_STRENGTH_UA              10

drive-strength = <8>; // 8mA drive strength

bias-type = <DRIVE_STRENGTH>;

OK where do I put my 8 mA now?

Yours,
Linus Walleij
