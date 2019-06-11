Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA753D010
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388770AbfFKO7E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:59:04 -0400
Received: from mail.gnudd.com ([77.43.112.34]:52246 "EHLO mail.gnudd.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387881AbfFKO7E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 10:59:04 -0400
Received: from mail.gnudd.com (localhost [127.0.0.1])
        by mail.gnudd.com (8.14.4/8.14.4/Debian-4+deb7u1) with ESMTP id x5BEwoUZ015751;
        Tue, 11 Jun 2019 16:58:50 +0200
Received: (from rubini@localhost)
        by mail.gnudd.com (8.14.4/8.14.4/Submit) id x5BEwoMP015750;
        Tue, 11 Jun 2019 16:58:50 +0200
Date:   Tue, 11 Jun 2019 16:58:50 +0200
From:   Alessandro Rubini <rubini@gnudd.com>
To:     lkml@metux.net
Cc:     linus.walleij@linaro.org, federico.vaga@cern.ch,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        riehecky@fnal.gov
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
Message-ID: <20190611145850.GA15743@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: GnuDD, Device Drivers, Embedded Systems, Courses
In-Reply-To: <fd1ad233-62aa-8545-a01e-511ea3db9f83@metux.net>
References: <fd1ad233-62aa-8545-a01e-511ea3db9f83@metux.net>
  <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
  <20190603230604.30938-1-linus.walleij@linaro.org>
  <22282873.PltXLBtAh5@pcbe13614> <20190610061325.GA9668@mail.gnudd.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Do you (or @Federico) recall the original design goals ?

Sure.

This FMC (fpga mezzanine carrier) is a "slot" for peripheral boards.
Like shields for beaglebone or such stuff.  So there is a board
(and our own are actually pci-x and vme) with the FPGA, and the pins
are carried to this "mezzanine" where the I/O happens. The mezzanine
is usually just dumb, but it has the mandatory eeprom.

So, our "fine delay" board, that can timestamp pulses and generate
other pulses at precise times) can plug in both the pcix and vme carrier.

The bus abstraction filled nicely in my opinion. The "spec" and "svec"
(simple pcix/vme carriers) drivers would register the device, named
according to the eeprom contents, and the driver was the same
irrespective of the carrier.  The drivers for spec and svec (or the
mezzanine) were not upstreamed, but the mechanism was, including
software-only examples of how to use it, in the hope others would find
it useful.  Back then there was no generalized way to load fpga
binaries, so we had our own, based on firmware loader.

Then things went more complex, and federico started to have issues.
The tow major ones, IIUC, are (1) the same mezzanine would require
different bitstreams according to external information and (2) the
fpga binary itself my expose different "devices" where a generalized
driver would benefit, instead of a mezzanine-specific driver.
 
> Leaving aside the purely electrical / mechanical aspects, why not
> just using either pcix or vme directly ?

pcix and vme hosted the carrier. Much like an USB controller can either
be PCI or memory-mapped, but the devices it register have a driver that
is irrespective of this detail.

/alessandro
