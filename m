Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5822FAD52
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 23:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbhARWaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 17:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbhARWaD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 17:30:03 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A637CC061575
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 14:29:22 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id j3so104543ljb.9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 14:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bUoyIwualxmCOZc7fLaBimHoQ2673QVgFv+KTluFbL0=;
        b=Y1xzqd2qTqin1Srx9hlZn6IdHLtP5a9Gdnopbgx8Nx/aCHDdkptz0KPQ5niknZeX6W
         TaFNLy72Z09WgagzvTcm0pDCGEDI5bvTYUDrkUI72babUOtYIv7zTPLwi5dPkf7ph7g3
         w/10z85fs63jQ2mLvqQKJTm454mOM+YjBEvLyFIuPjNS6rDSqjVvH6mJ3QFH77IoX2pz
         1+ep7j9nFvfeIRhDiM/+54XUizWWkzCORpG5hdZkgUMIuLJoOUKG3JByBgTI68o+Vwi0
         Rqh3vbJo7nleHFzyOoVOFXH31Tu9SjGH++HspYfZrg6qWBsnGr3lN76lqoHKEUWcYNp5
         m51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bUoyIwualxmCOZc7fLaBimHoQ2673QVgFv+KTluFbL0=;
        b=sfm+UfQ1q9nv0VhrSOSLcE0qwvb/yfDTgW6y70shWGORDi2giVbhxvf5UVTj9sowFP
         6t4mbMWBD0ENfg5xsqOlKjkmQQmPBi0SRC9SL+7CMzTyM4Io6nJxNWHMd8PlGJtkd89r
         qfzsNYZUxQGFWjlld7PAkCm287XPex7sR8kyTae0WqBVy92c1SfnIjdzmU2Sb8nwEXiq
         ApDTft06m8ExGLZb8aSPSV2XZIz2mRZEU+TcD8ed0oftRqU5JqxCcQwik4Kd9J35BIvF
         MMeMzNjQCEovt68R3INOY9XIOJ8jOha54VlhonkAU1tqEFI2egCWJhwSSoEBFuv5xuz7
         TM3Q==
X-Gm-Message-State: AOAM531V0kT3um8l40XOGw5npSTX78jL3mUNB6w6dO7ZTWjFhxlaSqXf
        7wXjxL7Og8mAH+dXHDfedyfKVGViK+kxxfWs+09a+Q==
X-Google-Smtp-Source: ABdhPJyi+yigw+zM8wEJDU+Me9gCw1yphmZyfKy2OAIuMKbAVJK4rhZggmQflYmvIPx0+jbtea2fym6hW4NW8R8z9rA=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr659935ljo.368.1611008961014;
 Mon, 18 Jan 2021 14:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20210116015350.3501927-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210116015350.3501927-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 23:29:10 +0100
Message-ID: <CACRpkdZ+Vp3Jq+vZavVwGrbahbqytuPQRASKHf0yC-c_NFk0-Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix indentation
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 16, 2021 at 2:54 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> yamllint warns:
> ./Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
>   102:10  error   wrong indentation: expected 10 but found 9 (indentation=
)
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied.

Yours,
Linus Walleij
