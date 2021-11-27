Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CAE4601C6
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 22:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356382AbhK0VzO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Nov 2021 16:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49854 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356268AbhK0VxN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 27 Nov 2021 16:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638049798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v11i6WYFnjf6+MMSul6zJRPd1NxGAxbJfjDy/cK0J3Q=;
        b=cENo4P0BHGErAS71DGSyLJyFLLWa5LSM555TZ+pJNkKCaU5UHkc0/tGlpplFmSdkCSeqRb
        SP/jYfTIm0F12gDPmFxIX5OFSjoVR5Gh2FsLS0jDGlNqVHZ5nffL3jhccFQgj9ukeFqboR
        7Fn1VNdteW8uY24jGcAr2XkliFj/svE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-105-TShWB63OMEqOjHK0H1oIew-1; Sat, 27 Nov 2021 16:49:57 -0500
X-MC-Unique: TShWB63OMEqOjHK0H1oIew-1
Received: by mail-ed1-f70.google.com with SMTP id eg20-20020a056402289400b003eb56fcf6easo10483034edb.20
        for <linux-gpio@vger.kernel.org>; Sat, 27 Nov 2021 13:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v11i6WYFnjf6+MMSul6zJRPd1NxGAxbJfjDy/cK0J3Q=;
        b=uSrLERe+SiDRA3I1nv270j+e2m6QzywbPu42zsQYAGMrUFVq1ophg7O0ehxRbXRL1P
         uh9kl7OcOXefkAXOkwrgqr/7DDiUGnPe1ceoZSLUgVGrNQnqdO5WHlBP2UwNXHdL+Emi
         KQLExmx3qXrGRKjglZmHq823ljFKLk1+w8pRZ3QKrcsdfTn5J8bQhZZ9fjLLJhLhCiuT
         sDLRspTCaB4Hm728Eu3hLT5shAlU8D4nonw9+oEZYyPLL8OLTAxpzcp6DUzzUxmmn0+X
         xNC/yyKJy12ocjrUmqLBPVD4i1fWfdA2yww5pAkzGjI4O+KlmsIJDkfeBAtB+cak92l5
         dBIg==
X-Gm-Message-State: AOAM531rW9Ja8CUe2350OyxJtkHwsl+DOuS+vYNP2zdK9g9Il3d9EhjU
        d5wB/1/I8kqNt6o/LL+cmWnf6s9X72RA5bgLFSf377b/001ty+9Yrecf8cKxUhbDBt55dohXlig
        omuv8ZG5I8GK6iarJM6eXQg==
X-Received: by 2002:a05:6402:339:: with SMTP id q25mr57794124edw.251.1638049796059;
        Sat, 27 Nov 2021 13:49:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDP82NjMaATDJ9G/nvrxi0qD42C4gAFEEX1wwEo65oMnclTYNUQy/RBy2j+LOI7J05gRsOLw==
X-Received: by 2002:a05:6402:339:: with SMTP id q25mr57794111edw.251.1638049795926;
        Sat, 27 Nov 2021 13:49:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id sd2sm5624434ejc.22.2021.11.27.13.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Nov 2021 13:49:55 -0800 (PST)
Message-ID: <654fd7f2-6ac3-6c4b-9710-0e6360935aa0@redhat.com>
Date:   Sat, 27 Nov 2021 22:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 3/3] pinctrl: cherryview: Ignore INT33FF UID 5 ACPI
 device
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        Yauhen Kharuzhy <jekhor@gmail.com>
References: <20211118105650.207638-1-hdegoede@redhat.com>
 <20211118105650.207638-3-hdegoede@redhat.com>
 <YZY4wj5AHhzFSwdD@smile.fi.intel.com> <YaEjqxg8rX0njW6z@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YaEjqxg8rX0njW6z@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/26/21 19:12, Andy Shevchenko wrote:
> On Thu, Nov 18, 2021 at 01:28:02PM +0200, Andy Shevchenko wrote:
>> On Thu, Nov 18, 2021 at 11:56:50AM +0100, Hans de Goede wrote:
>>> Many Cherry Trail DSDTs have an extra INT33FF device with UID 5,
>>> the intel_pinctrl_get_soc_data() call will fail for this extra
>>> unknown UID, leading to the following error in dmesg:
>>>
>>>  cherryview-pinctrl: probe of INT33FF:04 failed with error -61
>>>
>>> Add a check for this extra UID and return -ENODEV for it to
>>> silence this false-positive error message.
>>
>> Hmm... Interesting. Why do they have it?
>> Give me some time to check this...
> 
> _DDN in ACPI describes this as Virtual GPIO. The only documentation at hand
> right now tells me that this is a "solution" to represent the "virtual GPIO"
> as fifth community (no connection to any pads, minimum configuration, etc).
> 
> The goal as far as I can see is "to convert a PME event generated by PCI device
> to a GPIO interrupt".
> 
> Seems like we better have a driver for it, but the only purpose of it is to
> generate interrupts based on PME.
> 
> I'll try to dig more may be next week, but for now I would like to postpone the
> patch. Do you agree?

Yes postponing merging this is fine. There is no hurry since this does
not fix anything broken. I just wanted to get rid of the annoying log message :)

Regards,

Hans

