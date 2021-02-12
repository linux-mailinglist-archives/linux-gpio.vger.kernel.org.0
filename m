Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54912319B44
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 09:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhBLIdR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 03:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbhBLIdQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 03:33:16 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8D3C06178A
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:32:07 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id z11so4037686lfb.9
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hyslWWiTvci465Koa7xfon0gMi1z5RLHZfOG18JU7cc=;
        b=IRgwFVlCCOQ5uqf/YVamdpdVEzvDmFn3sSw6RdHiXyoh93ZFUgO/deQuaLdeXVgba9
         v+mvA4dVyOelmp/8ceXo8VVjUrpMD/T5xC3EclHjSGECURN1iVHz+lGKWuePZv6CMxRt
         R8oAa5EQOW3TJBl6OELuNfojjK7mBt7opyA4mzxTuC03gfB67lMpYyUwGiz43Q723yng
         sgTDeE1TBC7GbrWhbbY2Q+sdaK0syZD4KXruFTIfnILJhlbrOdYWgaJmEUike8DCt7CB
         T2l/gO9hJn5I1ZRQyRRdB5kI24trbUPjr12wuCmG0TcpZWr7uXVjqkEbcslM6olvjbYK
         boIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hyslWWiTvci465Koa7xfon0gMi1z5RLHZfOG18JU7cc=;
        b=Ab/F+GjSVkBWOfhRE/rjqApZPLcr47neLwEVdZdFfqy54DGUYqIV4qgvM/yc/Tx4ip
         UPMqwo6x6XK0WLZnUE2aBvcAoc3NpIC7hardZUwOoqtWkNpMI3MMrRo08LnJgyrdSr7g
         HkDNWwJNxXigWacFC0UUJrBr0qEva3tvq08gXti3ue5tx+WSc4KJ9XXOYZQosiTOJ1eT
         iZl/Ap+puxk2jEAAeVr8CNSL3Ky7Wm8zIG6UFxIHvnjSWZwTA1V3cggirgJNF9ME0Lbu
         BRhYK3yJFd8Plk2YbIbIt/EE0hvbwxUFNhRoXw2vjtebXCXFE0iO4vva+SllcAfAm9X4
         WLpg==
X-Gm-Message-State: AOAM531Hjskvsl6u06OoReaHVgeuwTbentBMHKBblFZmnUNj2rYTMIvm
        M5Xg4W9qZuu0syB2j0T5V3pdP84aUyhsmeDGPt29/g==
X-Google-Smtp-Source: ABdhPJymP53EmmQdv4O6ZSqB6sTRScfeEAE7CyOPBeEyDkLGYfMldAHByLhb4sQwv+aeMF1tY69nVpNY4ZuChk0BdP4=
X-Received: by 2002:a19:6b06:: with SMTP id d6mr1084443lfa.29.1613118725940;
 Fri, 12 Feb 2021 00:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20210127000303.436595-1-drew@beagleboard.org> <YBubDME90umkF9aQ@atomide.com>
 <20210204074658.GA271881@x1>
In-Reply-To: <20210204074658.GA271881@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 09:31:54 +0100
Message-ID: <CACRpkdaLeO9+=kz2ZwMiPkazuNFmjL-329zoYXnjOo-pGmVHMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: am335x-pocketbeagle: unique gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
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

On Thu, Feb 4, 2021 at 8:47 AM Drew Fustini <drew@beagleboard.org> wrote:
> On Thu, Feb 04, 2021 at 08:58:20AM +0200, Tony Lindgren wrote:
> > * Drew Fustini <drew@beagleboard.org> [210127 02:04]:
> > > Based on linux-gpio discussion [1], it is best practice to make the
> > > gpio-line-names unique. Generic names like "[ethernet]" are replaced
> > > with the name of the unique signal on the AM3358 SoC ball corresponding
> > > to the gpio line. "[NC]" is also renamed to the standard "NC" name to
> > > represent "not connected".
> > >
> > > [1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/
> >
> > So are these needed for v5.12 as fixes, or can these wait until after
> > the merge window for v5.13?
> >
> > Regards,
> >
> > Tony
>
> I suppose it depends on if/when the patches to make gpio lines unique
> go in.  I believe the last response from Linus W. was in mid-December
> and indicated he holding off merging as it was immature [1]

There is no hurry with that plus I hold that patch back indefinately
as it seems. I want to make line names unique for devices not
probing from DT but DT devices, I dunno.

Yours,
Linus Walleij
