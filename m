Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B475B9688
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 10:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiIOIoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 04:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiIOIoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 04:44:05 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823B197ED3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:44:04 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r18so40459321eja.11
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DwAOYGfkO3OPDyozHAPWbPMkPR348pJzmEfWU7to/7k=;
        b=oXf6/iVERcHsqGodxRep9TuWCJWvTfdY9ypaIjS2tUY73T/AwLKKOfBkntlSc0M6ej
         QrhtpLPZokbxO8sZ73o8YHeU5YW6eu9n0N+1wTqlOCmaskCymBSnw4NxriYOGoCogVTt
         rg81pmBLZAUXM4Mu+jpJoWx21CxGUC4AJDnob0er0KHwMO87F9anpout6+nvLLpwb7Qk
         B847SbW58Vzm0Ju/uTL+rgU68OrIWDtlJjUT5w47UygecIQC0xyURIp2sOBPTki9zpPz
         hZwseA8z8r1ttOHPsXF0JU1cyH594P24XGqCt4ydNTNtCTo6lF5MIz++Krl5ynQmR//2
         kUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DwAOYGfkO3OPDyozHAPWbPMkPR348pJzmEfWU7to/7k=;
        b=vgJTaxSuv+fM6ZTJc2lgh5Go4TYNyv8UEEd9e6uOC9blHj7qCrI3tiKeM2nWrsO0BJ
         bHbif+Goml5MddLilOt500P5HYlupFBfcDfwLIIABopQUrjxpkfTEoEbiA0YgcMMKn/I
         TZDOc7F69tVoFG5Cjvjhw1+GbezK66FuHa8NrSagtgUZeYJnoNzoBvfgcAivbX38Tpua
         gGnISU2AMkgQQMAZZCpt5M2CbA0B94LjsJ0/ron58Ij0IeSES9ABBPWfuJrn0Dxz69go
         7PHbzpBjBZEn5AXJ6X2+ORlDrCmypX9gA1rjES+UN3lq8AI/ZpEphOR6MAaZi0Tw2mKb
         WwFQ==
X-Gm-Message-State: ACgBeo1ioiSZdC0hp0ycHZL9YPyoE/dOJk7Dnjy1GfVkZwOs5XfxvL23
        35Qe1tCO5LISAv9/PLBwgPQtdT2RWOc5z9ikfkUPoA==
X-Google-Smtp-Source: AA6agR7qBgBc5KmeBQr28AbsnuudedYYAi2g/wyqFIP7vkOBcYcpcojaKmcq8lIUYEj6ZIyMvsduovCHdHEw39PGJxc=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr29067878ejs.190.1663231443131; Thu, 15
 Sep 2022 01:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220915021320.80364-1-jay.xu@rock-chips.com> <20220915021320.80364-3-jay.xu@rock-chips.com>
In-Reply-To: <20220915021320.80364-3-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Sep 2022 10:43:52 +0200
Message-ID: <CACRpkdZa7YNpO95=D0wyMWPXe6f8HYDwUhOfXdH15kjZYMGMeg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: export function get_pinctrl_dev_from_devname()
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     jbx6244@gmail.com, heiko@sntech.de,
        andriy.shevchenko@linux.intel.com, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 15, 2022 at 4:13 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Export get_pinctrl_dev_from_devname() as GPL and add to pinctrl head file.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/pinctrl/core.c          | 1 +
>  include/linux/pinctrl/pinctrl.h | 1 +

If you add it to <linux/pinctrl/pinctrl.h> you need to remove it from
drivers/pinctrl/core.h.

I suggest you just include the local header instead.

#include "../pinctrl/pinctrl.h"

Maybe not the most elegant but it keeps the interface private to
pinctrl and GPIO and not broadcast to the entire kernel.

If it looks very ugly, well then it is probably because this driver
should move into drivers/pinctrl.

Yours,
Linus Walleij
