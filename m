Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8DE3ADB2E
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jun 2021 19:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234731AbhFSRv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Jun 2021 13:51:28 -0400
Received: from linux.microsoft.com ([13.77.154.182]:58554 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbhFSRvZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Jun 2021 13:51:25 -0400
Received: by linux.microsoft.com (Postfix, from userid 1101)
        id DBA9920B7178; Sat, 19 Jun 2021 10:49:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DBA9920B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1624124953;
        bh=xQIpTF+VT/yV4ZA1aqYHhCPdR4W3ifhPOgA7rFQhmzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CFJO2E+AzSYirT9BYkvro/H3q8yv52kF8UsFQ9x8oDyj+ULad5pZEdtxK7unpept+
         nSIOX+XQi2/Gyw0kbIgxYshhX7PSZzt4lIXOUmEUqHJDmrqyz6bnV8RHFpYpzy1gtG
         0ovRMySEYY3sKMpzRRPYS3RYjRIwmE7YW6HQSkwE=
Date:   Sat, 19 Jun 2021 10:49:13 -0700
From:   Gabriel Knezek <gabeknez@linux.microsoft.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpiolib: cdev: zero padding during conversion to
 gpioline_info_changed
Message-ID: <20210619174913.GA6966@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1624056311-6836-1-git-send-email-gabeknez@linux.microsoft.com>
 <20210619041144.GA15015@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619041144.GA15015@sol>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 19, 2021 at 12:11:44PM +0800, Kent Gibson wrote:
> On Fri, Jun 18, 2021 at 03:45:11PM -0700, Gabriel Knezek wrote:
> 
> Probably should've been [PATCH v2], despite the subject rename.
> 
> And CC the maintainers (LinusW and Bart here) and past reviewers (Andy
> and me).
> 

Sorry about that. When sending the revised patch, should I change it to v2?
Or perhaps v3?

> > From: Gabriel Knezek <gabeknez@microsoft.com>
> > 
> 
> A second From: header?  With a different address?
> Perhaps you could pick one?
> Neither git nor checkpatch.pl seem to mind, but it is odd.
> 

Apologies for that as well. git send-email doesn't play well with Exchange, so
after talking to coworkers it turns out we have a separate email server for
sending patches which I wasn't aware of before I sent the first one. :-/ Sorry
for the confusion; I'll stick to the @linux address.

> 
> > Signed-off-by: Gabriel Knezek <gabeknez@microsoft.com>
> 
> You should retain the Fixes tag from v1 - it is important to identify
> where this patch will need to be backported to.
> And include at least the first twelve characters of the SHA-1 [1].
> 

Oh shoot. Sorry about that as well. I need to make a checklist.
Thanks for the link; I did read it before submitting the second patch,
but I clearly missed that part.

> 
> Still good with this bit ;)
> 
> Cheers,
> Kent.

Thanks for the kind help. I promise I'll update our wiki with these
learnings so hopefully dealing with the next person from our team submitting
a patch won't be so painful.

-Gabe

