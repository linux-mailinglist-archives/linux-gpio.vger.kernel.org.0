Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157556F8258
	for <lists+linux-gpio@lfdr.de>; Fri,  5 May 2023 13:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbjEEL5A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 May 2023 07:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbjEEL46 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 May 2023 07:56:58 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F57D1A607
        for <linux-gpio@vger.kernel.org>; Fri,  5 May 2023 04:56:54 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-55a6efe95c9so23359317b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 May 2023 04:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683287813; x=1685879813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riNetgoJcVW6a6DuMCUs2l//EH5X9sZZhCmoZC/wZtA=;
        b=jvSrvaBzv4UqZQ/pXfgqcYA84wDKXRYKVeq+J9Y6EO2kkzLR588MvOv7oMD2FHiqF2
         tJ3KF1tMlXylCDT6+cO2pr7qRdZ6whvm22ezoL79V2hHURzl1AbsjYiTJSWN1QOwUxfY
         36yEdrdk06U78dunF8NvCeLt1OVOcA9Xyrhn1sr0Qxtn/EpqlOhR8kcC7B/GstMSpczN
         zME4s28tN0oNUOMAb8ENT+ncwaksEhzm1iyfn5ltrGFjN41/4p2rfF2n/Ygb31gGj2Ny
         aqfFdbvN9Egt0P2ie4Wc5PhsS+vkpWR+TEPAT46NCA+FyNUKfCF7+GTF7s77NCTYUOYn
         U29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683287813; x=1685879813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riNetgoJcVW6a6DuMCUs2l//EH5X9sZZhCmoZC/wZtA=;
        b=Zn8T5X0SRs88vJshi/D9LLm6rqGV9LwPfw0Oo25qRokGGpyiySYNorL1trA3HkghWr
         j1U0qUcHtt+lPN7kC+Ezl0SmMBaaKnIBw2XYk9s8UzEtG+a5C31lUVsaDf7brq/0Xasz
         DC/iKHYNbaf4Ocwtr99w4KiCAk0TrKMpV2CnysENmJDB23rRcZVeX5/BAJTQ/gf6Td5Q
         GBkhYszYcFIv9NQnWwX2W3docgqD8IwqRtqEF4HtLcziKShPTI8JdyW75UGGX+AxVY9+
         53gQXXUcL+mEWFPY2fqS0CJNiZhHgxcVyj7qAR3SYzy9wVGHg0hg8KVge83Gus7oc9ns
         Fc/g==
X-Gm-Message-State: AC+VfDwL53JHeMWpoPNiNhGL9L6hK3HHnb7Y1CIz1K4dgL/josJMRsgO
        WVKsOlmAhcocRsvLlPuJjPocCqnC2Ax6FGsMhmICdQ==
X-Google-Smtp-Source: ACHHUZ6CEMIqvkmsUkNUteKj5I+RkgIx/lW5k1vOfXW/SR90QPOit72+8ZymEQrizF+4VZmh+Htpqey9KoGhBaIPPOg=
X-Received: by 2002:a0d:f383:0:b0:55a:ad0a:76c with SMTP id
 c125-20020a0df383000000b0055aad0a076cmr1076896ywf.18.1683287813578; Fri, 05
 May 2023 04:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <1681311127-6891-1-git-send-email-manikanta.guntupalli@amd.com>
In-Reply-To: <1681311127-6891-1-git-send-email-manikanta.guntupalli@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 May 2023 13:56:42 +0200
Message-ID: <CACRpkdYb9iy8Fs2w9p7-64h6bMx3W9=JFHT08yYPaeggenDmcw@mail.gmail.com>
Subject: Re: [PATCH] gpio: zynq: fix zynqmp_gpio not an immutable chip warning
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com, git@amd.com,
        shubhrajyoti.datta@xilinx.com, srinivas.neeli@xilinx.com,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        srinivas.goud@amd.com, manion05gk@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Manikanta,

thanks for your patch!

On Wed, Apr 12, 2023 at 4:52=E2=80=AFPM Manikanta Guntupalli
<manikanta.guntupalli@amd.com> wrote:

> Make the struct irq_chip const and flag it as IRQCHIP_IMMUTABLE to fix
> "gpio gpiochip1: (zynqmp_gpio): not an immutable chip" warning.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

Don't you need to also add
gpiochip_disable_irq() in the .irq_mask() callback and
gpiochip_enable_irq() in the .irq_unmask() callback as we
do in most other conversions?

Example:
https://lore.kernel.org/linux-gpio/20230414-immutable-irqchips-2-v1-3-6b59a=
5186b00@linaro.org/

Yours,
Linus Walleij
