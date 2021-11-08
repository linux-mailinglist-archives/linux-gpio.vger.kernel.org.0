Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC980447B4E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 08:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235202AbhKHHsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 02:48:08 -0500
Received: from verein.lst.de ([213.95.11.211]:44631 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234009AbhKHHsI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Nov 2021 02:48:08 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 555C86732D; Mon,  8 Nov 2021 08:45:22 +0100 (CET)
Date:   Mon, 8 Nov 2021 08:45:21 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Kent Gibson <warthog618@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [GIT PULL] configfs-based GPIO simulator for v5.16
Message-ID: <20211108074521.GA25773@lst.de>
References: <20211104190030.20660-1-brgl@bgdev.pl> <CACRpkdZchV1M+BYhMYoXNj_+uUHZeydW5-nHGTjD2bZedAqKKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZchV1M+BYhMYoXNj_+uUHZeydW5-nHGTjD2bZedAqKKw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 07, 2021 at 01:16:58PM +0100, Linus Walleij wrote:
> I think this indicates that configfs is partly orphaned. If not formally
> then practically. Let's poke Greg and see what he says, configfs
> is important for USB.

I don't think so.  It is regularly maintained as you could easily see
in the log.
