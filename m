Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93427BA87D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 19:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjJERzE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 13:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjJERyh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 13:54:37 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9538810D
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 10:54:20 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49d0f24a815so506172e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 10:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696528459; x=1697133259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D76EeSMgKi6+9rAoLhvu8+kB+2vM8hIpa0TeocCPFcs=;
        b=suyWDfANo2frFGih4DlCAmyOTNKXpa/vMIOvukgPrT0z1TV6CAdAwibYSKyh4Yf+9x
         APqMZUbYeqgaFPzMJCMI8wL+5ivAGLQFhLG2oFxKdYaHpwdpfdy0e46JQPohf6mIALO3
         2a8QvVpdIVtzZuFExywRt1ey8Fn1JwAti/AkeeX0jmwSzz6eRKEGI5k60potyYNFh36t
         sZHyBGz1ox7a5mcdNUtSMmlbxfXQsVLLctc/4MCHZFxWStQ/QCnBEX4rHl6zZeFeE8Gm
         tYdDb9UaofGwEUvARYZwD6DbC2D4CQek49f8iroJ/ff6mVxmTp2RnJWRC7PTb6DSU1iF
         oyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696528459; x=1697133259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D76EeSMgKi6+9rAoLhvu8+kB+2vM8hIpa0TeocCPFcs=;
        b=a42KWxiTbHpb9zPRE+XCc1zE8rAY/z0ZKDRhdidRUklMn9dUs73MddoDhfdhZtIAYN
         xLZm6zNFttqYrMitzMuD5U31D8a1RSe60ofUzApuwq2BIjCZmJtHKg1dZr7VoT41Xerx
         n3/n/Dk8irh5npoEeNBlXQ8e2X4eBP7jf8wK9tPubjfi7FcoFKVJkG/brLo5rdXb4Qcy
         kuIan/CiBiQ+V7RgTqNMdoz/2tnq79XXctPb+hZ6CGDQNBjzhxwhf57dTvqqxT9JZcwT
         Jjqp3No8zbpfUdoNN2ZVrx0KVAol/KVNtifu1bj1uy/X5goy5faNb7ur2JHCZTVyL0Hp
         v1uw==
X-Gm-Message-State: AOJu0YxnfzW4sR6LPFanBgHrIaY7+I47+qHzcoVY8rAnNa2LWixm/6Ch
        8lEjXUMMFArUSBFCClfLL7pb6g0IA2jx/tixoAeKDw==
X-Google-Smtp-Source: AGHT+IGqd7cRywJrqAx7tLdWplGQ/cpV/JZJxibRe7Uc/F7Xm33Lo6i42WYHIC4HVau1Ml+H0YEATejuGsARVRTWRu0=
X-Received: by 2002:a05:6122:ca8:b0:49d:120c:3c2a with SMTP id
 ba40-20020a0561220ca800b0049d120c3c2amr5902899vkb.11.1696528459613; Thu, 05
 Oct 2023 10:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231001-vf610-gpio-v5-0-8d873a8f224a@nxp.com>
In-Reply-To: <20231001-vf610-gpio-v5-0-8d873a8f224a@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Oct 2023 19:54:08 +0200
Message-ID: <CAMRc=MeNmEuXNgyw9eWCBoVLyo59UTB+45rMUY1uUk+0K_bYUw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: update i.MX93/8ULP and support i.MX95
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 1, 2023 at 10:23=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From hardware perspective:
> - i.MX8ULP/93 GPIO supports two interrupts, 1st for Trustzone non-secure =
irq,
>   2nd for Trustzone secure irq.
> - i.MX8ULP/93 only has one register base
>
> The current linux gpio-vf610.c could work with i.MX8ULP/i.MX93, it is
> because some trick did in device tree node with offset added to base:
>   reg =3D <0x2d010080 0x1000>, <0x2d010040 0x40>;
> But actually the register base should be 0x2d010000.
>
> So i.MX8ULP/93 is not HW compatible with i.MX7ULP.
>
> i.MX93 GPIO is directly derived from i.MX8ULP, so make i.MX93 compatible
> with i.MX8ULP. i.MX95 GPIO is same as i.MX93, so also compatible with
> i.MX8ULP
>
> There maybe dtbs_check failure if only test the 1st patch. After
> the patchset applied, no failure.
>
> To make avoid break old bindings from work, update the driver
> to support both old/new bindings.
>
> ---
> Changes in v5:
> - Add R-b for patch 1, 2
> - Simplify code a bit more in patch 4 pPer Marco's comments
> - Update patch 5 to only drop port->sdata check, since patch 4 is changed=
.
> - Link to v4: https://lore.kernel.org/r/20230926-vf610-gpio-v4-0-b57b7f6e=
8368@nxp.com
>
> Changes in v4:
>  Change to minItems for allOf: else: interrupts
>  Update commit log for patch 4/6
>  Follow Marco's comments for patch 4/6
>  Add a new patch 5/6 Per Marco's comments.
>
> Changes in v3:
> Update patch v2 2/6
> Update commit log in patch v2 5/6
> Add A-b from DT maintainer for patch v2 1/6, 3/6
> - Link to v2: https://lore.kernel.org/r/20230916-vf610-gpio-v2-0-40823da7=
88d7@nxp.com
>
> Changes in v2:
> - Update bindings with describe items, add one reg base for i.MX8ULP/93
> - Update driver to support one reg base, support both new/old bindings
> - Add a new patch 1 to update gpio-ranges found in dtbs_check
> - Link to v1: https://lore.kernel.org/r/20230914-vf610-gpio-v1-0-3ed41818=
2a6a@nxp.com
>
> ---
> Peng Fan (7):
>       dt-bindings: gpio: vf610: update gpio-ranges
>       dt-bindings: gpio: vf610: correct i.MX8ULP and i.MX93
>       dt-bindings: gpio: vf610: add i.MX95 compatible
>       gpio: vf610: add i.MX8ULP of_device_id entry
>       gpio: vf610: simplify code by dropping data check
>       arm64: dts: imx8ulp: update gpio node
>       arm64: dts: imx93: update gpio node
>
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 40 +++++++++++++---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 21 +++++----
>  arch/arm64/boot/dts/freescale/imx93.dtsi           | 28 +++++++-----
>  drivers/gpio/gpio-vf610.c                          | 53 ++++++++++++++++=
++----
>  4 files changed, 105 insertions(+), 37 deletions(-)
> ---
> base-commit: e143016b56ecb0fcda5bb6026b0a25fe55274f56
> change-id: 20230914-vf610-gpio-46edacd2b513
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

This looks good enough. I applied patches 1-5. If you could send a
follow-up with a comment clarification for patch 4/5, that would be
great.

Thanks,
Bart
