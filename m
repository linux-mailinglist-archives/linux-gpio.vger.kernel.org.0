Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5256C5149
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Mar 2023 17:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjCVQws (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Mar 2023 12:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjCVQwr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Mar 2023 12:52:47 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC58F5D45A
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 09:52:33 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id x2so1660672vss.10
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679503953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VOeoUcGtu8I/LNjwpgSIfUemk29T20g+8kE34NnXUY=;
        b=B+Pel4iYm4+myzpPtGIv8tSiY2AGXnr3Lg85FHBpdckoFQF2IH0E/4//gOTUUshGhY
         omJhWZ+4mkixXkTF/Ws/L9s1ZI4gvXdjfZ/i/zqoajAHcQ3KM1zbvwoZuQ4hCHRh+gQC
         J172P5aMjumBuF/sqoanpzFrvXSPD4S+hROOb/pqSoYFyrUDGS2Th6Gdj9ntNE3XiN0r
         OOw0av91RF6BIndkZUJwLAscJwM7m4ocQSN6La2ejQcor3PLocMcUAtDQjMqQQcs4wEE
         pX8IhKdMc1OzvOzIyS5alNcRoMOp8uxFon0WHmrhVxKDcn9TGfJllaQ3gRh/aKWRuOxB
         uAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VOeoUcGtu8I/LNjwpgSIfUemk29T20g+8kE34NnXUY=;
        b=zUsxJIA8+m7WofqpUVZMjXY2xTJKfIjop8UxiE4Ti213cUtPmDBsZ/6GKQP8wY3l4P
         bAT+U92tnPrQGvZHmBT05jR5/XTdu2jUSvoxk/PLtLK2OykZqrXj0rdaETkpS7Bqzikx
         77To3RP/hULbrV0bp3JYxyhtVj/rSIDHF8cd0RUdmZ5vWitmVmRW/fUCOTPJtVItTL04
         whvdt00ePlByeJI0BwWVOeSYW7tIRDVHbcYcw9gc7FHeE/Mgg8z7DdaKBiNS/YxCC4wI
         9/nNnOzWCRZ7s0j77PCOtLV76BDs6jodB6ZXgB4ZjkWQcHUprVh3SP0iZZCGIK3VpxsE
         CWEQ==
X-Gm-Message-State: AO0yUKWiVVO/o3mbAPiHhtmT/+7n4vyjGLN6px4kKQOuCr5op+ZKL0qy
        g3qtOF0zt+ivSH+Eg0CA2fBR93GZOZnM+fE4ajz88A==
X-Google-Smtp-Source: AK7set9uqvOFeY69mtvgqjWDOW7WFoxn2AmLfYZ6iHFg9tp/cYqBk8yxKQyfO17Xrbl4/yDoBerqEoXm5s5UPnJVDG0=
X-Received: by 2002:a05:6102:4751:b0:425:d6a1:173d with SMTP id
 ej17-20020a056102475100b00425d6a1173dmr102213vsb.0.1679503953023; Wed, 22 Mar
 2023 09:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
In-Reply-To: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Mar 2023 17:52:21 +0100
Message-ID: <CAMRc=Mc-UL-Yz4V+svG-b94zFevYKm5MKpOAY36iiN36JthLZw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Mass convert GPIO IRQ chips to be immutable part 2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Robert Richter <rric@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 20, 2023 at 10:55=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Following up on my first series with this second series
> concluding all the low-hanging immutable irqchip conversions
> in the GPIO subsystem. These are all I could easily
> convert.
>
> The remaining irqchips are not using the GPIOLIB_IRQCHIP
> for one or another reason, or too complex for me to
> deal with. Mostly they are using generic irqchip, and
> I guess those are fine as-is.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (9):
>       gpio: rda: Convert to immutable irq_chip
>       gpio: siox: Convert to immutable irq_chip
>       gpio: stmpe: Convert to immutable irq_chip
>       gpio: thunderx: Convert to immutable irq_chip
>       gpio: tqmx86: Convert to immutable irq_chip
>       gpio: visconti: Convert to immutable irq_chip
>       gpio: xgs-iproc: Convert to immutable irq_chip
>       gpio: xilinx: Convert to immutable irq_chip
>       gpio: xlp: Convert to immutable irq_chip
>
>  drivers/gpio/gpio-rda.c       | 22 +++++++------
>  drivers/gpio/gpio-siox.c      | 75 ++++++++++++++++++++++---------------=
------
>  drivers/gpio/gpio-stmpe.c     |  8 +++--
>  drivers/gpio/gpio-thunderx.c  | 26 +++++++++------
>  drivers/gpio/gpio-tqmx86.c    | 28 +++++++++++-----
>  drivers/gpio/gpio-visconti.c  | 50 ++++++++++++++++++++++-------
>  drivers/gpio/gpio-xgs-iproc.c | 32 ++++++++++++------
>  drivers/gpio/gpio-xilinx.c    | 23 ++++++++-----
>  drivers/gpio/gpio-xlp.c       | 14 ++++++--
>  9 files changed, 181 insertions(+), 97 deletions(-)
> ---
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> change-id: 20230316-immutable-chips-2-ad2808db8054
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

Series applied, thanks!

Bart
