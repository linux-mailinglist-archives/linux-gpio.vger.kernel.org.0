Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDF096210E1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 13:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbiKHMgT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 07:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbiKHMgS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 07:36:18 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB454C24F
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 04:36:14 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id z18so22231280edb.9
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 04:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lUte8uNFM/Ko5EYA94xDS4OarmRppybS52Yd06EmKs0=;
        b=exue/41mpesJS2YHEz7v0h7Ysi3Mac6gew2UFoCbLeSfddgbKISLJDgotDgMFVYkqV
         9buWnp6zQNtN4O6AT4aswNa1CgAq2FNtGMgCfMy4m9mpKJRgu1fYulX/Xu6c2NRdsrZR
         +1UMYXNI35yEqCowzKJyC9duOFwQ4Cnb1qzmCMTBdbPsQvk/ovnmKvU5XaMVOLDX9YCC
         zm/3t5mRGmoSf7cYJxhv+m6jHMhM/vsh6iB2JP+he/UnWDMxUsNMbXr+xYv+oOK+Kcmh
         uUVENFfQvlvi1WxCN6Xhp29t2LjaXSIuDLSg2jHWW+/BIljG+y/Z/FVMf5D6HDZQTmd4
         wDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUte8uNFM/Ko5EYA94xDS4OarmRppybS52Yd06EmKs0=;
        b=EVc/K/jcNn+fSkzMNFu4gbjmj3wBg46IEd5Tk0PO2utzvhR0C3+4/JvZ/6YguGnx8r
         4Sy94rSjF+Vs6W9MDYo+DiEzCVDM4LxIq2Zvq8GT9V72sPGwIOUfJ4phySIjXF1M4d2x
         mPRTegWbragZUXbqCcLARtDo5P3gD5bDZZ/ZvygOI7etDFNQhuWnF/I8EwEDz7JApJIq
         1RhVsdyV6Gufwa7VF9rTlZJDMnt18nOKzHyyhUQCOgEZcper3kyrqJrxVTBlkcBkFlBc
         qppgrSbx1DSz2aF3x6V5EHMMMxHpCUN/IkArZDlQNBBSFngE+l3CVVA+7DEFmbDI1GbO
         5cFw==
X-Gm-Message-State: ACrzQf32xrgWKO4FYDjgE7O0UWTaTxQXjuArXi+oReEVS+0jEsiZX+rp
        ORncX9eyCFB95OVyG9bmRQ5TQNndV6PnlIcz2MH/Yw==
X-Google-Smtp-Source: AMsMyM6J5Wkx9+mm9M5bnxR10MBsY4ZpxY0vOQ398u8OSuBf312QsZh7E7zi2Rnq4+DElyDARXmG+vClXK7CeAYG5YY=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr55652244edb.46.1667910973339; Tue, 08
 Nov 2022 04:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20221031100843.14579-1-clin@suse.com> <20221031100843.14579-3-clin@suse.com>
In-Reply-To: <20221031100843.14579-3-clin@suse.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 13:35:59 +0100
Message-ID: <CACRpkdYWLVc4Rp4U=hRV9qDdTWeWUXM1BF0WrBxRpCWkwt6VQw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: add NXP S32 SoC family support
To:     Chester Lin <clin@suse.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Larisa Grigore <larisa.grigore@nxp.com>,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Matthew Nunez <matthew.nunez@nxp.com>,
        Phu Luu An <phu.luuan@nxp.com>,
        Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
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

Hi Chester,

thanks for your patch!

On Mon, Oct 31, 2022 at 11:10 AM Chester Lin <clin@suse.com> wrote:

> Add the pinctrl driver for NXP S32 SoC family. This driver is mainly based
> on NXP's downstream implementation on CodeAurora[1].
>
> [1] https://source.codeaurora.org/external/autobsps32/linux/tree/drivers/pinctrl/freescale?h=bsp34.0-5.10.120-rt
>
> Signed-off-by: Matthew Nunez <matthew.nunez@nxp.com>
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@nxp.com>
> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> Signed-off-by: Chester Lin <clin@suse.com>

Overall this looks very good, special thanks for using as much generic code
as possible.

Only main thing I want you to look into are those magic nxp,pins ranges encoded
into the device tree.

> +static struct s32_pinctrl_soc_info s32_pinctrl_info = {
> +       .pins = s32_pinctrl_pads_siul2,
> +       .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
> +};
> +
> +static const struct of_device_id s32_pinctrl_of_match[] = {
> +       {
> +
> +               .compatible = "nxp,s32g-siul2-pinctrl",
> +               .data = (void *) &s32_pinctrl_info,
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);

Since you are already using .data so nicely for the variants surely the
nxp,pins info can go in there too?

Yours,
Linus Walleij
