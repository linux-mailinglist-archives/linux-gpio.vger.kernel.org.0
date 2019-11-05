Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8916EF55E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 07:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfKEGG5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 01:06:57 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38657 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfKEGG4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 01:06:56 -0500
Received: by mail-pf1-f196.google.com with SMTP id c13so14342680pfp.5
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 22:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=NE23qJQJ5NK4cF2goz+qk8PtMYKv58p4q/UOiEKdFkA=;
        b=DBaGMWa0KWRtkgKxGocAvhiKgGdI3BT9sPd/UyuYgFT5cxcXL/J3NHPApU9MYzlVWR
         g2Wt7oGHFo9Z4yctdbHlrd9BbdXcefuhOT00+bWfdG4x8HerF9JJZk0XM2z3pVoHgEPr
         WAD6pMhUZOSAENcFQE+NIIe9gwATf4y9tqzh8ayd/RYpETOVxFOEPeS5McE5n+PRm8rk
         xR0bQ9RnfHIRMtZ5GRyu0h1ktonokOFwG12ixwM7bEtwXc3TJyKbGJnejS37wLasGA0c
         3xb1lO+wcXKmhABHQKerE2/pv5Cx8qtP5ZVL2DoBbmW+M68goFPVfeF55rqIwpbzoE57
         Sr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=NE23qJQJ5NK4cF2goz+qk8PtMYKv58p4q/UOiEKdFkA=;
        b=N8W57x+WJy9WRcpUXHYdOLwvE2VgEN7tMira9up77VXZyqe9LcFichTsrpL108RtQp
         TcTTAIU8QS9wugdxmfifqt6qLeE/03+HSX2+ygJEqIjsjJAw7fIdGPVHGVnH3xDQsaLI
         DeMyIC96UoiQcaKVrkEJbrv+uAZOjziDEjlbyZoP/98JqsU+ReGu+RwqNXSFDXq/DXZE
         /rZjURPu+UE6hJTDSHd0C5vmsqLNy0vVOl+FNjpl+/jmX3xPqmVH4coHsUTmjloCxyRo
         EMY/2GvSswHgxyynKD383WoP8vR+3aAtNVMHdTc82DoeZ3YOoqWjWNjrrujPj0fua91V
         YTHA==
X-Gm-Message-State: APjAAAUc06rv3/znac3F3RGwwCpZxyTBl+ZuTjOMmIE/71ifhgIX0GiD
        QRlUUzGWSTOC1JAY86ZrYlM=
X-Google-Smtp-Source: APXvYqwhi6eIE+wRrtU1iUuxp3rBK2QgfAntY1LfrHGzUdIcm7W/UBgLPqiFn12ehtIvD4XT194w1g==
X-Received: by 2002:a63:5f44:: with SMTP id t65mr26854334pgb.124.1572934015743;
        Mon, 04 Nov 2019 22:06:55 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b21sm16158822pfd.74.2019.11.04.22.06.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 22:06:55 -0800 (PST)
Date:   Tue, 5 Nov 2019 14:06:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 4/7] gpiolib: add support for biasing output lines
Message-ID: <20191105060649.GA1302@sol>
References: <20191104153841.16911-1-warthog618@gmail.com>
 <20191104153841.16911-5-warthog618@gmail.com>
 <CAMpxmJUExXZ=ptMyRczvdujc7x9JP62Zy9m+WByYD4=w=1180w@mail.gmail.com>
 <20191104155927.GA17106@sol>
 <CAMpxmJUTFb_Bxsc8e006ohP6D3PP+kQgFYAPoZA2T1-HA41vSA@mail.gmail.com>
 <20191105020342.GA16739@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191105020342.GA16739@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 10:03:42AM +0800, Kent Gibson wrote:
> On Mon, Nov 04, 2019 at 05:19:14PM +0100, Bartosz Golaszewski wrote:
> > pon., 4 lis 2019 o 16:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> > >
> > > > Ugh, I missed one thing here - my for-next branch doesn't contain the
> > > > following commit e735244e2cf0 ("gpiolib: don't clear FLAG_IS_OUT when
> > > > emulating open-drain/open-source") which happens to modify this
> > > > function.
> > > >
> > > > If I provided you with a branch containing it - would it be a lot of
> > > > effort on your part to rebase it on top of it? If so - I can do it
> > > > myself.
> > > >
> > >
> > > I can do a rebase - though not until tomorrow (it is getting late here).
> > > I would like that commit in as well - I suspect it being missing is
> > > the reason a couple of the gpiod tests I was working on are failing.
> > > I was in the process of tracking that down when I switched back to this.
> > >
> > > Cheers,
> > > Kent.
> > >
> > >
> > 
> > No problem, it can wait until tomorrow. Please use the following
> > branch - gpio/for-kent - from my tree.
> > 
> 
> That was a lot simpler than I expected - it rebased cleanly onto the 
> new branch.  And fixed the gpiod test errors I was trying to track down.
> Will submit v6 shortly.
> 

Maybe I'm missing something, but given that the rebase was clean, was 
there actually any need for v6?
i.e. anyone can rebase the v5 patch onto gpio/for-kent:

$ git checkout -b pud_rebase brgl/gpio/for-next
Branch 'pud_rebase' set up to track remote branch 'gpio/for-next' from 'brgl'.
Switched to a new branch 'pud_rebase'
$ git am PATCH-v5-0-7-gpio-expose-line-bias-flags-to-userspace.mbox
Applying: gpio: expose pull-up/pull-down line flags to userspace
Applying: gpiolib: add support for pull up/down to lineevent_create
Applying: gpiolib: add support for disabling line bias
Applying: gpiolib: add support for biasing output lines
Applying: gpio: mockup: add set_config to support pull up/down
Applying: gpiolib: move validation of line handle flags into helper function
Applying: gpio: add new SET_CONFIG ioctl() to gpio chardev
$ git rebase brgl/gpio/for-kent
First, rewinding head to replay your work on top of it...
Applying: gpio: expose pull-up/pull-down line flags to userspace
Applying: gpiolib: add support for pull up/down to lineevent_create
Applying: gpiolib: add support for disabling line bias
Applying: gpiolib: add support for biasing output lines
Using index info to reconstruct a base tree...
M	drivers/gpio/gpiolib.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpio/gpiolib.c
Applying: gpio: mockup: add set_config to support pull up/down
Applying: gpiolib: move validation of line handle flags into helper function
Applying: gpio: add new SET_CONFIG ioctl() to gpio chardev

Or was it more about eyeballing and retesting the rebase in case the
3-way merge went haywire?

Cheers,
Kent.
