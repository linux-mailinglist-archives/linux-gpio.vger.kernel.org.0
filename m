Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8F2397514
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 16:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhFAOJo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 10:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbhFAOJl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 10:09:41 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1999EC061574;
        Tue,  1 Jun 2021 07:07:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f30so22069846lfj.1;
        Tue, 01 Jun 2021 07:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MExTV90rtZ8/hjUE3hCRwCeDds2Wqj8Wyw00i17Pg3I=;
        b=YN95LoKz1G8+dBZr9w+1D5COULtP1QhHPlvib9H1AP6UTioYfhgn7RtFXiYCC6Sc65
         vd0/Qmq+VkPFR/wlcqzdda7xNTFz1L3OddyrzJoTTfWl3CFjISfJg6dqkm3dZ1rPu9YU
         tzF4IhMEx1f4I2G3/tqX4cDSbPr5+ExqvpiH8uaO7sQEOl/b/vp38iDsU9hFYxtP1yjR
         AemJaTpIAwY3YP1OIN6kvT15WebUrfAZTAwFj6NbYXvVFiEmWuXqAh5ocEXgUyAmpvIW
         zI8RGArlYyJROLoLrBGCDRALWeL4Vks1+FojG8ymL1/wz2BHMDXkSIw8PbHnnL3qSOvk
         2TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MExTV90rtZ8/hjUE3hCRwCeDds2Wqj8Wyw00i17Pg3I=;
        b=bvct/2IZPsKDFDnr/eQzHPlf3rXSyBvrMuHJy4t6PGmsQZrGWQkULqMNf3LJKZHRiZ
         QKj9benQbjrRqtYi/BOUccjC1abNpCEAULZsdl4LZaenM5Rr8A58CP3r+fR9uTG01Wug
         lFkR8Dw4ktqwVtbp0tek2dAYorYxHBluquK1CbJ25UXS9mvIZbueEoCQA+eHRDGZUgZF
         mu6hprrUiKDI1dTYF6i7whWFC3CJ+qTY5smW6xzWLShbz7H63G5bAEGL0epDBpCEN7l7
         HyiZA0B/+ZQFkbIU1Gd++l0i0EoSXoQRCT9cJUjBDqSxTzhuya+XG9fztW7tj+LHihlE
         QmIA==
X-Gm-Message-State: AOAM5302Uhwh+vt/dy2OL4vW2cLjV7Ld2kYbBVC5eL1Ue48G66MPsVh4
        dzjr6vC93NA/hG5ejeNzez3sNb/AryCVpdfbM5Y=
X-Google-Smtp-Source: ABdhPJx4yKg5VJ1aLdoZu2YSJio0T9gNQu+Am7hvR47r0qklSK8tLR81cPevGpyOuyEIO9ABe4zcO/I8sca/UXqo4R8=
X-Received: by 2002:a19:5e0d:: with SMTP id s13mr18756585lfb.229.1622556475472;
 Tue, 01 Jun 2021 07:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210601062338.1969040-1-ping.bai@nxp.com> <20210601062338.1969040-2-ping.bai@nxp.com>
In-Reply-To: <20210601062338.1969040-2-ping.bai@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 1 Jun 2021 11:07:44 -0300
Message-ID: <CAOMZO5BhJ734DQy5MOpq20O8Pezwe4FG4hVV6CRnLpH_14PfVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: imx8ulp: Add pinctrl driver support
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jacky,

On Tue, Jun 1, 2021 at 3:13 AM Jacky Bai <ping.bai@nxp.com> wrote:

> +       pin_reg = &ipctl->pin_regs[offset];
> +       if (pin_reg->mux_reg == -1)

Can this condition happen?

> +               return -EINVAL;

> +static const struct of_device_id imx8ulp_pinctrl_of_match[] = {
> +       { .compatible = "fsl,imx8ulp-iomuxc1", },

In the bindings doc patch it is  documented "fsl,imx8ulp-iomuxc", so
there is a mismatch
between the driver and the binding doc.
