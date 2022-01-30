Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2E74A32DB
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 01:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245337AbiA3AbK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 19:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242545AbiA3AbJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 19:31:09 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2098AC061741
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:31:09 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 23so29502716ybf.7
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+tUswWPeFRUGhqeKnq9tPziIimeyogA4jbZIEQmujLE=;
        b=yrXvzCpDtTXPYs3wZlJZl+vl/d0SuDLMpHHZuUYn4/Rh3ZPBkUnan2mHGOmbXrmRQi
         CiVo+Dt0F6kwjuRCVeOHvkwKL2kdZ3IfaSsxZMLtQVDQk7cUdjlIa7mBw/UK4dA/u0TJ
         aV4P6o5wr4x47YcWqEjM+NuUs7FJSn6yEs0YuRa2JAew0CxiQnoKOR+Emwmj1Z9+sjd4
         09k6suZ7Myoqzh+PjgZ+BVQ03LOlD2QyIiijm8lhNQlFDu/+pDbGrJhtJvFqusdRcbm4
         AT/6CF3uzolK48Q1zW5sAtxBmFQ0yynEug9lDcbSJkbd3tYlDauavORP73qTOw0aiFNU
         O0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+tUswWPeFRUGhqeKnq9tPziIimeyogA4jbZIEQmujLE=;
        b=meD/cUnNV9qPBLOkYev642eA7YmRzrqc2/xuL50wY1G0S1AeuUmNDQiUpa2hPwm7hY
         WAiNdAk5tyJmK1BXxECxy2RHUzf72xIYcm7yjXBeJRGRECsmZKEKUni7ytQA9E5BrZLx
         uHRxOHyxlCHiqpzcbuvQHnR23c4otj5pD7wfWEBsGZD4qtKC7wLzwLcPc+vuXZK55ylg
         zC6egHSf/iTaLqyDmFVFjs+fGWhGa5FAsM/gWyiXbzu38lk0R6/rDQCG87l8dj4Z2uKW
         M1/dTGhlJ/U4vuG3Ft482vodmr3pQBa4JxLgCBYf4Gt0kk/5GkVbCQ9dIUWATRc98Siz
         RtZg==
X-Gm-Message-State: AOAM530X35KxE5E+NMervtA2iSzZVcLjQ9/gehlISrhR9bsKTI3kDwXo
        k7VMxxBqK3Yx5ztifqnl1CkMjcxedynxEQH/qaw6Xg==
X-Google-Smtp-Source: ABdhPJzY2OnQZpKA2VLwksOhGENnGo5N5qu48SpVRvHA6YxRNFoMTcxLpVgZSf9AG/y3h0pbkGQv1RAegyHBcrDtQdw=
X-Received: by 2002:a25:8011:: with SMTP id m17mr21608398ybk.284.1643502668348;
 Sat, 29 Jan 2022 16:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20220129220221.2823127-1-colin.foster@in-advantage.com> <20220129220221.2823127-2-colin.foster@in-advantage.com>
In-Reply-To: <20220129220221.2823127-2-colin.foster@in-advantage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 01:30:57 +0100
Message-ID: <CACRpkdbFOB-uoVKiG0qTcHDa45bNjwdkP=AzAB7kU2Car37QYg@mail.gmail.com>
Subject: Re: [RFC v6 net-next 1/9] pinctrl: ocelot: allow pinctrl-ocelot to be
 loaded as a module
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Russell King <linux@armlinux.org.uk>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, UNGLinuxDriver@microchip.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Lee Jones <lee.jones@linaro.org>, katie.morris@in-advantage.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 29, 2022 at 11:02 PM Colin Foster
<colin.foster@in-advantage.com> wrote:

> Work is being done to allow external control of Ocelot chips. When pinctrl
> drivers are used internally, it wouldn't make much sense to allow them to
> be loaded as modules. In the case where the Ocelot chip is controlled
> externally, this scenario becomes practical.
>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This is fine to merge through the netdev tree, if you prefer I merge patches
1 & 2 to the pinctrl tree just tell me.

Yours,
Linus Walleij
