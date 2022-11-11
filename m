Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608B3625CE3
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 15:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbiKKOXH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 09:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbiKKOWt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 09:22:49 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E13391C7
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 06:21:15 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id a5so7797695edb.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 06:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5f5WgwUHk615VrXXF8OwuJhFTW4m51G3jdhDcbEz7pI=;
        b=ncvCid2Ov/aPU2Q65PojXr6z/3uchstyo8Zz2ye/1T7kjNwsJw9FvuG/Pfvy0WVmpG
         3h9mBVAgham73/Aa5lEQfJNpfP+fGimP+LM9R8g25zzNprDnT5K73gsIQiXmYMkzpsbI
         Hwf7d3SqmwKqRz+A9UNz4aY0jfnisoKAs72iK0qWOcErFY2vkTmr7gzIAYmvo5MTiygd
         yaGFPvVjWG69zR9RWXO4eIun/Fe+eMrZ73T2yd7FC3wVc8+a9ka5YO9O/h3SClxESUbe
         HVm6j9PxV3N7gJ1t90VCJXY1DuylkRU+ArPE5V/tcu2Kz1ScJeFknVY9GaR+p1e0QHyj
         P4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5f5WgwUHk615VrXXF8OwuJhFTW4m51G3jdhDcbEz7pI=;
        b=UDca3zfz2ss5b/hm9yiltQd+8zG2cXDKNzFBiFAlUZj34JeAXtrtd5n4teR0i+CtId
         j4hgbdRVyszjlkqh6z+qH9UrKNnEZwLmMJwify4yOZHOjIuwzGBH+YCLAmDao2hTNj0g
         CYFH5oYIY4mnkTxWZY+Rqs4NqU3my/hFvFWmwx3LSkP9GcmeyPe7fGentHbQ0L0f3QSW
         /Y4Z1dI7z8kuS9N70Z/CvD1vr5QlVwD07OjWElP2xjALWOZmiDRcWPjclrIYORjb86dY
         y0jyGPIipuTPUlymsVoX/YcDmX2xavlYi8Z1KLt/3GrE+v2zGKipneQv66ugNL/ld2q0
         O7fA==
X-Gm-Message-State: ANoB5pkSYYpJS5SnSsV1FVX0fgk+RoGcDYTA30nkAvtOOrdMdaUb5AxH
        h7DShalq+pdYnslCMl1s6CaxRFZMMvywQpZPuLmvCDh4VLc=
X-Google-Smtp-Source: AA0mqf5Q2z1GDXmPcvZT0E18/A608A0LfO1wEsWDwNhe3rtbFDosGBdV3ICh7wD/EO+Hageahjq0EnCvsaeBBgzz+IU=
X-Received: by 2002:a50:d65d:0:b0:463:bc31:2604 with SMTP id
 c29-20020a50d65d000000b00463bc312604mr1673694edj.32.1668176474382; Fri, 11
 Nov 2022 06:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20221111113732.461881-1-thierry.reding@gmail.com>
In-Reply-To: <20221111113732.461881-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Nov 2022 15:21:03 +0100
Message-ID: <CACRpkda=oaQtsAKk0E_mDf7ZR7hvCiL=M3rkfOZ3JigRbCXvWg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: of: Use correct fwnode for DT-probed chips
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 11, 2022 at 12:37 PM Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The OF node store in chip->fwnode is used to explicitly override the FW
> node for a GPIO chip. For chips that use the default FW node (i.e. that
> of their parent device), this will be NULL and cause the chip not to be
> fully registered.
>
> Instead, use the GPIO device's FW node, which is set to either the node
> of the parent device or the explicit override in chip->fwnode.
>
> Fixes: 8afe82550240 ("gpiolib: of: Prepare of_gpiochip_add() / of_gpiochip_remove() for fwnode")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
