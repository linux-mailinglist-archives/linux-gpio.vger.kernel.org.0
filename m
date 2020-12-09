Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4412D4824
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 18:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732863AbgLIRkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 12:40:01 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43798 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732053AbgLIRjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 12:39:55 -0500
Received: by mail-lj1-f196.google.com with SMTP id e7so3342892ljg.10;
        Wed, 09 Dec 2020 09:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9tCyXmRdOVu83/SxOcTCL8+7o8DKdkiBQxL+CfYSglk=;
        b=j9WWYuZJTWuPAzvlfaif2Np+2NAeCotFnpT83IUirczamMdRYYyNis6yK+h2ySU0Mn
         2BcXJ+1u2BxwFwyo5te1O2Mb6GXxRHH9Kp5zHIUH3xJbXojxjdfypT5zNOaxwueRnLCr
         Ak6o3gVb/qxdYPL+9IAJ4uiXk/Fgwn0kzwQ/2ahYF0aRKHfi5zGJTi5gAhZYqGaFfouX
         B+I/fuA2/24KR9FZ0mxemSJikxdQKpcWmGSnmMEIfFlqJ6Y2pqN3+RL5v/7LSIwOzPyD
         TvyMUGEseVAjD296t3sVyBGI85S1AjqT+4eoZBDTU2oxhsFgWAJ0yd90MsUWGxKdGJdi
         icYA==
X-Gm-Message-State: AOAM531Q62/6vXz+2O/BdQyZO9GX7ViBjRQbNFAac3wn/kUayjRcNc8C
        15/94jzw8t2szk1qN7Z2PI/Dqsc+ZsAxVw==
X-Google-Smtp-Source: ABdhPJwUDZpuCISqa5/rL5hBv/nBydb/m4yCJKe5M9hh3ugp/0pyiudVeoWvwWhJqGC2kkvYXj79ng==
X-Received: by 2002:a2e:240f:: with SMTP id k15mr1500955ljk.506.1607535552842;
        Wed, 09 Dec 2020 09:39:12 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 141sm238224lfd.98.2020.12.09.09.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 09:39:12 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kn3RR-0006YS-3I; Wed, 09 Dec 2020 18:39:53 +0100
Date:   Wed, 9 Dec 2020 18:39:53 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 3/4] USB: serial: ftdi_sio: Log the CBUS GPIO validity
Message-ID: <X9EL6SwjutCHTPO+@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <20201204164739.781812-4-maz@kernel.org>
 <X848LXNv3GRmmSXA@localhost>
 <02b461244a33d5eb0620cfaa13c2b03e@kernel.org>
 <X85IC5NvcWikXfZY@localhost>
 <CACRpkda+JJ9ZMmwPcA_Rc0tgqKQw+VTgfVyp8PsZG55VM82uzg@mail.gmail.com>
 <X9ED9k5gxIlQ0YJ/@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9ED9k5gxIlQ0YJ/@localhost>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 09, 2020 at 06:05:58PM +0100, Johan Hovold wrote:
> On Wed, Dec 09, 2020 at 10:35:53AM +0100, Linus Walleij wrote:

> > It sounds like we agree that this patch sans prints is acceptable.
> > 
> > It makes things better so let's go with that.
> 
> Sounds good.
> 
> I'm about to apply patches 2, 3 and 4 with some smaller changes like
> demoting the printk messages to KERN_DEBUG and dropping the ftx-progs
> warning.
>
> > The problem for the user is that the line looks to be
> > "used by the kernel" (true in some sense) but they have no
> > idea what to do about it and that the ftx-prog will solve
> > their hacking problem.
> 
> Right, it's not ideal, but the datasheets for these devices clearly
> states that the configuration of the CBUS pins is done in EEPROM and the
> vendor provides some tool to do that. Then there's a bunch of open
> source implementations for the same including ftx-progs (which can only
> be used for a subset of these devices).
> 
> I'd be fine with a dev_err() on the first request that fails saying that
> the CBUS pin is not configured for GPIO use (perhaps even on every
> request if its not something that a non-root user can trigger). But we
> cannot have both that and have the line marked in-use through the
> chardev interface currently.
> 
> I'm admittedly a bit torn on which is preferable.

I've applied the patches now. Having this reported through the chardev
interface must be better than having to match up a failed request with
something in the system log.

Johan
