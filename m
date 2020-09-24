Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C2C2768ED
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 08:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgIXGbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 02:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgIXGbQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 02:31:16 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A563C0613CE;
        Wed, 23 Sep 2020 23:31:16 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id t16so2192999edw.7;
        Wed, 23 Sep 2020 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QTmPmjYa+syi4ESVUT2wwxmt6hYQRm3uAcrXir/7zYk=;
        b=qwfhLIUiIHVrSAP6BJectQna1rSJx0tgqRY9dNtOQ3Gi57V1GtKVs/pr3siZAEbh1U
         ay7tAX5GE2ZzYGN0/OSMiDZTe12SFl6m23MaWxNB9NW2kz2usTKFMxL0ZhRxCxGJ6ZMC
         aZTw8t1Z5WGWLaCmbVReLfLx2tO/iQWJ2Smxk1608WhQOAN/WiUMJ2kg2WkyVwbWEs92
         clMxJ1KT3BLjMYF0xEQWXhJIqNk8BXZ8ngxuXt1DDMhB/YvAE3hpu012XKr+81Qh7L24
         LhzMXdphrD4rmt9K2CdaSFAT+93BeIShtylit8uUnqXSST6jWN8Aan1X63GcjnedhYHs
         2HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QTmPmjYa+syi4ESVUT2wwxmt6hYQRm3uAcrXir/7zYk=;
        b=lapxVjFAF4KBNBunZTvggCoah/uVQa9ZNslHWrXnevyFoNzUqzMB8G2rRcSwwnGFBh
         LTmtHm8aRQNVbVcnhryJ7qlko6oN5X7wwUcDHPqGhr0+h1UhQwCnh06nWGDgWRUeXvv+
         oC0VFofOO5JskNTu3yY2fBOrZBSYq2KPehmj4q3pQ5cn+Ps15hBWzxK+t1LJIo7NWFkN
         nlgnRQ9mG+EirERu78WKRGPU8NN7xM/h9HBJtJQ03nMpr0plAoJy0+RM87WhhssDcRZb
         jtijbUdX3HB6zMGJD/LjnbI9cAZpCEqMHTW5OMpd6zZF2O7OYQEwVt6lWxYU+uvmEOtF
         vQyw==
X-Gm-Message-State: AOAM530SPMeHAxqbcqyUAAUEnnrMAyAjShAT04zCsNDT0EJMyb1+331a
        Kv0XOsKAx/AllX1wVAxnVXdqZzECQFPk1q7GssI=
X-Google-Smtp-Source: ABdhPJyUzmiyhcA9o4DsIrOpx+Q3dDdZNr0DSGE+0GuRP7GB8R7TMGkotLUXvMOUipRhFLz8Kx176y/0O5Amc3+uTCI=
X-Received: by 2002:a50:84e8:: with SMTP id 95mr2918850edq.99.1600929074865;
 Wed, 23 Sep 2020 23:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200914104352.2165818-1-drew@beagleboard.org>
 <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
 <20200917092004.GA2468349@x1> <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
 <20200917103942.GA2477958@x1> <20200923065755.GR7101@atomide.com>
 <CA+7tXigeNhQQVuAu0toZrvBKvMYkDU-8EWTpJR29HLTAMgoOBA@mail.gmail.com>
 <20200924054324.GB9471@atomide.com> <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
 <20200924060645.GD9471@atomide.com>
In-Reply-To: <20200924060645.GD9471@atomide.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Wed, 23 Sep 2020 23:31:04 -0700
Message-ID: <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 11:06 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Trent Piepho <tpiepho@gmail.com> [200924 05:49]:
> > On Wed, Sep 23, 2020 at 10:43 PM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Trent Piepho <tpiepho@gmail.com> [200924 01:34]:
> > > > On Tue, Sep 22, 2020 at 11:57 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > >
> > > > > Also FYI, folks have also complained for a long time that the pinctrl-single
> > > > > binding mixes mux and conf values while they should be handled separately.
> > > > >
> > > >
> > > > Instead of combining two fields when the dts is generated they are now
> > > > combined when the pinctrl-single driver reads the dts.  Other than
> > > > this detail, the result is the same.  The board dts source is the
> > > > same.  The value programmed into the pinctrl register is the same.
> > > > There is no mechanism currently that can alter that value in any way.
> > > >
> > > > What does combining them later allow that is not possible now?
> > >
> > > It now allows further driver changes to manage conf and mux separately :)
> >
> > The pinctrl-single driver?  How will that work with boards that are
> > not am335x and don't use conf and mux fields in the same manner as
> > am335x?
>
> For those cases we still have #pinctrl-cells = <1>.

If pincntrl-single is going to be am335x specific, then shouldn't it
be a different compatible string?

Are the driver changes something that can be not be done with the
pinconf-single properties?  They all include a mask.
