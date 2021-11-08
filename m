Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23BA447B48
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 08:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbhKHHrC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 02:47:02 -0500
Received: from verein.lst.de ([213.95.11.211]:44615 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234009AbhKHHrC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Nov 2021 02:47:02 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id F0A286732D; Mon,  8 Nov 2021 08:44:14 +0100 (CET)
Date:   Mon, 8 Nov 2021 08:44:14 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Kent Gibson <warthog618@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [GIT PULL] configfs-based GPIO simulator for v5.16
Message-ID: <20211108074414.GA24829@lst.de>
References: <20211104190030.20660-1-brgl@bgdev.pl> <CACRpkdZchV1M+BYhMYoXNj_+uUHZeydW5-nHGTjD2bZedAqKKw@mail.gmail.com> <YYfIS/sK+OAF8xsA@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYfIS/sK+OAF8xsA@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 07, 2021 at 01:36:27PM +0100, Greg KH wrote:
> configfs has two current maintainers, I don't think we need another one,
> but they should have at least responded to the patch series previously

I've clearly stated that I'm not going to take these "interesting" new
atomic semantics without an ACK from Al.  And to be honest even with that
feature creep isn't exactly on my wish list.
