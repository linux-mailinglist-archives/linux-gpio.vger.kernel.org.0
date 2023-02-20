Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01BE969D093
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Feb 2023 16:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbjBTPZ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Feb 2023 10:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbjBTPZ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Feb 2023 10:25:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB904224
        for <linux-gpio@vger.kernel.org>; Mon, 20 Feb 2023 07:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676906618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h33QpU2sQY74X3dZjb0I9PsJ55yb0IogyONJ/LA7kLE=;
        b=F6vbPNN6QzXZDgSJQaFfRR7FgienWh7Iy8MTcns8UtjWNyXDxRbjJu1FEEKUllxe4ITE2G
        lSEU8RpqONInk3FQF9mNBFb0u5WfL4wfcIfzyznXKOHQ7sBZo0bweOHD1FT0qBGEof1oLI
        VX2riar354M2z9UETEu+9qZlQ6JRtFg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-v9CpR4MfMtuU-CmijVcFqg-1; Mon, 20 Feb 2023 10:23:36 -0500
X-MC-Unique: v9CpR4MfMtuU-CmijVcFqg-1
Received: by mail-ed1-f72.google.com with SMTP id x16-20020a05640226d000b004a6c2f6a226so1568669edd.15
        for <linux-gpio@vger.kernel.org>; Mon, 20 Feb 2023 07:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h33QpU2sQY74X3dZjb0I9PsJ55yb0IogyONJ/LA7kLE=;
        b=NfAfcolyFdpAX4BjCxLfs61jtcCgmo9cQPhNCL7GqTJmSkj1Q9XVtZF/Q8TZI1Hp9w
         C2BDcZuYU6dW0O9VitE46V3hUvBReskmRZXcjOGH/VWeUPt4eR4thyJKYi9n7Onywa2r
         n4f9f368u0kb5p2EGDnxEXb0coiiAZY/IhgfFaKaO2CV/8TEDTtS6UsdkAZxFBFbTufO
         yDXib/ngA3XEPXPhwK5gg7zCpfeaGbkXZPiXp0q93ww31qZmL5ZaJt8SeNoijbePChEj
         LquV0257oEg8Jno3a9EKdBD4n4bKp+0/pTvrykzDOwoCNfiYPWHP1/CKboSpbumNOyQ8
         5uHw==
X-Gm-Message-State: AO0yUKV03UU4rU6TArRKQ3265UroC+w13Yx9N51xjkE610nNVcm0Rd19
        GqRfyc1/Vmn5KO740p8YIP+fiiv1pa2qEEaEE5W7XS1h8uhyHtVn3geyIcennirCRc8qr1F8HUx
        PvHDZjR6zIOIMSlRTKZk1Ug==
X-Received: by 2002:a17:906:a96:b0:8b2:d30:e722 with SMTP id y22-20020a1709060a9600b008b20d30e722mr13207289ejf.3.1676906615666;
        Mon, 20 Feb 2023 07:23:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/is8kiVsIxIrj34LOkdjWIUDUkDTQOPoBW9AUTjP4DjWtW941e8IbkoolO+A/rwDAMUTOcpg==
X-Received: by 2002:a17:906:a96:b0:8b2:d30:e722 with SMTP id y22-20020a1709060a9600b008b20d30e722mr13207270ejf.3.1676906615372;
        Mon, 20 Feb 2023 07:23:35 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o15-20020a17090608cf00b008d398a4e687sm1384441eje.158.2023.02.20.07.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 07:23:34 -0800 (PST)
Message-ID: <e61c78ea-e2b8-8c7f-c55f-a500036982a1@redhat.com>
Date:   Mon, 20 Feb 2023 16:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] ACPI: x86: Introduce an
 acpi_quirk_skip_gpio_event_handlers() helper
To:     Andy Shevchenko <andy@kernel.org>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20230218103235.6934-1-hdegoede@redhat.com>
 <20230218103235.6934-2-hdegoede@redhat.com>
 <Y/N2/+UgH6MRUSOr@smile.fi.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/N2/+UgH6MRUSOr@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 2/20/23 14:34, Andy Shevchenko wrote:
> On Sat, Feb 18, 2023 at 11:32:33AM +0100, Hans de Goede wrote:
>> x86 ACPI boards which ship with only Android as their factory image usually
>> have pretty broken ACPI tables, relying on everything being hardcoded in
>> the factory kernel image and often disabling parts of the ACPI enumeration
>> kernel code to avoid the broken tables causing issues.
>>
>> Part of this broken ACPI code is that sometimes these boards have _AEI
>> ACPI GPIO event handlers which are broken.
>>
>> So far this has been dealt with in the platform/x86/x86-android-tablets.c
>> module, which contains various workarounds for these devices, by it calling
>> acpi_gpiochip_free_interrupts() on gpiochip-s with troublesome handlers to
>> disable the handlers.
>>
>> But in some cases this is too late, if the handlers are of the edge type
>> then gpiolib-acpi.c's code will already have run them at boot.
>> This can cause issues such as GPIOs ending up as owned by "ACPI:OpRegion",
>> making them unavailable for drivers which actually need them.
>>
>> Boards with these broken ACPI tables are already listed in
>> drivers/acpi/x86/utils.c for e.g. acpi_quirk_skip_i2c_client_enumeration().
>> Extend the quirks mechanism for a new acpi_quirk_skip_gpio_event_handlers()
>> helper, this re-uses the DMI-ids rather then having to duplicate the same
>> DMI table in gpiolib-acpi.c .
>>
>> Also add the new ACPI_QUIRK_SKIP_GPIO_EVENT_HANDLERS quirk to existing
>> boards with troublesome ACPI gpio event handlers, so that the current
>> acpi_gpiochip_free_interrupts() hack can be removed from
>> x86-android-tablets.c .
> 
> I'm wondering if we can teach acpi_gpio_in_ignore_list() to handle this.

You mean have it call acpi_quirk_skip_gpio_event_handlers(), or you mean
extend the DMI matchs inside drivers/gpio/gpiolib-acpi.c to cover these
cases ?

These devices with severely broken DSDTs already need a bunch of
other acpi handling quirks. So the idea is to re-use the existing
quirk mechanism for these to avoid having to have DMI match table
entries for a single model in various different places.

> P.S. Why do we lock an IRQ before checking acpi_gpio_in_ignore_list() and
>      why do we not free that if the IRQ is in ignore list?

The idea was to do the test after other things which can fail, so that
if there are other reasons to skip the GPIO we don't do the test +
dev_xxx msg.  But you are right, we should either unlock it when ignoring
it, or move the acpi_gpio_in_ignore_list() list check up.

I guess just moving the check up is better, shall I prepare a patch for this?

Regards,

Hans

