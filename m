Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54171F1F1D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 20:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfKFTjf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 14:39:35 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42588 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727550AbfKFTjf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 14:39:35 -0500
Received: by mail-pf1-f195.google.com with SMTP id s5so11445412pfh.9
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 11:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a2TL8pUryCnIl3YhMeT7kGh+16Twfz8zRVam6bps6hI=;
        b=Q3yq+Wz+KJgE3lz+byWEXfBQGCIHepa/sidviXPAEhkHSQSRAw/vXHW61LR10PHB1X
         Q7yHATjTz6bQuUqS6xdXkt0QynVAsIAG7xNlhg+tq7+AnYznJYAjZkKjc5ikrAaFom0f
         5oZ1HaJYInq3dAsTpFFJSRab085Q19RNJ/Me0/7EbEiWuVVUnZpNwkVfo4CLoy8J6t5x
         RBBGNkmz3V1eQUgyNNX0hFShsfLAgiVHsnPgiqvj87OpM6hAdXVALIF8ZSRX1E+FuFMH
         ina5RcfQbf/niMPPWzTwFOsFaLiQJNjuXnvdEPtJuKqOiyfSHbFQQRcrQS9A17y68GIg
         wxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=a2TL8pUryCnIl3YhMeT7kGh+16Twfz8zRVam6bps6hI=;
        b=r0Kya3G2hUcWV0ch0WAqHtbAr71fZqD6+VOy6bf+nwB/uqJ1WyClLsU+rgFZv4IXZU
         kH3sbDIfC2lm0J8xoDoeNBK4NVypWBGtjcRGT8sPoLUpXlvvdlXy4oF+mjI0O2L2af2r
         0Oae4DmyUrvO3No0JR7yLy0AhuzkNxW9TMqEvRfQFXEMZJV8BVsB/9IwhR3OMB9c29FH
         4qxeyLF3l8avQngYET4eiH4hAXW999ZCyciKGKpbMFNTt5ydxTipn0Mi5wKtcxIJVtO5
         +xpKS9u9blNoOzRf5qnQvUafeymI5bJ/K+VEq0MflEwx16kt1Pj1j5ZOOr1i3WW6Z6k5
         DrEg==
X-Gm-Message-State: APjAAAVQ+zaqMSl75TMv3qVdA9WQaUE0et9vin8mPlpkssXfOrMCZd/A
        ihcluGWhwlwi2NnufKOpHhI=
X-Google-Smtp-Source: APXvYqxTjG7Rw1AyAL7FXrBP4C/llLzFc5f7nVhT2yhOVcK0ULhIMrRjf0ZWYP312laTyIZUfPQzww==
X-Received: by 2002:a63:364d:: with SMTP id d74mr4901137pga.408.1573069174236;
        Wed, 06 Nov 2019 11:39:34 -0800 (PST)
Received: from x1 ([216.243.17.16])
        by smtp.gmail.com with ESMTPSA id b9sm26683458pfp.77.2019.11.06.11.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 11:39:33 -0800 (PST)
Date:   Wed, 6 Nov 2019 11:39:31 -0800
From:   Drew Fustini <drew@pdp7.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com,
        thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v6 4/7] gpiolib: add support for biasing output lines
Message-ID: <20191106193931.GA3347@x1>
References: <20191105020429.18942-1-warthog618@gmail.com>
 <20191105020429.18942-5-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105020429.18942-5-warthog618@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 10:04:26AM +0800, Kent Gibson wrote:
> Allow pull up/down bias to be set on output lines.
> Use case is for open source or open drain applications where
> internal pull up/down may conflict with external biasing.
> 
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

I'm not sure if I am doing something wrong but I can't seem to apply this patch
from the series.

I checked out brgl/gpio/for-next.  I opened this mailbox from lore in mutt:
https://lore.kernel.org/linux-gpio/20191105231533.GA3478@sol/t.mbox.gz

And then I saved each message in the v6 series so I could run 'git am' on each.
I thought I should be able to run git am on the whole mailbox file but I wasn't
sure if the cover letter and replies would cause a problem.

I'd appreciate any suggestions as to how I can resolve this:

pdp7@x1:~/linux$ git checkout -b brgl-gpio-for-next brgl/gpio/for-next 
Branch 'brgl-gpio-for-next' set up to track remote branch 'gpio/for-next' from 'brgl'.
Switched to a new branch 'brgl-gpio-for-next'
pdp7@x1:~/linux$ git log --oneline -1
228fc0104070 (HEAD -> brgl-gpio-for-next, tag: gpio-v5.5-updates-for-linus-part-1, brgl/gpio/for-next) gpio: of: don't warn if ignored GPIO flag matches the behavior
pdp7@x1:~/linux$ grep Subject /tmp/7*
/tmp/71:Subject: [PATCH v6 1/7] gpio: expose pull-up/pull-down line flags to userspace
/tmp/72:Subject: [PATCH v6 2/7] gpiolib: add support for pull up/down to lineevent_create
/tmp/73:Subject: [PATCH v6 3/7] gpiolib: add support for disabling line bias
/tmp/74:Subject: [PATCH v6 4/7] gpiolib: add support for biasing output lines
/tmp/75:Subject: [PATCH v6 5/7] gpio: mockup: add set_config to support pull up/down
/tmp/76:Subject: [PATCH v6 6/7] gpiolib: move validation of line handle flags into helper function
/tmp/77:Subject: [PATCH v6 7/7] gpio: add new SET_CONFIG ioctl() to gpio chardev
pdp7@x1:~/linux$ git am /tmp/7*
Applying: gpio: expose pull-up/pull-down line flags to userspace
Applying: gpiolib: add support for pull up/down to lineevent_create
Applying: gpiolib: add support for disabling line bias
Applying: gpiolib: add support for biasing output lines
error: patch failed: drivers/gpio/gpiolib.c:3168
error: drivers/gpio/gpiolib.c: patch does not apply
Patch failed at 0004 gpiolib: add support for biasing output lines
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

thanks,
drew
