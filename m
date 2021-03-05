Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3E432E3B6
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 09:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhCEIeW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 03:34:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:49726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhCEIeC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Mar 2021 03:34:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A8AE64DD1;
        Fri,  5 Mar 2021 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614933241;
        bh=vw6EGjbXZIEeWKBtB6myI1NVU4w2Gp7ON2w8kB2mftg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dXWlFuw6bYicLWfrlUcriO6QBzFSOivpu1TEl0bhDZ/u8QQq4sLt9dUcov/TNHnfN
         9k8XY0HqFFjPV/uIuvoQTFsshxVGpGmm+o7DGTBi4q0IaSPSXeR8PEc3W06s0GgIDU
         lAQpvSC9ie7bbj8wZrcHrRmIsliG8JCIOBacpBIg=
Date:   Fri, 5 Mar 2021 09:33:32 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 08/12] drivers: export device_is_bound()
Message-ID: <YEHs3CxWnusWklME@kroah.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-9-brgl@bgdev.pl>
 <CAMuHMdXRK5=w1-Z=EbM60Sf2bLY1EiVaxbZjMP+XyQ3g7nBpZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXRK5=w1-Z=EbM60Sf2bLY1EiVaxbZjMP+XyQ3g7nBpZw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 05, 2021 at 09:18:30AM +0100, Geert Uytterhoeven wrote:
> CC Greg
> 
> On Thu, Mar 4, 2021 at 11:30 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Export the symbol for device_is_bound() so that we can use it in gpio-sim
> > to check if the simulated GPIO chip is bound before fetching its driver
> > data from configfs callbacks in order to retrieve the name of the GPIO
> > chip device.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/base/dd.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 9179825ff646..c62c02e3490a 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
> >  {
> >         return dev->p && klist_node_attached(&dev->p->knode_driver);
> >  }
> > +EXPORT_SYMBOL_GPL(device_is_bound);

No.  Please no.  Why is this needed?  Feels like someone is doing
something really wrong...

NACK.

