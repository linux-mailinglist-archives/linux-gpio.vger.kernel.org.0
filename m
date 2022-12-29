Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD8E658825
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 01:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbiL2Akx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 19:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbiL2Akv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 19:40:51 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83B2EE3B
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 16:40:48 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id k7-20020a056830168700b0067832816190so10743694otr.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 16:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f2p2shVUpdpBRcPbig+xzUB8/WfGytn/tvXqnk/G7/Y=;
        b=Gzjw0D8iyAbTjlB/MOb4J4YmMSW1zdzpRQCifiwhKhsZ7e8lkDYZvuuDw9+alRwI9j
         3becoCce9AZU4D3fLWu5VgjqdWZmwVbd16kzYohhpmZHS64shJslyqIbB4nhVjZ0BvJd
         Z4W7VaKotC5HqA/8wU3fn8lx7vi9Ox2i0PP+M1J7GM9ZuO3VCpP7hQrRndAfHkWkOpX+
         GqnNNrnymEPDCRoO6MXXEEoMbfXd5hdAdox8Pdi/2sMyzkBeHL9F5HM5PoULI+bK7L4z
         xMvOqu25W0oUvfDLAg7fCGEqRnesaAEkZgN7/t8t2Vlu6z6gNhM4BhIjvS3lWghb//4p
         Mj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2p2shVUpdpBRcPbig+xzUB8/WfGytn/tvXqnk/G7/Y=;
        b=EKCK4gSCNmF6M2JnbieA7l7RnpLooYIeYgHdhC7Xhgh/GinbjtK4Mu2Sd7I5MdGEWO
         Y0PlsILovrUGQby3/6L4wnSyHafo6jBa4x6nU/yNcaP+TUAdjQjp3h5Yb6f34Y4YFKmw
         3j4ZcXP6YTpNRER9Ak4GZusO34Tci5bVX45hvdPl8xqDmGms/mAJUXqureFxk82SA6Ws
         bY6PpJGdPtvxgiAniP4bWJWw5BN4JTJFkzBJZGwT+qKvfsBx6y6xcP0ASSKZEOFWtOvf
         kMZLSKgBBheNww/3pj+xtVlIz3sup6XCh4Aa96iUtQl5YgEf2btyq4edvEPG9nYRpNLm
         gX8w==
X-Gm-Message-State: AFqh2kq2pXDHU5T94W99+pgOPkiMGdvKuzyr/YMQ84qS7yZMbGePkoaY
        T1aTQw5kjTcn2VY+7iUE0lptqE1eoFdqipiArjLcFg==
X-Google-Smtp-Source: AMrXdXss1Jmt661r3O2VlGaPW9mKv9FIuBxyzoUhU0tjN3DiJULKXqqoxPvNSGzhCM/K9neAcF+2BHIkcgzsyvCr2mg=
X-Received: by 2002:a05:6830:3499:b0:66c:61c8:ceeb with SMTP id
 c25-20020a056830349900b0066c61c8ceebmr1793244otu.12.1672274448080; Wed, 28
 Dec 2022 16:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20221221210917.458537-1-fabrizio.castro.jz@renesas.com> <20221221210917.458537-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20221221210917.458537-4-fabrizio.castro.jz@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 01:40:36 +0100
Message-ID: <CACRpkdZBz_+MeJjP5-vjNGbqyrCBTj+f=gm87o4sgiMqRwndVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: Add support for the Renesas RZ/V2M PWC GPIOs
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
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

On Wed, Dec 21, 2022 at 10:09 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:

> The RZ/V2M SoC contains an External Power Sequence Controller
> (PWC) module. The PWC module provides an external power supply
> on/off sequence, on/off signal for the LPDDR4 core power supply,
> General-Purpose Outputs, and key input signals.
>
> Add a driver for controlling the General-Purpose Outputs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

This is a nice driver.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
