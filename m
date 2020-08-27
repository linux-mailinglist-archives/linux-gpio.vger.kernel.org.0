Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7630254117
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgH0ImF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgH0ImE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:42:04 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CE9C06121A
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:41:35 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 185so5483554ljj.7
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNHfAA9c1rW26r8b3XpKfnc6lco5EHJf/DqyF4IQnJE=;
        b=uHKltIvyd+elQaC/FxlGXQPhY77dqRUJIAEshJY+kg7O7GiZ2doChKLmnuCNsojyFv
         XWtsBL+iSbkK8CgZnUZuhHi54H4Q0uzVSCYcroegnfH74cq2za0N2HiVhVHCXBNoh116
         h4qfeqqTJzbzVWBB5jB7eTXxVmkvRDGOW3chqmma9sG9zaIMxeonKjXa53Y1iNSR9PPJ
         NR3KdQfWrGh18axOYUFKhyF+SmJiwliOuOIoKNHIMQ1USfBBeRImeR0HQMDgd8KCR//y
         53hpVgiCHZS26XCIRnvHZtNmo/JGqXyH4gCWXsocXsa2NvlLXYUJMxdHybQf8sl9Ou7E
         YY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNHfAA9c1rW26r8b3XpKfnc6lco5EHJf/DqyF4IQnJE=;
        b=NVXY9EQ8bYle6kaSeMPOgqWfdMoKwVUyHH83TAEd7TySL3wftJgj46ZQiAJ7AwhX1m
         r6liXf7EDO3x1ranZakb+s7vZHqUI2KcYyfRgX/KDAzW0Yk0Ogcz2pn0e6a8aQq/LyNL
         YKRiWrugC2VYT+e8X/4yy1l8Pm6wlj9g3Q6sdcRMMJvMffvy7uxZTiPg5KaPnSJcUq79
         UxczYIs9/BkdPKKPTzdTfgUtCjvm8XzGMZDZgR5VaQKsgJ0sZt75Z/sKedaqu9k6PhMq
         tMh0VFFc3NPvqhUinJyL4A7yqAT7Jj06MWuPgX3OjCW0fA7x4PqQhGyrlOkhK244kItI
         AmoQ==
X-Gm-Message-State: AOAM533+9LD+lr9FXIQuBVbzIJH6xoVJSJf7475UD8XcoYUpvHoE6g7k
        4fjL8rdx9k76ArHhqum+aCuPO+yCUNOMKsAzbQ0rfQ==
X-Google-Smtp-Source: ABdhPJyoexWx0lQntuDJb/srGDOvASDiz+F6QURT3uDs8tPb+ypjy3GzKHexyWtdLFyvuDKYcfrpblkjhfpNDVWMtWA=
X-Received: by 2002:a2e:558:: with SMTP id 85mr1888049ljf.293.1598517694135;
 Thu, 27 Aug 2020 01:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
In-Reply-To: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Aug 2020 10:41:23 +0200
Message-ID: <CACRpkdaE0HZVN6QxMpA5+509iZ8kZ7A5S5XwuiRoyM=0dpGGSw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add Actions Semi S500 pinctrl support
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 3, 2020 at 4:21 PM Cristian Ciocaltea
<cristian.ciocaltea@gmail.com> wrote:

> This patchset adds pinctrl support for Actions Semi S500 SoC.
>
> Pinmux functions are only accessible for pin groups while pinconf
> parameters are available for both pin groups and individual pins.
>
> The pinctrl driver has been verified using RoseapplePi, the SBC for
> which an initial support has been provided via:
> https://lore.kernel.org/lkml/cover.1592123160.git.cristian.ciocaltea@gmail.com/

No comments on the v2 patch set for more than 2 weeks so patches
applied. If people find issues we can make incremental
patches.

Thanks!
Linus Walleij
