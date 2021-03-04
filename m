Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F4E32DA72
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 20:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237508AbhCDTeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 14:34:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22179 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237333AbhCDTdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 14:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614886339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wrPAflFGNHOXutzM/wry07r42DdisR9sPKXbgj55UKc=;
        b=MOs5TDKo49Y0W9moDx9xJhLFiLJOLjMng8mls7+8c0uO3xUqNKurUKI4fLli4sxL4i2lQl
        9YsuSFuvmWHHcX0ZfrIE5ie1vdDAcK3Fv19em557TS8HPsEiXkYUhiS16lKWQDg2bHiDII
        gCpAVHb48phWGi2dWB0wGNOd1JGfRtQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-zVNEPTElOe-TNG6sq2LTWw-1; Thu, 04 Mar 2021 14:32:18 -0500
X-MC-Unique: zVNEPTElOe-TNG6sq2LTWw-1
Received: by mail-ej1-f69.google.com with SMTP id w22so12699264ejv.18
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 11:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wrPAflFGNHOXutzM/wry07r42DdisR9sPKXbgj55UKc=;
        b=eBhTnhqeGOWQ7WPbA/Q5yXOp1zbZtOVsHbGJqac9ZjBRkZFWVrdKWe2Zv9nMpN8PFR
         Xk+6Ch/e9nyji7KmeLPDvcq2oh0DVjeDnZrYGrblOTUwUCYaRldu1Wvtw9vwuXjKYla6
         ES79Nqf/5Cu/ZcKmz6+XgORpSuu6YjkwBPwVUiVMwKILObepB+9WzSa0V9gj/wUCHl0Z
         nCT8b0l/F1/rHvejXwH/UfGvzIGA9gClyG8D6Ml+LYt9hM/KD8XHh2RQ3EUPZf2HH+Jn
         oLvLjfiDABHriuDwVPY26NVmTj9UTZt3mJ4n/BdwNvkeGjOAMpgmNldMtYANYl7jZHzO
         NQ7g==
X-Gm-Message-State: AOAM530INnza6s4mbOJjOd2+8Y15zchBjPwY77kdGhAmDtAckjQrPjzA
        0PmxWTXZDvQaAah9k/7si8QsvkylP8+w+rJ0Sj3POYaak9Ukc7+wVaiJ0spiaeyHctyeDkRCjm9
        GF2fsgW19dcWixt1AgTIeWQ==
X-Received: by 2002:a05:6402:646:: with SMTP id u6mr6302904edx.250.1614886336783;
        Thu, 04 Mar 2021 11:32:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuucKpF2WrPMi/NcdJCn1dAHIe6ryR+51VfWliz/aifrAH633s+zLkKmPjsJM9f4VsLejYqQ==
X-Received: by 2002:a05:6402:646:: with SMTP id u6mr6302888edx.250.1614886336593;
        Thu, 04 Mar 2021 11:32:16 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u14sm119725ejx.60.2021.03.04.11.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 11:32:15 -0800 (PST)
Subject: Re: [PATCH] gpiolib: acpi: support override broken GPIO number in
 ACPI table
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210226033919.8871-1-shawn.guo@linaro.org>
 <YD9bQXBD+9k3Lf/4@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2ed0d4dc-2756-9a55-3f54-1377732e35fc@redhat.com>
Date:   Thu, 4 Mar 2021 20:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YD9bQXBD+9k3Lf/4@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 3/3/21 10:47 AM, Andy Shevchenko wrote:
> On Fri, Feb 26, 2021 at 11:39:19AM +0800, Shawn Guo wrote:
>> Running kernel with ACPI on Lenovo Flex 5G laptop, touchpad is just
>> not working.  That's because the GpioInt number of TSC2 node in ACPI
>> table is simply wrong, and the number even exceeds the maximum GPIO
>> lines.  As the touchpad works fine with Windows on the same machine,
>> presumably this is something Windows-ism.  Although it's obviously
>> a specification violation, believe of that Microsoft will fix this in
>> the near future is not really realistic.
>>
>> It adds the support of overriding broken GPIO number in ACPI table
>> on particular machines, which are matched using DMI info.  Such
>> mechanism for fixing up broken firmware and ACPI table is not uncommon
>> in kernel.  And hopefully it can be useful for other machines that get
>> broken GPIO number coded in ACPI table.
> 
> 
> +Cc: Hans.
> 
> Hans, would appreciate your opinion on this thread. Maybe I'm mistaken in my
> conclusions.

So I've read the entire thread here:
https://lore.kernel.org/linux-gpio/20210226033919.8871-1-shawn.guo@linaro.org/T/#u

And I agree wih Andy, this is not something which should be fixed up in the
generic gpiolib-acpi code.

Note that we have similar things going on on x86 platforms. There are cases
there where there are e.g. holes in the GPIO ranges advertised by the Intel
pinctrl drivers. And in the beginning as i2c (and thus GpioIRQ) HID devices
started to become more common there were also several rounds of work to make
sure that the GPIO numbering (per ACPI-device / island) exported to the rest
of the kernel (and thus to gpiolib-acpi) matched with the numbering which
the ACPI tables expected (so the numbering which the Windows driver use).

It seems to me, esp. in the light that there are a lot of "crazy high" GPIO
indexes in the DSDT of the Lenovo Flex 5G, that the right thing to do here
is to fix the qualcom pinctrl/GPIO driver to number its GPIOs in the way
expected by these ACPI tables. This will break use of existing devicetrees,
so it will likely need to detect if the main firmware of the system is ACPI
or DT based and then use 2 different numbering schemes depending on the
outcome of that check.

Please also do not try ti fix this with some quirks in e.g. the i2c-hid driver,
I will definitely NACK such attempts. From what we can see now any fix clearly
should be done inside the qualcom GPIO driver.

Regards,

Hans

