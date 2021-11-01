Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20EC4420C1
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 20:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbhKATZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 15:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbhKATZv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 15:25:51 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8373C061714;
        Mon,  1 Nov 2021 12:23:17 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id t11so12661929ljh.6;
        Mon, 01 Nov 2021 12:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D2lApqNHzsz7xil/t1thYPGHgz5hJH6hdTcmgav0Z2Y=;
        b=ZMDQ4KU4Ztk1q1EzVP1gpUttPH/NBeKhQO43kzd4eiY78Wp4UTGd3kFtf0+1sJEh7Y
         azAuOUO1lznnOs0dgiEDXQLEbyoUVIOX9U6kjCQgwfbW+6svpUNTBljwOIm7gOz6RyvA
         jzzRiXfJ6ELz5CZjGbsyItQYnsCygdK9u7WUcE2gAi11fu9iTCPJYhJGlaocZKImm/hD
         KDYLPWfRp3ZeFNE6JD9kovT37PzyGlL1m4kGFIRBmMG7BOqfRvRUBpHwHZNx5XmSDTvf
         Coa5GJrLiW8eprTCedMjriyXLdLSHQjofyVNRqZrCjvleQ/KTQYpZXFv3I+m/MGS/VK4
         cAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D2lApqNHzsz7xil/t1thYPGHgz5hJH6hdTcmgav0Z2Y=;
        b=3hneM6yQX13xOo+rfD16pYwnozyhcjLed9bTikMtOvDzBAoWP37P7KtG2Hxzejzq8o
         5zxIOtwsTUiRlCbCvSLS8hJ2J9ARYvS3iD60XI0MBsnEj2G1J6Jv4yKufm5X1e+OWfBb
         ecLDkMjPELaEAbgD3BA9kVuKI8zcEvSjOob03x7J+XCrZjgSzLqXgczZNImZPrLwfKg3
         SOyGAMT3Lj4cmGuvajHTqJMQLtEEbRW22EIpZFCCOG25i2DID7jSzfXriGMMmEK3T9zN
         Dm0HxVqE04tH63HKc/HXRqlZlBe7q/uoWB6l739u/DJCG5VziEAaeR+q67iS8EEI+kAo
         MoCA==
X-Gm-Message-State: AOAM530N0Br2QSuO+rOIoppD/tr485HuEHBAMkYJI9UsA5RCj32JR9g/
        mflM9kJafJGv5mrxW26PE6XkZq25fnbPi775K2k=
X-Google-Smtp-Source: ABdhPJxwFl1xhc28ZpQsiTutYAPoyUnYHYNNbyek8wLOpzupjilR01u0JLrLrTAshIIND9/MmUZuP6qreXhSnH2EBMY=
X-Received: by 2002:a2e:9496:: with SMTP id c22mr3412967ljh.407.1635794596270;
 Mon, 01 Nov 2021 12:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211026175815.52703-1-joey.gouly@arm.com> <20211026175815.52703-5-joey.gouly@arm.com>
 <CAHp75Vc8-sZX-aMtR9o5_=_X0y6ALYCXR2W3Y4389=xD7c__nw@mail.gmail.com> <20211101175326.GA14846@e124191.cambridge.arm.com>
In-Reply-To: <20211101175326.GA14846@e124191.cambridge.arm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 21:22:26 +0200
Message-ID: <CAHp75VfpCnvAj_5J+5N+9qtVZdEQe-+TVSKaVKTcJhFqqGOUZw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 1, 2021 at 7:53 PM Joey Gouly <joey.gouly@arm.com> wrote:
> On Sun, Oct 31, 2021 at 03:39:01PM +0200, Andy Shevchenko wrote:
> > On Wed, Oct 27, 2021 at 5:28 AM Joey Gouly <joey.gouly@arm.com> wrote:

...

> > > +       ret = of_property_count_u32_elems(node, "pinmux");
> > > +       if (ret <= 0) {
> > > +               dev_err(pctl->dev,
> > > +                       "missing or empty pinmux property in node %pOFn.\n",
> > > +                       node);
> > > +               return ret;

if (ret == 0)
 dev_err();
 return 0;

> > This is incorrect. It always happens when somebody is in hurry :-)
> I don't understand which bit you are saying is incorrect here, can you expand on your comment?

See above.

-- 
With Best Regards,
Andy Shevchenko
