Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C410BF22EA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 00:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfKFX42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 18:56:28 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35247 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfKFX41 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 18:56:27 -0500
Received: by mail-pg1-f196.google.com with SMTP id q22so320456pgk.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 15:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6BEdL5JGqsEW5n9UTJuRpjh0YKyuOs7hLwthZXwVm9E=;
        b=lYTMadoQUYJSVqrGNGrg1BVtLh998UlTpOaxjgLro27JUcIKKpDWs0rcFojyJK3PXp
         ARyaf9t6v8BysngFMgrD2hQgWw+RLgp+2rnkmgsyiESi3ckQsKRNQw5l8RpWNegzQAEg
         E3DZPungtEekuViwS/cjHDQovAoOcfsmf3vc9bR9AEPmfC1HBPOjkc5/rWD83r4JCIkG
         OYBSUzugEQSX3ZBkA9Wet6zjgRgC/KCRKeFVY9l0U81oCKOBbDjNtZBkjW5NYNciWpe/
         w5+cT00sITVIsUM8Ms9NmD8kC0fOApUmHH/Og7JGn+lq8wDkrcntUSxuvfuHV0NoRuuJ
         fQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6BEdL5JGqsEW5n9UTJuRpjh0YKyuOs7hLwthZXwVm9E=;
        b=dupt6Sm3Lztrz+5x1a2/pwFwHFjdmAw+7BHWoTCD8kVzN3iovrQr8oPVTWXF1/5h6J
         XIpuxwZMjA8xoT0Kelu0sy165q+fagJYsL7kRW31lffEY4rHI8ZZCwXKGGt58+ulcNyc
         n0VRuigMTdIyUhL3+UBDPIcnyfLgwN4fSZJYfqHSFPBSSRcFdcLRnkAud5ZEMuRZ5pD4
         xOOw6GcESBMktgokpeNKn33rMmbbn427XBSHNywjw9ivoMWVkLOPujp5HD0LdkQLC+sn
         exGCqvzqdk6jJ3Y6Wj21cnR0b3Wc2oWaKg6+povtEVtLFDJcMmZFg/bXGf9rrSrFM+b4
         Y2xA==
X-Gm-Message-State: APjAAAWJLbtZTAVLPM1K1kAuVv0UmbuH7EV559i+/t4aRU6IbeZ1HtRh
        lF5uNCewEcx+bIuW8NstpxU=
X-Google-Smtp-Source: APXvYqzxKtM+zFrSESjT/cFDaRwqBf0ejkJ4iT1aKMf0Awu9gAEPBQZH55rT6I2x7E0HGbS4m12Q6A==
X-Received: by 2002:a17:90a:bf04:: with SMTP id c4mr796227pjs.5.1573084586868;
        Wed, 06 Nov 2019 15:56:26 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id f5sm53654pjq.24.2019.11.06.15.56.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 15:56:26 -0800 (PST)
Date:   Thu, 7 Nov 2019 07:56:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com,
        thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v6 4/7] gpiolib: add support for biasing output lines
Message-ID: <20191106235620.GA4998@sol>
References: <20191105020429.18942-1-warthog618@gmail.com>
 <20191105020429.18942-5-warthog618@gmail.com>
 <20191106193931.GA3347@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106193931.GA3347@x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 06, 2019 at 11:39:31AM -0800, Drew Fustini wrote:
> On Tue, Nov 05, 2019 at 10:04:26AM +0800, Kent Gibson wrote:
> > Allow pull up/down bias to be set on output lines.
> > Use case is for open source or open drain applications where
> > internal pull up/down may conflict with external biasing.
> > 
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> I'm not sure if I am doing something wrong but I can't seem to apply this patch
> from the series.
> 
> I checked out brgl/gpio/for-next.  I opened this mailbox from lore in mutt:
> https://lore.kernel.org/linux-gpio/20191105231533.GA3478@sol/t.mbox.gz
> 
> And then I saved each message in the v6 series so I could run 'git am' on each.
> I thought I should be able to run git am on the whole mailbox file but I wasn't
> sure if the cover letter and replies would cause a problem.
> 
> I'd appreciate any suggestions as to how I can resolve this:
> 
> pdp7@x1:~/linux$ git checkout -b brgl-gpio-for-next brgl/gpio/for-next 

As per the cover note, v6 is based on brgl/gpio/for-kent, not brgl/gpio/for-next:

 The changes from v5:
  - rebased onto Bart's gpio/for-kent branch.
 
That is the only diff between v5 and v6.  Ironically you should be
applying v5 to your branch :)

Specifically, in my branch the v6 patch is applied to 

e812692b6e9c (brgl/gpio/for-kent) gpio: rcar: Use proper irq_chip name

which is still the HEAD at time of writing.

Applying the patch to for-next also breaks for me at 0004, so your 
patches are probably ok.

You aren't the only one wondering if there is an easier way to apply patches
from lore, especially when there are additional replies in the thread.
To write my demo showing how anyone, not just those that received the 
patches by mail, can rebase v5 onto for-kent to get v6, I ended up 
downloading the mbox.gz, and unzipping and removing the cruft from it.
Fortunately the mbox is chronological, so it was just removing the cover
note and then everything after patch 7.

Surely there is a better way to do this?
Is there a filter for lore or some tool out there that can filter
the returned mbox for you?

Cheers,
Kent.

