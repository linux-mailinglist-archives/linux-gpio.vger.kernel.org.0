Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94C05BA73F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 09:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiIPHK6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 03:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiIPHKe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 03:10:34 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A70F13F8B
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 00:10:22 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id l14so47374107eja.7
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=w2QwWheEPLVSpXkVNNHXhfxQsdG/BXCUtq+zf7tr0nA=;
        b=DFnnCaOStqk/p+LnFQwBUjIj7b+VTImIJB6Bfgk8mAEzzdQb7T2RHOIv8ed4332svT
         v/SGiMaEocsBtVq1HSSeugiCLqvUn0+UpgMqvKzvG9thLPEYIpHk6iOGqflCT8ttbX3R
         qS4KaS33FsDSc3OS9tnl4ks4nsYQO54Q39zsKiEsAV53KBwGp3/FigIsJ9wpaeIYDfrv
         a+t9U4jajOec7d+vhpIp5wWGp7Q0OFeaez83NmR3k1GNK3L2R6TTozarlL5kWabAwr9w
         2m3QsQm7wiKcQm8tXwQ3WuCBYDq8E+/7Up0BI+qShXdiG4gOA/6kKAs+xBKsidoGTj/d
         kVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=w2QwWheEPLVSpXkVNNHXhfxQsdG/BXCUtq+zf7tr0nA=;
        b=5vBb7RrBMq2lNPU5UrAZb3YTwlY92sivte5yvRRm3rhwL8VDGRZttIhqVDuw+OeHXO
         9Q4LVlEIvESgKv5prPrlMmEHPMCILF1G2yTjYdV4eMElXMRMRyjklLpgefEyyx+1Gn60
         eNwJtisltca3Z+6q5N1RnQEG7BpeNKcJeINIkyE5ZSdrQAqyOLkwzgkeNTNkUGrKzWVE
         /oLqOxSCgASihtBGxS6OTyThL48meeRgrF+3b+4JaaxrtxuanBAQrbh02mE5eYtmNkfv
         xv2hok/bU/UV2LFLQatLhOY4/N7lGAthPeUd+1Rhw86NNo+Tp7mE9A8UgJYv2DDWbt0E
         or+Q==
X-Gm-Message-State: ACrzQf2yuItXF98FLHlhrZq9SrvBs631dwKQNEZ1GNIE9MzCUxv6q85U
        PDBwEZUFcolV6DjGuUs9nttz85LSPlAXgICbBUHQoCb8uJ4=
X-Google-Smtp-Source: AMsMyM44kcL/LhUw3xWduVNk4owqHrBGPzw42yyk9fOGRItmQhfnrTiIajzhDB5wunXxPsXu2rDe8oOLKhrSiJIa5M8=
X-Received: by 2002:a17:907:a0c6:b0:77d:7ad3:d05f with SMTP id
 hw6-20020a170907a0c600b0077d7ad3d05fmr2578605ejc.734.1663312221345; Fri, 16
 Sep 2022 00:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220915084723.19910-1-brgl@bgdev.pl> <YyL4AwaJIO9kim9s@sol> <YyMGHEbFTs02HguJ@sol>
In-Reply-To: <YyMGHEbFTs02HguJ@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Sep 2022 09:10:10 +0200
Message-ID: <CAMRc=Mf1EMeeN5G8Ud-5N63Yf7=4TFN8NbEO6biiubr79712TA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2] bindings: cxx: tests: use the builder
 pattern for the GPIO simulator
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 15, 2022 at 1:01 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Sep 15, 2022 at 06:01:39PM +0800, Kent Gibson wrote:
> > On Thu, Sep 15, 2022 at 10:47:23AM +0200, Bartosz Golaszewski wrote:
> > > In order to make the interface more elegant use the Rust-like builder
> > > pattern for the GPIO simulator class.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > ---
> >
> > > -   ::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
> > > +   auto sim = make_sim()
> > > +           .set_num_lines(8)
> > > +           .set_label("foobar")
> > > +           .build();
> > > +
> >
> > You do this a few times, so perhaps add a helper to create a simple
> > simulator with a given a number of lines?
> >
> > (I called the equivalent in my tests a Simpleton, borrowing LinusW's
> > practice of naming things after yourself.
> > Not that I'm suggesting you use that name.)
>
> Good grief - I meant LinusT.  See what I mean?
>

Yeah, I was going to say that Linus W - being the nicest person ever -
would have never called anyone a Simpleton. :)

And as for the Simpleton itself - I may add it in the future but for
now I think I'll just keep this version - it's brief and clear.

Bart
