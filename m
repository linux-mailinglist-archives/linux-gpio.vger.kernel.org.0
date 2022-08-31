Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B7C5A7F18
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 15:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbiHaNmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 09:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbiHaNmK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 09:42:10 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFC3CCD62
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 06:42:08 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id nc14so23531198ejc.4
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DLKViM3P0G3GIwgCELmESwzcn0D7+PHGeO/uJOOqS4I=;
        b=FGcizhzxebhqaA7TUKgWmh4OIuHcAVTWgaFqufK7XSbHmjMFTY6Acajv7HoqD6CtD4
         QXF5vXbNqRwa2S9dD2dwDUA9GI8W9n2h9WRInpIWVrDShU0kWhU1hx/TRYs4jOWzJFLR
         ObA/Tzpyy+aZ/E97tY3XwcGDoWy3A+PUmZvVA6pEJjAszZ1y5ppf2OiRGb1uRZQc/qnL
         juvmHCeBYg2ggfLmu0PI9w5GohiLT2341HUq68fJcvObvDoh6Yz1PpoeKxrK5tQJ+bj0
         EbeiC+SSYzuRtRMyA8L//1buPutYnYM274QpJM7CJNoHFf0kTiIPCayhstRO7U+ZktyQ
         aG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DLKViM3P0G3GIwgCELmESwzcn0D7+PHGeO/uJOOqS4I=;
        b=MhcHFbVOPgEfdEh7GcsNlv57H+u+2Q66UpxhToVCQ8yPApXkoellnSovvhyhcbRvly
         do6s2jvQ54E5MAjQ6uZKXzMZOBjet0zgFMGR4jh7Imh3Uwo19i1xddDJYyF1qrfXT5Gu
         DZJLsIq7hxxciK/muQtdOUql2Z75VWslkZt+wNTmY4fK2PYU3kCEWN6LkWuNcYuvOmNk
         uv5ha1d+kPz5uhbPg3m9BUgFb/kgKjuS/arbH2D/w3/mgAoizxFyP2XiKzQ91ROp1BMi
         gtf5qAXT394xeXNIuoVfWmxX/lQrAgrdkIwv0+bDk2/j0mKysa4xhWf4CJs8AJ1vjC/i
         I6sw==
X-Gm-Message-State: ACgBeo34mQHeh3zjuH6Zsf+3uP5pLGTgtkxenu9pGzNSK1p8fd/5w16E
        dAkTMyQIibcFqXlsGEODjY9EyKW4UTD4tDhAsPeoRB8Y3GQ=
X-Google-Smtp-Source: AA6agR6X994OZ8FtA14MD+fyVSnSVFfDmA39ewtBDSiDtGAu5gkPBTkF2l/7T4GuajGvXuZL2QXvnfFReBbtQPRmGzA=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr14471102ejc.208.1661953326893; Wed, 31
 Aug 2022 06:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220830142727.313080-1-francesco.dolcini@toradex.com>
In-Reply-To: <20220830142727.313080-1-francesco.dolcini@toradex.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 15:41:55 +0200
Message-ID: <CACRpkdazNns-v5upE27xcW0OMDvQO=X6o1qLzdd4y0pPtTshjQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 30, 2022 at 4:27 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:

> Change PINCTRL_IMX8M* dependency from just ARCH_MXC to SOC_IMX8M,
> likewise is done for other PINCTRL_IMX* kconfig. This avoid polluting
> the config when SOC_IMX8M is not enabled.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Patch applied.

Yours,
Linus Walleij
