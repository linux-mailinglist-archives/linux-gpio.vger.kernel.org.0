Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FAA1F571A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 16:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgFJOyg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 10:54:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:44132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbgFJOyf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 10:54:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C009F2072F;
        Wed, 10 Jun 2020 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591800875;
        bh=h4GU7pIHSH5YCQVcvAzjRoaE8142Y+WoPe3aExRwEV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eLXbmVHursVNIqb8JTBmWPsenKWOSKR6Eff0VmZEi5m5uq7Dh5sUSVrKCQhQ181bB
         FCURlDVuhQUQeWxgxm4WaPOobuSG30vWKrhOrnDbMLuVaDIHmCyy1G76ucW7i5aFGp
         2ownfxKK+kMNkyeROKw30C1cs9aRwOTq3G7r3ntM=
Date:   Wed, 10 Jun 2020 16:54:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
        Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: arizona: put pm_runtime in case of failure
Message-ID: <20200610145429.GB2102023@kroah.com>
References: <11488e76-2ea0-6478-0800-deb0438f0136@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11488e76-2ea0-6478-0800-deb0438f0136@web.de>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 05, 2020 at 02:14:38PM +0200, Markus Elfring wrote:
> I recommend to replace the word “pm_runtime” by the
> alternative “PM run time system” in the patch subject.
> 
> 
> > Calling pm_runtime_get_sync increments the counter even in case of
> > failure, causing incorrect ref count if pm_runtime_put is not called in
> > error handling paths.
> 
> Should the term “reference count” be used here?
> 
> 
> > Call pm_runtime_put if pm_runtime_get_sync fails.
> 
> The diff hunks show an other function name.
> 
> 
> …
> > +++ b/drivers/gpio/gpio-arizona.c
> > @@ -64,6 +64,7 @@  static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
> >  		ret = pm_runtime_get_sync(chip->parent);
> >  		if (ret < 0) {
> >  			dev_err(chip->parent, "Failed to resume: %d\n", ret);
> > +			pm_runtime_put_autosuspend(chip->parent);
> >  			return ret;
> >  		}
> 
> You propose to use identical statements in three if branches.
> Please add a corresponding jump target for better exception handling.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=435faf5c218a47fd6258187f62d9bb1009717896#n455
> 
> 
> Would you like to add the tag “Fixes” to the commit message?
> 
> 
> I find it amazing how many questionable implementation details
> you pointed out recently.
> Were these contributions triggered by an evolving source code analysis
> tool like CheQ?
> https://github.com/umnsec/cheq/
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
