Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760463D25E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 18:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404352AbfFKQiB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 12:38:01 -0400
Received: from mail.gnudd.com ([77.43.112.34]:52334 "EHLO mail.gnudd.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404082AbfFKQiB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 12:38:01 -0400
Received: from mail.gnudd.com (localhost [127.0.0.1])
        by mail.gnudd.com (8.14.4/8.14.4/Debian-4+deb7u1) with ESMTP id x5BGbnSU022348;
        Tue, 11 Jun 2019 18:37:49 +0200
Received: (from rubini@localhost)
        by mail.gnudd.com (8.14.4/8.14.4/Submit) id x5BGbnIm022347;
        Tue, 11 Jun 2019 18:37:49 +0200
Date:   Tue, 11 Jun 2019 18:37:48 +0200
From:   Alessandro Rubini <rubini@gnudd.com>
To:     lkml@metux.net
Cc:     linus.walleij@linaro.org, federico.vaga@cern.ch,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        riehecky@fnal.gov
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
Message-ID: <20190611163748.GA22340@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: GnuDD, Device Drivers, Embedded Systems, Courses
In-Reply-To: <6006a8cd-ac80-93d0-bd61-cf2392655519@metux.net>
References: <6006a8cd-ac80-93d0-bd61-cf2392655519@metux.net>
  <fd1ad233-62aa-8545-a01e-511ea3db9f83@metux.net>
  <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
  <20190603230604.30938-1-linus.walleij@linaro.org>
  <22282873.PltXLBtAh5@pcbe13614> <20190610061325.GA9668@mail.gnudd.com>
  <20190611145850.GA15743@mail.gnudd.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>> This FMC (fpga mezzanine carrier) is a "slot" for peripheral boards.
>> Like shields for beaglebone or such stuff.  So there is a board
>> (and our own are actually pci-x and vme) with the FPGA, and the pins
>> are carried to this "mezzanine" where the I/O happens. The mezzanine
>> is usually just dumb, but it has the mandatory eeprom.
> 
> Ah, the fpga directly terminates w/ pcix or vme ?

The FMC standard doesn't talk about this. In our devices (pcix and vme
adapters), there is a bridge. If the fpga was directly connected, it
could not speak vme or pcix.  Then there are standalone applications,
but then it's not of interest for the linux kernel (there is no host).

> So, from *logical* point of view (leaving aside the physical aspects),
> we have either pcix or vme cards, carrying an eepromp and an fpga ?
> The i2c and gpio controllers are also implemented in the fpga ?

No. There is a "carrier" that has the fpga and possible the bridge
to be a slave of a host. And a connector where the "mezzanine" fits.
The mezzanine is like a shield of arduino/raspberry: it usually
only hosts the signa conditioning and adc/dac.  But it also has
an eeprom.  In the use case I worked with, we had an oscilloscope
(4 adc, hifh speed) and a fine-delay card, both plugging in the
same carrier (the pcix carrier).

The pci driver for the carrier (which is a pci device) instantiates
the fmc bus and loads a "generic" bitstream for the fpga. The
bitstream is carrier-specific.  With this I could read the eeprom,
and thus know what the mezzanine was.  This told me what "final"
bitstream to load.  After that, we have a "device" (adc, fine-delay,
whatever) and thus could load the appropriate driver.

The eeprom is read-only. Only exported in sysfs for informational
purposes. This is the current fmc-bus design. But if there are
no users (besides people building it off-tree), it can go.



About SDB:

We used SDB because ipmi-fru is a pain of complexity.  Thus, we had a
filesystem-like thing in the eeprom where we can store calibration
parameters or whatever (we use SDB for mac addresses in flash, for
example, with a barebox "driver" to read them). In fmc mezzanines
we declare the "fru" information at offset 0 as a "file" within an
sdb structure, whose magic number is at offset 256 or 512 in the eeprom.

SDB was born to describe peripherals within a wishbone address space
(so we autdetect peripherals from within our soft-core), and it lends
itself ferfectly to describe an eeprom. It's more than a "partition
table" thing and less than a filesystem. You can think about it as an
array of "legacy uboot images", with subdirectories (wishbone
crossbars) and relative addressing. Something very simple to parse
from a microcontroller.

Then we lacked the resources to properly advertize it, and it remained
somehow an internal project. I don't know why federico says it's
abandoned, becase it is still used to describe fpga address spaces in
at least one german research center. Maybe it's just abandoned for
fmc eeprom, I don't know.


Please note that I'm not insisting to keep fmc-bus as is, i just try
to explain the design choices, taken back when the world was easy.
Now I'm basically out of these project, and whatever federico says
is much more valuable than my out-of-date view of the issues.

thanks
/alessandro
