Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71793279A8
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 09:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhCAIpM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 03:45:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:57340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233319AbhCAIpK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 03:45:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4773A64DEF;
        Mon,  1 Mar 2021 08:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614588269;
        bh=yI9vk7/j1WOYnOHUSAxSo33Gf4b9ogltKOcygaxgC/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AwU+infUiSF+eRxYlr3iF3Nhty9BbOR3OFHSqz0/Xw9d9LTaxrngHHfGWJvirKuJH
         KWq6z5dhctFSfAJL1Pmfmq/zNSwv57U2iFnfAfAmq9K+VNBKbKc/XX2KBZN9NNuW06
         fqthBzcLxzrCoHozjj/iAJnjCizyJJwk3ATIhIwRgV7f0WBj9MZHeYVtUk0GOlKIAL
         9fmoq3Lsup02yWimweaIH5dzNx1PhE8s88zWWjvvcwlLZHoNYlwXoXEKesGRp6fxWl
         uvGeYPRacjNptGp8pHpyEJn9ymAyzWYDkuBP9t/rTS4K4QvOhfbjeRG6szB9R/jwS4
         0aVel+tqYRxUQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lGeAY-00017E-1A; Mon, 01 Mar 2021 09:44:46 +0100
Date:   Mon, 1 Mar 2021 09:44:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] gpio: fix NULL-deref-on-deregistration regression
Message-ID: <YDypfjoBpHsd+dCo@hovoldconsulting.com>
References: <20210226145246.1171-1-johan@kernel.org>
 <20210226145246.1171-2-johan@kernel.org>
 <CAGETcx-4Q+SkdLO-rXE-zt2kdz=J1cnrPjv07mt0KRtCPa_OGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx-4Q+SkdLO-rXE-zt2kdz=J1cnrPjv07mt0KRtCPa_OGg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 26, 2021 at 01:54:12PM -0800, Saravana Kannan wrote:
> On Fri, Feb 26, 2021 at 6:55 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > Fix a NULL-pointer deference when deregistering the gpio character
> > device that was introduced by the recent stub-driver hack. When the new
> > "driver" is unbound as part of deregistration, driver core clears the
> > driver-data pointer which is used to retrieve the struct gpio_device in
> > its release callback.
> >
> > Fix this by using container_of() in the release callback as should have
> > been done all along.
> >
> > Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
> > Cc: Saravana Kannan <saravanak@google.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reported-by: syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/gpio/gpiolib.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index adf55db080d8..e1016bc8cf14 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -474,7 +474,7 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
> >
> >  static void gpiodevice_release(struct device *dev)
> >  {
> > -       struct gpio_device *gdev = dev_get_drvdata(dev);
> > +       struct gpio_device *gdev = container_of(dev, struct gpio_device, dev);
> 
> Can you also delete the dev_set_drvdata() in
> gpiochip_add_data_with_key() if the drvdata is not used
> elsewhere anymore? I skimmed the code and it doesn't look like it, but
> I could be wrong.

Yeah, I considered it but didn't want to risk introducing any new
regressions just to clean up a redundant store.

But looking at it again today, I agree that it looks like it isn't used
anywhere else. I'll send a v2. Thanks.

Johan
