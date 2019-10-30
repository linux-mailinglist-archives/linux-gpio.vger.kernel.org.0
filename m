Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7248E9E49
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 16:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfJ3PD5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 11:03:57 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26027 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726741AbfJ3PD5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 11:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572447835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T9cOyKvG/sM34p2CDMALwor5dv8dCFAVSkqRIm0OqIU=;
        b=FlMNUce+B2O0xZEJM2ehR22M8XF0IZdEO6Y7h4+Y0YbKjtoauXzwQms6+oPkT5kP+aWblD
        YnPlB2FwZzdAEFjHbDaaEeN4hEvZkNu1Ndixf9FMqTr1LMsHe29YaNtNuQMndPAnupbUD7
        DhNLKZpoEZWtxwnlBEJmgfJr8w+jTTY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348--PIfKiRlO0y16zBAYyMXBQ-1; Wed, 30 Oct 2019 11:03:53 -0400
Received: by mail-wr1-f70.google.com with SMTP id q14so1501518wrw.4
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 08:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KYX5+/ZwVdBT9ZTuJFIzk+9jmIKo8EkKb8IVmvYh5yQ=;
        b=PSbirTOclLmalmz81lYVxqUtofy6czTGxDxYMeWx6Fa7abqBqEH0M+VZimrPrQexM3
         +T1q+0yo8VBxIQSrOXuJ7WeeBrPYm7cVgS8QijRKGmjEJKKJolPPvu3/7ByvRhTKY2sY
         V7uOZQeRb2eMY2vo2cbTGC1lVbfKYa3WCegm/+9ZWEESg0IxXTUXR516H6eSeWLxFLrD
         BZtBlGFt4b13usthvuQ4giqSFNzgzWtiy7nbNZKmQcL4uWlHw9vO4OIxzSowPVnWKmwT
         +wc1DfLvJ55RW1VXcl5uN6U3jDMYwwxLW1xb/sVotiSxdF+zCMH1U8RRFKRGnoFMaISM
         N1Rg==
X-Gm-Message-State: APjAAAU179xh113/A9yfWt8663HMezwt4472IQyul7gBZ6JTylfmJ6Pu
        lcBeAcS2sO3ixO3VNLJCW7Dy01pSy/DTrV45xQWCyfM4ppspPSAtyMcSyGji7FxYB24e9fIjyI7
        BOaNOOh9CiPdxP1cbZnvV6Q==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr9693056wmb.125.1572447832201;
        Wed, 30 Oct 2019 08:03:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2NcBeTMZCiFkNB8unnWVpY4kPDUfqhLzalYtKO1cKuaB81+76OXoCcsXWuN1A6V10rXRxRQ==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr9693032wmb.125.1572447832004;
        Wed, 30 Oct 2019 08:03:52 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id q25sm654132wra.3.2019.10.30.08.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 08:03:50 -0700 (PDT)
Subject: Re: [PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization
 to a dedicated callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
 <ddd33998-43c4-7772-16dd-c09c2184c51d@redhat.com>
 <CACRpkdboOodR4Ux-bNp+XcFkTtxA-QehtP6+H+RsfFk+h6OaXQ@mail.gmail.com>
 <cae76d3c-7a9d-2fdd-2899-b1a98cf0df78@redhat.com>
 <20191030144722.GZ32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <91c31940-e00f-9b93-860b-34f6d17491d4@redhat.com>
Date:   Wed, 30 Oct 2019 16:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030144722.GZ32742@smile.fi.intel.com>
Content-Language: en-US
X-MC-Unique: -PIfKiRlO0y16zBAYyMXBQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30-10-2019 15:47, Andy Shevchenko wrote:
> On Wed, Oct 30, 2019 at 02:11:50PM +0100, Hans de Goede wrote:
>> On 30-10-2019 13:42, Linus Walleij wrote:
>>> On Wed, Oct 30, 2019 at 10:31 AM Hans de Goede <hdegoede@redhat.com> wr=
ote:
>=20
>>>> TL;DR: commit 88583e340a0e ("pinctrl: intel: baytrail: Pass irqchip wh=
en adding gpiochip")
>>>> breaks a bunch of stuff and should be dropped from pinctrl/intel.git/f=
or-next
>>>> and this needs some more work before it is ready for mainline.
>>>
>>> I don't know if that is such a good idea if this is a global problem,
>>> like something that would potentially disturb any ACPI-based
>>> GPIO chip. We might leave something else broken even if we
>>> fix the issue locally.
>>
>> Right, I did a quick check and at least these x86 pinctrl drivers
>> all 3 have this ordering problem once the irq chip registration is
>> moved to the gpiochip_add_data() call.
>>
>> drivers/pinctrl/intel/pinctrl-baytrail.c
>> drivers/pinctrl/intel/pinctrl-cherryview.c
>> drivers/pinctrl/intel/pinctrl-intel.c
>> drivers/pinctrl/pinctrl-amd.c
>=20
> Hmm.. do we have cherryview broken in next / vanilla?

In 5.4-rc# the irq chip is still registered as a separate step
after the gpiochip_add_pin_range calls.

I'm also not seen any troublesome patches here:

https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/log/?h=3D=
for-next

>> And it seems that drivers/gpio/gpio-merrifield.c is already
>> suffering from this problem in 5.4!
>>
>> So some more generic solution would be ideal...

merrifield OTOH definitely seems broken wrt this (when looking at the code)=
.

Regards,

Hans

