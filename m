Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338CD4834EC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 17:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbiACQkv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 11:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39462 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231733AbiACQku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 11:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641228049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=j8y4yEmk0veKGavmME8mZr1dkwGPCQ0/MIQ1r8V5Sj8=;
        b=cC/5iztIvVvEUt4m0akIvl8fX5+PlTLu0OvW3DGkItI7YlhuV/5BBeuw4aSqN42f4THcYT
        ZUZ7rmMYTFvxXZ0uJC0RfZiJn/84/Sc1dcJCa8H8oVLL1Qg6XFxoRmWVZLt6UF0rA8VAqp
        qx14Ym/ATilj9viPzpFRfeqc0fQ6tnQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-vlPxIOSTNvmaRkpTC9mhnQ-1; Mon, 03 Jan 2022 11:40:46 -0500
X-MC-Unique: vlPxIOSTNvmaRkpTC9mhnQ-1
Received: by mail-ed1-f70.google.com with SMTP id h6-20020a056402280600b003f9967993aeso2422940ede.10
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 08:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=j8y4yEmk0veKGavmME8mZr1dkwGPCQ0/MIQ1r8V5Sj8=;
        b=b68DwQH75QJZplvshy5K7uIosqMYXyspNAOYEDe96eJft7TxeJ6B3tEWb8/XLtydrB
         cwVNZEV4fCgrf2059OfFQUWSZ0mkVCNHFzT0mkhqtNvL/Q3zG9cMm2i78ihmer0zwpaJ
         bgSHM3ZPNn6ad/cI5xdzqUUCQ/ePwbWngDOHCwg0JdPfCsUleLel6eW2rszwvVxs1WuU
         RnDbYpuShn3xgR2lper6dkkbfrP6TewY0aNXsA8MIarbVoQotRB4FnSB4nqfNtvFkwxp
         GzG0IhHMif9Wr49pcxms4IWjrAulX038QV7ywFBmWwxknmQ+Qq7e4Zv6LeF9iZw9IohE
         j/fQ==
X-Gm-Message-State: AOAM532++3tP3CxXvt23Gzmy2GlgUgajK17THQ8sXFlOyoF3sAn68xhb
        3iGFX8bqs3k3fZ5NTjjrCAGXQc47SxiCTZRQtK5IFddaO684gEp1SKX2UNq5WTIJkdNasb+ygSD
        tNVovGEhljjlG3BQoeUXpQg==
X-Received: by 2002:a17:907:1b21:: with SMTP id mp33mr35409656ejc.580.1641228044995;
        Mon, 03 Jan 2022 08:40:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV/r7AVm/yXXQbGnttDc1pHtYtygOtr5NXDhvkbmFxYXvQzGrwRsC1jB20EYpHx/3pBiEd1g==
X-Received: by 2002:a17:907:1b21:: with SMTP id mp33mr35409643ejc.580.1641228044783;
        Mon, 03 Jan 2022 08:40:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id n8sm11590981edb.41.2022.01.03.08.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 08:40:44 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------qvz3dsMh0DXQsGWK0un8s7GS"
Message-ID: <c29e98f5-c8e4-1967-a249-a461776488ad@redhat.com>
Date:   Mon, 3 Jan 2022 17:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
 <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
 <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------qvz3dsMh0DXQsGWK0un8s7GS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/3/22 13:34, Jarkko Nikula wrote:
> Hi
> 
> On 1/3/22 12:42, Hans de Goede wrote:
>> Hi Jarkko,
>>
>> On 1/3/22 10:42, Jarkko Nikula wrote:
>>> Hi
>>>
>>> We have a Braswell based preproduction HW. I noticed linux-next tag next-20211224 doesn't boot on it due to following error:
>>>
>>> [   34.674271] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>>> [   34.682476] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>>> [   34.690681] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>>> ...
>>>
>>> Linux v5.16-rc8 is ok. I found the following commit to be reason for the regression:
>>>
>>> bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused")
>>
>> Thank you for the timely headsup about this.
>>
>> I assume that you have tried a revert (if necessary including reverting some
>> of the follow ups) and that reverting the patch you point to fixes the
>> issue, right ?
>>
> Yes since linux-next has only these three commits below to pinctrl-cherryview.c that are not in v5.16-rc8 I reverted them one by one. I often try these kind of simple steps before going to more labor git bisect :-)
> 
> db1b2a8caf5b pinctrl: cherryview: Use temporary variable for struct device
> 07199dbf8cae pinctrl: cherryview: Do not allow the same interrupt line to be used by 2 pins
> bdfbef2d29dc pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused
> 
> I also double checked by checking out to bdfbef2d29dc and tested that commit and it reverted.
> 
>> Can you try the 2 attached patches *one at a time* ? :
>>
>> 1. Restores the old behavior of just triggering hwirq 0 of
>> the pincontroller-domain when we don't know the mapping
>>
> Patch 1 does work and here's the output from modified error print:
> 
> [   13.550781] cherryview-pinctrl INT33FF:00: interrupt on unmapped interrupt line 0
> 
> If you want to go with patch 1 you may add my
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> 
>> 2. Restores the old behavior which allows chv_gpio_irq_startup()
>> to overwrite the interrupt-line to pin mapping if the current
>> mapping points to pin 0
>>
> Patch 2 alone doesn't:
> 
> [   24.977116] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   24.985314] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   24.993513] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> ...

Ok, that is good news actually, I was already hoping that patch 1
would fix things.

