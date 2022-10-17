Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 798BE600B0C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 11:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbiJQJjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 05:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiJQJjg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 05:39:36 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDD5DFC7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:39:32 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r17so23532953eja.7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J0YhO3HzLm2V4h7OTfmPCXEk6LVGyM2MExF0oyrbPLs=;
        b=Wffr4UFGk/jp/aCXUwFCyJvIwsfYrNcE4ANBGsE/TtCyub6pfENvEepM72XsNEMsOm
         tyb12pgmvbBVqhg3L/86HMp9z/52cbFlsCsgpYxRreEtVLAoqYGfQVaHeoO3OT1uLUPd
         VWTXUtW3pcjrLKjhBvnF5ShkcmCcBAjFNAW7zFgXkjJQ1PB93K4IBV7/VdRrMcLgeFAI
         kkh1PqYJeCc2tumvRUCSrUyxEUpLjeyLb7GorEWSiuGNxyjMbhMdkvIzOZkCScg3aGtP
         jJQ9N5fJRr4oPavqkqzf537164n7AvMGr2Wimpr5/n2FiB8F935GLLVDrmHMNAwmn1QR
         aTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0YhO3HzLm2V4h7OTfmPCXEk6LVGyM2MExF0oyrbPLs=;
        b=cqJG5JEQPYgMh5zK83yTPmRBSc5gIihE8viYq92SIdaPfyaEFV3Jnz0qOe9xFNM9NP
         Lq1l7iVNXB8tmXCZhPOlbMgdRBy4EvlHcA47IVrOucYnb0/22rDgoLF1dz2GZCDnepJ+
         Rui4j+bqKprbBRCbeArCsvuR/3NnGdJp8mH6L4tG0jvwCNfFojohJ1RWUV3FymY+TyTI
         KLKBsLQgcyBxPwmPWlH7oSodI70jTIDSdG44qcspmM6OeQty3DaqIcc5LHobQloQ00Mg
         eJ38Vj4pucDMbjCw+7EopamzhmGaPqYDm8EgWif1pMDi75eWViHnCSQzckYKDAYzhfop
         WFRA==
X-Gm-Message-State: ACrzQf3cNJA6QmPeWt5OwDZ/0Hd95+kYPHkNYxt4+8UjbZDsDkj7+BrJ
        I8u148DUDUtkNwDgEiTZMs7Bfa68t5BwPR5A0soNeQ==
X-Google-Smtp-Source: AMsMyM7MydtQD2B74+S86KBF0MsWw1L6jmxP6JDsOzPL9wKuvOqq5tsExhAnLgBdku3EgCNpI9yqTWZ+DT+UqiEOoWM=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr7972727ejc.203.1665999570894; Mon, 17
 Oct 2022 02:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221007152853.838136-1-shenwei.wang@nxp.com>
In-Reply-To: <20221007152853.838136-1-shenwei.wang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:39:19 +0200
Message-ID: <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mxc: add suspend/resume support for i.mx8x SoCs
To:     Shenwei Wang <shenwei.wang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 7, 2022 at 5:29 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source,
> the GPIO block will be powered off when system enters into suspend
> state. This can greatly reduce the power consumption of suspend state
> because the whole partition can be shutdown. This is called PAD wakeup
> feature on i.MX8x platform.
>
> This patch enables this wakeup feature on i.MX8QM/QXP/DXL platforms.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Changes in v2:
>  - fix a bug when finding the pad index

This:

> +#define IMX_SC_PAD_FUNC_GET_WAKEUP     9
> +#define IMX_SC_PAD_FUNC_SET_WAKEUP     4
> +#define IMX_SC_IRQ_GROUP_WAKE           3   /* Wakeup interrupts */
> +#define IMX_SC_IRQ_PAD                 2    /* Pad wakeup */
> +
> +#define IMX_SC_PAD_WAKEUP_OFF          0
> +#define IMX_SC_PAD_WAKEUP_LOW_LVL      4
> +#define IMX_SC_PAD_WAKEUP_FALL_EDGE    5
> +#define IMX_SC_PAD_WAKEUP_RISE_EDGE    6
> +#define IMX_SC_PAD_WAKEUP_HIGH_LVL     7
(...)

> +const struct mxc_gpio_pad_map imx8qm_pad_map[] = {
> +       /* GPIO0 */
> +       {  0, IMX8QM_SIM0_CLK},
> +       {  1, IMX8QM_SIM0_RST},
> +       {  2, IMX8QM_SIM0_IO},
> +       {  3, IMX8QM_SIM0_PD},

this is pin control.

I think you need to think about adding this to the i.MX pin control
driver instead, possibly cooperaring with the GPIO driver.

I'm not entirely certain about the relationship between MXC and
i.MX so correct me if I get this wrong...

To me this looks like two drivers could end up fighting about the
control of the same hardware if you don't.

Also CC i.MX Freescale pin control maintainers on all patches
like this, thanks! (Added on to-line.)

Yours,
Linus Walleij
