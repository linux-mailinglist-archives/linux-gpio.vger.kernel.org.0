Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153AF21821D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGHIXb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:23:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52163 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726006AbgGHIXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594196608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cs+maBdeihJ4IKr25ojJHWEu+TviCb3lQndUP/4ycEs=;
        b=PmZGZ0Tk9MV2Lzhe7J/o6M3dIGd+/eTdW3k/j8zDUIgw+ffZrvS8l53DJBD0uwaGwwMnFw
        UwDO7DJSPxVBvsxhwoyjZYs5tB+YTHIHTIYnmXyJHVp3+rnoiIcQLvA1nlUy1wvFp1vnTp
        /gV1b6yT5XlrECXbvYvTxEVjpXcCz1E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-mmhckwuDN1WZvYy-6YW7dQ-1; Wed, 08 Jul 2020 04:23:22 -0400
X-MC-Unique: mmhckwuDN1WZvYy-6YW7dQ-1
Received: by mail-ej1-f71.google.com with SMTP id c16so42506755ejb.22
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 01:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cs+maBdeihJ4IKr25ojJHWEu+TviCb3lQndUP/4ycEs=;
        b=NkQcdhLrRCrt2rWnbOR9ROuFH0oDVUIvoZ6mqVOd3uuJPw+ROqkkhnbqR9K4t+vGkm
         HDXLn3CyDsfkK3UI3thCNEyou5a+/YY8s+W4E56LD2ARhxG7CR3PEZiNbcnbFufnxVIV
         RW1uTpqrVYhYDSM5mvkAYcZTGid7dIGJXPHYbVzlc2l7i9XPG/Xw5NA8Kzrr52Bhw9a8
         64hDd6bFnO06013H214FlJNNNpu038vBNlyhhW+8aF75TGilbgmX0cFdmHdBKFqNySg8
         +KIj4VRb5KRfrkeZa5Xp7PKLLmipNUA4D/duJ0jLf3lVxGwrT3xLDoZEipprBzGBw/QF
         EoSw==
X-Gm-Message-State: AOAM533s83pbDIlVTaxQBTH0D/RbX4IaJ3asUCp3RsM5vR6FaVtxcjy4
        RyaqGZqpkndDWM3XQcF8uMrnh8etorxVg2pEvgmoxTUi4UBPNBmVcjBnXNoLiLp8BJjzXBzw2+x
        Fcl4/EGRC+9eY6da/evb6Tw==
X-Received: by 2002:a17:906:2799:: with SMTP id j25mr37387760ejc.466.1594196601697;
        Wed, 08 Jul 2020 01:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg2ygpxBlr/voqub1R/dAFeg5Rg7D1AhACv0B75Ob7jie7bqFqkFvnS9KceA7s8NKvlwb4wA==
X-Received: by 2002:a17:906:2799:: with SMTP id j25mr37387748ejc.466.1594196601449;
        Wed, 08 Jul 2020 01:23:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u19sm30654495edd.62.2020.07.08.01.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 01:23:20 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
Date:   Wed, 8 Jul 2020 10:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

On 7/8/20 9:47 AM, Linus Walleij wrote:
> On Wed, Jul 8, 2020 at 9:18 AM Jiri Slaby <jirislaby@kernel.org> wrote:
> 
>> I installed Linux on UMAX VisionBook 10Wi Pro. It sometimes boots, but
>> even then it encounters lags, soft lockups:
>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>> watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:0H:6]
>>> watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [kworker/0:2:133]
>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
> 
> Adding Hans de Goede to Cc, he often deals with this kind of weirdness
> so he might have some ideas here.

Thank you for looping me in Linus. I've read up on the rest of the
thread in the archives.

So looking at this:
https://www.umax.cz/umax-visionbook-10wi/

This device appears to be a pretty standard Cherry Trail based 2-in-1
with detachable keyboard. Which usually means (with all the hw-enablement
I've been doing the last 2 years for these) that it will just work.
But no such luck this time it seems.

What I find interesting / weird is that you (Jiri) get an active
(/sys/bus/acpi/devices/INT3496\:00/status != 0) INT3496 device at
all. That typically only happens when the BIOS thinks you are booting
Android.

Now you may think that Android == Linux so that should be good,
but Intel did a real frankenstein solution for Android X86, see:
https://github.com/intel/ProductionKernelQuilts
for all the 5000 downstream patches in al their glory (hint your
life will be better if you don't take a look).

The much saner support for these devices which eventually got added
to the mainline kernel actually works much better with the "Windows"
profile of the BIOS, since the mainline code expects sane ACPI tables
and the Android targetting ACPI tables are a bit of a mess.

So the first thing to do is to go into the BIOS setup and see if
there is a setting for this (this depends on if the BIOS is
unlocked and has like a gazillion settings, or if it is locked
to only show a few settings).

I just checked on one of own CHT devices and there the option is
under Advanced -> System Component -> OS IMAGE ID

If you have that option (or a similar android/windows toggle
elsewhere) try setting it to Windows and see if that helps.

I would expect the INT3496 device to disappear when you do
this (it will be replaced by an ACPI event handler for the
USB id pin GPIO, so I guess we might change one interrupt
storm for the other).

Also can you put an acpidump of this device up somewhere,
or send me a private email with it ?

Regards,

Hans


p.s.

As for adding your device's DMI id to the chv_no_valid_mask
dmi table not helping. That is somewhat expected, that table
activates a bug to work around an *IRQ* numbering problem
for some older Chromebooks which use direct IRQ resources
in combination with broken IRQ numbering. The chromebooks
adjusted the ACPI tables to deal with a bug in the Linux kernel,
then when we fixed the bug so that things would work with
the gazillion Windows devices out there, we had to add the
quirk to restore the buggy behavior for the chromebooks.

