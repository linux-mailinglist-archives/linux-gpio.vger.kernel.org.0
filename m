Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF84399477
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 22:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhFBUWZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 16:22:25 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:46778 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhFBUWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 16:22:25 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:68a0:2d8c:2cf4:22fa] (unknown [IPv6:2a02:a03f:eafb:ee01:68a0:2d8c:2cf4:22fa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 313C1207BA9;
        Wed,  2 Jun 2021 22:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622665240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tjgQPo7D7vHxtzbIkH7YF4pVykSHzufmavp+/FcwEII=;
        b=nvd6aqtAkg4TpRt+facH2rIhRRt8yF46Fa5K11EgCOqFAsocKQxIyseplf6vbpg9qWzxvB
        bGp5ppiR2Yn6DDhldI7ufYe9PuxDoS92XgS7DNjdFG4C1vPbZHHUEMaCYDr5mtvkCYBO9y
        gm46UnmTuz269jgGe16tBvlN3e5/NkTuGuoxUm35AlNnVFIVNUXDne4YOLplyJzudEZf65
        /jPoUr/q73Z+hIRAXydqd6Tp5bgRo3XeqecnvlLXNj2ETJj5MLAh/DjrspDl5PoZPUBWmz
        vHvEY13gqNrfFfHBpBotDVc+1nvGTOB7Jpa9rCfPA51tE7prZgWHSNikpcj8QA==
Message-ID: <3d0c69e746fba43267fed0f32dd660ddb405782c.camel@svanheule.net>
Subject: Re: [PATCH 0/5] RTL8231 GPIO expander support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>
Cc:     Hans de Goede <hdegoede@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 02 Jun 2021 22:20:38 +0200
In-Reply-To: <CAHp75VdaPS0YPvNHVgeDOuz=9ACn7okHxhyNEZuyQR8=kSdNdg@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
         <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
         <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
         <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc>
         <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
         <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
         <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
         <c7239e0cbbc9748925410937a914bd8a@walle.cc>
         <7a9978881e9ec5d4b811fa6e5d355fb6bce6f6d8.camel@svanheule.net>
         <0047200eecbd7ee480258cc904d6b7ee@walle.cc>
         <CAHp75VfOrUBRQH1vrXEwHN4ZPojQfQju-_wp_3djZeozEaatug@mail.gmail.com>
         <272ac6af4a5ba5df4bb085617c9267e5ece61c19.camel@svanheule.net>
         <CAHp75Vcb95HiYxvEzYr0QXcQmA_A+2M9M0uv6PAhPHtgTges8g@mail.gmail.com>
         <8df77f619730b9e7b5cdd7ddefb60a03@walle.cc>
         <CAHp75VdaPS0YPvNHVgeDOuz=9ACn7okHxhyNEZuyQR8=kSdNdg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Tue, 2021-06-01 at 18:24 +0300, Andy Shevchenko wrote:
> On Tue, Jun 1, 2021 at 2:49 PM Michael Walle <michael@walle.cc> wrote:
> > Am 2021-05-31 17:48, schrieb Andy Shevchenko:
> > > On Mon, May 31, 2021 at 6:33 PM Sander Vanheule <sander@svanheule.net>
> > > wrote:
> > > > On Mon, 2021-05-31 at 14:16 +0300, Andy Shevchenko wrote:
> > > > > On Monday, May 31, 2021, Michael Walle <michael@walle.cc> wrote:
> > > > > > Am 2021-05-31 10:36, schrieb Sander Vanheule:
> > > 
> > > > Am I missing something here? It seems to me like the regmap interface
> > > > can't
> > > > really accommodate what's required, unless maybe the rtl8231 regmap
> > > > users
> > > > perform some manual locking. This all seems terribly complicated
> > > > compared to
> > > > using an internal output-value cache inside regmap-gpio.
> > > 
> > > Have you had a chance to look into the PCA953x driver?
> > > Sounds to me that you are missing the APIs that regmap provides.
> > 
> > What would that be? The register cache? We need to cache the
> > value somehow, because (still assuming it is write only) we cannot
> > read it back. Thus the read of the RMW, would need get the
> > value from the cache. Thus the user of gpio-regmap would need
> > to make sure, to (a) use a cache for the regmap supplied to
> > gpio-regmap and (b) populate its initial values correctly. Is
> > that what you are suggesting? And hopefully, no other user
> > of the regmap will call regcache_mark_dirty() or something
> > like that.
> > 
> > I had a quick look at the PCA953x driver but it all its
> > registers are readable according to the comment on the top
> > of the file.
> 
> Since regmap doesn't have a facility to support the registers _at the
> same offset_ with different meaning (depending on data direction), the
> only way to handle this (without redesign regmap internals) is to add
> specific "pages" via additional bits in the address space. So, let's
> say 0 = RW, 1 = RO, 2 = WO. In this case see the following offset
> mapping of the hypothetical hardware registers:
> 
> REG1 (RW)   0x00 -> 0x000
> REG2 (RW)   0x04 -> 0x004
> REG3 (RO)   0x08 -> 0x108
> REG3 (RW)   0x08 -> 0x208
> 
> Then these bits should be masked out. Something similar is done in the
> PCA953x driver for extended addresses and autoincrement.
> 
> This is what I propose to look at as the starter.

Thank you for clarifying. Essentialy this is then the same solution as an extra
cache in gpio-regmap for the output values, except the cacheing is handled by
the regmap layer.

I think this was the last issue standing, so after I implement this, I'll spin a
v4.

Best,
Sander

