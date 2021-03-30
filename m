Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262C734E02E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 06:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhC3Ecs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 00:32:48 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:41923 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhC3Ecl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 00:32:41 -0400
Received: by mail-lf1-f53.google.com with SMTP id b14so21717018lfv.8;
        Mon, 29 Mar 2021 21:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=RNVWpTsR1EU4/n7h7Ur5fWeNrn3CLUmS+LFxH0dWKP0=;
        b=BcM9Fq9A8h7WhasyuuU1qHBn1sC+hkVdTbakXCd0SdB3gUq08l75adu1zut/vPTU17
         CrgYgsf0L68R/yA4c8g0BDgfp/e8zEG1pBvNA8Ym/nNkvryTUswjB7RjnUpZnwvZAtLi
         6qsSEaH1fOG1tmVua1le8JvZIUNifcI8wleqUvtMK0e4lR+DhSHzoBtzbteprxpdAzoH
         IXdWr6wjieY31oztUt2cb54KdmddtiHmXp7Evoa/u+A59NElarI4m/TDfTUZok02ugRr
         iHaYVlHlT3qdxZdZwEEFy0J6XGq+hhg5ZpRYV2qX7DyfYUoNZkkZMsg+iT7SVqKazjAm
         ymJg==
X-Gm-Message-State: AOAM532nuU7EwcczOUR2MKyk8dMjgmZqZyFGfiRhG0/OAJJmyqAW1fl7
        m/HSsc58jlA4YhhI1VxsHEY=
X-Google-Smtp-Source: ABdhPJxv09qQWoRgXLBttaTMtsa808i7c1tUSkRC6nXhlDV/KiDJ/fbxRUsHTYen7LhDM1jjY4YKaA==
X-Received: by 2002:a05:6512:714:: with SMTP id b20mr17536838lfs.370.1617078760349;
        Mon, 29 Mar 2021 21:32:40 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id g24sm2029548lfv.257.2021.03.29.21.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 21:32:39 -0700 (PDT)
Message-ID: <92243c7b428d2025c1a9f3beb8db46995c9376d0.camel@fi.rohmeurope.com>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from
 config
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Joe Perches <joe@perches.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <YGHWZuNfbSDe+B6y@smile.fi.intel.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
         <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
         <bf12f668db2f0dce7dfc09351780e295da30714c.camel@fi.rohmeurope.com>
         <YGHWZuNfbSDe+B6y@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Tue, 30 Mar 2021 07:32:33 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Morning Folks,

On Mon, 2021-03-29 at 16:30 +0300, Andy Shevchenko wrote:
> On Mon, Mar 29, 2021 at 03:20:07PM +0300, Matti Vaittinen wrote:
> > On Mon, 2021-03-29 at 14:59 +0300, Andy Shevchenko wrote:
> > > On Mon, Mar 29, 2021 at 2:43 PM Matti Vaittinen
> > > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > > The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.
> > > > > WARNING: ENOTSUPP is not a SUSV4 error code, prefer
> > > > > EOPNOTSUPP
> > > > 
> > > > Make the gpiolib allow drivers to return both so driver
> > > > developers
> > > > can avoid one of the checkpatch complaints.
> > > 
> > > Internally we are fine to use the ENOTSUPP.
> > > Checkpatch false positives there.
> > 
> > I agree. OTOH, the checkpatch check makes sense to user-visible
> > stuff.
> > Yet, the checkpatch has hard time guessing what is user-visible -
> > so it
> > probably is easiest to nag about all ENOTSUPP uses as it does now.
> > 
> > > I doubt we need this change. Rather checkpatch should rephrase
> > > this
> > > to
> > > point out that this is only applicable to _user-visible_ error
> > > path.
> > > Cc'ed Joe.
> > 
> > Yes, thanks for pulling Joe in.
> > 
> > Anyways, no matter what the warning says, all false positives are
> > annoying. I don't see why we should stay with ENOTSUPP in gpiolib?
> > (other than the burden of changing it).
> 
> For sake of the changing we are not changing the code.
No. But for the sake of making it better / more consistent :)

Anyway - after giving this second thought (thanks Andy for provoking me
to thinking this further) - I do agree with Andy that this particular
change is bad. More I think of this, less I like the idea of having two
separate return values to indicate the same thing. So we should support
only one which makes my patch terrible.

For the sake of consistency it would be cleaner to use same, single
value, for same error both inside the gpiolib and at user-interface.
That would be EOPNOTSUPP. As I said, having two separate error codes to
indicate same thing is confusing. Now the confusion is at the boundary
of gpiolib and user-land. Please educate me - is there difference in
the meaning of ENOTSUPP and EOPNOTSUPP or are they really indicating
the same thing? If yes, then yes - correct fix would be to use only one
and ditch the other. Whether the amount of work is such it is
practically worth is another topic - but that would be the right thing
to do (tm).

> 
> > But I have no strong opinion on this. All options I see have
> > downsides.
> > 
> > Accepting both ENOTSUPP and EOPNOTSUPP is the easy way to avoid
> > allowing checkpatch warnings - but I admit it isn't stylish.
> 
> I think the error code which is Linux kernel internal is for a
> reason.

If so, then the current checkpatch warning is even more questionable.

> 
> > Converting all ENOTSUPP cases inside gpiolib to EOPNOTSUPP is
> > teodious
> > although end result might be nicer.
> 
> Why? You still missed the justification except satisfying some tool
> that gives
> you false positives. We don't do that. It's the tool that has to be
> fixed /
> amended.
> 
> > Leaving it as is gives annoying false-positives to driver
> > developers.
> > 
> > My personal preference was this patch - others can have other view
> > like
> > Andy does. I'll leave this to community/maintainers to evaluate :)
> 
> This patch misses documentation fixes, for example.

Valid point.

> Also, do you suggest that we have to do the same in entire pin
> control
> subsystem?

After reading/writing this, I am unsure. This is why the discussion is
good :) I don't see why we should have two separate error codes for
same thing - but as you put it:

> I think the error code which is Linux kernel internal is for a
> reason.

not all of us thinks the same. So maybe I just don't get it? :)

Best Regards
	Matti Vaittinen


