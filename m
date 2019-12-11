Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7832011A718
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfLKJ3c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:29:32 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37950 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbfLKJ32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:29:28 -0500
Received: by mail-pf1-f195.google.com with SMTP id x185so1520391pfc.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pBUfK/Gfy8GSSSi2c/5xoyMI0JFkHyIWPlFy3Th0EN0=;
        b=eERC+yexJ3T4TmQGp6qAsmLhHS4VN3w91Ek9g+Lf0ZPNc3sp2SkJekKRCg2JXraV5h
         Ki31BrUeAz2X801pbBvV9SBfBjTdiZ/rKzKO+QdjZMmwtSW7pYY7c1FgU2wLdjHl3YSe
         cyTFa8beFtDVEYz8gAYS0mz1eJWG3PNnMMzsDDt6yjVwcva7NpDxhuQRGS4bJJjk8ENP
         bnxqt8I8eqPMBokaNAyfId7IiailZ6QdXGc+x/qFyiNBSH0eDG1KiRD+HAIR5oXZZpl2
         BD92EXx6KxHhm2c01hw+X08fiRaxnCHzZTlu1w33g46y5ehG0NFpAv04n1chMCNzx1Gy
         +QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pBUfK/Gfy8GSSSi2c/5xoyMI0JFkHyIWPlFy3Th0EN0=;
        b=Dtc1liso6Fm64Wzeu+fCFyly66zSZSkBUrzYs/ctltBvsp8w+ikxXKxb2wVaPsXQsG
         QRDAGXZURTegUaT7VJ1Czha13MPO3SwZMO8Q2fLHyMlecwnq4xDnobwJESH8KWoJkvFm
         pnM3pworZlBNK0B81m+P4QpmB/p51E9mhQbJseD985kGxJSw90zQWKX2aRRZDCmu16oL
         +BGW9di9pubQaUIHDKx38wsIMvohOLB8uBBD/YbgVeSFoGb1+UT0U7RGKNHcY4ZYY/Ov
         Mi4Y1xTjUK7waRlRJGKeAFFedf9JjN4odLJZX/4Q0N3SbIVOSUh6dyL0wboaKCQ2k8Ox
         ipdA==
X-Gm-Message-State: APjAAAWF1h23EQ+px71aYXCG1mv87pc3VAuaKt0b8WGsaA6ekB3GIyOh
        M8L3SmLrYL0/MUKybQElzuc=
X-Google-Smtp-Source: APXvYqxME4CgApxD9MtdaEpSMJGCCF1ix10OXWonF5ARyP82sNgi+NCb+D2cP+8OMEmpjGsL6PDIkQ==
X-Received: by 2002:a62:6001:: with SMTP id u1mr2725270pfb.158.1576056567626;
        Wed, 11 Dec 2019 01:29:27 -0800 (PST)
Received: from sol (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id c8sm2135135pfj.106.2019.12.11.01.29.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 01:29:26 -0800 (PST)
Date:   Wed, 11 Dec 2019 17:29:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible
 mode
Message-ID: <20191211092921.GA21730@sol>
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
 <20191210143902.GA3509@sol>
 <20191210165548.GY32742@smile.fi.intel.com>
 <CAMpxmJVMW=3k2odB9UKEzeopZ0q7T48Cux6ux=1j72Hv5A4yOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVMW=3k2odB9UKEzeopZ0q7T48Cux6ux=1j72Hv5A4yOQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 10:18:39AM +0100, Bartosz Golaszewski wrote:
> wt., 10 gru 2019 o 17:55 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> >
> > > For Go the structs are aligned based on the size of their components so
> > > that arrays of struct are naturally aligned.  The struct is given a
> > > hidden trailing pad so that a subsequent struct will be correctly aligned.
> > > The sizeof the struct includes this hidden pad.
> > > I'm pretty sure the same is true for gcc.
> > >
> > > The gpioevent_data contains a __u64 which causes the whole struct to be
> > > 64 bit aligned on 64 bit, so it actually looks like this internally:
> > >
> > > struct gpioevent_data {
> > >       __u64 timestamp;
> > >       __u32 id;
> > >     __u32 pad; // hidden
> > > };
> > >
> > > so 16 bytes.
> > >
> > > On 32 bit the struct is 32 bit aligned and the trailing pad is missing,
> > > so 12 bytes. This causes grief for the read due to the size mismatch.
> >
> > Exactly.
> >
> > > (I'm sorry to say I had to add the pad to my Go gpiod library to get it
> > > to read event data - but forgot to go back later and work out why -
> > > until now :-()
> > >
> > > Your new info change struct has the same problem, as it also contains a
> > > __u64 and ends up with an odd number of __u32s, so gets a trailing pad
> > > on 64 bit.  Using __packed seems to inhibit the trailing pad.
> > > Or you could explicitly add the pad so the struct will be 64bit aligned
> > > even on 32bit.
> >
> > I spoke to colleague of mine and has been told that best option is to fill all
> > gaps explicitly to have all members in the struct + 8 bytes alignment at the
> > end (also with explicit member).
> >
> > > Neither of those options are available for the
> > > gpioevent_data, as that would break the ABI.
> >
> > ABI needs v2 actually.
> >
> 
> I finally sat down to integrate this with my series and figured that
> this can't go on top of it. It's a bug-fix actually and maybe even
> stable material.
> 
> On the other hand - if we have so few users of GPIO chardev with
> 32-bit user-space and 64-bit kernel - maybe we should just bite the
> bullet, not fix this one, deprecate it and introduce a proper v2 of
> the API?
> 

Fixing it in API v2 makes the most sense to me.

Kent.
