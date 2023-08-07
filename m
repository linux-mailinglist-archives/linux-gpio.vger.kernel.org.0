Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A117724BC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 14:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjHGMwu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 08:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjHGMwt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 08:52:49 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D5310F7
        for <linux-gpio@vger.kernel.org>; Mon,  7 Aug 2023 05:52:47 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d0b597e7ac1so5094321276.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2023 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691412767; x=1692017567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AFGlTum5UMlZjZ7E842n3ZFd1VK6+2/5dFVFox+pj4=;
        b=AXHvoKakGa2q9pjyem5iZZRspGtnjrRe7MIdhug6Xp/jnQ4dukyhknWzqSH4VUWORy
         k/FwANCCYRRYmDUMP53zJAG2wLUXWV15q3fVc50tXQMUl+CRMdgB4QAuKj073Ltyo642
         X4nMmMBYYwyCSAVHYguDbfGUPy2VAztwP1Gjpcard8B0qv4IXFWKGEq+lik7IoowRcam
         WKbuu7SK2j1WMVb89Joc49UH0tMhbEgBvQG1t9MVrpUB151PvmilMbEj3pK1hNJXNp3y
         j2uQmwNpy/SaqaXTQLG9Slt5bfM711fsdO2WrZfuNCyXzySXOEEcJJ2ohq1KqLFzEE4z
         plgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691412767; x=1692017567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AFGlTum5UMlZjZ7E842n3ZFd1VK6+2/5dFVFox+pj4=;
        b=UGo5RNLPDRStRzIQxO+63koTGKeGIo3A32oCW1g7RD1CIJKwRYnh7MA/VBdfdYXpnD
         yI+tdtJ1wqy0PW2GOPwDtDrIYRiIji+BS66WQS3IPBSN15v3AqJC3qvUyG+7rP3unEnh
         hcVYrNU4/52zyru+4+4h2AX4UhQEnXRrIkAuls/x8hYXWfdj8zHQXojwFskGND43b3PQ
         Ze6kWGzeGlC8owHbGK90AgfvjeRMt76WMuWuKwj+UDMZFvWb8YMa3ZmWcjfGI8h3cwYz
         2b71OWz5oA3ucGBriZvi4ZODinywCgGrqm1i23GtafEhacw11Q68dfuPeFK3vd/dC+J3
         4DpA==
X-Gm-Message-State: AOJu0YyljSZXs33+daSrTZ2+8m8SjrMDYR6LNzuNnATiLcKD8kM2l000
        hagRwxceJCkN2JyL+fJvxjn9OlFiDJjwo4PEA0KHvw==
X-Google-Smtp-Source: AGHT+IGPfyIbynWx7QZJWdwwx4hWSata6jpbVSZxrGJNsjuKKKNxfaZwdNRL5QP8SuC29/wka5f0RxzJjgsIj8NJ7Ls=
X-Received: by 2002:a25:720b:0:b0:d09:f934:f2fe with SMTP id
 n11-20020a25720b000000b00d09f934f2femr9563444ybc.18.1691412767068; Mon, 07
 Aug 2023 05:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230726090409.16606-1-tychang@realtek.com> <20230726090409.16606-6-tychang@realtek.com>
In-Reply-To: <20230726090409.16606-6-tychang@realtek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 14:52:36 +0200
Message-ID: <CACRpkdYzLiXSLpU63Nn84b+p3Nz5Ls-o94HsoAq514LvGkSiVg@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: realtek: add RTD1315E pinctrl binding
To:     TY Chang <tychang@realtek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi TY Chang,

thanks for your patch!

On Wed, Jul 26, 2023 at 11:06=E2=80=AFAM TY Chang <tychang@realtek.com> wro=
te:

> Add device tree bindings for RTD1315E.
>
> Signed-off-by: TY Chang <tychang@realtek.com>

Maybe you could write a short paragraph about the RTD1315E so we
know what this is? I guess it is some SoC with some intended use case?

(...)
> +description: |
> +  Binding for Realtek DHC RTD1315E SoC pin control.

Same text should go here in that case.

> +        realtek,pdrive:
> +          description: |
> +            An integer describing the level to adjust PMOS output drivin=
g capability.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          minimum: 0
> +          maximum: 7
> +
> +        realtek,ndrive:
> +          description: |
> +            An integer describing the level to adjust NMOS output drivin=
g capability.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          minimum: 0
> +          maximum: 7

I would rename these realtek,drive-strength-p and realtek,drive-strength-n.

You need to explain what is meant with PMOS and NMOS here. If it is what
I think it is, I think some ASCII art would be handy!

You can reuse my ASCII art from Documentation/driver-api/gpio/driver.rst:

                     VDD
                      |
            OD    ||--+
         +--/ ---o||     P-MOS-FET
         |        ||--+
    IN --+            +----- out
         |        ||--+
         +--/ ----||     N-MOS-FET
            OS    ||--+
                      |
                     GND

Maybe you wanna delete the OD switch if these drivers don't support that.

What does the values 0..7 actually correspond to? Is it the number of
transistors/driver stages simply? Then write that.

We need to think whether this is so generically useful that it should simpl=
y
be drive-strength-pmos and drive-strength-nmos, simply put, as other
SoCs may implement the same. What do people think?

> +        realtek,dcycle:
> +          description: |
> +            An integer describing the level to adjust output duty cycle.
> +            Valid arguments are described as below:
> +            0: 0ns
> +            2: + 0.25ns
> +            3: + 0.5ns
> +            4: -0.25ns
> +            5: -0.5ns
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [ 0, 2, 3, 4, 5 ]

This does not explain the duty cycle of *what*?

It looks really useful so please explain thoroughly what it does.

I guess this is not PWM because then you could use
PIN_CONFIG_MODE_PWM.

Yours,
Linus Walleij
