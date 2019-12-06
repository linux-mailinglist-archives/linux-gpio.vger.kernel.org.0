Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8251156C3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfLFRvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:51:01 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:37399 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfLFRvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:51:00 -0500
Received: from [192.168.1.155] ([95.117.69.190]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MnaY1-1hwYUP3VcD-00jWXk; Fri, 06 Dec 2019 18:50:56 +0100
Subject: Re: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status
 changes
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20191127133510.10614-1-brgl@bgdev.pl>
 <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
 <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com>
 <0058e57c-5765-3944-3137-10b780985a36@metux.net>
 <CACRpkda-nucsM-b=68t5N2gQ7910G_a5Hz1cEwSNgVHgvJhqLA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <e642378f-11c2-9def-da75-4a03b5ef8f77@metux.net>
Date:   Fri, 6 Dec 2019 18:50:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda-nucsM-b=68t5N2gQ7910G_a5Hz1cEwSNgVHgvJhqLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:k+Cc2sODvJPuFhC9Uww1N2/vyzGbYzhZjQkxLf8X6RW99r2sP8o
 5y3WhOg7MBs1owGviMs/rS8ZAbWHIwri8TQmORs2OJ9SsrFAZiDWa2rc+TOCobGZHwaJfW8
 CE8g3L0I7q1LmZluqR+5xnjTmsrbct9zcJu6j7bFTj5iIzqpac9DSUxG76nSKr/zW43iSg4
 4LYGLt8pTyNrJ/OR00zgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OP82d5Glzrk=:sMnU0uCbD5H4SS7AeQ4p5J
 U5T70kCIzrrTqgYN24tvwAvXmydsAVuc+I44F3/jzFGUZAft/7kIrco+my9gCHV4EtatDGBDP
 7Bp6xRjVTSSQdBhw72SuSJhv4TfN4N/qeWgOrTrtrEG7ojvKdo7Gmv70vVnTP/wr92bjQ/NmB
 YhQnHw9cveizXN+Tm+3FJgrEAGqahKde+RWOdratDDUfm7CES3tFgXNxolMhXszMGogw9Suep
 ZyyGQ5XFxqFB5q2bDD+4F1yeKGK2rNWKmbqLt6whatJmWB1OKYSTFrxstjnnmnPG1bo1jqwOQ
 a8Xfz2V6RdUfEr45DrjiFFudDE7MZt87HLFN27YgXqv/gYZrE3dsj7wxVvnRPefo0XE8IZbXx
 Pt/A/Wk3ho2Y8NNNeSkiUCucGmK0XL9b3PIlf6heDdw0xOe0Q3ZVpLEEPaeO/eorYZYhtLbKn
 ztBqy+TMLIZz/Zg5wZxdPGi6WRrcJU58jsUuhRLntriDSP4foBcgVSfE5zpm6S15ZbOHtDgJU
 zn0Q4v9ImNJZAmLStx3SGolyaILYDmnmDvYnS8At4NUoNZjD+22TIhri4tlKuxNmwwMpHJr7X
 3gDATneAJnVcPCepGtwvgAlsZq/2tawgyEa+mvM/zBo8QFsQFCAJAM0f5WBA9C3FguCn+wAXo
 WKHHv5gVLNMitSNYMV7EfsuGZP8rgE/a5VMhc0d4NF9gyouSTmPHWhm8BG/bmwBx0ZF/PV+V7
 63q7ACC8LSWa2dTrEaMGmvb16Dl8tsi14cEAdnt/Z6vsEYBaHshsOyNF8cpsexlh7MzQg78QA
 OpWn+51PxKShLHq8ugSP11nXao8xJ4GIsbXXVjHuwC9x4zpjlQjHf7Po2/wbJC1rUbhHPYCI6
 n9J5R8Hyp8Tb3gORXwZg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06.12.19 16:44, Linus Walleij wrote:

> The main issue sysfs in its current form had to die was that it relied
> on global GPIO numbers. An alternative to the character device
> would be to use e.g. subdirs for each GPIO chip and export
> local offset numbers from there,

Yes, shouldn't be such a big deal. Maybe I'll find some time to fix
this. Another nice feature would be supporting gpio names for export
and unexport, as well as a file that lists all available gpios.

> but well we reached a fork in the road with the chardev I'd say.

Why can't we support both ? These two interfaces have different use
cases, neither one can replace the other one completely. The cool
thing w/ Linux is the configurability (once I've got some spare time,
I'll create some patches to make the chardev optional :p).

> The main problem solved with the chardev was that scripts that
> died/crashed left the sysfs nodes explicitly exported and
> populated and everything just in the general mess it was at the time
> the application crashed.

Yes, but this cleanup-on-close also could have been done in the old
interface. OTOH, there are use cases where you do not want this,
where sysfs interface is fine (eg. set up certain things in a boot
script, etc)

> Of course it is easy to pose things like that the application should
> register crash handlers or whatnot, but it turns out people weren't
> doing that and with a character device, then it cleans up automatically
> if the application dies or get terminated by a signal for example,

I don't question this usecase. Such automatic cleanup is indeed an
important feature. (even though I never had a practical usecase myself,
where I did go via raw gpios instead of binding some driver).

My bad feelings about chardev comes from entirely different angles, eg:

* not portable, not network transparent (needs special ioctl())
* needs a lot of more code in application side (yes: I also count in
  libraries :p)
* no access control for individual lines
* can't use filesystem (eg. symlinks) to assign application /
  installation specific (path)names, which individual programs can
  act on.

> I see your stance, but it also makes it much easier to shoot
> yourself in the foot.

Yes, you have to care about state tracking (even in error cases) on your
own. Typical issue for such lowlevel things. The optimal case would be
having higher level drivers (eg. led, keys, ...) to bind to, but we're
talking about use cases where that isn't an option.

> Nobody should. The users of userspace GPIO are factory lines,
> industrial control and automation, maker communities and odd
> prototypes. Not deployed products like phones or computers.

Unfortunately, the real-world is different :(

I've had many cases where folks we using raw gpios (with insanely huge
userland code around that) even for trivial things like leds, keys,
serial control lines, etc.

Okay, this isn't a technical, but an educational problem. Don't know
a good solution, except for either trying educate folks or just
ignoring them :o

> The typical cases involves rigging a few relays and sensors
> up in a lab to perform some automation, not dissimilar to e.g.
> PLC (programmable logic controllers) and such. The world is
> full of these one-offs, some in more expensive and intimidating
> environments than others. Some are the lab bench of a few
> select makers. Makers are not important to big capital and
> big business (who are not talking to us) but they are important
> to the community exactly because they are talking to us.

Yeah, expected you'll be saying that ;-)

That bad side here is, this stuff often is going into the field
this way. Seen that many times.

I believe the real problem is on a completely different layer: it's
still too hard (for non-kernel-hackers) to configure things like
platform devices. For DT-based systems we've got DT-overlays (already
solves the kernel side here) - but for non-DT (eg. ACPI) world, it's
ugly. And even worse: if things like gpios come in on probe'able
bus'es like PCI or USB, it gets even more weird.

So, IMHO; the actual topic we should concentrate on is dynamic
multi-level device provisioning / binding. Yes, it's a big topic, but
something I definitively have on my 2do list.


--mtx

---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
