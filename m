Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25CA734EE3
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjFSI6y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbjFSI6l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:58:41 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A25CE56
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:58:00 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-570282233ceso26587707b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687165079; x=1689757079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLmeJWd/edsFY2ls/Yz70yLNc/eoAErRFP6oqVGaQzo=;
        b=uIr0hcR/YywyPAn1Q9NNec4n4+nmGsa9QwL8DBaVlBbyAkaJwg20xEqKD4ly3I2aVj
         BQyWFsp6A9kFryjQcNVsM+x32cYfVnFmDqL66ku1aFu2ZbDAwTzeu2PDry2Sq5HtQ7ZE
         D/GcEb21bpeuRiXhhVx4B44cJGiL0tdXU/UduN4U1SvhInp2hUshVs9ec8TvARKAmuZI
         D/CJUYRpjiJhPBty1vLybrP32uODyW51NPMX395ko6lcldvDcibUDq6/3CJtQYIqCP+D
         eHD4MGOHPb2qMmcVE8o6OIIDznY6aOEFSdXT801SIgY4pE1lQe1IyCTJhQDM6JVHCnA8
         Q26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687165079; x=1689757079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLmeJWd/edsFY2ls/Yz70yLNc/eoAErRFP6oqVGaQzo=;
        b=Mp9JyPAjfCg1HGFt/2I9MLPJKTIubR3RgccCc0c5xj9Nhf8LeZLzmuTPfXtyu9Fk6p
         SLv/vWd2AVIpb7/o416bSapjfVMlBjsJE5NczTrUUJ9EaF4zm/ZrwL6Edj86Phwpjczq
         nRnCr58rjhOrlg9ASX1VwOlN9B33OUKONL2O1EQCEpyVFBEhQ5QLFZM3K5/AhD9OxNtv
         XJTFu1Z5mJH3wgj/do5PrdfwKAByhURcz6mIHslQsKqTJj/qm1QDo0VNo33kQvy4g2WP
         qTQYtmjYzkixhxqJblGXv+r6ViRfqQ3dQV21EXTVFwneLvZCwGygQXz3jZ6ub0USuuKB
         VIIw==
X-Gm-Message-State: AC+VfDz9oiyHwxRubw5EWDs43WxZuJpjfA2Z0nYmmGfa9XIFNotaVTVr
        aACWUX8jm14xl49ySC5PpzrMnPdu1IcWlclIst9CVWRckGmZPSaE
X-Google-Smtp-Source: ACHHUZ5+r5xud6CHZeGlG1QSWzO428im7bO5R2mp0md9VvDElGt3sdaijKYmfRcsXy0ZO73h1kU6UMMNy9w6gPMGHyg=
X-Received: by 2002:a25:ce85:0:b0:b96:4634:146 with SMTP id
 x127-20020a25ce85000000b00b9646340146mr4203242ybe.60.1687165079656; Mon, 19
 Jun 2023 01:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230616145036.3910153-1-arnd@kernel.org>
In-Reply-To: <20230616145036.3910153-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Jun 2023 10:57:48 +0200
Message-ID: <CACRpkdaNqELB8OtCuEbqny80OvJnxo1Ggw4kEQQ59+9BonDpeA@mail.gmail.com>
Subject: Re: [PATCH] gpio: synq: remove unused zynq_gpio_irq_reqres/zynq_gpio_irq_relres
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michal Simek <michal.simek@amd.com>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, Jun 16, 2023 at 4:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The driver now uses the generic request/release callbacks, so the custom
> ones are no longer called. When building with -Woverride-init, gcc produc=
es
> a warning about the duplicate entries:
>
> In file included from drivers/gpio/gpio-zynq.c:10:
> include/linux/gpio/driver.h:621:43: error: initialized field overwritten =
[-Werror=3Doverride-init]
>   621 |                 .irq_request_resources  =3D gpiochip_irq_reqres, =
         \
>       |                                           ^~~~~~~~~~~~~~~~~~~
> drivers/gpio/gpio-zynq.c:611:9: note: in expansion of macro 'GPIOCHIP_IRQ=
_RESOURCE_HELPERS'
>   611 |         GPIOCHIP_IRQ_RESOURCE_HELPERS,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/gpio/driver.h:621:43: note: (near initialization for 'zynq_=
gpio_level_irqchip.irq_request_resources')
>   621 |                 .irq_request_resources  =3D gpiochip_irq_reqres, =
         \
>       |                                           ^~~~~~~~~~~~~~~~~~~
> drivers/gpio/gpio-zynq.c:625:9: note: in expansion of macro 'GPIOCHIP_IRQ=
_RESOURCE_HELPERS'
>   625 |         GPIOCHIP_IRQ_RESOURCE_HELPERS,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/gpio/driver.h:622:43: error: initialized field overwritten =
[-Werror=3Doverride-init]
>   622 |                 .irq_release_resources  =3D gpiochip_irq_relres
>       |                                           ^~~~~~~~~~~~~~~~~~~
>
> Removing the old ones has no effect on the driver but avoids the warnings=
.
>
> Fixes: f569143935378 ("gpio: zynq: fix zynqmp_gpio not an immutable chip =
warning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Right.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
