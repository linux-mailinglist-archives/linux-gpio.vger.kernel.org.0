Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEF62A70F9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 00:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbgKDXKC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 18:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgKDXKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 18:10:01 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B797EC0613CF;
        Wed,  4 Nov 2020 15:10:01 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id r186so158176pgr.0;
        Wed, 04 Nov 2020 15:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nAEB7MGHIrO5v7Gd1XDA2NI5HdyMy7kQ/oBNM6wJnN0=;
        b=kOa3pyPY/D5GqanGw+MdSUZnZxrvlTo2B2wR+QPrBAzIQlrryFKWRldDNJnwpcyBoq
         o/AEtSr2P7KrjQt1a3zfwd/ENUoPsPY8DP5CZ8MfECrYdkEYtXUtbodtmbR7BUFts1Pi
         ZexsluUNvR24XFdgKCt8RpMUPFIzFd/+elDtLW+WKmrtBX3+enN84z4Io4tjmCZnE31y
         LGcpIfJHxYk/xCraln5M6b1ZY2+hystvgqvEMFjY/KrmfRW9gWxTnW/w3eZfFVI9C/+i
         3FBMfuzxR7sWMA0Fbl0VVCO2qZxszYIfSC6Q0Ek+RjSrQCyeR8zSx613POYTG4EsUkQ4
         kQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nAEB7MGHIrO5v7Gd1XDA2NI5HdyMy7kQ/oBNM6wJnN0=;
        b=JTt/bLXPySENODkwmFRtZ+MUf83wmXrjoAwlVTHCvWs4jhqEF8+fgHqptLn62Ka53W
         Soj/S4j91rz3BKiAF+L0tN9BjlmDnHJNj2O2IVqQ27E2unFTGV2//XX/UV1ZzNSbLG7b
         twgF1cqm1xzs9Z8DNmpHPV5tP28+8SneNM90eNR7Te6udsdSv1kIavSv3+Wc5W5VYw1p
         wB1XPpPAVSDLwpn8h/GfyfEB5TtN4jyIWVcyT9AFoY7xfhJziri3mCV19sOQ/wznuwtH
         /rFhZ3aBgCrG4uid/Wzep8NU52tlycz/MPGfQdVaprfo9iq9Q8hS5qYe9NmgjEDpQ6W+
         hokw==
X-Gm-Message-State: AOAM532jWLnnOS7ULQWdbMRi1w20q+tYtomaMEZEuEimGY+6Hc75olU5
        Vne1a73X56XI2sBR3Jf6xbU=
X-Google-Smtp-Source: ABdhPJz+SokgLKffky4K/lUNPxZIEpC5iOaIKjgEX4cHFI5R3NH4999eyYAjMvSlC76CL1dPvx87hQ==
X-Received: by 2002:a17:90a:8b93:: with SMTP id z19mr188354pjn.123.1604531401389;
        Wed, 04 Nov 2020 15:10:01 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id u24sm3524639pfn.205.2020.11.04.15.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 15:10:01 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 5 Nov 2020 07:09:21 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        1887190@bugs.launchpad.net,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] pinctrl: amd: remove debounce filter setting in irq
 type setting
Message-ID: <20201104230921.7kpt7sqaghpgywqa@Rk>
References: <20201104160344.4929-1-coiby.xu@gmail.com>
 <20201104160344.4929-5-coiby.xu@gmail.com>
 <CAHp75VcA6vk0dXQ0iOpSM8YdmBBBoU+veqBuK3hur9sbCiwkww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75VcA6vk0dXQ0iOpSM8YdmBBBoU+veqBuK3hur9sbCiwkww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 04, 2020 at 10:42:38PM +0200, Andy Shevchenko wrote:
>On Wed, Nov 4, 2020 at 6:05 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Debounce filter setting should be independent from irq type setting
>> because according to the ACPI specs, there are separate arguments for
>> specifying debounce timeout and irq type in GpioIo and GpioInt.
>>
>> This will fix broken touchpads for Lenovo Legion-5 AMD gaming laptops
>> including 15ARH05 (R7000) and R7000P whose BIOS set the debounce timeout
>> to 124.8ms which led to kernel receiving only ~7 HID reports per second.
>
>to the kernel

Thank you for correcting my grammar mistakes!

>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Cc: 1887190@bugs.launchpad.net
>> BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
>
>> Message-Id: <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
>
>Link: https://lore.kernel.org/...
>
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby
