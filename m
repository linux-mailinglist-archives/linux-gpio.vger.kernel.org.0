Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B429307571
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 13:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhA1MCw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 07:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhA1MBx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 07:01:53 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A784AC061756
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2021 04:01:12 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id e18so5963744lja.12
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2021 04:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n9EOKkeTY2+d1Fa4iHB/4cHa37Z0fzFo4OzOK4oM6Q4=;
        b=F/CmSMOuSr5zNpyIz8oDpfs0uxO2NhcU5b2INzxjrItESHLsnvvNX/yf1410eKA9ve
         VQpoXLUK241FEkj9ofwBDSWNFjyOlJ1/B0w503sD1RjI/Sv8Mpy9AuKTl4v9unPAbVpt
         o2NhCHR1kO8BzF2uLKVtJlY/eb6hmEA6dxkoKIZIDA//svyJxEpWliH0+/KoPRpX6yuQ
         xOaOhiqgJROQ4qzL4Ai4Vu8QEK7vHTmjcR+D0QSzio07rhzy0JmaMHDNZNHoYvUzzBdq
         PIk0qSMqBACkwRrT1oeqoueNhsZKSRQyiROFe5pXaQq2lZ0IVc3HI0/lPCj4ym1EPKe0
         BuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n9EOKkeTY2+d1Fa4iHB/4cHa37Z0fzFo4OzOK4oM6Q4=;
        b=bijnltesNfaVtHtpqOlxRNuHJKppn1FvsH2mTALAnialm20iI8UhUyKj3J/deQS4dh
         HkUkl05XQbB4v47gRSViqUwUCYr2hAiPR7h/Rxf1ddfymNbXLUR3Cj71K2ef+HXDiDl6
         Vsbz3wzxzvy0dNvrOePLg3hE75r7zWLwFomd9UDUg8HubeS9GfeDW7vWE/RXGyHTuIJe
         kw5FL/v7H0scWHJpK31fu6riXgA7yzBglYFtAJaZAuqn3e8baDX9pQ6YC59aXaeDQp5D
         NvTT0ACRtmtmCkKCENprxVS0IvkBhP+48suSxvN3/jA9nV9KYRqwQuBu/kQPx1EXdJpG
         AIsQ==
X-Gm-Message-State: AOAM532ZFNnAPyvkZDnZqLJxfpIfOLckv8h8us4R9S0l2/DznIBU4hfu
        +ybPU6oTPd7MwTQaVKxzCPKrI3zqZXHODJypKTiTSg==
X-Google-Smtp-Source: ABdhPJypbRkZO7oNmfkvuCEOFNhZkoDt3uSClsJKrU2bBbdo1JdlUWBieGzbeMl4eG6ef0bI+oE4Ri5xIQqzgGc6PuE=
X-Received: by 2002:a2e:8ec3:: with SMTP id e3mr7938969ljl.467.1611835271030;
 Thu, 28 Jan 2021 04:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20210127000303.436595-1-drew@beagleboard.org>
In-Reply-To: <20210127000303.436595-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Jan 2021 13:01:00 +0100
Message-ID: <CACRpkdam4gY3iU1DBtczgdnxQ-t0OkrRMZ-Y9e1W0FQOrYnndw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: am335x-pocketbeagle: unique gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 1:04 AM Drew Fustini <drew@beagleboard.org> wrote:

> Based on linux-gpio discussion [1], it is best practice to make the
> gpio-line-names unique. Generic names like "[ethernet]" are replaced
> with the name of the unique signal on the AM3358 SoC ball corresponding
> to the gpio line. "[NC]" is also renamed to the standard "NC" name to
> represent "not connected".
>
> [1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

This certainly looks better!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
