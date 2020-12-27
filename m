Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7AF2E32D4
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 22:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgL0VOx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 16:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgL0VOp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 16:14:45 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F75C061794
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:14:04 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id h22so20106108lfu.2
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CS/Q9kpBmX1TyOKsWp6MAco5gWy7Zdx8vvkGEX7VhaI=;
        b=tXDWl7CArrfizWGfB1RyiWkwOB9TZr8TOahiIN8uiKetWXcoRoXcaKGalN5dTGZMLo
         9SMPGojDRx3vvd/z7FEovDvb7J4KTKBkunAy6lna5qKjIZR7tItMz+o3jEG7grBMbrh7
         U4lSq7VS+plvjrNHl1y4HCWvIWYftke6BB3OXvXqRiAR0i0rd1br/uDKznCyGe4KuJxS
         e2RKQIxd9O7pnbeysrVxTDF67hWbfOhAIgU6K37HGLeRLNFVIyjN1DCocwgM2SaQMxcV
         u90J1z36xlkPS9Yg5XLsuIrdF6R87LKHFqYIfPxbIAjawHyvn9ljxkmeD4rTUgzWAxT2
         V6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CS/Q9kpBmX1TyOKsWp6MAco5gWy7Zdx8vvkGEX7VhaI=;
        b=FWVR8M5LEd4eSpoew0C82couCIvdB2DhSiHYuP96bm9r5rJSAWcFcroEzmXUNAn6L8
         yqYTNh8Tda8FNocpQJY76U5W8RACPiw/coRydmHwB0X94IoJNzbTLYO686Srph3uSZDH
         6rbJb0bk3WAkcXSRR2JZ+mWTVb+Q3MCANgCLqjvh5qa9rksIQtLyxTmJf3RCnk4q5Njg
         QZrHjFMxsEbv2yqQix3P/RsvWqbw4z8WCVHgItkYhRKL0+xGJXRIQ9dsWVizodfWP566
         JZp1FDAk+61TocKXi3G9aO8BllABh0HwMpUfrC5I++BDiqA5EnPTfYDitdH7aLBeaqBq
         pG9Q==
X-Gm-Message-State: AOAM530nyVgBsxVCRVDEwJo307XjJJJnpaEUYGDrql6SOV7pcX2pkBU3
        68UobSJQUKvWbLL3u00UPIXveygi29rqWC7DeL/39Q==
X-Google-Smtp-Source: ABdhPJwCUilce0/8tW0c9ohPwemzY1n+IrEtWSAWJFZIem+2Gjv+uXnjnEeTIYA0WLTfWRH5AtIxG3VbeXWGCv29y0I=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr20452891lja.200.1609103642973;
 Sun, 27 Dec 2020 13:14:02 -0800 (PST)
MIME-Version: 1.0
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608718963-21818-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 22:13:51 +0100
Message-ID: <CACRpkdbR_caacfiKs4yxwSsdJgtw2AHXrTNeKPVW5EN--yMfVQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] gpio: bd9571mwv: Use the SPDX license identifier
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 23, 2020 at 11:22 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:

> Use the SPDX license identifier instead of a local description.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
