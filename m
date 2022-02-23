Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF6E4C1653
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 16:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbiBWPRS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 10:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236100AbiBWPRS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 10:17:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E66865F86
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645629407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wJMzfMZTbOFeZJxgtRO31BM9K4FI9BB8cDLrW2mcBXI=;
        b=R6Etx88jkl+r+i9xgIE0Yu/cD6jUlDDIFDAl8tHklGq5/XjnnXSftIyV8hMMWvLirXdM0w
        IT/nyW8BXidcQIEdEV2OK7I799peP7xrDW59yw5UB3k7rXvOaI6YERdHiHvti+dqrLvHj9
        p95AAbfWhF6KNgIMjlBRB/uc3Q8oJ+A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-v6HvLO7WMbCYmMYgYK_bsg-1; Wed, 23 Feb 2022 10:16:46 -0500
X-MC-Unique: v6HvLO7WMbCYmMYgYK_bsg-1
Received: by mail-ed1-f70.google.com with SMTP id b13-20020a056402278d00b0041311e02a9bso4542424ede.13
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 07:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wJMzfMZTbOFeZJxgtRO31BM9K4FI9BB8cDLrW2mcBXI=;
        b=uT3tchjBVNwYztKO1k/VD61FdhsqBGlXVMiP3zPDHftKIeZo7gWnd2R5s1+18Ex6wj
         pQ0i3p1EQehehUPGq/f2FJPkUgDS0jeF4xXcB+DAJwII/YBXt5O1R1DhCXJXhpqDkYxz
         l5rL/d0QnZKnMINV6puzta1/WN0XqjP/TWQSwoKLDsEOjGDq++ZY/INXgtRgpyYC9TC0
         ptW7PwF7dpKgLEcUsdqUr1VZr7glxDncdByoGWCTo10QmWww/FpJ1DggXEhMrr2CBhY3
         SWczD7YW4eCI4W8QXigVtJblzpmsZpxHQhy4TY5INSU2YjgVwVDwhJ+5d7hXl+mxDvjD
         UcwA==
X-Gm-Message-State: AOAM531M7za1HOpbOuSHsSMjaCXcoImYvpXF2cvSw36/ZI8kGOXg6U4f
        qmFdecd956iYTMdDn0GkJmAYdwqxhFDmOk+c3bQm42DTEz5aeWA9wq1aTwlgQ7MJeFIRC+jhyXF
        TEtykuZOE0oehjSup2b7+SQ==
X-Received: by 2002:a05:6402:3553:b0:412:d0aa:e7b0 with SMTP id f19-20020a056402355300b00412d0aae7b0mr25149389edd.309.1645629404256;
        Wed, 23 Feb 2022 07:16:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzweXAUj12cZ6J1TzYUyKUhASrpoYGkrNOcll4D9CTEJhD37i7G97LC8viYuUsa2g0VGRd8yw==
X-Received: by 2002:a05:6402:3553:b0:412:d0aa:e7b0 with SMTP id f19-20020a056402355300b00412d0aae7b0mr25149373edd.309.1645629404116;
        Wed, 23 Feb 2022 07:16:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 23sm7882404ejf.175.2022.02.23.07.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 07:16:43 -0800 (PST)
Message-ID: <9cda0c14-8108-fb42-4464-36a2fde0ffda@redhat.com>
Date:   Wed, 23 Feb 2022 16:16:42 +0100
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZLI40Vukgv+PPO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 2/23/22 15:56, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 02:31:50PM +0100, Hans de Goede wrote:
>> Sometimes IRQs used by GPIOs in direct-IRQ mode are already registered
>> because they are used as ACPI "Interrupt () {}" resource for one of the
>> many bogus I2C devices present in the broken DSDTs of Android x86 tablets.
>>
>> This is an issue if the existing (bogus) ACPI resource uses different
>> trigger settings then what is being requested, leading to an -EBUSY
>> error return of acpi_register_gsi().
>>
>> Fix this by calling acpi_unregister_gsi() first, so that
>> the acpi_register_gsi() is allowed to change the trigger settings.
>>
>> In cases where the GSI has not been registered yet
>> the acpi_unregister_gsi() is a no-op.
> 
> ...
> 
>>  	case X86_ACPI_IRQ_TYPE_APIC:
>> +		/*
>> +		 * The DSDT may already reference the GSI in a device skipped by
>> +		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
>> +		 * to avoid EBUSY errors in this case.
>> +		 */
>> +		acpi_unregister_gsi(data->index);
> 
> Perhaps a warning (or at least debug) message?

The function returns void, so we cannot check if it did anything or not.

Regards,

Hans

