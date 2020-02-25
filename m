Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A047F16BEBD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2020 11:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730258AbgBYK26 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 05:28:58 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26187 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730242AbgBYK26 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Feb 2020 05:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582626537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SeNohtJk8Z/lFihZ8cJtOY6qMddS7ksum/5KVbX7TlY=;
        b=clJBab7swrOaNif1NzGEbkDYerDrLMeilSV+hi6XXExzDI1ZdbscgtTtSQ1+4NleKVtg6C
        K8SdY4OeN/HpN1Z8Em09vKWLiiOt9LTS741fDonz1U3AMIdol7JkNUF7yEjtUpXfAq5ykW
        PY6HNJ2t7vkRIRpiEDCBs+BMwOw+lpU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-2DlZE64KNYKhnkEwl3nXHw-1; Tue, 25 Feb 2020 05:28:56 -0500
X-MC-Unique: 2DlZE64KNYKhnkEwl3nXHw-1
Received: by mail-wm1-f72.google.com with SMTP id b8so526404wmj.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2020 02:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SeNohtJk8Z/lFihZ8cJtOY6qMddS7ksum/5KVbX7TlY=;
        b=isnwsmiy3aJBAxjVcmX9vvPIB05sGd45QCl4YyPColjjG1VaRjgBu4VrfPXeUNwl6N
         E2KxQBLlgMsh6/Qcd1px7slvrXfljed14t8h1PfatBVnSSEisogApuYiZW9wOkG9T1kG
         9NeCeTZN3+PRNRnf8PBWSySDn4rdlkjgwa8jbBtef1N+YGwm8kCx7ZPuiXxJOBpf1QjW
         cAN4YJJH8/lHgaKpfW0YpBtEUE2cTPpRNLhxPR4gaAzcnNB3dI44HQg5Qi1NS4bZsqgW
         48TXBS7VuhECUMAu4C4kHAG4kAPlW/WRbjjY68gkLhM8NEwd1tQ7b8wWs5ZXSDNvEQgd
         EvRw==
X-Gm-Message-State: APjAAAUF1G+YNyllH8JAwZqpo49xfeBkWETW4irY93cJmkiH+sMJbHg0
        mXi6HPCqSD/4g9l22bek7r6/zAkJ25qnYegsyGx7BrsRJupbRy8MElFqeS+xQL53DycBx486/Ft
        54nybvENU239/O5n4sDS9MA==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr48305965wrm.302.1582626534479;
        Tue, 25 Feb 2020 02:28:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUscyA7I0+uTWo7Hd9qm3yS7VxPP4Gj/WGFZhw0+PVnDOrDbCsGzgzsvPU7pbvjZoFdZGMTw==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr48305936wrm.302.1582626534306;
        Tue, 25 Feb 2020 02:28:54 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-7a91-34f6-66f7-d87c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7a91:34f6:66f7:d87c])
        by smtp.gmail.com with ESMTPSA id b10sm3413635wmj.48.2020.02.25.02.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2020 02:28:53 -0800 (PST)
Subject: Re: [PATCH resend 1/3] gpiolib: acpi: ignore-wakeup handling rework
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Lehmann <schmorp@schmorp.de>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
References: <20200225102753.8351-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3810da1d-e5c1-a117-9f05-2cd6d86e0bd1@redhat.com>
Date:   Tue, 25 Feb 2020 11:28:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225102753.8351-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Subject for this one should be:

"[PATCH resend 0/3] gpiolib: acpi: ignore-wakeup handling rework"

As it is the cover letter, sorry about that.




On 2/25/20 11:27 AM, Hans de Goede wrote:
> Hi All,
> 
> The first patch just updates the comment describing why we are ignoring
> GPIO ACPI event wakeups on HP x2 10 models.
> 
> The second patch is more interesting, in the mean time I've learned their
> are actually at least 3 variants of the HP x2 10, and the original quirk
> only applies to the Cherry Trail with TI PMIC variant (and the original
> DMI match only matches that model). We need a similar quirk for the
> Bay Trail with AXP288 model, but there we only want to ignore the wakeups
> for the GPIO ACPI event which is (ab)used for embedded-controller events
> on this model while still honoring the wakeup flags on other pins.
> 
> I'm not 100% happy with the solution I've come up with to allow ignoring
> events on a single pin. But this was the best KISS thing I could come up
> with. Alternatives would involve string parsing (*), which I would rather
> avoid. I'm very much open to alternatives for the current approach in the
> second patch.
> 
> Since sending out the first 2 patches of this series I've received
> positive testing feedback for the quirk for the HP X2 10 Cherry Trail +
> AXP288 PMIC variant, so here is a resend of the first 2 patches with
> a third patch adding a quirk for the third variant of HP X2 10 added.
> 
> Regards,
> 
> Hans
> 
> 
> *) And more complex DMI quirk handling since now we would need to store
> a string + some other flags in the DMI driver_data
> 
> 

