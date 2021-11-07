Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D1D4472DB
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Nov 2021 13:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234661AbhKGMjO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Nov 2021 07:39:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:43996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230407AbhKGMjN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 7 Nov 2021 07:39:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3740161186;
        Sun,  7 Nov 2021 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636288590;
        bh=cWSkht8r0mo+bZ4+XB3yNtuN+ISwR4Uuk6eaqzasqBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qpo+zmNcaTV2L+pLwB4uFr5AUQ9XprD4dchWj7GGtrporN4kPE5ymwF0GgmZo2mQ/
         xJxJJoWO15Jo6UVLw4tN5Z8mn1re0dY0biiOs2P3vJ03l6gA5f2Ajqe6pv3UD3MJZ9
         yBDiJ4ahAfhrAxmAiivmjpkiIvDH9xlqgMryNpUY=
Date:   Sun, 7 Nov 2021 13:36:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Kent Gibson <warthog618@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [GIT PULL] configfs-based GPIO simulator for v5.16
Message-ID: <YYfIS/sK+OAF8xsA@kroah.com>
References: <20211104190030.20660-1-brgl@bgdev.pl>
 <CACRpkdZchV1M+BYhMYoXNj_+uUHZeydW5-nHGTjD2bZedAqKKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZchV1M+BYhMYoXNj_+uUHZeydW5-nHGTjD2bZedAqKKw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 07, 2021 at 01:16:58PM +0100, Linus Walleij wrote:
> On Thu, Nov 4, 2021 at 8:01 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > A couple months have passed with a few more iterations and I still can't get
> > any meaningful reviews from the configfs maintainers (nor NAKs for that
> > matter). I decided to give it another try and send it to you directly again.
> 
> I think this indicates that configfs is partly orphaned. If not formally
> then practically. Let's poke Greg and see what he says, configfs
> is important for USB.
> 
> I do understand the lack of maintainership hours and that people have
> more important things to do, we all suffer from this.
> 
> If you are the only one who really care maybe we should consider listing
> you as configfs (co-)maintainer as well?

configfs has two current maintainers, I don't think we need another one,
but they should have at least responded to the patch series previously
:(

greg k-h
