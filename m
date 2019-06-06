Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB1B7375D5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 15:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbfFFN6v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 09:58:51 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46897 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfFFN6u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 09:58:50 -0400
Received: from [192.168.1.110] ([77.9.2.22]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M2Nm2-1hYK953s5O-003rub; Thu, 06 Jun 2019 15:58:38 +0200
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
To:     federico.vaga@cern.ch
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
References: <20190603230604.30938-1-linus.walleij@linaro.org>
 <22282873.PltXLBtAh5@pcbe13614>
 <4f4b2dc0-2ad3-4e0a-ee12-c2755e810600@metux.net>
 <51993170.yLCrTtoNgA@pcbe13614>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <559a0d26-5abe-093e-0d4b-05d244dc1e35@metux.net>
Date:   Thu, 6 Jun 2019 15:58:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <51993170.yLCrTtoNgA@pcbe13614>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3EpZOPj47vWRgqEPHLeXulqzcSwzDC7ljVF+V7qrWVBUjCK4vVf
 YjUgeFh/RJrQcdX7jR4lHRymaVFkIDAu2997DscHkhxzMTakbRkOqfmoeP2LkXfhPhGcba8
 50rwRkbkyVfRvgkB3yafZytnhGdKvkdwqxq96gCBvcngKpdJbPYF5GEbQeqsN7UBi4OUIzy
 vbapaRv3D159VfrEbOboQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CTraOFCr/os=:5zaVP+tnHNvkzOOjKzeLFP
 p9+d1oolmS/lMnPjtgWgS03k/gSwbXBdjDJvUsPq7tZB2XIhVlAlhXfg6039RZumpNFPBOjn5
 OZoaqlq5+jU0N7twh8yhiIL8Fo5KtljVhFUYmldAYso79a2CmN3wm1GlD06zYDTCjbi4Ej2+U
 Fh2rWOGlIxO8sbnRMjGWbIi8RQjlaVSSrbDcEi2+E9a+vh0ij3R6XlnStvl5+31MU2bXVlVjG
 naZ6yEXw0/mtmJv9O0QzpjdDJZaFgv6hWx4Qnp5gDKoy3IgzAuS8tJ6HMaDtxjMPN2rZtyqnG
 rmQpZKAyI0Raq4CsT9QjazooiNohHMV/Aqtih+dVr+RQTvyYHobjQWVo0vqt0ftI7DiFZ109r
 iOxfKUmDDhPEQcpOL84rvH6UxHKhhRIx7p9V/JyhcXu2fYPOvgjwqDK2tEhxfQY6Q+q9G52rA
 Z6GFFeCSarxY+9mFzobmv70lRdnhe7laI2juXz6z6lnDnYpIzTs5cGorAsxPCOzr9b5TpV0uC
 DG8vVLOC9XmqqRJ2l7LfMRQIyS+5jm5b27r6+vW8asmZ37QHcwxCt/C19pgffr3DsqenX85dT
 r6ME411RC0lxPZPCaAcmOW2MszzsR7yblb7d+9xNwDpoa9bpM6oVs9/n8iPghejZM70mdoku1
 cPOU07wQ9vHUHzytbQzLNLGyulp4N8HpyVPqqapGEdv6fHMKJLpghR86NE/OkOX8HQzGC4fda
 /F4TbDQGkCwBrYMoibbQUNRRuVFl5q/8eg0pOKeoXi/bxwISyB/DHVi5VUQ=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05.06.19 09:55, Federico Vaga wrote:
> Hello Enrico,
> 
> from your questions is clear that you do not know the fmc-bus and neither the 
> VITA-57.1 (FMC) standard or the IPMI FRU specification.

Ideed, I never came anywhere near it. (guess, that applies to most
people here). So, forgive me for asking some stupid questions.

> Some of your questions 
> are answered by those documents (VITA-57.1, Platform Management FRU 
> Information Storage Definition V1.0, fmc-bus documentation in Documentation/
> fmc); 

thanks, I'm just reading the kernel docs (unfortunately lacking the time
to work through the whole specs).

Let me some more stupid questions:

* am I'm correctly assuming that there can be different FMCs, which in
  turn can be deployed with different application specific bitfiles ?
* could the SDB data be dynamically changed at runtime ?
  does it make sense to expose it as an actual fs to userland ?
* is not having the SDB data a common usecase ?
* GPIO: are these actually in the carrier itself (not on the cards
  plugged into it) ? Who's gonna consume them ? (also userland ?)
  Can we implement this as generic gpio drivers and use
  gpiod_lookup_table ?
* chardev: is some kinda /dev/mem for the fmc devices ?
  is it used by applications or just development ?
