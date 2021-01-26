Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46146304660
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 19:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391519AbhAZRWg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 12:22:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:46174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389746AbhAZIPX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 03:15:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25D5A22228;
        Tue, 26 Jan 2021 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611648882;
        bh=+sKzhSFWhWauqiRz9HojgHGyNeXt3ck3av2LQ6tycNA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xp0QBo2323VbmXEj0/IRd71Q+GdSorF7K5V1x9t8FJpvlKrZf3Pc6TpKKNs8dDlY0
         mz5sfO56R/2or5r+pu7Jbap7uSi4sgdZI+9+6rdYE1oXuwGkAiVUMDVlAk7M0ADO3p
         UYQ3SYwpXvybdMubAbhc99GQo58NbnKgwYFTKj+Q=
Date:   Tue, 26 Jan 2021 09:14:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
Message-ID: <YA/Pb08rCg5x1X7z@kroah.com>
References: <20210122193600.1415639-1-saravanak@google.com>
 <CACRpkdYtToLVxyMxC=24AoGVk89c9FyQt899OTz9Jx8yJeu+mw@mail.gmail.com>
 <CAGETcx8Zozoe2BuP+zmJhQkJ6V0gJ1mtf5907BifEExw8s-zvQ@mail.gmail.com>
 <CACRpkdbid_LbxfmJ3cN7R1jupvOxeY10tXR=O79LAqgqg5H4ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbid_LbxfmJ3cN7R1jupvOxeY10tXR=O79LAqgqg5H4ug@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 24, 2021 at 11:48:28PM +0100, Linus Walleij wrote:
> On Sun, Jan 24, 2021 at 3:54 AM Saravana Kannan <saravanak@google.com> wrote:
> 
> >  Considering the "Fixes" is only in driver-core-next, should this go
> > through driver-core?
> 
> I think Bartosz should pick it up as a GPIO fix for the -rc:s
> because it touches code that he is managing.

Ok, that's fine with me, but if not, I can easily take it as well, just
let me know.

thanks,

greg k-h
