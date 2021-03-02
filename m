Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEF032ACE5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383758AbhCBVR5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239070AbhCBIve (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 03:51:34 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89314C0617A7
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 00:42:36 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id bm21so14823856ejb.4
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cqj83OHH0uy6jXnn/6KBeppUvOHSpH1VsMfJDu/RtSk=;
        b=vFLsMKKiZvzx63grS8/bVXFdMNv4fOLL4c6hkZiljW/H7KUmXzXu0TblXaRgN7HH0X
         sRs278w+B9Rb9CUADc+tXJmc99YoEPc0ZR9rfxIxgMyQNt4y3G7x2aD67k/sNXjEZfhW
         SGFg3mWcj6hrBADdf8mpl54LZxCOv3zNiWvHoXdhJh1EMjvyFGpE8PaOby5gGpPuOYgE
         mZSyst99gu5zwfj7CGCF8sYoSrc6pocYzwx6R9208KKecfp4+/5tacG3ZkRyrpqFiHJa
         U2pRkeernB6y465khfgeXxt6r4PwcofdmInvJF4RE5YbGQXDsWNqbO0oSzM+SD+6Pa3p
         Se8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cqj83OHH0uy6jXnn/6KBeppUvOHSpH1VsMfJDu/RtSk=;
        b=kSBunUJypG8964YVuoW6HZeiUIy+siBZ2IalXrP9MiMaNxsr7QphjpS+sGsOm+rzKG
         y6t6in1WyPmovwBWx1a1TK9tX0InAB/jvGXeZCoR4r8j40B6q4QuiLd9ftc3WAHZ8wPy
         OOQwP37vlJmtR5bxCQo2Ef8GxB4cZ/y5HAWWYUssrGPSi3wV6JYL7YNSEAKKiN0Dy4Hp
         t+bcbwhN0GlLP5N8fOmDncwqPql8xY2mkTJXf9amB2KoW/crdQCkwJihZGs/K0S/I3p2
         5ywfgXonu11RMTvm7cN9yU9dbWdHfvbns6KQuWcZ5aAEvk/tXQnwgviQY/OIBrkzQlgu
         YAKw==
X-Gm-Message-State: AOAM532hf6qWi73BZS9gb4KVvtRgrL3a9hB3wLaRwJDgVnhKdqq/Vm7q
        8ZBAGQpzC+Hmbv2ddwCFXMIl9icvzdz7A+t0SCmTJQ==
X-Google-Smtp-Source: ABdhPJzGPey4/zJAweoL7NIyiBWG5j+JHefetxzo+d4UB+dkYOkVHlCSa1ueXoWOLvYaTHqorLcuIeAd2yR+S+Tvt6o=
X-Received: by 2002:a17:906:ac6:: with SMTP id z6mr19121663ejf.505.1614674555172;
 Tue, 02 Mar 2021 00:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20210216113118.17484-1-kostap@marvell.com>
In-Reply-To: <20210216113118.17484-1-kostap@marvell.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 09:42:24 +0100
Message-ID: <CACRpkdb+ampUXg1qN6iH8aTagqvfJwosHD6c2WGLA3p_JCXa-g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix Marvell CP110 pin control finction names
To:     Kostya Porotchkin <kostap@marvell.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "(Exiting) Amit Kucheria" <amit.kucheria@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Stefan Chulski <stefanc@marvell.com>, bpeled@marvell.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 16, 2021 at 12:31 PM <kostap@marvell.com> wrote:

> From: Konstantin Porotchkin <kostap@marvell.com>
>
> These patches are fixing the CP110 pin control driver and the related
> documentation.
> Current CP110 pin control driver uses two different MPP functions named
> the same (sdio) in MPP54 and MPP55 definitions.
> Since these names are used for the MPP functionality selection, all
> function names within single MPP group should be unique.
> This patches series fixes function names in MPP54 and MPP55 pin
> definitions.

Excellent fix, patches applied!

Yours,
Linus Walleij
