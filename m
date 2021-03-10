Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5E7334C14
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 23:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhCJW6G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 17:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbhCJW5t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 17:57:49 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7379C061574
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 14:57:49 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m22so36379777lfg.5
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 14:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d2/T7lC+TgI1noDB/pMmyFyVPYA1l5MlMJCzUb0Ud9A=;
        b=CGBOyR6lxd9bsulbOoTafTqqLQjjXRzQuOVaS5kFuCJtdt5IdIkAYtQS/+loOCTgXM
         hmIMX8PIVF/4+ctZM6soZUnGMalaoJUXcBMT44YvohN48vtxV7lRiByVJ1rJT6OjgsJn
         bX0NZ+kEjhv7BgWWmEzVDbpmYEM216ldKC93nksg/vDDb75s+SGV2rq6ZJSsyLpvDSqY
         PzOLNKAlxLi+wTUeUtCGALn+iz63DjKr7+I+6VhOYJA+j2aOkOTQB4p6m4VamhJwm/8A
         KIBK5e52WiZqWxSI6RXp3IzNgdCkCUOj96INhjiwzRQ0vNc5Wwke1tJi5WyP58vV3F8A
         tAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2/T7lC+TgI1noDB/pMmyFyVPYA1l5MlMJCzUb0Ud9A=;
        b=FNpqOVH1UI44/I9/alwZVrDTJXrcRdimPS53szFlEAMXtox6kmecyRlBue7EiGcG8c
         PTHZdFXQXILkWMW3r1RRPlle8M01KdC7f0TQaFOy7HuGwOieO3RvWcE/49GIQyBSPO0V
         YVgwIbzKe8qXHpeohN06Cn5ji4b/bYkUzjYTMpWyTueEU/+UlstKx0lZg2eENkrT/S3B
         OL1OtTIGKGvIlzbIeOlOI2vXMknxDw53WCLKpcnDcKmyXv8P6S4NQoEQ1/0VQyBmDpCA
         W6V/Doj9/ZL6a4ORAShlV+4MNCVKUt3R0wvS/a54plHFW+JZvYgRI7MI9fjp3liAtJr3
         MX6Q==
X-Gm-Message-State: AOAM532a7FhG0FvBqd+yRdQG05UuXx2/L0en3bWmqZJ3SPSFkkeIAE+2
        2CTGUNinoOWHc6+yw0z1k5pO2bZqCq0j0gZOaoCNVA==
X-Google-Smtp-Source: ABdhPJy6mJfwWioqliBKauWWA3snsEiRmpsS5OlCAOSeEeE/LycC1E1udAEzj6ZkO1j7OJ0PtV/KBxxcqbGummNnUVk=
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr456530lfs.586.1615417068054;
 Wed, 10 Mar 2021 14:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20210305003907.1692515-1-jay.xu@rock-chips.com>
In-Reply-To: <20210305003907.1692515-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Mar 2021 23:57:36 +0100
Message-ID: <CACRpkdYcKPehB2ugpDsD+mZ81eOey7ciK76BEJT_wECH_O1zGQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] make rockchip pinctrl module able
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 5, 2021 at 1:39 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Make the rockchip pinctrl driver able to be module by unselect
> PINCTRL_ROCKCHIP from ARCH_ROCKCHIP, then modify driver module define.

This patch set fails like this:

ERROR: modpost: "irq_gc_set_wake"
[drivers/pinctrl/pinctrl-rockchip.ko] undefined!
make[3]: *** [../scripts/Makefile.modpost:132: Module.symvers] Error 1
make[3]: *** Deleting file 'Module.symvers'
make[2]: *** [/home/linus/linux-pinctrl/Makefile:1440: modules] Error 2

Probably this function needs to get exported. (Send a separate
patch for that.)

Yours,
Linus Walleij

Yours,
Linus Walleij
