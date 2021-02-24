Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3365232383B
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Feb 2021 09:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbhBXIAz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Feb 2021 03:00:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:58522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhBXIAu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Feb 2021 03:00:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1452C64EC9;
        Wed, 24 Feb 2021 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614153608;
        bh=sCbgu1JqbQiKn7eBlA9lB1TYCWTP8YQixDiHIF62wyE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K63jYqu08okxP96WxxF6kEU0gNDm+vd/LCrAnSr8Rh3sT1kDFXWgVF1aoNfFyTBMD
         l0AkqoGz4mXfiB6m49p33McYzo7PE8kEUKdBmQz453skwZSs18pCysetK8cm1n8l8m
         6nhqVNTSarS6Al65ScP1MrXTb1brnA72wUtqrQtA=
Date:   Wed, 24 Feb 2021 09:00:05 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, rafael@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, frowand.list@gmail.com,
        pantelis.antoniou@konsulko.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 09/12] drivers: base: reintroduce find_bus()
Message-ID: <YDYHhYRDBDKGSZ1r@kroah.com>
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-10-info@metux.net>
 <YCen7uHqFJQ/U/5p@kroah.com>
 <da82c033-3a82-3420-4d06-f5c39c524ae9@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da82c033-3a82-3420-4d06-f5c39c524ae9@metux.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 23, 2021 at 09:13:26PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 13.02.21 11:20, Greg KH wrote:
> > On Mon, Feb 08, 2021 at 11:22:00PM +0100, Enrico Weigelt, metux IT consult wrote:
> > > ---
> > >   drivers/base/bus.c         | 14 ++++++++++----
> > >   include/linux/device/bus.h |  2 ++
> > >   2 files changed, 12 insertions(+), 4 deletions(-)
> > 
> > Um, no.
> 
> Why not ? Do you have a better idea ?
> 
> What I actually need is a way to unbdind a specific device, identified
> by bus name and device name. The problem to be solved here is dropping
> devices that have been enumerated in a bad way by firmware (ACPI in this
> case), and then recreating it in a clean, consistent way.

Have the firmware code do it itself, do nto try to "reach across" like
this.

And what problem are you really trying to solve here by doing this?

thanks,

greg k-h
