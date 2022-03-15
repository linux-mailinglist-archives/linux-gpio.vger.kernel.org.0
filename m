Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDE24D9227
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 02:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344214AbiCOBQ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 21:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344207AbiCOBQz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 21:16:55 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B8439821
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:15:44 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2dbd97f9bfcso184921457b3.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pC8Myz4YlofSUNcp3puZ1GbZJ/dg5VjQ7/yDmBxn+eA=;
        b=wmyEINKwLaGLsp3Ki3JguAJ/jOLaUneOi0kPsR2pL+v6EaMLHOoMDz9cA6K5Lc2X5W
         sfmbgGis3Vx0uYHa5kqRjH3IcpQUGPDl06rOagZXNTO7SdPjHTOQhtnRHeKoM1EUmM/a
         iKY+yzu8gmjwlmzQTifk5pteyiYOt/LBpFsMPg0ev7WLHKZkBtJFTlPa+8uCsyv7j1V5
         KrU1fhvFBWRYQk1C9ii7yZW7xCspc98HtktJpcdz3NVfNMLBq6IrpDHmwiFQIhKJNcn4
         +p+bS0ePnhxd5oqB2Y8ni+/a0/pjTsi72lE/DEt/MtnGc1UTMumCO+2vH/ehWr3CbpAX
         C9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pC8Myz4YlofSUNcp3puZ1GbZJ/dg5VjQ7/yDmBxn+eA=;
        b=y1GF7CyuRleWaJg0GLCuHCYYgKDzc203LnKSMsue7jLg4pSqGXDikYUqgwku44Zjh8
         036wmafBlwhizdLmMtr6j6ccgv13jZg+S2bCKvZO5iXF7NwtLRwESqDp09LKZY0S3Wou
         +kyMoD0237G1ejKFrKBgjaCFlwtom3yCErR63sjBfJIs2KzFm6MIXsTyoiiMcMltyAUG
         cOw7PLr4Ji4NTkSTL6qRbMfu9zUmt/II9hDZL1pydC1sfmLmchOKN76buh6rnt7AvT2D
         W7Sl4P9W/dqia219qWJuDSetCeIo8iSxJG/O5D1DmJ6YygA51VdMQM5K4XC0cMU8HPDm
         6zkQ==
X-Gm-Message-State: AOAM5308dBUq7MrUj4aD8J4yIbDvdTfBpTcqirgVtITZyIWOSLjceMdD
        m8TSqy4a+C1svTYjjYUNLQErVOPl+RXls7ufFRwV4g==
X-Google-Smtp-Source: ABdhPJzJLFed474ofr89/LlN3suZJUh4S1f4LeorbhqHJKNv59eiwl+mQqd+K5WDPpoHwHT8u9koqgcq/TYVH7Oh4ww=
X-Received: by 2002:a05:690c:9b:b0:2e4:da22:2a71 with SMTP id
 be27-20020a05690c009b00b002e4da222a71mr15948649ywb.126.1647306943903; Mon, 14
 Mar 2022 18:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220303062211.1378883-1-jay.xu@rock-chips.com> <20220303062211.1378883-3-jay.xu@rock-chips.com>
In-Reply-To: <20220303062211.1378883-3-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 02:15:32 +0100
Message-ID: <CACRpkdb1366vp6nK3K20kenLkwiy_1ebT8Wt+S93vdQ_Gjd_-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rockchip: get pinctrl node from 'gpio-ranges' property
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     heiko@sntech.de, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org
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

On Thu, Mar 3, 2022 at 7:22 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> The dt nodes for rockchip soc designes as
>
>         pinctrl: pinctrl {
>                 gpio {
>                         gpio-ranges = <&pinctrl xxx>;
>                 };
>         };
>
> Currently, we get the pinctrl dt node from parent of gpio, this patch
> try to get pinctrl dt node from 'gpio-ranges' property.
>
> After this patch, the dt nodes possible to be
>
>         gpio {
>                 gpio-ranges = <&pinctrl xxx>;
>         };
>
>         pinctrl: pinctrl {
>
>         };
>
> then the gpio driver could register as platform device itself, but not
> populate from pinctrl driver.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
(...)
> -       if (!np || !pctlnp)
> -               return -ENODEV;
> +       pctlnp = of_parse_phandle(np, "gpio-ranges", 0);
> +       if (!pctlnp)
> +               pctlnp = of_get_parent(np);

GPIO ranges can be several and point to several different pin controllers.

I understand it does not in your case, so I guess it is fine if Heiko
is fine with it.

Yours,
Linus Walleij
