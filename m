Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA892226A4
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 17:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbgGPPPj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 11:15:39 -0400
Received: from smtpcmd0756.aruba.it ([62.149.156.56]:56406 "EHLO
        smtpcmd0756.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbgGPPPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 11:15:38 -0400
Received: from [192.168.1.134] ([93.146.66.165])
        by smtpcmd07.ad.aruba.it with bizsmtp
        id 3rFa2300k3Zw7e501rFbtF; Thu, 16 Jul 2020 17:15:36 +0200
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
 <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
 <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com>
 <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com>
 <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com>
 <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com>
Date:   Thu, 16 Jul 2020 17:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1594912536; bh=qy5xLzSkwvbiXuF4Doc3vE85SLMXhiSmCMUGxe7lEAo=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=O/bURHF4YZkhL3M3e7FVw9aVfhSpM/+isp0AWb9s/JkujpZIQoh6MgwesQhn2MptH
         lEgiBqfiDwQNlo3/Azgv/1uBNGbem4WmnYdDAwuGAZVQmk/zGHRwx8h6ofMXkegYOw
         mNBs8qG+QtQmRfwf8q5kIbd9wEjmpmN7g00ySqVw2MDBRZZ+spmb/1HINlXJLoQOh6
         /OOqAEDVsP4GwhZEkgFoxApyga6fY7CwLdekscn3m4SW7bEbWqMqxDT/Bw8ee9MRxn
         jjaISL5dENHohDyzZ/dsbQWAorKhj96FHmtLa+efVGy4itf3Bkut+q9Ptoqyzn6O32
         6jzjkCoevT0vg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/07/2020 15:38, Linus Walleij wrote:
> On Tue, Jul 14, 2020 at 4:01 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
> 
>> I see... however attached is a new version of my proposal patch
> 
> I looked a bit at this!
> 
> IIUC the idea is a "new" sysfs interface that does not require the exporting
> etc used by the current "old" sysfs interface. Instead of poking around in
> sysfs to export lines we do that from the device tree.

Yes.

> It also does not use any global GPIO numbers which would be my other
> main concern.

Exactly, the idea is to have "names" that describe the IO lines to the userspace
and a way to fix their usage in each board in the device tree. If a board has a
relay line is a non-sense allow users in the userland to use it as an input line.

> I must admit that it has some elegance to it. Especially when it comes
> to scripting.

:)

> The problem I see is that lines are left in whatever state they were in
> if a script crashes, so there is no "return to the initial value" that was
> there when the GPIOs were picked from the device tree. This makes
> this a bit fragile.

I see but this interface is not designed for such complex usage nor to compete
with the current character interface! It is designed to allow boards
manufactures to "describe" some I/O lines that are not used by any driver in the
device tree, and that users may desire to manage in a very simple manner. Let's
thing about relay lines, or just a locked/unlocked input line which can be
easily polled.

> Also users regularly need to listen to events. This interface can and
> should never support that, for this one must use the character device,
> which will of course not work in parallel with using this sysfs ABI.
> And the day someone wants that we simply have to say no. There
> is no way to hold states for event handling in a stateless ABI.
> 
> Well of course they can poll for a line to change, but that is not
> proper event handling that reacts to an interrupt.

Again, the basic idea is not to compete with the current character interface nor
to manage interrupts lines, but just to have a really simple way to describe
those I/O lines which at the moment has no name nor references within the device
tree.

> So while this is much more elegant the old sysfs ABI, and certainly
> better for scripting, it still suffers from some conflicts with
> the character device, and there is a risk to make users dissatisfied
> when they want to e.g. script event handlers.
> 
> What are your thoughts on this?

Regarding the event handlers we can add irq supports... however I prefer to keep
this interface really simple just to not be confused with the character interface.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
