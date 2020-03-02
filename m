Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E9D175795
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 10:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbgCBJrD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 04:47:03 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32982 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727490AbgCBJrC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 04:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583142421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7xMIqGq0tmEuuWD9+M+D+t1F1wORPhrl0ly3x5s1ae8=;
        b=iWWEOC6clZSsr33rbLQ7s0dLW+yTW2l3NvYeOUbIN6gwbKWuDUrW4w1NDp3Yg622zn1VMC
        clfUXAdIFHhuS1nDlPlYVvfU7TvRg6lrpztAroFXgkS22AJWDzYK/VDFiOl/4pW2DpR8Pu
        b2ezEk27Pp4pNZZEQNo9xK7+QpWXf6Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-FyGjsUyVO8egLkAAbicXDg-1; Mon, 02 Mar 2020 04:47:00 -0500
X-MC-Unique: FyGjsUyVO8egLkAAbicXDg-1
Received: by mail-wr1-f71.google.com with SMTP id n12so5538583wrp.19
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2020 01:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7xMIqGq0tmEuuWD9+M+D+t1F1wORPhrl0ly3x5s1ae8=;
        b=WKtYFzN6lKKc4sRvX9hhWCxy+Q0AqG29tMAuC86Jvl0qJrgLHVg1VbQmP4N94b04Ec
         nM+SxfjwuhTQKGOnsZ687Pzl93IVYjfb0atAmQgMnlwqHAssZi+HSgqCOUriBrNsaNKO
         jiQ0yjJG0yZQ8YJTkPmYyLPXSLSbWMpYruu+jrjULKIm80TgiZthGP/MehmyxqzJwjRH
         bBhZDVdDidIs9pcW9juM7PrLhtS09eLuUOW+iRfEIhuvXAC3XcHX+S3BumVYAuSxBjIf
         liv06xAc2U8g/jhE5QgTG43gq0WP7KOO9JjbWutxx1ymCibgM+NTRs9yz8rNx3K/oDWr
         zDKA==
X-Gm-Message-State: ANhLgQ2kF24Zgpk2ypYJ89d5NgIivkKd5ZgADwO/H/MlNCESwHM+SFqK
        3Il2mwPNRExHBsCV+e3el7e6WnCmSJe6mPPPz91MjPCvQBqlV7AH3dh7Xpv212RV8qRweGx7Zh2
        2cpuHV/Wn0oSyt9pbBtEJEw==
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr2621201wmg.154.1583142419219;
        Mon, 02 Mar 2020 01:46:59 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuMX7qlu9du9wOCjDyVFC9IGEZy6ZjpRts0Jw9S7ERwzzs9hAEsQos336zobdeQ3jdKcMb1mA==
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr2621188wmg.154.1583142418983;
        Mon, 02 Mar 2020 01:46:58 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id f16sm17965573wrx.25.2020.03.02.01.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 01:46:58 -0800 (PST)
Subject: Re: [PATCH resend 2/3] gpiolib: acpi: Rename honor_wakeup option to
 ignore_wake, add extra quirk
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Lehmann <schmorp@schmorp.de>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
References: <20200225102753.8351-1-hdegoede@redhat.com>
 <20200225102753.8351-3-hdegoede@redhat.com>
 <20200225105437.GG10400@smile.fi.intel.com>
 <e0c39a89-bcac-4315-d764-5853eb77537d@redhat.com>
 <20200225123425.GK10400@smile.fi.intel.com>
 <20200225125700.GL10400@smile.fi.intel.com>
 <44cc5510-571c-21c4-1855-f3141f72eaa3@redhat.com>
 <ac38ee83-5edf-2ee0-8cec-a0b4367054a8@redhat.com>
 <20200302093038.GN1224808@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c187c90b-fe02-8dee-c37c-80d06feba566@redhat.com>
Date:   Mon, 2 Mar 2020 10:46:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302093038.GN1224808@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 3/2/20 10:30 AM, Andy Shevchenko wrote:
> On Sat, Feb 29, 2020 at 09:57:52PM +0100, Hans de Goede wrote:
>> On 2/28/20 12:22 PM, Hans de Goede wrote:
>>> On 2/25/20 1:57 PM, Andy Shevchenko wrote:
>>>> On Tue, Feb 25, 2020 at 02:34:25PM +0200, Andy Shevchenko wrote:
>>>>> On Tue, Feb 25, 2020 at 12:26:04PM +0100, Hans de Goede wrote:
>>>>
>>>>> Let's do it as a list of pairs, but in slightly different format (I see some
>>>>> potential to derive a generic parser, based on users described in
>>>>> Documentation/admin-guide/kernel-parameters.txt), i.e.
>>>>>
>>>>>      ignore_wake=pin:controller[,pin:controller[,...]]
>>>>
>>>> Another possible format
>>>>
>>>>      ignore_wake=controller@pin[;controller@pin[;...]]
>>>
>>> I like this one, the other one with the pin first feels wrong, the pin is
>>> part of the controller, not the other way around.
>>>
>>> I will rework the patch series to use the ignore_wake=controller@pin format.
>>
>> Just a quick note. I've changed the separator from ; to , for some reason
>> grub, at least as used in Fedora with Fedora's grub2 BLS (boot loader spec)
>> implementation does not like it when there is a ; in the kernel commandline.
> 
> Hmm... I think it would be harder then to have less possible formats in the
> command line. Do you really need right now several pins to be listed?

Yes, the existing quirk for the HP X2 10 with Cherry Trail SoC + TI PMIC,
which currently ignores wakeups on all pins needs to ignore wakeup on 2 pins.

> If it's about testing, perhaps we may do it with other means.

Well it is possible to pass the ; by putting quotes around it, so we could
go with the ; if you insist, but it really makes life harder for

>> I will also send an email about this to Fedora grub maintainer, but for
>> now it is easiest to just avoid the problem.
> 
> It's definitely bug in Grub due to existing kernel users with such format.
> It means Grub is unable to support kernel command line in full.

So I discussed this with the Fedora Grub maintainer, he says the problem
exists in upstream grub2 too, grub2 uses a shell like command syntax
both in its config file and in interactive mode, so if you do e.g.:

linux /boot/vmlinuz root=/dev/sda1 gpiolib_acpi.ignore_wake=INT33FF:01@0;INT0002:00@2

Then grub will see the INT0002:00@2 as a new separate commaond, this should
work:

linux /boot/vmlinuz root=/dev/sda1 gpiolib_acpi.ignore_wake="INT33FF:01@0;INT0002:00@2"

But the recommended way to edit the cmdline is by editing /etc/default/grub and
then re-running grub2-mkconfig, which clears the quotes unless we escape them
and since grub2-mkconfig is shell script inside shell script inside shell script
I don't even want to think about how many times I need to escape the quotes.

TL;DR: Using ; in kernel commandline options makes life much harder for users
and as such is something which we should try to avoid.

I appreciate that you are trying to come up with a format for the option which
looks like existing options and I like the @ use, but using ; really is not a
good example to follow and IMHO that (not a good example / idea) trumps keeping
the syntax identical to an existing option.

Regards,

Hans



