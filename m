Return-Path: <linux-gpio+bounces-16406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37432A40038
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D8A3BCE5A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 19:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D19225334A;
	Fri, 21 Feb 2025 19:56:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981D01FF1BD
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740167800; cv=none; b=MiB66TkNgvTY11EKOM47J7EOOeLWg7XypWHxmMSbGEm2QPIPEUPyq6GC1T5l6DmWz7Htr6xARqsv+Kk2/hMFJXK2vrH99SSlf5H+kjFwgDIMIFYvmAEzez3AidbJ91AsXzURTqafqpP6jL4g6qwUMemeIsKRZQmO9VxzqGHLDXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740167800; c=relaxed/simple;
	bh=S1Oo65ZNvSFvSvIr0+0DWNYT4tmcutb6FFm1AYHItis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdNMPe5BMJnnOBvwDzwwMDBG/qAEICSPaYbzbcGIoi3iJj7CEGcw9MAcKGOPreZLObfMEL2hzEBDZ6Sajbmu362YBOaiHhrDbBCioLuV0ISFYbqkqIO75M/wp2HHB9gpCc5ME4iFmz/ifrruHnTIc3+6QOiHpeo36Fs9HrYRVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tlZ8R-0002ir-3K; Fri, 21 Feb 2025 20:56:31 +0100
Message-ID: <9d3f1ca4-d865-45af-9032-c38cacc7fe93@pengutronix.de>
Date: Fri, 21 Feb 2025 20:56:29 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?=
 <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hello Linus,

On 14.02.25 10:14, Linus Walleij wrote:
> On Sun, Feb 2, 2025 at 1:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
>> I think it was Ahmad or Marek who suggested that users aren't really
>> attached to the global numbering but to the ease of use of sysfs.
>>
>> I floated an idea of introducing a backward compatible change to sysfs
>> that would allow users to identify GPIOs by the label of their parent
>> chip and the hardware offset of the line within that chip (...)
>>
>> We could then encourage users to switch to using the chip-local
>> exports and eventually at least remove the global export/unexport pair
>> if we cannot make the entire sysfs class go away.
>>
>> Please let me know what you think about it?
> 
> Yes, I think it is mostly equivalent to what I say in drivers/gpio/TODO,

I wasn't aware of this file. Thanks for pointing it out.

> my only point being that when we add something like this, we
> put it in debugfs where it belongs, and as illustrated by your
> example, it is indeed used for debugging/exploring the
> system:

Why does it belong in debugfs? The whole premise of Bartosz's mail is
to provide holdouts that haven't yet migrated away from the sysfs global
number space an alternative _stable_ kernel interface they can rely on.

DebugFS is the opposite of that. It may not even be available in those
resource-constrained systems that this would be useful for.

> ----------------8<----------------------------8<------------------------
> Debugfs in place of sysfs
> 
> The old sysfs code that enables simple uses of GPIOs from the
> command line is still popular despite the existance of the proper
> character device. The reason is that it is simple to use on
> root filesystems where you only have a minimal set of tools such
> as "cat", "echo" etc.

And most importantly having the kernel keep the line requested.

> The old sysfs still need to be strongly deprecated and removed
> as it relies on the global GPIO numberspace that assume a strict
> order of global GPIO numbers that do not change between boots
> and is independent of probe order.

The new proposal gets rid of the global numberspace all the same.

> To solve this and provide an ABI that people can use for hacks
> and development, implement a debugfs interface to manipulate
> GPIO lines that can do everything that sysfs can do today: one
> directory per gpiochip and one file entry per line:

[snip]

> The exact files and design of the debugfs interface can be
> discussed but the idea is to provide a low-level access point
> for debugging and hacking and to expose all lines without the
> need of any exporting. Also provide ample ammunition to shoot
> oneself in the foot, because this is debugfs after all.

I am afraid that if we go the debugfs route, we end up with
a solution that just needs maintenance, but doesn't win users
over.

The target audience is not developers doing interactive debugging
or development. It's embedded folks having init scripts which need
GPIO lines to stay requested or software like labgrid that needs
to login to a remote host outside of its control and needs to toggle
GPIOs.

These users won't consider an unstable debugfs interface.

Thanks,
Ahmad



-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

