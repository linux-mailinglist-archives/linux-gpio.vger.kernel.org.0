Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39DA632AD07
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1837243AbhCBVTI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384635AbhCBPcC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:32:02 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC2FC061A30
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:28:06 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id m11so23568163lji.10
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aPax3GL1qwe1HwLabdJUeK1LIyhAZJzxJUxC8g0CrqA=;
        b=zUMBuf2BI1C1L3cXsm5ETv5uy/TNdLURmncPes75wlQXzUc7LGrFJpIpB0tGX+DVzl
         Xq8xgRKJhdx70VSBYNnkiaF+TAisNndnUOVlmbku+mOplCwlWeP1WXK4UQ50qv7jDzyP
         RgglgTgURUrDzlSg8pkATeL54SG4LrzDACHTmxev6Uv1+Hs0cjrhvsXkRKIONTKe49cQ
         QyXQvbanzB7Bt2Qf1Ocgk/dEHOUiLBHhNLiNjHYI1/GmdTMhhd3OC/8Hyk70u4Ap9kDm
         3/MJz0tamQztGSqhOTCrEbQpJzituKpVIEX8mRk2Eq/v4vmnATbU31W8hfruFS8+f+lX
         AI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aPax3GL1qwe1HwLabdJUeK1LIyhAZJzxJUxC8g0CrqA=;
        b=S7syQyCe7Znq3VKihDvuSFH9J6+kXyElOCoR0Flpj+4GmwvbCsNyknaPvpjbPZy2AQ
         dNjf0DtaVmuN+5m6kjQtxFZ9fCWDJ2fpwRwB/CUIt9S1NoZ6lzcTplz7GizgMrYZg7ig
         ANKB3X3fIugMxp39lh9UHxVE1daXRfYf4sTFbVVNfP7izQXvoIyCsJaPsZS+WjmqJ47/
         M2cLm/ISeWXdb/GpJMLYrqsns0MTMd65g3ElgacAGf6z5hhJo4xIVJ0BzHftc5LELWkb
         ggP7EtXU6aJVk6g3hJ3tbANm/8+efAeFomwtnXBy48KMsvWMVC5tpDZwIR+bu3u9F6+h
         A05Q==
X-Gm-Message-State: AOAM531GWKoSHiiA/3bfVVkWDbnQJI5JtEkFX0Qj6fRObbVvjwMOj5CA
        ycutBIPONpWiW5UIA4xPh/x3hGKMWP7PzkxS9Cv8lA==
X-Google-Smtp-Source: ABdhPJwpVHsQIIpr4Wxk1imfzi1DhFf4KVqUC8erLVb6K34rLlG4dfMC2gAE/7BMpbwcrYTc43NzTLz/U3I4d78XTP0=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr4062048ljw.74.1614698885189;
 Tue, 02 Mar 2021 07:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-9-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-9-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:27:53 +0100
Message-ID: <CACRpkdanuQAg9ON_-=NwOi7J_pYZS4zecH+r3tFKK-NuRa1P2Q@mail.gmail.com>
Subject: Re: [PATCH 08/12] pinctrl: add a pincontrol driver for BCM6368
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add a pincontrol driver for BCM6368. BCM6368 allows muxing the first 32
> GPIOs onto alternative functions. Not all are documented.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Same comments as for the other drivers :)

Yours,
Linus Walleij
