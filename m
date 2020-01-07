Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE631327F8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 14:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgAGNmJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 08:42:09 -0500
Received: from www84.your-server.de ([213.133.104.84]:53176 "EHLO
        www84.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgAGNmJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 08:42:09 -0500
X-Greylist: delayed 1564 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Jan 2020 08:42:08 EST
Received: from [188.192.102.182] (helo=[192.168.0.7])
        by www84.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <stefani@seibold.net>)
        id 1iooiI-0003xj-OC; Tue, 07 Jan 2020 14:16:02 +0100
Message-ID: <10721bebc81144c25e53b55c8cd086a34d4fd1f8.camel@seibold.net>
Subject: Re: [PATCH v4 00/13] gpiolib: add an ioctl() for monitoring line
 status changes
From:   Stefani Seibold <stefani@seibold.net>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Tue, 07 Jan 2020 14:15:59 +0100
In-Reply-To: <CACRpkdY2NXNrAk9VY18YDeQ2WDfDfAyi4mgW26JuTPHdEOE-uQ@mail.gmail.com>
References: <20191224120709.18247-1-brgl@bgdev.pl>
         <CACRpkdZ_TroKCAnDWiY-jPbe0NL+ingm1pMLQLPxT1Uh78kx8g@mail.gmail.com>
         <CAMpxmJXikLw0d1e1Eq7vVzoORz3utEBxfG6nRmkngLqezVqtuA@mail.gmail.com>
         <CACRpkdY2NXNrAk9VY18YDeQ2WDfDfAyi4mgW26JuTPHdEOE-uQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: stefani@seibold.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25687/Tue Jan  7 10:56:22 2020)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Dienstag, den 07.01.2020, 13:50 +0100 schrieb Linus Walleij:
> On Tue, Jan 7, 2020 at 11:38 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > wt., 7 sty 2020 o 11:07 Linus Walleij <linus.walleij@linaro.org>
> > napisał(a):
> > > The patch set overall looks good to me, I don't understand the
> > > kfifo
> > > parts but I trust you on this, though we need review from a FIFO
> > > maintainer.
> > 
> > Ha! This may be a problem - there doesn't seem to be one. This is
> > why
> > I Cc'd Greg.
> 
> I was under the impression that KFIFO was part of the driver core.
> Let's try to CC the actual author (Stefani Seibold) and see if the
> mail
> address works and if he can look at it. Or did you already talk to
> Stefani?
> 
> (git blame is always my best friend in cases like this, hehe)
> 
> Yours,
> Linus Walleij

I have looked around for the patches and I found the following patches 

[PATCH v4 07/13] kfifo: provide noirqsave variants of spinlocked in and out helpers
[PATCH v4 08/13] kfifo: provide kfifo_is_empty_spinlocked()

dated on 24 Dec 2019.

Both seems to be okay. The patch is non intrusive to KFIFO adding only
spinlock wrapper functions for the contemporary kfifo functions.

So...

Acked by Stefani Seibold <stefani@seibold.net>