* eeprom: should we introduce an actual eeprom device class ?
  several years ago, somebody was working on that, but don't know
  what happended it it:
  https://lore.kernel.org/patchwork/patch/436179/

By the way: looks like the git repos aren't publiclly accessible:
(gitlab web frontend seems to work)

>> nekrad@orion:~/src/fmc$ git clone -vvvv
git://ohwr.org/hdl-core-lib/fpga-config-space.git
>> Cloning into 'fpga-config-space'...
>> fatal: unable to connect to ohwr.org:
>> ohwr.org[0: 188.185.83.37]: errno=Connection timed out

>> nekrad@orion:~/src/fmc$ git clone
https://ohwr.org/project/fpga-config-space.git
>> Cloning into 'fpga-config-space'...
>> fatal: unable to access
'https://ohwr.org/project/fpga-config-space.git/': gnutls_handshake()
failed: Handshake failed

>> So, this is some special backplane bus ?
> 
> Despite the fact that FMC on Linux is a Linux bus (a mechanism to match 
> devices and driver with some logic), it is not a real bus. Form software 
> prospective it is an I2C EEPROM that identifies an FMC module. A part from 
> this connection with the host, the FMC module is not accessible. All accesses 
> pass through an FPGA which interface is not in a one-to-one relation with any 
> FMC module.
>
> VITA-57.1 standardize the connection between an FPGA and an FMC module. In 
> addition it offers this I2C interface to identify the connected FMC module(s).

I guess the connection to the host is very FMC specific. Which
IO operations can we do here ? Just register read/write ?

Might that be a case for regmap ?

I'm imagining giving struct fmc_operations a ref (or get/put) to a
regmap instance instead of readl()/writel() operations. That way,
subdevice drivers (for some generic logic inside the fpga, eg. a uart,
gpio, etc) don't need to be fmc-aware at all - they'd just be
initialized by some bitfile-specific parent driver.

By the way: is there already name for bitfile specific devices ?
(maybe call it "fmc payload" ?)

>> Is that information ("card X is in slot Y", correct ?) important for the
>> drivers or even userland ?
> 
> This sort of information is always important when you what to be able to 
> distinguish cards when you look at then with your eyes, or when those FMC 
> modules are used to create a network with external equipment

Aha, so it's something that an operator needs to know, like "this is
the first uart" or "that's the 3rd eth port" ?

>> Are there some known cases where a different eeprom is used ?
> 
> For example, all open-hardware designs that my group at CERN is producing, but 
> there are more out there which are "not standard". This happened because, as I 
> wrote and VITA admitted, the standard is open to misinterpretation; VITA 
> promised to fix it on the next revision.

hmm, is there any way for probing the eeprom type or is that something
the operator needs to know/configure ?

Not sure whether I really understood the whole, so I'll try to
summarize - correct me if I'm wrong:

* each FMC carries an i2c eeprom with the SDB data, and potentially
  extra payload specific data (eg. sdbfs)
* there may be different eeprom types (speaking different protocols)
* this i2c eeprom is connected to an i2c controller on the carrier
* cpu can talk to the carrier in order to do i2c transactions
  (thus, from cpu pov, the carrier implements an an i2c controller
  that's connected to that eeprom)
* the i2c controller type (more precisely: the cpu-visible protocol)
  is known by carrier type

Are this standard i2c controllers that are already supported by the
i2c subsystem ?

>>  > As stated before, there is no such thing as an "FMC module driver",
>>  > nor a "device driver for the FPGA code".
>>
>> Oh, seems I had a wrong idea of that. Do the individual module types
>> differ - from cpu pov - in anyway, despite the bitfile specific
>> interfaces ?
> 
> I am not sure to understand your question

My question is whether the FMCs, besides the current bitfile in FPGA,
differ from host point of view. IOW: does the host need to care about
the actual FMC type, before we have an actual bitfile loaded ?
(maybe fpga specific upload protocols or check whether bitfile fits
that FMC ?)

>> Who shall be responsible for instantiating these platform devices ?
>> Maybe oftree overlays ?
> 
> Could be DeviceTree, ACPI descriptors, or another driver. There are plenty of 
> possibilities. I have noticed that DeviceTree is extensively used in some 
> context.

So, this part isn't defined yet ?
How is that currrently handled ?
Could you put a dtb directly in the FPGA, at some defined address ?

Some quick idea floating around in my head: we could place a dtb
right next to the bitfile (one dtb per bitfile), and when fpga payload
is up and running, start dt-based probing of platform devices.


hmm, there're several things, I'd like to put on my fun-project-list.
Do you happen to have some remote-accesible testbed for playground ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
