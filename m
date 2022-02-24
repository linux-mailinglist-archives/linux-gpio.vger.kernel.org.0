Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15CC4C31DC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 17:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbiBXQvF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 11:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbiBXQuz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 11:50:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1DB21C74FD
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645721400;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5d5v5g/KURDWe0uo4rDGLo8uToSqpP6+d3Aa5ejBoSQ=;
        b=O8agahx7gBfNFvijOKmgclH37gj2MpgGVQVShW9IrGoTC+Eod9VTvG7zUqt/h/xhIBGEYb
        5KX/yckLmOy/qWHAV3HvqzfUL/We18ZFpDwAIRCYawaZXIWWUdWhezNBiTmyTJSluLxy+g
        s313h3+FqbLIYBj83OPOxdXjth3UKMc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-r3fm2eBYOF2W5DXwlmzUDQ-1; Thu, 24 Feb 2022 11:49:56 -0500
X-MC-Unique: r3fm2eBYOF2W5DXwlmzUDQ-1
Received: by mail-ed1-f70.google.com with SMTP id m11-20020a056402430b00b00410678d119eso964114edc.21
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 08:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5d5v5g/KURDWe0uo4rDGLo8uToSqpP6+d3Aa5ejBoSQ=;
        b=nJPL7BAMwfX/3b8+qwCOiaB3G5nXziWIchZ84ubb3ru34GaSxY0WEgZRzimqDsA7se
         L82VMTVtogp895KAV5gPFfmg1jfthFsxfqmW7dZOLv7oTSOlzt2isKNrZWKnSpNLZVQF
         FdOk84n/8JJIXb8jVQR1bDnPgm2yfKvrHcNJHUzFu1XKuGv9tRzq7wDQHcp4YqYCTSBC
         kXaprI8A/p/1FpoMBOsE9zEcjiELCGZ+eYyLJal2G31wc8yy67h/XSR9efHJa9Y1HqLS
         ica81mGA0JWq8CarT5pjThxmZLAI0QfopLGaKaHB10HD+YDd4UBry0wUNCutzOgslRv9
         xl6w==
X-Gm-Message-State: AOAM532a6/8jZ5BV7WQb1hWZn6OrE7BE88rymV30FcKVpq8hckOjfEBv
        IsSiVh0cjJJzHPBxDrtde5TMsMU9hlnqpW90x/75CI9HA/irz6MHRQoP/yP+HFYIVhs+u4STbka
        PkEkBR11zzCmIYC5FQNQyhA==
X-Received: by 2002:a05:6402:2686:b0:412:d1cb:a6d8 with SMTP id w6-20020a056402268600b00412d1cba6d8mr3179182edd.280.1645721395635;
        Thu, 24 Feb 2022 08:49:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNAeM7yFukA4NuAEUTFYRdZ7RxfC7vPutD0j3WScBbyg5USbJ/ySiwnAhgD7kEpDtRKpx/Ug==
X-Received: by 2002:a05:6402:2686:b0:412:d1cb:a6d8 with SMTP id w6-20020a056402268600b00412d1cba6d8mr3179166edd.280.1645721395484;
        Thu, 24 Feb 2022 08:49:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b2sm1626913edr.44.2022.02.24.08.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:49:54 -0800 (PST)
Message-ID: <85474eb8-8fe3-2aa7-5619-fd7ee98da498@redhat.com>
Date:   Thu, 24 Feb 2022 17:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/5] platform/x86: x86-android-tablets: Fix EBUSY error
 when requesting IOAPIC IRQs
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-3-hdegoede@redhat.com>
 <YhZLI40Vukgv+PPO@smile.fi.intel.com>
 <9cda0c14-8108-fb42-4464-36a2fde0ffda@redhat.com>
 <YhZU6rDSYPG3pUbx@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZU6rDSYPG3pUbx@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 2/23/22 16:38, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 04:16:42PM +0100, Hans de Goede wrote:
>> On 2/23/22 15:56, Andy Shevchenko wrote:
>>> On Wed, Feb 23, 2022 at 02:31:50PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>>  	case X86_ACPI_IRQ_TYPE_APIC:
>>>> +		/*
>>>> +		 * The DSDT may already reference the GSI in a device skipped by
>>>> +		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
>>>> +		 * to avoid EBUSY errors in this case.
>>>> +		 */
>>>> +		acpi_unregister_gsi(data->index);
>>>
>>> Perhaps a warning (or at least debug) message?
>>
>> The function returns void, so we cannot check if it did anything or not.
> 
> Another approach may be to try to register GSI and if fail, try unregister
> and register again?

Since we only run this on boards where it is specifically enabled and it
thus has been tested to be safe I believe that that needlessly complicates
things, so I'm just going to merge this as is.

Regards,

Hans

