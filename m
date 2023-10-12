Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A57C7C6FF3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 16:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378354AbjJLODv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 10:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235737AbjJLODu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 10:03:50 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9272D9
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 07:03:48 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d81d09d883dso1103166276.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 07:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697119428; x=1697724228; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=puIzhyS5gW8rbBXjq7G5YhTTPZWWF1R9uTZ424mIyo8=;
        b=Gy88XDvvmkXt+pXJa4u5QHliGDqbu6a4N7qgkEOzNtirQ3cRHpgJstqW/Ih3HderE6
         E948rl30Mcpi9qsC2I8KpD8ca9SoL+HpKhtd1DJFhND3BWiAzdyAUy+HW+8+RUdS68ss
         vrymLykl7dN2WI/agPO7Nj2TzfNEhd6+xgLjo7QP6cGEAIfSEaupeTk9eKG+kAQLWLig
         JkCHNViDQpeasr8lAD3gVs0gV52CbcBC99Df2hgvg5sb8YQfoVkx5CF80x0X3kIR70cZ
         1QJxUA06eZdaqlTFg0v7KviQe3pQ+btL2XXzKUJUdeQrtHY0UyYnokhjlC1iKefiex74
         0sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119428; x=1697724228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puIzhyS5gW8rbBXjq7G5YhTTPZWWF1R9uTZ424mIyo8=;
        b=jXvX6VN/o5rqOzA2VdgOGLgc0nbLXXXS982FUZJgh9FxEvk/GRv51mZnhIIEX4Zul4
         x8NRGeHUSdVF8CZ06APwxFv7wR4vSnBBN/DZT1/M5gvcl+OUc6V/rkQXY6oRuXvmKnB8
         e96HAnUGeHJUUlnnr/c4OBIM6jS3GaTIJ4G2A5RFKxBcKOP50vxt897FkvCPZXC7YM6D
         35FDljKRq2RhP5FLm8rIevUOxQ9SoXQ6CeKa//ug7FztHuYaRKzcE+bN7sEPTVuJbJGI
         HCG892RQppWzPF43IpNnsTyDoL9GboP7N2MZzLinetAXHsdd+DYwYf0Rqo6recI/fFHk
         nIAg==
X-Gm-Message-State: AOJu0YyXTJ0dw7kp7W9rAdrIYbbqZ1ZAPH456KK6TNwSXs6Sy2jiw8c6
        oqJ6jctPU/OLShLoG7Ig6vxK2jXKcVMrAwvcceYZkw==
X-Google-Smtp-Source: AGHT+IEGxOAHYxFWe5zN7VMnBZpra60R5/a8mbnM6JL9voxiaeBEv75YfHq+VJXGhKSFvI92pIjqpWnDeQDRoREZX68=
X-Received: by 2002:a5b:40b:0:b0:d5c:1b9b:6f5a with SMTP id
 m11-20020a5b040b000000b00d5c1b9b6f5amr20283517ybp.44.1697119427708; Thu, 12
 Oct 2023 07:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org> <ccd0d092-8ae5-4033-96cf-5ba37e175e0c@linaro.org>
In-Reply-To: <ccd0d092-8ae5-4033-96cf-5ba37e175e0c@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 15:03:35 +0100
Message-ID: <CADrjBPpUt-PShY4Wm9UWK7ZxujYsm7DoNUY67tzUMAp33BVY=w@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On Thu, 12 Oct 2023 at 07:26, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 20:48, Peter Griffin wrote:
> > Add serial driver data for Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > index 07fb8a9dac63..26bc52e681a4 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> >       .fifosize = { 256, 64, 64, 64 },
> >  };
> >
> > +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +     /* rely on samsung,uart-fifosize DT property for fifosize */
>
> It's an optional property, so you cannot rely on it.

Is it possible to make it a mandatory DT property for certain SoCs?

>
> > +     .fifosize = { 0 },

I can update this to 256, and we can add more sizes as we enable other
UARTs I suppose.

What's the purpose of having fifosize specified in DT and in *_serial_drv_data?

Thanks,

Peter
