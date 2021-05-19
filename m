Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E70E3899EC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhESXfw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhESXfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 19:35:51 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2119FC061574
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:34:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j6so18955787lfr.11
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/tyzFlC7GFwXnrj0V8m48OERS+pLw5c5zxDWrrkhdBw=;
        b=b37jKpT+7x7iD0HeQ83f1/KaTplCxHAOHK25l2/DXlCdan+UJpDmpdbMX1/LVPSijO
         yaI8dRcYBBanWLB7sDdp6NFjQC4dWZXxYdIlCWT5V4uBqzJYmL5jlf/EeQhhc7pisse0
         hdXy6WfWw9aD3B4FT26lQYmEIJ2hB+cBgkIFC/YV7CFq1Tzy2wWmob+MpQsCkHXv8dTL
         uJsUtLZCXD61OmsFFzq/dTu+Wd/Hr47noAz1XVxDhXDn+/llOq8GMmD5zOLHXoS561gj
         R9TvQKmLdnh+ZMnx1OYasc9mtICWzNjw+nrvijLdiI5F9sDFgeb5bdrOqloN289NFqcg
         GEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/tyzFlC7GFwXnrj0V8m48OERS+pLw5c5zxDWrrkhdBw=;
        b=avUN3b1WDuyzY+l2JyOLIO7xw3Xp5KqaeuJN9FQfRCtg/wuya0IAGKaGgczxJ0wh6k
         4O4yr6LuKz0coa0SJ3kWE72XKf1VURp0YhodPaCqSPmGva/Jd8qeGyQ57rJ31xLvBQ6B
         Iy7o1Ny77t8fY2h4jNamoc8Zbq3rZ88RNnttq1dKlkrKPORvLllUupTR8wgfyZNA/6+7
         Dl1E46tlztwBxYWv+FQTzjg39X2ZOAs2CA8zVdEzNfhVjZQ31U+njCi8s1u002ae+Bli
         mT46yUQLk1/Uiarwe326EA0mPWKzneQR3xy1uMkOA9WI/QGhY5f5tUbR8hMcw0m2WPKv
         Y4Rg==
X-Gm-Message-State: AOAM5330bo+W3wsZW+1T0/vdIgM7A3b2OknkOLMD4vBh92/exU9sTr7J
        RYdi8VWZBkDT6gXRSOsKHn5Jp3kCCqs6iB5gOoOeS4WRD04=
X-Google-Smtp-Source: ABdhPJywzcbQhM9dAKIE/bJkOzI0kT9sSri3bLyemDST9cEVJ4hOYU/bFJBVVcrxv8lILEXuCPFTtmVc2W7IzxZJ2ew=
X-Received: by 2002:a05:6512:1185:: with SMTP id g5mr598480lfr.586.1621467269530;
 Wed, 19 May 2021 16:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210511090936.4452-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210511090936.4452-1-thunder.leizhen@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 May 2021 01:34:18 +0200
Message-ID: <CACRpkdZMkCNTdDCCpARhHd8KermNQwxh9sEVk8EW5YsKO-ePaw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: ocelot: Remove redundant error printing in ocelot_pinctrl_probe()
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 11:09 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:

> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
>
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Patch applied!
Yours,
Linus Walleij