>> Both of these restore old behavior caused by a mapping-table
>> entry containing 0 meaning both unset as well as HWIRQ0
>> before the patch in question.
>>
>> If applying them one at a time does not help, please also try with
>> both applied.
>>
>> These 2 patches should apply cleanly on top of linux-next.
>>
>> If patch 2 fixes things it would be interesting if you can grab a
>> dmesg with "pinctrl-cherryview.dyndbg" added to the command line
>> (with the patched kernel).
>>
> With both applied it does work:
> 
> # dmesg |grep cherryview-pinctrl
> [   15.465425] cherryview-pinctrl INT33FF:00: interrupt on unmapped interrupt line 0
> [   16.562282] cherryview-pinctrl INT33FF:03: using interrupt line 0 for pin 81
> [   17.824905] cherryview-pinctrl INT33FF:02: using interrupt line 0 for pin 22
> [   17.835757] cherryview-pinctrl INT33FF:03: using interrupt line 2 for pin 77
> [   17.850170] cherryview-pinctrl INT33FF:00: using interrupt line 0 for pin 76

Oh, that is actually interesting, this is a per gpio controller thing, so if we
filter on the controller then we end up with:

[   15.465425] cherryview-pinctrl INT33FF:00: interrupt on unmapped interrupt line 0
[   17.850170] cherryview-pinctrl INT33FF:00: using interrupt line 0 for pin 76

So we do eventually get an IRQ request for a pin using the GPIO controller
internal interrupt-line 0. But the IRQ triggers at least once before then and
even though we haven't set a handler yet, calling generic_handle_irq for the
GPIO-chips irqdomain, offset 0 IRQ does manage to silence the interrupt.

I've been tracing this through the kernel code and AFAICT we end up in:

arch/x86/kernel/irq.c: ack_bad_irq() in this case:

Which means that this message should show up in dmesg:

        if (printk_ratelimit())
                pr_err("unexpected IRQ trap at vector %02x\n", irq);

Can you confirm this? Also can you share the full dmesg output of this
device (with both patches, with dyndbg option) ?

###

Note what we are seeing here is basically a spurious IRQ. Except on a few
known broken devices the cherryview pinctrl code relies on the BIOS having
configured things so that there are no spurious IRQs. I've attached a
quick hack which activates the workaround for known broken devices
unconditionally. This replace my previous 2 patches. I expect this to
fix things too.

If you can make some time to give this one a test too that would be
great, then we have some options on how to fix this :)

Regards,

Hans


--------------qvz3dsMh0DXQsGWK0un8s7GS
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-pinctrl-cherryview-Hack-to-try-and-workaround-linux-.patch"
Content-Disposition: attachment;
 filename*0="0001-pinctrl-cherryview-Hack-to-try-and-workaround-linux-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0OGM3MzliMTAyMDUxYjcxYTlkNGRlMmQxMjhmNGYyNjMzY2Q2NjhkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDMgSmFuIDIwMjIgMTc6MzE6MzYgKzAxMDAKU3ViamVjdDogW1BB
VENIXSBwaW5jdHJsOiBjaGVycnl2aWV3OiBIYWNrIHRvIHRyeSBhbmQgd29ya2Fyb3VuZCBs
aW51eC1uZXh0CiByZWdyZXNzaW9uCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJs
LWNoZXJyeXZpZXcuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvaW50ZWwv
cGluY3RybC1jaGVycnl2aWV3LmMgYi9kcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1j
aGVycnl2aWV3LmMKaW5kZXggNjgzYjk1ZTk2MzlhLi4yZWU5MzNjNjMwNGEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJsLWNoZXJyeXZpZXcuYworKysgYi9k
cml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1jaGVycnl2aWV3LmMKQEAgLTE1NTgsMTMg
KzE1NTgsMTMgQEAgc3RhdGljIGludCBjaHZfZ3Bpb19pcnFfaW5pdF9odyhzdHJ1Y3QgZ3Bp
b19jaGlwICpjaGlwKQogCSAqCiAJICogU2VlIGFsc28gaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTc5NTMuCiAJICovCi0JaWYgKCFwY3RybC0+Y2hp
cC5pcnEuaW5pdF92YWxpZF9tYXNrKSB7CisvLwlpZiAoIXBjdHJsLT5jaGlwLmlycS5pbml0
X3ZhbGlkX21hc2spIHsKIAkJLyoKIAkJICogTWFzayBhbGwgaW50ZXJydXB0cyB0aGUgY29t
bXVuaXR5IGlzIGFibGUgdG8gZ2VuZXJhdGUKIAkJICogYnV0IGxlYXZlIHRoZSBvbmVzIHRo
YXQgY2FuIG9ubHkgZ2VuZXJhdGUgR1BFcyB1bm1hc2tlZC4KIAkJICovCiAJCWNodl9wY3Ry
bF93cml0ZWwocGN0cmwsIENIVl9JTlRNQVNLLCBHRU5NQVNLKDMxLCBjb21tdW5pdHktPm5p
cnFzKSk7Ci0JfQorLy8JfQogCiAJLyogQ2xlYXIgYWxsIGludGVycnVwdHMgKi8KIAljaHZf
cGN0cmxfd3JpdGVsKHBjdHJsLCBDSFZfSU5UU1RBVCwgMHhmZmZmKTsKLS0gCjIuMzMuMQoK

--------------qvz3dsMh0DXQsGWK0un8s7GS--

