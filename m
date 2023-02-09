Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5D06905FD
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Feb 2023 12:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjBILBM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Feb 2023 06:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjBILAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2023 06:00:50 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16AE6F21B
        for <linux-gpio@vger.kernel.org>; Thu,  9 Feb 2023 03:00:19 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-52bf225460cso20146897b3.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Feb 2023 03:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VaYxH+luPubXrxEEO3mp39wyM7U5jIil6rypMHPCRe0=;
        b=g9QGA7/AAmcCR0u2nHKp/6bm4mxU/rsqb1L8ruwzIkXuGwoZ/JMQ9i4JGhoGQ1e4wj
         04easd/c+8IUOHEI7Nhrcl8hcJ1p/fcHaJumtOllg3BIwap3oifHTiNMHifpcBmCo0iO
         qlRnHdMGYBwq168ZdarFDPaOE1jBVf6U+o2gxtcU3h3rCwlUa4VtNNhBM6ThtzneWpjA
         /t91P9HqhqspPkm6MaTqsh7RiQlqiJglX+n9k1pAILGvjrp3D7UakAzdpgoaal4Lqduu
         tTNNXJZ/TsShkTQ68tH2cs5p5dYu/nkSJDLN5zzKdBKZO3KNQLJgslDcRaJhppryczWM
         lV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaYxH+luPubXrxEEO3mp39wyM7U5jIil6rypMHPCRe0=;
        b=jtsJLgjVIksAOtcXb424yQnr9eInRtG0JI6dDb6Di4ROI2fIl0clGZeRdS/aXajDzJ
         84nDJlmkjRb0evZtxlOz7fiqAwAcXMg01Lx0B8XFLnZuncWRqJ1rw1QKfqKAVaobQdL+
         ci9tpTPnyls12gmFgh578Yl7mnN9lyRlzTBrPo31dIIYp1ZF+Ks2FGKRi16/ci2Yam2G
         IR6bEEYQLplJtNu3Woat/4r3ddRZbz10/DGUx0GbQfRhtbPbesb4DmG7h8oNbRpr4FWR
         U6d3Rh1OCcQibIC/tS12VptPw8DRfJ3XB4d/mtuuozSV9Tbn6hrv+VS3kMcqjaIdeKzm
         w3Xg==
X-Gm-Message-State: AO0yUKXDsxkXEpB0dAz8qXtUtVR24lK7fIyEocNOKYVbYmT2wIvrKbwJ
        JcmjS7KQwbjqz14XCOBR16ViwCkOOKdp+LsN0TRJJYj6qNfSbKBl
X-Google-Smtp-Source: AK7set8Ok3cidPn89sCL0JHH7lDRufF+ifjH+mMj8j5if920VaOPfnFKUBiC/O/WL/lQMnus4S6RwSQgccoZTv8+Nyw=
X-Received: by 2002:a0d:e743:0:b0:50b:429e:a9ef with SMTP id
 q64-20020a0de743000000b0050b429ea9efmr1049632ywe.434.1675940417102; Thu, 09
 Feb 2023 03:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20230208185714.27313-1-asmaa@nvidia.com> <20230208185714.27313-3-asmaa@nvidia.com>
In-Reply-To: <20230208185714.27313-3-asmaa@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Feb 2023 12:00:06 +0100
Message-ID: <CACRpkdZC5YH4=AboEooDd4EQueCipSTbYpRtpxhMopbpXKnESA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Support NVIDIA BlueField-3 pinctrl driver
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        linux-acpi@vger.kernel.org, Niyas Sait <niyas.sait@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Asmaa,

thanks for your patch!

(Adding my colleague Niyas so he can have a look at this quite typical ACPI
embedded pinctrl driver.)

On Wed, Feb 8, 2023 at 7:57 PM Asmaa Mnebhi <asmaa@nvidia.com> wrote:

> This patch adds support to the BlueField-3 SoC pin controller.
> It allows muxing individual GPIOs to switch from the default
> hardware mode to software controlled mode.
>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

(...)
> +config PINCTRL_MLXBF
> +       tristate "NVIDIA BlueField-3 SoC Pinctrl driver"
> +       depends on (MELLANOX_PLATFORM && ARM64 && ACPI)
> +       select PINMUX
> +       select GPIOLIB
> +       select GPIOLIB_IRQCHIP

Since you're selecting these you could as well
select GPIO_MLXBF3
too.

> +#include <linux/acpi.h>

Oh ACPI, I hope Andy has time to look at this.

> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/gpio.h>

Drop this include, this is a legacy API, also this is not a GPIO driver.

Go through the list and see if there are some more unnecessary headers.

> +#include <linux/pinctrl/machine.h>

Why?

> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +
> +#include "core.h"

Do you need this? (I'm uncertain myself, so try without.)

Yours,
Linus Walleij
