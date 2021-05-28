Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9939393FC4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 11:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235997AbhE1JW3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 05:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235931AbhE1JWX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 05:22:23 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C41C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 02:20:46 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s25so4348055ljo.11
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9NyLm4M6sno3u68FwAJ1r8D39ashG0coxPAL+2ytbo8=;
        b=m3KjY1b2H8lewGLvYfwdijyr0kT3Wu1LNZP93AXyhqs4bkCFph4GD0igddPrB5cwtJ
         SLE8Z0Hj94599O30PbmqxaWGcDKwpl8evubGvvvDUo9qnFujjaHmzdEyVbVJGsAT9g23
         06hlKbVRew3zE4IWYQxfbqY5/yf+h889FoOBQqzqS2DDJlYqqed2ErBfg1e2FRQMj1BU
         3sCl43FNTZ/cWgLdzbSnCyVGjLytnIrwWAYZDB3jOEZZF7wbL7VH5XoWnkIcWlSil00x
         WYVF1NimFto7/MwtV39GJ9iW9GCP7v/zxWwpJ900USlaLozoL38IpIVS2PdswG5uS+W8
         +q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9NyLm4M6sno3u68FwAJ1r8D39ashG0coxPAL+2ytbo8=;
        b=k1Cl9RduEK9gTTNGE1oq28l3dGqACT0PU9AoIaRBGX3UeNlBCk9lvJX9kn0rxXf0kV
         akJwfnkwrGLxIvTjovDvfTgCxY1lAeCLCS1VWlIixW+hGGNK46kF3xOJs6prJrH1OmD/
         4cILYs7KlCxOEi9uNnRUJYwprkmRQBSl8l3Y2vU/uglmzhtoGXoilDJyWWZUeAi72iWn
         kkRRVCKuJAQ/OT1v/BgTiAt+GGT99jliD+Re1PRPIIzcHaA4Oaisu/CrDzdcmWvwRAL1
         bZkHUb0/OlOOdeXxQ+O+01t5q0iRB0vzd9yHy2JHcuJbAMD1Z0KDKL4M+xDKcJh0bJz0
         Ctew==
X-Gm-Message-State: AOAM533VNxd+OZLaUsWgzb1F6HrMWMFk1NSCU7IkAfR+Slf6UN6e2Eud
        EDT3RQ1XmRg/zUoUaQTk88AmBUWjWKeGuxGz6OBHnw==
X-Google-Smtp-Source: ABdhPJwaCkUllAD2rNdoBS/S0G1y0aXKEWfHDRy7bbdri1JLQs5273AM4VtJgQ1pOaZbsnf9vhQWoA0ph9fTHhrOsWI=
X-Received: by 2002:a05:651c:4c6:: with SMTP id e6mr5831209lji.326.1622193644998;
 Fri, 28 May 2021 02:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com>
 <20210519162409.3755679-2-fparent@baylibre.com> <CACRpkdZ70OcbgyFN2cQtLgsXFCTsvstsrBYYt3UY6Wc=NbXuag@mail.gmail.com>
 <CAOwMV_zin4ODuv8pA8_tfVyg3g9=Mrt2Txdk0O2wL8JqDefzog@mail.gmail.com>
In-Reply-To: <CAOwMV_zin4ODuv8pA8_tfVyg3g9=Mrt2Txdk0O2wL8JqDefzog@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 11:20:33 +0200
Message-ID: <CACRpkdZmyD-s-J50G8FJPXDyDYEJbLURSCz+DT+H7VFHJt5uLw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: don't hardcode mode encoding in
 common code
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 28, 2021 at 11:11 AM Fabien Parent <fparent@baylibre.com> wrote:

> -       bit = BIT(pin & 0xf);
> +       bit = BIT(offset & pctl->devdata->mode_mask);
>
> I should not have replaced 'pin' by 'offset' here. What do you
> recommend me to do here, shall I send a V2 of this series and you will
> drop my V1 from your tree, or do you want me to make a new patch that
> fixes the error created by this patch?

I just made the small patch myself, it's faster.
Sending it out as we speak.

Yours,
Linus Walleij
