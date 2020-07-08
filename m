Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5AC2182DE
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgGHIw5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:52:57 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:42107 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgGHIw4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:52:56 -0400
Received: by mail-ej1-f67.google.com with SMTP id f12so23294757eja.9
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 01:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KhNsqKOaKY4/9qXZOdlDFAmC8N1o8ni4gxG96lzYjd8=;
        b=EpemMS9CFHA6Ibrxq++JQwQvZ8FjsGtrkTgkpUrIhHA1qObVOXrABESFuMRc80wrBY
         MmpR3qYxpZUUcsbTqFtc3g89DuyHRkAzZTNZ+ChVVpCvlffX/S3oOZNLwzUPMarwDgK3
         +7fg/O5Nfu1Uha82KN7fJwVz+YdYwYkd/IgeCUOZgjgDBDSMZO6ncZo2RyLrKCzArUDW
         BGoRPVT/WBY7xDAj7yLZauuunV0Iw+7akCc3yXajVWdWWU9+H231raXy8V8tMcRRn4zB
         XJpNDLhgZoHQ9joicJz5EK2mByhjta2C0Afhc4vN5aA5cQv7mxCE9EkYElcmypPxvX7h
         /qaQ==
X-Gm-Message-State: AOAM532/YrbGLAZDTQ4UNd5yYjlBWk1bT2ALrxDWY7Xn+rDpZqAi2m2v
        rDqi6qgHqvW/eUSzdzHgfVQ=
X-Google-Smtp-Source: ABdhPJx2vOCnf1KkpQ8PpeVQ1pptWJXP1FQwtaGt2ThXnFeWJepTGzQnoZgLV7EtimRpYHvWUhGxRA==
X-Received: by 2002:a17:906:3b83:: with SMTP id u3mr49720833ejf.207.1594198374510;
        Wed, 08 Jul 2020 01:52:54 -0700 (PDT)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id se16sm1634130ejb.93.2020.07.08.01.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 01:52:53 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
Date:   Wed, 8 Jul 2020 10:52:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08. 07. 20, 10:23, Hans de Goede wrote:
> Hi all,
> 
> On 7/8/20 9:47 AM, Linus Walleij wrote:
>> On Wed, Jul 8, 2020 at 9:18 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>
>>> I installed Linux on UMAX VisionBook 10Wi Pro. It sometimes boots, but
>>> even then it encounters lags, soft lockups:
>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:0H:6]
>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [kworker/0:2:133]
>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>
>> Adding Hans de Goede to Cc, he often deals with this kind of weirdness
>> so he might have some ideas here.
> 
> Thank you for looping me in Linus. I've read up on the rest of the
> thread in the archives.
> 
> So looking at this:
> https://www.umax.cz/umax-visionbook-10wi/
> 
> This device appears to be a pretty standard Cherry Trail based 2-in-1
> with detachable keyboard. Which usually means (with all the hw-enablement
> I've been doing the last 2 years for these) that it will just work.
> But no such luck this time it seems.

Hi,

It seems to be Baytrail.

> What I find interesting / weird is that you (Jiri) get an active
> (/sys/bus/acpi/devices/INT3496\:00/status != 0) INT3496 device at
> all. That typically only happens when the BIOS thinks you are booting
> Android.

15 that is.

> Now you may think that Android == Linux so that should be good,
> but Intel did a real frankenstein solution for Android X86, see:
> https://github.com/intel/ProductionKernelQuilts
> for all the 5000 downstream patches in al their glory (hint your
> life will be better if you don't take a look).
> 
> The much saner support for these devices which eventually got added
> to the mainline kernel actually works much better with the "Windows"
> profile of the BIOS, since the mainline code expects sane ACPI tables
> and the Android targetting ACPI tables are a bit of a mess.
> 
> So the first thing to do is to go into the BIOS setup and see if
> there is a setting for this (this depends on if the BIOS is
> unlocked and has like a gazillion settings, or if it is locked
> to only show a few settings).
> 
> I just checked on one of own CHT devices and there the option is
> under Advanced -> System Component -> OS IMAGE ID

I had/have:
Advanced
  -> Droid boot = disabled
  -> Android boot = disabled
  -> OS selection = Windows 8.x (there is also GMIN and Android to select)

So there seems nothing I should change?

> I would expect the INT3496 device to disappear when you do
> this (it will be replaced by an ACPI event handler for the
> USB id pin GPIO, so I guess we might change one interrupt
> storm for the other).
> 
> Also can you put an acpidump of this device up somewhere,
> or send me a private email with it ?

Sure:
https://paste.opensuse.org/view/raw/79423338

> Regards,
> 
> Hans
> 
> 
> p.s.
> 
> As for adding your device's DMI id to the chv_no_valid_mask
> dmi table not helping. That is somewhat expected, that table
> activates a bug to work around an *IRQ* numbering problem
> for some older Chromebooks which use direct IRQ resources
> in combination with broken IRQ numbering. The chromebooks
> adjusted the ACPI tables to deal with a bug in the Linux kernel,
> then when we fixed the bug so that things would work with
> the gazillion Windows devices out there, we had to add the
> quirk to restore the buggy behavior for the chromebooks.

The bugs also suggest that this avoids storms thanks to different
handling in chv_gpio_irq_init_hw (if (!pctrl->chip.irq.init_valid_mask)
there).

thanks,
-- 
js
