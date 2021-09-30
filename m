Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B241441DEB0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 18:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349630AbhI3QTV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 12:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349611AbhI3QTV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 12:19:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B056C06176C
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 09:17:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x27so27679357lfu.5
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9AydplMO/OhchranFJNxsujjEB+Eo9pfrveqj6lBlFg=;
        b=qUffUWOuFP3/0X04i77M7wE7tr9M3z9zUShjb3xRJsb7HIXmRnl2l3AxGvVjar7aFA
         unF5eCBPPT8czCY8/I4w32GSWCvamltkC677hJ2bFllO97iK036m/SlqreWhRTvmPLHQ
         4s2kSLW1ppCmS1NeQY3xYj2+0YKirmOPQhblVrGWGe+t4ZjIGZIP7wSWoJrRdXG7wSuW
         xL48DAlsGwZkwhAl3NEq4/XTb8i9C/M9x0JWQZw1pJ2ii6viWDd/GD+dghS7TTzjTKGa
         cPHyik+7LLS2fCB3XJkPyzqyg53L8yltVZITOkM4M/zR9KPrXiSqbMWZD9JeST//3i11
         9rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9AydplMO/OhchranFJNxsujjEB+Eo9pfrveqj6lBlFg=;
        b=rs7g4DdYvQv2qUV/He+OcyOISyKdrJtb3A5oGUOu6SlTgUMJo5ajXQFGHoT+gcHNpO
         kB7XQbzHRuJ8qvPWJl5S8nyENbu8T66oiUyCt23EG2MxORb+iH2lilhiWPikHAJJNv10
         QcEy+sXk4VH9iwlYXFAmTfeZAzi5Era11cnOCuIUV583B14U14tT+n+Suw4YfnDphB1M
         wccVdelzaEYfT4COz3wPC4atH7p5C61dZSDLNbLIvpREu8VFp1h5y4KdT227ZZ7n6k/a
         LvT4Nt3qCwg2bWIrVSovV+yqLTuNq1TXPaOZ1E5xpnQbogOiSh+R7fwoIS5tDee1cl6S
         8quw==
X-Gm-Message-State: AOAM532dlFA2xt/VHhZkOklQsUczzDn5u+25tOCHunyxoe5SZplMMG6P
        KSMptKzpXXcCDyFtIA9MLT4U4gINbnJy8ap6rgXllsyP/us=
X-Google-Smtp-Source: ABdhPJy+kwam2qnCIJA421Yva4o4+CPlZrt6f87kDQGjhOta3fQWnFUPvQVO3ABPx0RiMmhb2e/ysCCV5bMgqrYfB1A=
X-Received: by 2002:a2e:4e11:: with SMTP id c17mr6598678ljb.19.1633018656196;
 Thu, 30 Sep 2021 09:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210930095225.9718-1-jbx6244@gmail.com> <20210930095225.9718-3-jbx6244@gmail.com>
In-Reply-To: <20210930095225.9718-3-jbx6244@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Sep 2021 18:17:24 +0200
Message-ID: <CACRpkdZfzQK4LcwkwY-AbfXUaMssfUpKSa4VOSnuVLQPdapCYg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: change gpio nodenames
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 11:52 AM Johan Jonker <jbx6244@gmail.com> wrote:

> Currently all gpio nodenames are sort of identical to there label.
> Nodenames should be of a generic type, so change them all.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through the SoC tree.

Yours,
Linus Walleij
