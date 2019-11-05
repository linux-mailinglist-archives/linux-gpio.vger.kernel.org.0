Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA64F0A1B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 00:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfKEXPk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 18:15:40 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41436 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbfKEXPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 18:15:40 -0500
Received: by mail-pf1-f194.google.com with SMTP id p26so17235304pfq.8
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 15:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0h6rEZMh2NXaLoZit/uCxUIDMY8FcqjXSLN71K4BEGE=;
        b=I+Ygx7cD47k6b886Po63OT607wSIfakM21+SUXdLrXExrJSaHkUabGFR8flw64i8yD
         kOaQS4WYhx26uB7Qxcn0UPxtOjsfzi1RjvUIMTVbJEO5FsLA3eLeBifc3Fg+wW7ta3N/
         qqbESH8Y6mbyqfWA2u8+NhnG+g9GlefRZjgZ1uwR6xYS43TaW3DUK8rJx39j5sFwB0EH
         egKq5UOXwXdN1KjY2It0hPc856p/4/sh77QZ+dCkPjchkWvauCmlRIAzCQVLVLcK1kev
         QjPrIQcIS078cy91toD3zybXYlF9SY5v1f+NJ/ZY146tEPIWKOGIo7PsEyOLdzOhnmO7
         8CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0h6rEZMh2NXaLoZit/uCxUIDMY8FcqjXSLN71K4BEGE=;
        b=LTbjBfGLCqLFufI9tDgabVkfzStEv8w9W0BLSdeZ3/u62WCAHgvQNZSoZn7YJmd8Zl
         gqKbbbTYkhj0L9gFt/9nLsBKkXLsgCE446U61rQ4ZAfn0Uzl2P6OZuun8bbxABLwiEHO
         Gi5mhvDtLX1jJBlvxwWPX0icSsqwfiBJl0veDinDsUpbwJgiEJFGYAbg2NcawA3SAHQ/
         ELusH4x5shaSWKqOfAbDAhQKNEk+Jhe6la/UbosGFrDm8NFgczXCs2mJArwQT3HZyg7I
         U+t3qNWLdMem9SGB+68CfXU4Yfim/Pv3+KI1QJUZrnm1JRdf21hERB6KDF7SWvPPdlp3
         Kb5Q==
X-Gm-Message-State: APjAAAWGpC82ZEDwGAQgHZpOiixo5tJTejtubSWPi/6ECdi1oDN+G+ww
        ltMYQdjqd1TLa4bM3Fqmo+s=
X-Google-Smtp-Source: APXvYqzTpX6CVc8SWysvy5Z9WpN1MwqbsuRMJ9aIOKk9pGAHlq5RDGHSo/8uDr1lxHCA4FuorYGLBw==
X-Received: by 2002:a63:9d0f:: with SMTP id i15mr39967062pgd.286.1572995739234;
        Tue, 05 Nov 2019 15:15:39 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id h8sm1090783pjp.1.2019.11.05.15.15.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 15:15:38 -0800 (PST)
Date:   Wed, 6 Nov 2019 07:15:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191105231533.GA3478@sol>
References: <20191105020429.18942-1-warthog618@gmail.com>
 <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 05:24:44PM +0100, Bartosz Golaszewski wrote:
> wt., 5 lis 2019 o 16:26 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Tue, Nov 05, 2019 at 10:04:22AM +0800, Kent Gibson wrote:
> > > Patches are against Bart's gpio/for-kent branch[1].
> > >
> > > The patch has been successfully tested against gpio-mockup, and
> > > on a Raspberry Pi, in both cases using the feature/pud_set_config
> > > branch of my Go gpiod library[2], as well as with my feature/pud
> > > development branch of libgpiod[3].  Patch 7 has only been tested using
> > > my gpiod library as libgpiod has not yet been updated to support the
> > > SET_CONFIG ioctl.
> > >
> >
> > I've just pushed a first pass at SET_CONFIG support into my libgpiod
> > feature/pud branch.  It is causing me a bit of grief.  Due to the way
> > the libgpiod API is structured, with the direction flags pulled out into
> > the request type, I thought it would be cleaner to keep changes to direction
> > orthogonal to changes to the other handle flags.
> >
> 
> I'd love to see that branch - is it public?
> 

Sorry - I forgot to add the references to the bottom of the cover note
for v5 and v6.
It should've been:

[1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
[2] https://github.com/warthog618/gpiod.git
[3] https://github.com/warthog618/libgpiod.git

It is my libgpiod repo on github[3] - in the feature/pud branch.

Cheers,
Kent.

