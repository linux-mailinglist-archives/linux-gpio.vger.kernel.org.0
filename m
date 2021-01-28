Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54C5307046
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 08:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhA1Hx0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 02:53:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:37262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231596AbhA1HwT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Jan 2021 02:52:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 829B864DD1;
        Thu, 28 Jan 2021 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611820293;
        bh=ZanzQmOBwTPZjYDebv8dSidjk8tn44gz015ev2aHnZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H4JGdZkbAR6twH2laZyDhCdTfwPaoEqYri29M22pc1WEMQUt9fLfXCpQ7WIPMQTIz
         kpPEe/epF6WuWgjx0cszg5xvJzAyJVJ75rYBXRAkh+oAZegtd+irbqE4JAW+//x4hV
         w64ZdysYXg72bNrYn8T8mQ185S9HOM4IrroC6BOg=
Date:   Thu, 28 Jan 2021 08:51:29 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the
 repository
Message-ID: <YBJtAeyNHMFVHQ3o@kroah.com>
References: <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
 <20210111144647.GY4077@smile.fi.intel.com>
 <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
 <20210125055527.GA344851@sol>
 <CAMRc=Mc4gK6BXKV8-b9qBTgm8m5DqW35UPxPWn7PbfJ-8LB4Yw@mail.gmail.com>
 <YBBNSzKHYNXki6NY@kroah.com>
 <CAMRc=MeQ2gNgCEuf9apUgmzxeCUUPjD5oAChXXVOw=JmoqqaGA@mail.gmail.com>
 <YBFR3bwLyrc1a6Ln@kroah.com>
 <20210128032641.GA11655@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128032641.GA11655@sol>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2021 at 11:26:41AM +0800, Kent Gibson wrote:
> Bart and Dmitry: I submit that we are good to copy the headers into the
> repositories, but we should take a few steps just to make clear that we
> are in full compliance with the GPL v2.
> 
> Firstly, we are distributing the headers under Section 1 (distribution)
> of the GPL, so we should keep the headers in a separate directory that
> contains its own COPYING file as well as the GPL v2 and Linux syscall note
> - unless they are already available elsewhere in the repo.
> 
> The headers must be copied verbatim so as to not trigger Section 2
> (modification).  And it is probably good to include in the commit
> comment what kernel version or commit they were drawn from so that can
> be easily confirmed.
> 
> Section 3 still doesn't apply, as any resulting object code or
> executables are no more a derived work due to the availability of the
> header than they were previously.  And I don't think anyone is claiming
> that the repo itself is a derived work - in this context it is just a
> distribution medium.
> 
> The COPYING file, or equivalent, for the project should explicitly
> exclude any claim on the kernel header directory to make clear we are
> not trying to sublicense the headers as LGPL - which could breach
> Section 4.
> 
> Other than those points, I don't see anywhere we may be in breach.

That looks good, you should also consider following the REUSE
specification:
	https://reuse.software/
which recommends using a LICENSES/ directory for the different licenses
in your project and use SPDX lines at the top of your files to make
everything explicit.  The `reuse lint` command line tool should give you
lots of hints on good things to fix up in this area.

Good luck!

greg k-h
