Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0C2B4C3260
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 17:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiBXQ5s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 11:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiBXQ5r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 11:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 047D4E0E5
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 08:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645721835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TncsG7YXX5+yOaoX96UNZNhSvIR4PPKBKgvHMZmiEE8=;
        b=eVQ0NZfCyYBjgXw3AI4uN7Tfu5edGN9VQyG6uegeD8BqHVa3VeBXnpELLaVi8YaOSGzJ5r
        XyJAhG8GbfXyTY1vaHWj/nPghH8ft+YMFTyD75AVc7HO82VhlQgKU2Opt+6E9bhm500ba1
        Pz7iplbhAy7gvW+pkOtlWT6+fOXHwZA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-YOQjw-qXN4KGfgBJmhXCKQ-1; Thu, 24 Feb 2022 11:57:13 -0500
X-MC-Unique: YOQjw-qXN4KGfgBJmhXCKQ-1
Received: by mail-ed1-f69.google.com with SMTP id dy17-20020a05640231f100b00412897682b4so980345edb.18
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 08:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TncsG7YXX5+yOaoX96UNZNhSvIR4PPKBKgvHMZmiEE8=;
        b=gdHuf5KnKeSRTlwvYaUtNL3Fvak24xJ1kORvO8RvylmpbpAoWQM5vJjAff20ZBWbqj
         c2UsdJyCj6qCEANrCvamved1icdd3AXkwjW+I7Ewd5LOBCj9bqu0HsGo/XiEfG9Y0t0a
         yWOmrqoOQmeRQS0+a0vLy//U2HunivzpGW3sq/tyieLW2cl6/G66L3oZrIU2B4GpToeV
         uabodTgTYScvjzYzXLk/nu3jG0YNN3uH+g5UhMhBmATQL6FfUZ8oyClef6MZEucQwcw5
         1z3bMOFeHrrfsgqHhoyZAWhPH7pl75OJ0R+4U+YNPLRQhmGMLEEjclLUtEhFBFSmFaak
         3dLw==
X-Gm-Message-State: AOAM532v+1vIc9eH8vmo9ZZqRLBefmEkHPTtzNI5JIHeQvpR7xiNdekS
        adlEsMuB1aAJh9Cy8dfmNSbPaum/KikkziYi2X4LYZq6ScN62B6yzrOCjDSqTFvn0ArzFkJX7RP
        0b/rX/7B3gL4JUR3rz/4Spg==
X-Received: by 2002:a05:6402:440b:b0:410:5fb4:7225 with SMTP id y11-20020a056402440b00b004105fb47225mr3107434eda.216.1645721832360;
        Thu, 24 Feb 2022 08:57:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkrMWqFPTudWVMfc/YBNuuU+WF5pQlz2tw8rgREzx5hKsdbogu3/XpRlu2sJBuVaHggsaszg==
X-Received: by 2002:a05:6402:440b:b0:410:5fb4:7225 with SMTP id y11-20020a056402440b00b004105fb47225mr3107432eda.216.1645721832181;
        Thu, 24 Feb 2022 08:57:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id r22sm1653717ejo.48.2022.02.24.08.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:57:11 -0800 (PST)
Message-ID: <0568e484-4ab2-5641-53ae-29ff48e952e6@redhat.com>
Date:   Thu, 24 Feb 2022 17:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] platform/x86: x86-android-tablets: Workaround Lenovo
 Yoga Tablet 2 830/1050 poweroff hang
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-5-hdegoede@redhat.com>
 <YhZLpmhobBjrOHDU@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZLpmhobBjrOHDU@smile.fi.intel.com>
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

On 2/23/22 15:58, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 02:31:52PM +0100, Hans de Goede wrote:
>> These tablets' DSDT does not set acpi_gbl_reduced_hardware, so
>> acpi_power_off gets used as pm_power_off handler. This causes "poweroff"
>> on these tablets to hang hard. Requiring pressing the powerbutton for
>> 30 seconds *twice* followed by a normal 3 second press to recover.
>>
>> Avoid this by overriding the global pm_power_off handler to do
>> an EFI poweroff instead.
> 
> Oh, you eventually found the root cause (reduced HW bit)?

I'm not sure, it is possible that not setting the reduced HW bit
is actually correct for this hw, but that does lead to using
acpi_power_off which seems broken on this system.

I've updated the commit message while merging this to reflect
that using acpi_power_off is the problem, rather then not setting
the reduced HW bit.

Also note that the issue of reboot being the same as poweroff once
the system has been rebooted at least once is still unresolved.

Regards,

Hans

