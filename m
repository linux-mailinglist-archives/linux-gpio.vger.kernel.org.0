Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7723B47E696
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 18:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349374AbhLWRAU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 12:00:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45805 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349363AbhLWRAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Dec 2021 12:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640278817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nvsfcMVBWJERgEqnOROoErbQ2mtiiEO1pkWlJPmYlIg=;
        b=GjMjpYBJtNxLEJvjRJYNisE0QOVe7+1dOqRCyFtiMZ5kz2J0ZwwTEwT3Nvs783lQktIak7
        PtgTz+JkqvzCaEmb8UUDhL7UMJNelpmMcf09AilF6W/zXstwlQc5ed6Tz704+o/G+b5Bqx
        RVPp+4Fh/yadduQYiHuWfF2BM0RYsAI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-_s8MbibjPJqup63SkEmYnw-1; Thu, 23 Dec 2021 12:00:16 -0500
X-MC-Unique: _s8MbibjPJqup63SkEmYnw-1
Received: by mail-ed1-f72.google.com with SMTP id x19-20020a05640226d300b003f8b80f5729so3763452edd.13
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 09:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nvsfcMVBWJERgEqnOROoErbQ2mtiiEO1pkWlJPmYlIg=;
        b=lFPgMO5PkOkNbnKy/ucyDd5drJftjcJCs3IZnaIrJqkkBbRX2sGVAfD+ZTqcbXGNgh
         Ai0mhM+JFKWXGVKcE4to1/4DkhN4rlftmW9fKPypaxbPhftpjslaf86AyEM0IqBrOZ4W
         Bx0U4WSvlNrQSdxHlM4y77++R6P+BLHmep+H1S42+tPYksKVC5SlRhZdcg59blkq5P6F
         fqy/JRnRSSUmzjxmO1aeKUSDobOQk/3D8pLD13m19BEKOYiY6gR5bQI2+1Vllqyvq2Ja
         GRnglu6Ko3VzWZRKgIUsXy85v8JkshrIw2EX0IVBxD88qqnqVlnhEULkdalVJnDg7EPp
         lNDw==
X-Gm-Message-State: AOAM531zrPLgxRpOdghWmrZiQ4EFefWBwh1EaAXWYIekWq3GyGkLLfe9
        WG3e9MMekXd5UB9dPwekh+WpiEI+nWzkNfAsWT6YV02LocYS0EGP22l+CkmZCJkaZmpWRgVAlKN
        sLfoGz5NlHBe8oc9q/uo/ug==
X-Received: by 2002:a05:6402:d0a:: with SMTP id eb10mr2784902edb.48.1640278815468;
        Thu, 23 Dec 2021 09:00:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw87UhCINhB18oUYfK4gbd/3DsjSTlRJLtf/0Dh2g1Vscsz3MP7wWjdmIMopMNKIhj0qff5DA==
X-Received: by 2002:a05:6402:d0a:: with SMTP id eb10mr2784889edb.48.1640278815306;
        Thu, 23 Dec 2021 09:00:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id mp9sm1919620ejc.106.2021.12.23.09.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 09:00:14 -0800 (PST)
Message-ID: <08236e18-f1ae-303c-3d2e-96f795d96c1f@redhat.com>
Date:   Thu, 23 Dec 2021 18:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 0/8] platform/x86: introduce p2sb_bar() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/21/21 19:15, Andy Shevchenko wrote:
> There are a few users and at least one more is coming that would
> like to utilize P2SB mechanism of hiding and unhiding a device from
> the PCI configuration space.
> 
> Here is the series to deduplicate existing users and provide
> a generic way for new comers.
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.
> 
> The patch that bring the helper ("platform/x86/intel: Add Primary
> to Sideband (P2SB) bridge support") has a commit message that
> sheds a light on what the P2SB is and why this is needed.
> 
> Please, comment on the approach and individual patches.
> 
> The changes made in v2 do not change the main idea and the functionality
> in a big scale. What we need is probably one more (RE-)test done by Henning.
> I hope to have it merged to v5.17-rc1 that Siemens can develop their changes
> based on this series.
> 
> I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> since we have an ACPI device for GPIO I do not see any attempts to recreate
> one).
> 
> (Since it's cross subsystem, the PDx86 seems the main one and
> I think it makes sense to route it throught it with immutable
> tag or branch provided for the others).

The series looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Not sure if this is really 5.17 material this late in the cycle though,
but lets wait and see what Bjorn and Lee have to say (patch 8/8 still
needs an ack from Lee).

I'm fine with taking this upstream through the pdx86 tree, please
prepare a pull-req for everyone involved with an immutable branch
pushed to pdx86/platform-drivers-x86.git/
based on 5.16-rc1 (if everyone is happy with merging this for 5.17) or
based on 5.17-rc1 once that is out.

Regards,

Hans

