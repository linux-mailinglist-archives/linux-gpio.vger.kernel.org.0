Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D153D199
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 18:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404569AbfFKQBN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 12:01:13 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:55589 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727549AbfFKQBM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 12:01:12 -0400
Received: from [192.168.1.110] ([95.118.191.213]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N6KMR-1gU4wN3ESH-016eZg; Tue, 11 Jun 2019 18:00:58 +0200
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
To:     federico.vaga@cern.ch
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
References: <20190603230604.30938-1-linus.walleij@linaro.org>
 <51993170.yLCrTtoNgA@pcbe13614>
 <559a0d26-5abe-093e-0d4b-05d244dc1e35@metux.net>
 <19747274.VuuCNqAmkf@pcbe13614>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <fa706ad1-c7df-55a3-3bb0-a7159f563678@metux.net>
Date:   Tue, 11 Jun 2019 18:00:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <19747274.VuuCNqAmkf@pcbe13614>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0PRC8RECPnlKxPjXDZsxShPiSsbPaLMUbJDoJdq6eoVfuqj97Xx
 jAb8VdNgWGqj56aYa0ysYtd5IbiaZVWFhnjjC5EKfsXU8a8mCqnUZslHYHt30CMjI24KFr8
 YaZpzqeSdS+FaDpfES8SRWPDo6sEtwaVbilozu0j1zadVtl8UUkbvGcRbRDEd0dV30AVf3V
 TUj50ESad0IdcLBbl/ckQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hgbbJDAn2tA=:Q15JCS2re1SRvnwBVo8TBC
 5cO2tpGjg/lOa+o4MSzybwIFXPTxuGwiCR4Kck8xE66QuY+PB2nPPnnK9JcomlmVi9yyl9PB4
 m83QNJU5VHQsw6FUDwbsY4cIiHi3qgEWYZCUdNWz3gCS8fXpDLftGIkFvf+fCliXr1Pa8rBPf
 plqO7MNHDobofrlw4UD7JNtJYHXcaK5p+nxIWYuULI1t9Rtj+JF41ngvqO73WcW8fA7N27L8o
 osqvUByn/ptZ5EAHDq5sMg8dCvmPiyEb/glYkWwN3RRTGaW+PF2X6GQiFPNIcvSpwroxR1sTh
 jsTaElAb0RV+eW+6RlKhd1u3OND7yXSYA7sytXN1tmUsbGLwV2N1YYQF+uH92H3Az8HeyqaeY
 RhK6F6ntlypc7YyIPj21FBwForGZwL4g+h0paMnuBSK8H0Qd1+DaNPkcdDcf/iqWIrbWVBusz
 f31G4aXAh/mx+iM7fv8mIQB3QCUtp9iQWw725OsBLS38DAMah1teiH3WkJmS59U5/xjOi5fYl
 Se3Tsxp36DGu56+EwriSWQ9JCz+EE6pJ2efxqGcTldDqgE5tcp9LAmMKDDBXcw4V7kMoXFJyi
 yQYGzK+TLTUT3ibY4LPugllgbsTOkJ7BVe663J0WAIfVe7G2fns0M5DXBrVcHvmSnwY1pbq8f
 zIlpngaaLnatTwkv6CEDwffBOmqN597YCQCRqiVHcKtEOQW96qRb24dBVhQEPgMJX7Xe3DkYq
 iQ59GKZfPBFFbqwsyiSoVjHawtHfZDoq1G0FP7yNYW2AElqqfL55amqpYMI=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06.06.19 16:41, Federico Vaga wrote:

Hi,

>> * am I'm correctly assuming that there can be different FMCs, which in
>>   turn can be deployed with different application specific bitfiles ?
> 
> yes

Ok, then - from LDM point of view - I'd prefer treating the FMC as kind
of an bus adapter. That "bus" would also employ fpga subsystem for the
bitfile deployment (maybe, pure fw-loader would also do ?) and then let
it do the logical probing. Sounds a bit cleaner to me than the mfd
approach.

> SDB is something that has been attached to FMC but actually is totally 
> unrelated. There were plans about it in the past but they have been abandon.

So, we can ignore it ?

> There are no relations between GPIO and FMC. GPIO usage is design specific, 
> and in particular specific to the carrier not the modules.

Now I'm confused. If the gpio's are design specific, means they're
implemented inside fpga ? But how exactly are they carrier specific ?
(by "carrier" you mean the adapter to pcie or vme ?)

>> * chardev: is some kinda /dev/mem for the fmc devices ?
>>   is it used by applications or just development ?
> 
> probably development. At least at CERN nobody uses it; it has been used to 
> hack around at the very beginning

So, not part of the uapi ? (IOW: could we drop it, w/o causing huge
pain ?)

>> * eeprom: should we introduce an actual eeprom device class ?
>>   several years ago, somebody was working on that, but don't know
>>   what happended it it:
>>   https://lore.kernel.org/patchwork/patch/436179/
> 
> I do not think is necessary. The kernel has support for I2C, it has support to 
> the FMC standard EEPROM. They are easy to configure

How does the fmc subsystem talk to these drivers ? Just had a quick look
on a few of them - these just provide access via sysfs, but haven't
found an internal API, where other drivers/subsystems talk to them
directly. Is that all done in userland ?

>> 'https://ohwr.org/project/fpga-config-space.git/': gnutls_handshake()
>> failed: Handshake failed
> 
> I can report the error, but as you can see that project is abandon. 

hmm, now only used internally ?

>> I guess the connection to the host is very FMC specific. Which
>> IO operations can we do here ? Just register read/write ?
> 
> It is not FMC specific. FMC is just a connector that you can use to extend a 
> PCI/VME/USB/ISA/SPI/... card

But there're different types (depending on which bus they're plugged
into), and these parts have to be type specific ?

