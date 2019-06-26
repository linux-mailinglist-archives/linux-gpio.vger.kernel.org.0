Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6645706B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 20:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfFZSQW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 14:16:22 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38811 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfFZSQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 14:16:22 -0400
Received: from [192.168.1.110] ([77.4.50.183]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MD9Kj-1hoguT0A41-0097SG; Wed, 26 Jun 2019 20:16:20 +0200
Subject: Re: [RFC] Addition of kernel
To:     Linus Walleij <linus.walleij@linaro.org>,
        Martyn Welch <martyn.welch@collabora.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel@collabora.com
References: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
 <e6ca74e2-fc51-3f24-c5e9-18c22d6f87ef@metux.net>
 <e344f5a35e314ebcea110ba082b74659de5b0e5e.camel@collabora.com>
 <CACRpkdaLEDmJ49m_fpuuA1e33hTtyB-LsyZeOmpRybbULgmHDA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <c80c67e8-ed4c-d4eb-9655-9fbb4a6a4cd8@metux.net>
Date:   Wed, 26 Jun 2019 20:16:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdaLEDmJ49m_fpuuA1e33hTtyB-LsyZeOmpRybbULgmHDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:stXr7zNxTEE19r3e55Uc/69AOoaWMzK9hvTEKeQrhGNUZctgZgH
 RkPBF3zwyHl2SVlLG31NGJI3nsRgIjtJQLL6kh3G3DqPq3+4XrylmxXF3NZN3M/8qGzggUe
 gVJ9P7NmUMlMVFmAPgdOTe5qrsaSaq2ijyQFjGEASFSZit3++YhxvISWhZZ2s5THGYkH49u
 3cqwXSZIaShhM7/uMK7Lw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HBZETcKOX04=:jpk5G5p50Lh7dbnRTjyPDE
 qLCsKvsfhYLYnaiBPj/kIMnUbNU9p/Vx+adwkfqMz7FFxG5IuZrojZnkI2x+fYap3kjwqHqAI
 QlDIYt68PPS3e5i6XCdYbdDFIUJ1re+NPPaHHYvsyAE0ZclIlh4OzJHDzrJb62cruERL+GM5o
 P9Bc6OJm75bUAYe+K63KKJX5NTbBbk5Nn5HVpfnblFSQlZJ7vvA77CZfIfDdpd96TDyf3P8VK
 Y7EuWX6uhX4EgRsmQ/dcZ9D94S8Oudobpulpt2onVwUc2zCKB7q+lPVr7rTahSLSrlXqS3uSR
 NLypxQvwY/m9HY58H9lOhEpZf1rbsJUoWughWcjuZDB94jbUGVPDZHmttowlOSrABIcwrWqIR
 4Cd0nj4FiWyhNYTxOOriYAmn02qtbg9ZrGM5WOjJ5n2VKnq/8JBE3Ua0bVXqCPvokZFpIJFQj
 UsUUsTGnWgARi6Hu7nKbF7eYBOPg5sgbwXxGfWVrQrON9WwWj6Tk8d94fcuqgyqhILEE/tR6T
 fjsdtEgHi4BNeMS0eckN6yg0rplreGNTUwNcin83wVGe+MgKixaoEs/X6LP5axAbqCIpVBYSW
 eWqjf+YIOMD62S82h0L/9ZN6sXNMQhcSHWGIGzS/Pld+Uy/uDKljTzLl87R1iUd8yG07EsU+E
 XGWqkJkH7cMt/HrJrTnwqUqklnZqDHJSxeEdeEg/o+jG2cr+bhpYtL/2OO15LhyxSV9ydGpPa
 rjAafVumaD8mj/z2Wk5oSCiDpLX5kUof4Vu1V8bxY4jcayzRI8pGBamaH0U=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24.06.19 23:46, Linus Walleij wrote:

> A GPS unit should be handled using the GNSS subsystem in
> drivers/gnss:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gnss

yes, since serdev we can also easily drive serial-connected devices
(which many gps receivers are) from inside the kernel. there're also
composite devices (eg. combined basebands) which also have gps amongst
other things, so an own subsystem for gps devices is the way to go.

> While we do encourage to use the right subsystems for this kind
> of stuff there are certain cases we do defer to be handled in userspace,
> but not many. These include one-off things like prototypes and

Those are cases which probably nobody wants to have special support
in the mainline kernel ... i recall some rules about no kernel drivers
without corresponding free userland ...

> factory lines with a myriad of relays (some PLC usecases),
> door openers (we don't want drivers/dooropener) 

Actually, I've got something like that in the pipeline: a generic relais
subsystem for anything that just switches on/off. Haven't gathered all
requirements yet - for now just abusing LED for that (yes, also actually
door openers). Okay, door openers could be a complex matter on their
own, depending on how it electrically/mechanically works - some devices
let motors spin until an end reached, etc. ... but haven't had an
actual usecase for putting such things into the kernel.

> or fire alarm button

Button -> input subsystem ?

> (but definately any elaborate IIO sensors
> goes into drivers/iio) so it is a bit on case-by-case intuition
> here.

yes, and it's primarily about high level functionality. in industrial
world we often have composite devices that span multiple subsystems.

I any case, for a good decision we need to know what exactly some
individual device actually does.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
