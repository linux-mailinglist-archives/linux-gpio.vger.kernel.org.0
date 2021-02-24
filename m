Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE8B32476D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 00:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236168AbhBXXOz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Feb 2021 18:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234728AbhBXXOy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2021 18:14:54 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B68C061574;
        Wed, 24 Feb 2021 15:14:14 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id t1so871022qvj.8;
        Wed, 24 Feb 2021 15:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A3g1rPz4Z5wHrOBN/vss/tpJg+Tks75zY0bAsuzFhro=;
        b=PzIo4dPGMVWTNOWmnpG1518sEWdaWNVd+7FrLobTTK7tQGFjV+bC6PPsoxmmTXzzoe
         sr8A7DK9itHpE6DHM1av8OZzTu7O9/NsT2+wMajPfPELgrdCf9wBSTgx0AO/iuMJDXrP
         ITFBcab6RrNFedl9T5/SxgC9FxudLIG4JeMxncLLzrxMTZi7V2MKjjGvCh78hEEHUYPv
         2E0cgaS/OT6xG+QdX1/ZiGTN8gZZX7xc9PexJRPKv1h+q7/+RH2HRkm5I2a17Te2MUSW
         hS5nRgW3eaksqn34WjNgTyivL1QxA0OR+M73blQb5sPK2pLZ8w9CSZDh3dghMK+uSSjN
         Nh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A3g1rPz4Z5wHrOBN/vss/tpJg+Tks75zY0bAsuzFhro=;
        b=ryd3X77i6tiDmtUb+o80hDQug5H7QxSJQKObkeLrtkxhjTySvBk8fjwqJ+Gm/fFj15
         SRvTFV/WyJq7iihSJ8SzE5ibicbylUGF8dou9XEq+Xv6KuJWc94GTtJdX9B6QCZBsVfA
         AhV6PD0Fn1GCLvYhMnjaaJZw4bnqFIqJ6xwpPgwVdwd/PZZ61woieO+PI+QZV/m53V/h
         sdW4FAq1RemmW9gTJrqmiKTBlBW9Ubqd3Eew33osbt8JQsNu/kqQtqOHdx4mS3+swwfw
         mNiNOvrRxJwShVXzXI+GbVm3Efg6mpHO2XJWoDA2rx5D/o/F8HBro/L333bwyd2idPLm
         XM2Q==
X-Gm-Message-State: AOAM531clVZHX3mB1AA5PxvnYryZw0PNQiGQAm5iqRtJHmk61Np8Qdrb
        OvXPARyFrGP8DSRWtAB6fiA=
X-Google-Smtp-Source: ABdhPJx4shiVFjCPZin6lyLQRhwTsIspvusBSy1Sie/3lT+KgN1KvXQS+y0LVNEzUv0xoIbLIOeJOA==
X-Received: by 2002:a0c:ea87:: with SMTP id d7mr8985523qvp.27.1614208453271;
        Wed, 24 Feb 2021 15:14:13 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id n82sm2650938qkn.114.2021.02.24.15.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 15:14:12 -0800 (PST)
Subject: Re: RFC: oftree based setup of composite board devices
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20210208222203.22335-1-info@metux.net>
 <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
 <76bf0f7c-9477-f370-8fbd-ce8ef15188b1@gmail.com>
 <44b9b561-5e0d-6a1c-ca5d-4e9f6000884c@metux.net>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <89086c87-c730-ff35-3865-4cf145883a95@gmail.com>
