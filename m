Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5066110283B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 16:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbfKSPjA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 10:39:00 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44632 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727505AbfKSPjA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Nov 2019 10:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574177939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FTxJmudlnMQQjRRxh/x/4NOPPe9JpTOrcw07y3bRZ+A=;
        b=Buu5uhqIVSdcMwUuLapNjtIbK5ZeVDAuijGLsfO5YVt/sG2Y/36Im8lxKmreRRCcGW1Dlj
        xivnMwPrECyjWEozuF2MOFFDbXSamCUncIygzdRMhMoJSkyybi2z9+pRpfZIHV7KzRP+Zy
        EKcvVlA7TBZ041NO9F5FCP2/Kg35fkc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-Y2EqaPCCMCuCRRbKeul1Sw-1; Tue, 19 Nov 2019 10:38:57 -0500
Received: by mail-wm1-f70.google.com with SMTP id v8so2463477wml.4
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 07:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RiyemL711+UTpgAFyILUw1P7Hb8w/e7oipbse+Ru6BU=;
        b=jcAu3rPCN1x+vX82gnUllGA5jo2F2qZ94PUis5zpNSyzHTiODcN5bo7+Mbtx01HMhV
         MfUUvwFLqNqh4a3iCI7NGWmKeGlUfwh7bReOzRa2QU88ecpKODez6/kLvM3YBc2yeArj
         x5sj5hdxpuDB9Aat4kZElIH5Mghiq5W8nkx1Az9rhbNPD8VMgZBgk3csqZGld0yK7jYQ
         dXJL054tm+d72zvXkohOl/qQuuBk1KBisXlZOzDYZH4wlkJQIfTv0i2UJER0TRgoPySq
         lVuxHYxc1BLa3vznQzCpKqxU4Kt9NZ7OOM2eE04vYl3K0nusQAezbt1kpMzHszZmi+S8
         kITw==
X-Gm-Message-State: APjAAAXeIPaVtCuTFYX93LVHRDRP8ms+e+ZH3Q5b7837U4IPsd5x/S0N
        EchIS33hQUUFGpo7XiYtk6KoJIyQWmcCJ5VjVL8JOG8PoD+X69CU6TstoaJcDMurq+pAmjvsUY5
        tZZOnI0vrBXmzm93deY+3Tw==
X-Received: by 2002:adf:f147:: with SMTP id y7mr30551742wro.236.1574177933984;
        Tue, 19 Nov 2019 07:38:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6k3t6w/uSt3UhXjSK9V5CC55Oxb8Mdl3qFb0ut7kzii8TvQiUjfOFUwcR8yIASWO9Qk1q3Q==
X-Received: by 2002:adf:f147:: with SMTP id y7mr30551714wro.236.1574177933754;
        Tue, 19 Nov 2019 07:38:53 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id o5sm27292840wrx.15.2019.11.19.07.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2019 07:38:53 -0800 (PST)
Subject: Re: [PATCH] ACPI / button: Add DMI quirk for Acer Switch 10 SW5-032
 lid-switch
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
References: <20191118153556.28751-1-hdegoede@redhat.com>
 <20191119082642.GF11621@lahna.fi.intel.com>
 <7a2ac981-1c28-5abb-0599-68da44675bdc@redhat.com>
 <20191119124411.GF32742@smile.fi.intel.com>
 <20191119125757.GJ11621@lahna.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <84e0ce18-500e-b45a-c77a-ad4cc35b1533@redhat.com>
Date:   Tue, 19 Nov 2019 16:38:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191119125757.GJ11621@lahna.fi.intel.com>
Content-Language: en-US
X-MC-Unique: Y2EqaPCCMCuCRRbKeul1Sw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 19-11-2019 13:57, Mika Westerberg wrote:
> On Tue, Nov 19, 2019 at 02:44:11PM +0200, Andy Shevchenko wrote:
>> On Tue, Nov 19, 2019 at 12:12:35PM +0100, Hans de Goede wrote:
>>> On 19-11-2019 09:26, Mika Westerberg wrote:
>>>> On Mon, Nov 18, 2019 at 04:35:56PM +0100, Hans de Goede wrote:
>>
>>> Working around this is not impossible, but it will be quite ugly and gi=
ven
>>> the age of the machine IMHO not worth it. I've also found out that I ne=
ed a
>>> DSDT override to be able to control the LCD backlight, this is controll=
ed by
>>> the 1st PWM controller in the SoC LPSS block, which is normally enumera=
ted
>>> through ACPI but the entire Device (PWM1) {} block is missing from the
>>> DSDT :|  Adding it from similar hardware fixes things and makes the bac=
klight
>>> controllable. TL;DR: it seems that this is one of the rare cased where
>>> people who want to run Linux will need to do a manual DSDT override :|
>>
>> If it's missing it's easy to inject entire block from EFI variable or us=
ing
>> ConfigFS (see meta-acpi project [1] for details).
>>
>>> When they do that override they can also fix the _LID method and
>>> then re-enable LID functionality on the kernel commandline overriding
>>> this DMI quirk.
>>
>> Yes, if you override entire DSDT it can be fixed for many bugs at once.
>>
>>> I will probably do a blog post on this (some people have asked me
>>> to do some blogposts about how to analyze DSDT-s, this will be a nice
>>> example) and add a link to the DSDT override to the blogpost, I believe
>>> that this is the best we can do for users of this device.
>>
>> Perhaps above mentioned project somehow can be extended to keep DSDT ASL=
 code
>> for overriding? Mika?
>>
>> [1]: https://github.com/westeri/meta-acpi/
>=20
> No objections.
>=20
> Maybe we should have a mechanism in the kernel that allows you to have
> ACPI table quirks like this for multiple different systems (based on DMI
> indentifiers perhaps) inside a single initrd and the kernel then loads
> tables only matching the running system. That would allow distros to
> ship these for broken systems.

I would love to have something like this, but I'm afraid that the distros
cannot just distribute modified DSDT's. I know we ask people to upload
acpidump's to bugzilla, etc. all the time. But one can reasonably argue
that that is fair-use (IANAL, TINLA). OTOH for something to be distributed
by distros we are going to need something a lot less handwavy wrt
re-dsitribution of these files, which AFAIK is impossible to get.

I had a discussion about this a while ago at my local hackerspace (*),
and someone there suggested to distribute patch files and have some
scripts which automatically generate an overlay by doing acpidump +
acpixtract + iasl -d + apply-patch + iasl -ta. This would then automaticall=
y
run at boot so that the next boot will have a fixed DSDT. Which is an
interesting concept if anyone is willing to work on it ...

Regards,

Hans




*) While working on fixing something which needed a DSDT override IIRC


