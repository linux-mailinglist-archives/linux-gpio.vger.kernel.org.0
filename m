Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2C96A1C20
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Feb 2023 13:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjBXM24 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 07:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjBXM2z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 07:28:55 -0500
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59121589F
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 04:28:54 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id cbb6f13b-b43e-11ed-bd9b-005056bd6ce9;
        Fri, 24 Feb 2023 14:28:52 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Fri, 24 Feb 2023 14:28:51 +0200
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.0-rc3 released
Message-ID: <Y/itg/cmrPCGa5qf@surfacebook>
References: <CAMRc=Mc+cAPZnxFXPPp0RzhUqFRBYBkf1c9=wTozY15gTyi5aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc+cAPZnxFXPPp0RzhUqFRBYBkf1c9=wTozY15gTyi5aQ@mail.gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thu, Feb 23, 2023 at 08:25:02PM +0100, Bartosz Golaszewski kirjoitti:
> I decided to introduce a late change to the C++ bindings - mark all
> public types as final since they already don't have virtual
> destructors and inheriting from them makes little sense anyway. This
> has little impact on the programming interface but I still think it's
> worth another RC and I also have a gut feeling that makes me want to
> sit down over the weekend and inspect the entire API once more before
> carving it in stone for the foreseeable future.
> 
> The tarball and git tree are in their usual places[1][2].

Thank you for the update!

A bit of an offtopic here (but related a bit as well), but since all parties
are in Cc list I dare to ask.

I have got one bug report internally and, while thinking over it (it has nothing
to do with the library, but with the flow on how we change line states during
requests and releases), realised that we probably have no knob to tell GPIO driver
to which state pin should be left after release.

This at least allows several things to achieve:
1) emulation of the sysfs behaviour (to some extent) without a necessity of
   the context (yes, I know that this is still error prone, but why not);
2) allow the possibility to grab a GPIO line and set it to the particular
   state and leave the process off (makes sense in some setups where it's
   guaranted that no other process will touch the line);
3) something else I forgot or not even thinking of.

That said, would be nice to have an additional flag (during request?)
to tell kernel what it should do with the line after releasing the
handle from user space.

Thoughts?

P.S. Sorry if I missed any discussion related to this in the past.
In such case, please share the links.

> [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

-- 
With Best Regards,
Andy Shevchenko


