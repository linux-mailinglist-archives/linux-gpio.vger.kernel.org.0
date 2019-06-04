Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4BA34EB1
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 19:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbfFDRZE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 13:25:04 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43871 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfFDRZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 13:25:04 -0400
Received: from [192.168.1.110] ([95.118.47.44]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MHoAg-1hJLrr3pV0-00Et0m; Tue, 04 Jun 2019 19:24:50 +0200
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
To:     federico.vaga@cern.ch, Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
References: <20190603230604.30938-1-linus.walleij@linaro.org>
 <22282873.PltXLBtAh5@pcbe13614>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <4f4b2dc0-2ad3-4e0a-ee12-c2755e810600@metux.net>
Date:   Tue, 4 Jun 2019 17:24:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <22282873.PltXLBtAh5@pcbe13614>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:V2bZcl+TowxC0ONKloCAMGQVwgpIVFnLMBglHlRppT+4KutMy6v
 wxeoKKnl6W2h+cDKDZeJ+4oyIARJQwmMnpU7A/zfjt87UXHeg/UH+EXiGxgl1xLFifDYRpd
 xOV2almnSly+/mMzSOxkiH4ZgJjG0v+NzkBwyRWF1PA6PK9mN4XueIyyHWox6BqtUbgjPzG
 cwGfp/nnJfd/tTZVm4PJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VysPLXO6HOE=:vN0/jC1gHYrtzybxankb1c
 LpBGEUXfoih5S0VMmWYNN9yUfl2TJLPa4QmgcVT+rVCbfHyOjsMDk8oHcKrq2XVRKiiEYr8ON
 wm3b/WXdTuLLdMQOtFoRXeU8f/SnL1Zc57hVOZcsesF2cy+5boCQWrczfxtc6DVYgRrLVbK6o
 GRiH+ltNqYIX06T6tgzP2hdYIJEE1M697rj0O1nWCDWpJkOQScPLZvLe8JwLYyPK7k9EWKwW5
 oTiHBfdw2l6QikN3wm8gKk+jVBwpEMB72IUQnXe3Mx8y174GlNWjDfy4Ozf2E6TEAM9AqqeK/
 ko6+y7A+5NzlwpB3XdnVWbs/ebRDnNrLIsfRLTvPviDN8UcU7QgPeaDzyfssXAi0kj1xNxf20
 loWqDxXmQSPlSnk7JGRm/iH6t5KRzDqhgxbcS85CPsw+IiTZ5lxDXJ1xaGg5vm0X6HIsWct8T
 rmCenjFxQ8lGxjNwPbSBA6A51sMaFRAZ3CIUaeNo1JsfEnl7Ipr3RywHxABlL3H0NdcT/uxqQ
 XdH9vC9Y7kSZzUfSdhs2++1rHDrkhyW9Rielm7h3EB7X3MhRJgMJAtiGQk4ktQ/M8B0UkoZ41
 EPxb4LqgWbWtnucuxg55n+FwOEgN7xkGDVlv8HlAl/a38WxcS94TNyT0+w+j8TPKO63z+S438
 YDPI7lPzX/95KhP36sdCfwMNZWmp4TEfMNzZY6L8ARm8VPvNANM8wRfsH3USahNS9/idqCCuG
 RmSaUt2NsFOT9p1Uju83N2aMCAID5aHMVTbp3au7z0qqX6o3vikYh6eE26M=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04.06.19 06:42, Federico Vaga wrote:
> Hello Linus,
> 
> I take this occasion to renovate my proposal
> 
> https://lkml.org/lkml/2018/10/29/534

Is CERN open to invest resources into it (eg. manpower
or sponsoring) ?

Just a few questions on your original proposal:

 >> The FMC Standard
 >> ----------------
 >>
 >> The FMC standard (`VITA-57.1`_) describes FMC modules and carriers
 >> from the mechanical and the electrical point of view. `VITA-57.1`_
 >> also specifies the information stored in the (mandatory) EEPROM on
 >> the FMC module.

So, this is some special backplane bus ?

Does the host (linux machine) also act as a module or more like a pci
host bridge ? In the latter case it IMHO smells like it deservces its
own bus type (which also cares about things like probing logic)

 >> On the other hand, `VITA-57.1`_ does not specify at all how FMC
 >> carriers and its FMC modules communicate.

<snip>

 >> 5.5 I2C bus signal
 >>  This chapter specifies that an I2C bus connecting an FMC carrier
 >>  and its FMC modules is mandatory. Consequently, it specifies the FMC
 >>  signals that are reserved for that purpose.
 >>
 >>  By this chapter, an FMC module must contain an EEPROM connected to 
 >> that
 >>  I2C bus. The purpose of this EEPROM is to store
 >>  *hardware definition information* using the
 >>  `Platform Management FRU Information Storage Definition V1.0`_

Does the fmc carrier have an i2c controller, which in turn the host
cpu can speak with ? Is that one directly accessible on the CPUs
mem/io bus or do we need some extra transport layer (regmap) ?

 >  So, from a software point of view, we are interested in reading the FRU
 >
 >  information that provides useful data to identify the FMC modules, and
 >  to do so at a standardized I2C address and EEPROM programming interface.

Does that eeprom contain just some model ID (similar to eg. PCI IDs) ?
Or maybe something more detailed, similar to oftree or acpi ?

 > 5.6 Geographical address
 >  This chapter describes how to address the different I2C devices hosted
 >  in the FMC mezzanines that live in a single FMC carrier.

What are "FMC mezzanines" ? Specific combinations of cards ?
Do they form some kind of composite device ?

 >  As the
 >  standard specifies up to four mezzanines per I2C bus, it enforces the
 >  convention that the two least significant bits of the I2C address
 >  identify the slot.
 >  For example, the mandatory I2C EEPROM must be addressable at the 7-bit
 >  address b10100XX, the suffix XX=00,01,10,11 determining the geographical
 >  addressing of the module in the carrier. Other I2C devices follow 
the same
 >  schema.

Is that information ("card X is in slot Y", correct ?) important for the
drivers or even userland ?

 > The main wrong assumption in the Linux fmc-bus is the idea that
 > drivers
 > are bound to FMC modules through the carrier FPGA: this is not true.

hmm, smells a bit similar to having a generic FPGA card in PCI, where
we can probe the card model itself, but yet have to load a bitfile to
do something useful with it. correct ?

Maybe introduce an own bus_type - similar to eg. pci, let the carriers
be host adapters and the module bus devices. Then it should be pretty
much the same scenario like fpga's on pci cards. IMHO.

 > Behind this lies another wrong assumption: that FMC modules are in a
 > one-to-one relationship with the FPGA code: this is wrong. The actual
 > relationship is one-to-many: one FMC module can be driven by many FPGA
 > code designs, which might be wildly varying. The real behavior of a
 > card (FMC carrier + FMC module[s]) is determined by the FPGA code that
 > has been loaded on the FPGA.

Is there a way to dynamically identify the currently loaded bitfiles ?
Can the fpga's be directly memory mapped to cpu ?

My favourite approach would be putting an oftree into the the fpga, on
some fixed address. Then the individual module could also be treated
as bus adapters, which probe the in-bitfile-devices as platform devices
via oftee.

 > We can have an FMC module with a simple 5 digital I/O channel. We all
 > know that such module is versatile, so we can have FPGA code that
 > implements: two I2C masters, an SPI master, a GPIO interface, a TDC,
 > custom logic. In all these cases the FMC module is the same but the
 > FPGA code that drives it is different,
 > as well as the Linux driver that should drive it.

hmm, so the module driver somehow has to do the probing, after the
actual bitfile is loaded.

 > So, the fmc-bus design is wrong in trying to match devices and drivers
 > using
 > the FRU information from the FMC module EEPROM.

IMHO depending on the exact definition of the term "devices and drivers.
We'd need to split it into two layers - one for the hardware module,
another one for the payloads. I believe the approach I've mentioned
above are a good way to do it.

On a highlevel view this scenario shouldn't be so different from having
an USB host on a PCI card and arbitrarily replacable usb devices behind
that. But here replacing devices is done by software (bitfile upload).

 > FMC Device Class
 > ----------------
 > I propose to retain all the functionality of the fmc-bus that should
 > remain (see below) in a kernel module implementing an FMC device class
 > that registers the presence of individual FMC modules.

I believe it should actually be a fmc bus_type, so we can benefit from
lots of code for the probing / (sub)device instantiation.

Few years go I've did a similar approach with some strange railways
backplane system. The usecase was a little bit less complex (basically,
a memmapped fpga that implements a bunch of proprietary serial pipes
and the cards behind them).

 > FPGA Manager
 >  The Linux fmc-bus asks the FMC carrier driver to export the necessary
 >  operations to program the FMC carrier FPGA. Currently, this is handled
 >  by the Linux kernel FPGA manager subsystem.

Can it already trigger some probing ?

 >  So, the FMC carrier driver should create a device instance for the FPGA
   manager.

The bitfile loading is done by the carrier, not the modules ?

 > I2C Master Driver
 >  The Linux fmc-bus current implementation asks the FMC carrier 
drivers > to
 >  implement the I2C operations in order to access the EEPROM. In 
theory > this
 >  is not really necessary; Linux provides a nice I2C sub-system for this
 >  purpose. Only the particular I2C master instance needs to be 
registered by
 >  the FMC carrier driver.

Are these standard i2c controllers ?

 > EEPROM Driver
 >   The Linux fmc-bus uses the I2C programming interface of an FMC 
module EEPROM
 >  to extract its contents, in particular the module identification for 
driver
 >  Again, this is rendered superfluous by the Linux kernel I2C EEPROM
 >  drivers. There is, however, a difficulty with the particular EEPROM
 >  to use: which one is it? `VITA-57.1`_ is unclear about this.
 >  rule 5.69 about what kind of EEPROM is mandatory:

Seems plausible.

 >  to support 24C02 EEPROMs. Support of other EEPROMs should not be
 >  excluded, though, as `VITA-57.1`_ is admittedly open
 > misinterpretaion
 >  on this point.

Are there some known cases where a different eeprom is used ?

 > IRQ Controller
 >  The Linux fmc-bus asks the FMC carrier to implement the operations to
 >  request, free and acknowledge interrupts. This is necessary because
 >  FMC modules plugged into an FMC carrier share the unique interrupt
 >  line or vector of the latter. However, this function does not belong
 >  in the fmc-bus. As the obvious need for such logic suggests,
 >  the FMC carrier contains interrupt routing logic; thus, an IRQ
 >  controller is the proper way to handle this.

Agreed.

 > As stated before, there is no such thing as an "FMC module driver",
 > nor a "device driver for the FPGA code".

Oh, seems I had a wrong idea of that. Do the individual module types
differ - from cpu pov - in anyway, despite the bitfile specific
interfaces ?

If not, what's the actual purpose of the eeprom data ?

 > So, the only way I see it possible is by using platform drivers for
 > the *FPGA internal devices*. The description of the internal devices
 > is not within the scope of the FMC software layer.

Who shall be responsible for instantiating these platform devices ?
Maybe oftree overlays ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
