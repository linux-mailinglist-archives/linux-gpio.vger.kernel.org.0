Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E832FD663
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 18:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391781AbhATRDN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 12:03:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:58178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391078AbhATRCf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 12:02:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 246882137B;
        Wed, 20 Jan 2021 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611162114;
        bh=IXE7YWSp5sbnX68+dQh69BcI37K7iwemDVat4dRrGbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z7Tw5usoEKTk66L8gHy7wd3/duewE8m0yylC8SpRmKBhHx7SRPSYcgG+tOIpAfEIs
         YdeZG8ymMFP1EaKdsov6qoOumpBSBB8vQ5Hlu9lF5RgN/V/lglL7GxlPz6vs1IDG2D
         fAvTYi9CoWto2QxIdC1OqD7QaW4d5oWm2F8XY6Oo=
Date:   Wed, 20 Jan 2021 18:01:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
Message-ID: <YAhh3+e1cxLN0OLS@kroah.com>
References: <20210116011412.3211292-1-saravanak@google.com>
 <87r1mjkc07.wl-maz@kernel.org>
 <CAGETcx_5JJ2An=URY=0GwBbZzjfqN4w=-+2BuCsstYePej3sRw@mail.gmail.com>
 <01f733ab81959e4cf847cbf1d521ad9d@kernel.org>
 <YAhQzxaHCffpPSdQ@kroah.com>
 <2c2950c5bf94e456560704dbfa48ed16@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c2950c5bf94e456560704dbfa48ed16@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 03:58:29PM +0000, Marc Zyngier wrote:
> On 2021-01-20 15:48, Greg Kroah-Hartman wrote:
> > On Wed, Jan 20, 2021 at 03:39:30PM +0000, Marc Zyngier wrote:
> 
> > > Anyway, I said what I had to say. If platforms break with this
> > > change, I'll expect it to be disabled in 5.12.
> > 
> > I'm thinking we can not change the default and will probably revert this
> > patch "soon".
> 
> I think there is a lot of value in keeping this enabled for a bit,
> so that we can work out what breaks, and find solutions that scale
> a bit better.

Ok, will leave it alone for a few more weeks.

thanks,

greg k-h
