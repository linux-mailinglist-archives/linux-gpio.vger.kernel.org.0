Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B71A2D25BF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 09:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725208AbgLHIWa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 03:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgLHIWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 03:22:30 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C7EC0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  8 Dec 2020 00:21:44 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id y16so18149411ljk.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2020 00:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/L9ij+xi4aU+RA5FHQP+6+0fS+qsQ1KICkMdHJmFYFc=;
        b=bYPvkZyzHphpd2LIG29zK/pI8TNd8M64LXuz04KBFAzCVM2tn6HgtLC4y0krAVsJGv
         HmZ6aUEcKYzXhARN1OGrWuBrOKpnEmmtqa7ywUSjV2r3A/jB2vpbQwNsgZOlxEJUcsl8
         QPPgKvurbDc295hFdI/W3mWEddd+hjtVyjNxtB0fT1BAi4cCrNQVH6032xcs8asD7CgZ
         EjanTiW0Fb3w7kLQrHr//TwXgV/cX7v7abUMsryIbh+Zh3qx0UasUnD0LEuYbhxqaqX1
         Y8uQ6gjPAkp/qoxxPhEYKuWcbegGalJQIMuDoMvXI7pe3d8Y1O/e8XVdhZAy05EJc7mH
         8j8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/L9ij+xi4aU+RA5FHQP+6+0fS+qsQ1KICkMdHJmFYFc=;
        b=gc5nO38L4QcOYN9lmX3KmjQPxji6d94LgJ8eZ1u+LdMnjOCcoS+X4OGoskGFwLX7NJ
         cbOof84vT+l6E+U+44rjZb03S9U8Xc1gZKaGc30NqJr/dkmb1JhZ49JxbpgLJqEEPQDv
         tAYZvwka6Vt9iCJL0JkfZ0w3OvISr1gxVxhE1iLKlUg4mb9cfV58iHbbJI3jMOGnxf7U
         UBz2MCDcKEdWpvDL/d/LQdJLiXNATrqMCsSQtCEbJnRBBlXpx9dYOuO8ttfHix0aityc
         x0AodZKg5qTottlN6yX9Tp/Wl/gEq9L3URqMidyyYfOq3ekC414iO1QVX0l+Rk50BVGS
         AxVA==
X-Gm-Message-State: AOAM531OAVHDMGdQTyTQhpSOZniP1a/fxX5KK8dgUELCf4lFjGXcurt7
        /5g38/pmd+Y/CJmagfJsc+BbqD/rbgC09qfScote8g==
X-Google-Smtp-Source: ABdhPJz3QSFZPxGv2N/pnXp+VezSxPYZ2V9M6+O2npQftKaRSLMZh4qMKQdxMJx/Ncz13H34GLneBICqZoSBqKisFV4=
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr10482058lja.283.1607415702493;
 Tue, 08 Dec 2020 00:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20201208075523.7060-1-sergio.paracuellos@gmail.com> <20201208075523.7060-3-sergio.paracuellos@gmail.com>
In-Reply-To: <20201208075523.7060-3-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 09:21:31 +0100
Message-ID: <CACRpkdY_Me8kO-Fa-vUspJNv+2vy0fswTM-RaUoaZJ5rCfuynA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: ralink: add a pinctrl driver for the
 rt2880 family
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 8, 2020 at 8:55 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> These Socs have 1-3 banks of 8-32 gpios. Rather then setting the muxing of each
> pin individually, these socs have mux groups that when set will effect 1-N pins.
> Pin groups have a 2, 4 or 8 different muxes.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Greg I'm happy if you just apply this right now for v5.11, as Sergio
is obviously on top of things and the DT bindings will get there
eventually so I don't see any need to hold back the de-staging just
waiting for patch 1 (which I will eventually apply directly anyway).

Yours,
Linus Walleij