Date:   Wed, 24 Feb 2021 17:14:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <44b9b561-5e0d-6a1c-ca5d-4e9f6000884c@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/24/21 7:00 AM, Enrico Weigelt, metux IT consult wrote:
> On 15.02.21 02:12, Frank Rowand wrote:
> 
>> Why not compile in ACPI data (tables?) instead of devicetree description?
> 
> The problem is a bit more complex than it might seem.
> 
> Let's take the APU2/37/4 boards as an example. They've got some aux
> devices, eg. some gpio controller, and some things (leds, keys, reset
> lines, etc) attached to it.
> 
> Now we've got lots of different bios versions in the field,
> enumerating only some of the devices. For example, older ones didn't
> even contain the gpio, later ones added just gpio, other ones just
> added LEDs (with different names than the Linux driver already mainlined
> and field-deployed at that time), but still other lines unhandled, etc, etc. etc.
> 
> A big mess :( And I can't ask everybody to do bios uprade on devices far
> out in the field (litterally open field, sometimes offshore, ...). So, I
> need a usable solution, that's also maintainable, w/o testing each
> single combination of board, bios, etc. IOW: without relying on bios
> (except for board identification)
> 
> OTOH, I'm also looking for a solution get rid writing those kind of
> relatively huge board drivers, that pretty are much like old fashioned
> board files from pre-DT times - just made up of lots of tables and
> a few trivial register-something calls. Sounds pretty much like the
> original use case of oftree.
> 
> The primary difference between classic oftree and this scanario:
> * this is additional to existing platform information, which is
>   incomplete or even incorrect (and that can't be fixed)
> * extra carrier boards that are detected by other means, but no
>   enumeration of the devices on it.
> 
>>> This is something I've wanted to see for a while. There's use cases
>>> for DT based systems too. The example I'd like to see supported are
>>> USB serial adapters with downstream serdev, GPIO, I2C, SPI, etc. Then
>>> plug more than one of those in.
>>
>> My understanding from the past is that the experts (those who understand both
>> devicetree and ACPI) regard trying to mix devicetree and ACPI in a single
>> running Linux kernel image is insanity, or at least likely to be confusing,
>> difficult, and problematic.

Since you have persisted, a more referenced and emphatic "no" to mixing ACPI
and devicetree:

  https://elinux.org/Device_Tree_Linux#mixing_devicetree_and_ACPI


> 
> Well, mixing different, overlapping data sources tends to be tricky. The
> same problem exists with the classic approach of hand-written board
> drivers. So there have to be clear border lines.
> 
> In my case (eg. apu2+ boards), the overlap is only that some bios
> versions enumerate the gpio chip, others even some of the gpio-based
> devices. I'm attempting to solve this by just kicking out those
> duplicate devices, if they exist. The alternative could be leaving them
> in an trying to bind the missing ones to them. But that would be really
> complicatd and needs to be well crafted for lots of different board and
> bios versions - a kind of complexity we wanna avoid.

So you want to use devicetree data to fix broken ACPI data.

Again, why don't you use data in an ACPI format to fix broken ACPI
data?

-Frank

> 
> My use cases are actually a bit easier than the average dt overlay
> cases, as I have almost no interactions with already existing devices
> (except that some specific devices have to be moved out of the way)
> 
> The original DT overlay use case, arbitrary expansion boards (eg. on
> raspi), are trickier, if the overlays shall be generic over a wider
> range of base boards (eg. same overlay for any raspi or odroid).
> This is something calling for an own (pseudo-)bus type that handles
> the correct probing ... I've hacked up something similar for the APU2+'s
> combined msata/usb/mpcie ports.
> 
> BTW: I've already been thinking of ways for internally transforming ACPI
> tables into DT data structures (struct device_node) at an early point,
> before probing. But that would be another research project with unknown
> outcome, and most likely a HUGE change. Not what I'm talking about now.
> 
>> From the devicetree side, I expect nightmares for me if devicetree and ACPI
>> are mixed in a single running kernel image.
> 
> Note that I'm not talking about arbitrary configurations. Just re-using
> existing device tree code to express things that are currently open
> coded C into DT.
> 
> It's NOT trying to boot an ACPI-based machine with DT. (which would be
> yet another research project)
> 
>> Multiple root nodes and disjoint trees both seem problematic.  Existing
>> subsystems and drivers expect a single cohesive tree.  Changing that
>> architecture looks to me to be a painful exercise.
> 
> Yes, it's not entirely trivial, but managable. My experiments seemed to
> work so far, and I couldn't see general blockers yet. Drivers usually
> expect certain sub-nodes, but haven't found any that expect their node
> being embedded in some other one. (maybe there really are some, but the
> likehood that they're applicable in these use cases looks pretty low).
> 
> 
> --mtx
> 