> In principle there is only one correct EEPROM: 24C02. Any other eeprom is non-
> standard, so the operator must know what to do in that specific case.

Ok. From where is the eeprom accessed ? Userland or kernel ?

>> Not sure whether I really understood the whole, so I'll try to
>> summarize - correct me if I'm wrong:
>>
>> * each FMC carries an i2c eeprom with the SDB data, and potentially
>>   extra payload specific data (eg. sdbfs)
> 
> No.
> FMc Modules (plugged on FMC carriers) carry an I2C EEPROM with the "Platform
> Management FRU Information Storage Definition V1.0."

Ah, okay, so no sdb data.

>> * there may be different eeprom types (speaking different protocols)
> 
> According to the standard no. But since the standard is unclear, people 
> misunderstood this point, so it is possible to have different eeproms

Okay, so we practically have different types (even if that violates
the spec). Does that have to be supported ?

>> * this i2c eeprom is connected to an i2c controller on the carrier
> 
> Yes

So, the carrier forms an MFD which holds an bus adapter as well as
an i2c controller. I guess the fmc subsystem needs to parse/handle
the eeprom data (for probing, etc), correct ?

IMHO, the fmc carrier driver should instanciate an i2c controller
and an eeprom behind that. As an intermediate step, I'd imagine changing
the built in i2c functions to call into the standard i2c subsystem.

>> Are this standard i2c controllers that are already supported by the
>> i2c subsystem ?
> 
> There is not a standard I2C controller. It is a carrier design choice

Are some of them compatible w/ any already supported i2c controller ?

>> My question is whether the FMCs, besides the current bitfile in FPGA,
>> differ from host point of view. IOW: does the host need to care about
>> the actual FMC type, before we have an actual bitfile loaded ?
>> (maybe fpga specific upload protocols or check whether bitfile fits
>> that FMC ?)
> 
> It depends on the context. If your FPGA is empty and you want to load a new 
> configuration then you should check the type of FMC Module plugged in order to 
> avoid to "burn" it (really rare, but it could happen)

Understood. Is this already done automatically, or manually by the
operator ?

>>> Could be DeviceTree, ACPI descriptors, or another driver. There are plenty
>>> of possibilities. I have noticed that DeviceTree is extensively used in
>>> some context.
>>
>> So, this part isn't defined yet ?
> 
> It does not need to be defined. It is out of scope. How FPGA devices are 
> declare is a general problem, not and FMC problem

But somebody needs to start the probing process (however this actually
looks like) - finally needs not instanciate the platform devices with
the correct configuration. Does  subsystem already has some mechanisms
for that ?

>> How is that currrently handled ?
> 
> The way fmc-bus is designed, does not need to discover FPGA devices.

How then does the discovery ? Or is that purely application specific
and entirely handled in userspace ?

>> Could you put a dtb directly in the FPGA, at some defined address ?
> 
> In general yes. Why not?

Ok, than that's probably the way I would go.
Not sure whether we already have standard mechanisms for that.

> Well, I am suggesting to erase fmc-bus from the Linux kernel and to provide a 
> device_class for a standardized way to access that I2C EEPROM. I already have 
> the implementation; perhaps it needs some clean-up and for sure to be ported 
> to 5.x (I will do this job only if there is interest in removing/replacing the 
> current fmc subsystem).

Can you post what you've already got ?
I'd like to have a closer look at it.

Maybe it has some overlap w/ pstore or firmware flashing.

>> Do you happen to have some remote-accesible testbed for playground ?
> 
> Of course not :D
> CERN infrastructure is not freely accessible

How sad :(

I believe CERN could be one of the top candidates for setting up such
environments - not for this case, but also other Linux-supported
hardware. Do you happen to know some people there, with whom we could
have a talk about that ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
