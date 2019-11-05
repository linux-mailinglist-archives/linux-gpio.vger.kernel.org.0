Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 654FFEF50A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 06:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfKEFe7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 00:34:59 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41246 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfKEFe6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 00:34:58 -0500
Received: by mail-pg1-f193.google.com with SMTP id l3so13186236pgr.8
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 21:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YAtyN9gS0XmBgI5dhzDRgTUy6cuYsScut6Kcp5MRN9E=;
        b=VYzxKMUW55up/k0aXwTOgSMFgXF+OFc5dSoNufF++PAihtQGxUtxHTlReQ9cmCb8Ih
         1WMLYh9bJCRUKTNmLfh2NAfD8FdvlyItA+G6KwMD6y4B0ISycqH4U/Z7e/lJApGZ3uYm
         aLCIUY4gMt4UzoI1qCVZl9nZyhAjkiaQyBJWA41UpBJrHxbVtZyp8A7sKtjxosh8w4BU
         /7Z1YMFGQ1Mlg2VCInfb4SOtZQDpywaABnHh92NpK+xSkcVNUZ4hS+toX0+AbwGozT8X
         AaeFZwQuS2iLcnx6gPdqvTwcB1n1cJ6qHjT3/+6PA+GV6fiZqXypQTGHMJRzJZLC1/Wc
         vFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YAtyN9gS0XmBgI5dhzDRgTUy6cuYsScut6Kcp5MRN9E=;
        b=DWTiH8Wb+gi5h25Cv3B2QumxPPVdMarMLlf2ECWuTNzZHc0QQpoc6xhEiXWkl3G1un
         hvn8E+YYRM1F92YO5h7cDbC0YxaC+ihkkFzFxIXmncivzzPbkfIdsxovBd66JjDDVMX8
         P+XujqTR+buEnECCUvEUr6MMybex6HH/jFS7tPqRz8DtmFcCD+KpBvItriLl6z4midQJ
         I9yBQ5VLx+CQ0R2gi63VcookXEpD/FKpTix8TLiM67zPoWZalc0gadvXv/mPekoYDZPg
         Ly1QygvqDuMNnokUbBY+ZW89azIMLrYWYzcPRvFGY9e5F1vOdzTpk6iInY/5my7XBVUO
         uoFw==
X-Gm-Message-State: APjAAAVxB/N48NYD8FYd43NYfLI01LS7PmXDD23WDFHV+epfeUoxlcGV
        SPUfJIKGyhIdq5WeoS+r+Bv6mYb20P0=
X-Google-Smtp-Source: APXvYqykLnCS4lLOqJ/SZLa1xBhjOkqMxXh0nFRmbpNwMuJyJlsVCwbX/vZksGML6JvK1SCvRe19GQ==
X-Received: by 2002:a63:381b:: with SMTP id f27mr32516127pga.291.1572932097574;
        Mon, 04 Nov 2019 21:34:57 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id e198sm20297973pfh.83.2019.11.04.21.34.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 21:34:56 -0800 (PST)
Date:   Tue, 5 Nov 2019 13:34:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191105053451.GA32084@sol>
References: <20191104153841.16911-1-warthog618@gmail.com>
 <20191104195838.GA9833@x1>
 <20191105001213.GA3685@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105001213.GA3685@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 08:12:13AM +0800, Kent Gibson wrote:
> On Mon, Nov 04, 2019 at 11:58:38AM -0800, Drew Fustini wrote:
> > On Mon, Nov 04, 2019 at 11:38:34PM +0800, Kent Gibson wrote:
> > > on a Raspberry Pi, in both cases using the feature/pud_set_config 
> > > branch of my Go gpiod library[2], as well as with my feature/pud 
> > > development branch of libgpiod[3].  Patch 7 has only been tested using 
> > > my gpiod library as libgpiod has not yet been updated to support the 
> > > SET_CONFIG ioctl.
> > > 
> > > Patch 1 adds pull-up/pull-down support to line handle requests.
> > > Patch 2 adds pull-up/pull-down support to line event requests.
> > > Patch 3 adds support for disabling bias.
> > > Patch 4 adds support for setting bias on output lines.
> > > Patch 5 adds pull-up/down support to the gpio-mockup for uAPI testing.
> > > Patch 6 refactors the flag validation from linehandle_create.
> > > Patch 7 adds the SET_CONFIG ioctl.
> > 
> > Hi Kent, thanks for continuing pushing this patch series forward.
> > 
> > I've not used gpiomockup before and I was hoping you might be able to share
> > the commands you use to run it to test the patches.
> > 
> 
> I refer you to the libgpiod tests, particularly
> libgpiod/tests/mockup/gpio-mockup.c as well as gpio/gpio-mockup.c
> itself.
> 
> If you run the libgpiod tests they will load and manipulate the module
> themselves.  My gpiod tests do similarly.  I run them in a VM to ensure
> they can't interfere with real hardware by accident.
> 

It occurs to me that you might want to know how to run the Go tests that
I'm refering to when I say I've tested against gpio-mockup using gpiod.
While that is probably obvious for Go developers, it probably isn't 
so obvious for kernel developers.

So here is a quick guide for running the gpiod tests:

1. Install Go[1].

2. Checkout gpiod:
  git clone https://github.com/warthog618/gpiod.git

3. The uapi sub-package contains the tests for the uapi itself so
  cd gpiod/uapi

4. Checkout the appropriate branch - in this case 
  git checkout feature/pud_set_config

5. Build the tests
  go test -c

6. Run the tests (requires modprobe rights hence the sudo)
  sudo ./uapi.test

You can get a list of the tests being run by adding a --test.v
parameter to uapi.test, or run particular tests with 
  uapi.test --test.run [pattern]

The tests themselves are in uapi_test.go, in case you get errors or want
to see what they do.  The gpio-mockup wrapper is in gpiod/mockup.

There are also tests for gpiod itself in gpiod/*_test.go, though 
those focus on the gpiod library rather than the uapi and kernel.

Cheers,
Kent.

[1] https://golang.org/doc/install

