Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B009B331379
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhCHQdS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhCHQcu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 11:32:50 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABF5C06174A;
        Mon,  8 Mar 2021 08:32:50 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id d13so15699089edp.4;
        Mon, 08 Mar 2021 08:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mKPfJFGVaRtKVr+LwUZuy12DGYcpjjNTvhjdoxOkbD4=;
        b=HW4qK7jCgNiolMi1QM7Hq6UsT8lglw4FiIUtJuIqkvrE3et5ApnhuziNB1oz0921w1
         ZbnatMl/vRZMSJ6/eljCSTPgPZPeCPRG3d+bq6FKFnJw2VuAr0Z2q+qU0pQHBMWm497o
         uWJ+GN0VJBXS2A/staNnz5gJzGjOeIPTQUgcibIrhyvP1Ifd0gDRCZpsDNPRI2Pw8Wyh
         riLT3sEa33OHitaW2UYj/OMmMY0SFMlvo0tU8E5d7IexYsSMax/Fs3PMwNtj9VkteIKL
         4fprf9iNk/2bc0AIUdfWMXdJEp5jcsnGY0rCtLzUunU6Klrf6CiBpLP4+3iN11ecHTE0
         +SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mKPfJFGVaRtKVr+LwUZuy12DGYcpjjNTvhjdoxOkbD4=;
        b=gqpoA876XADKxyvQkppSbovE73FS0qR6nZcpiF8CGAvuNONVSa8TaLZ6wVhshf3gDG
         D+5zNRE8vQ3ixXklc6hTmq2zcqttCAZ89s4eeMW4V0YXNEhFGMe3KgTuSBAcIQt3SKlF
         OML6+fSDlbCsh4CYUJIzIEWYj2TR7kZevWot+vpW1rIPc8AmUpPZ5nxrggMWf34iDZ/G
         C+e6ovNp9apC2ftI9v1VULVSQ88M87YFzqAgzJKjHxdwKxt5Mb2+Vn0wZ7pSLuRChGaY
         W7bVZnZsTp2ijqGRNDe8ya5dQ8dcF4qV4zLI/2/K0affEn2NJjV0sDi/gHsZDq/xo8Qv
         lK4g==
X-Gm-Message-State: AOAM532mezodaGmDmngLzeaRJHlEAFIO1adA4Yzaa8Z6QEgTV3r5ho9X
        Y1KSa0kMjTIB5hu1jHY06CQnhFjoZL6Isg==
X-Google-Smtp-Source: ABdhPJw+rwZXIbDRjo4YHdPz7lyAeYup2/5fh1IwMyOVHXiah95xMppUR4+i9KoKBRrsJyK9qrbFvw==
X-Received: by 2002:aa7:c386:: with SMTP id k6mr22515928edq.224.1615221168898;
        Mon, 08 Mar 2021 08:32:48 -0800 (PST)
Received: from [10.17.0.16] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id c7sm1039879edk.50.2021.03.08.08.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 08:32:48 -0800 (PST)
Subject: Re: [PATCH] Revert "pinctrl: intel: Split
 intel_pinctrl_add_padgroups() for better maintenance"
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210308152505.3762055-1-luzmaximilian@gmail.com>
 <YEZEX+BCw21O6rmT@smile.fi.intel.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <c306b082-f97a-96d8-1291-78ff14c4ea88@gmail.com>
Date:   Mon, 8 Mar 2021 17:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEZEX+BCw21O6rmT@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/8/21 4:35 PM, Andy Shevchenko wrote:
> On Mon, Mar 08, 2021 at 04:25:05PM +0100, Maximilian Luz wrote:
>> Following commit 036e126c72eb ("pinctrl: intel: Split
>> intel_pinctrl_add_padgroups() for better maintenance"),
>> gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
>> a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
>> should be there (they are defined in ACPI and have been accessible
>> previously). Due to this, gpiod_get() fails with -ENOENT.
>>
>> Reverting this commit fixes that issue and the GPIOs in question are
>> accessible again.
> 
> I would like to have more information.
> Can you enable PINCTRL and GPIO debug options in the kernel, and show dmesg
> output (when kernel command line has 'ignore_loglevel' option) for both working
> and non-working cases?

Sure.

Here are dmesg logs for:

  - Kernel v5.12-rc2 (not working): https://paste.ubuntu.com/p/HVZybcvQDH/
  - Kernel v5.12-rc2 with 036e126c72eb reverted: https://paste.ubuntu.com/p/hwcXFvhcBd/

> Also if it's possible to have DSDT.dsl of the device in question along with
> output of `grep -H 15 /sys/bus/acpi/devices/*/status`.

You can find the DSDT and a full ACPI dump at [1] and GPIOs that fail at
[2] and [3].

[1]: https://github.com/linux-surface/acpidumps/tree/master/surface_book_2
[2]: https://github.com/linux-surface/acpidumps/blob/62972f0d806cef45ca01341e3cfbabc04c6dd583/surface_book_2/dsdt.dsl#L15274-L15285
[3]: https://github.com/linux-surface/acpidumps/blob/62972f0d806cef45ca01341e3cfbabc04c6dd583/surface_book_2/dsdt.dsl#L17947-L17982

`grep -H 15 /sys/bus/acpi/devices/*/status` yields

/sys/bus/acpi/devices/ACPI0003:00/status:15
/sys/bus/acpi/devices/ACPI000C:00/status:15
/sys/bus/acpi/devices/ACPI000E:00/status:15
/sys/bus/acpi/devices/device:16/status:15
/sys/bus/acpi/devices/device:17/status:15
/sys/bus/acpi/devices/device:31/status:15
/sys/bus/acpi/devices/device:71/status:15
/sys/bus/acpi/devices/INT33A1:00/status:15
/sys/bus/acpi/devices/INT33BE:00/status:15
/sys/bus/acpi/devices/INT3400:00/status:15
/sys/bus/acpi/devices/INT3403:01/status:15
/sys/bus/acpi/devices/INT3403:02/status:15
/sys/bus/acpi/devices/INT3403:06/status:15
/sys/bus/acpi/devices/INT3403:07/status:15
/sys/bus/acpi/devices/INT3403:08/status:15
/sys/bus/acpi/devices/INT3403:09/status:15
/sys/bus/acpi/devices/INT3403:11/status:15
/sys/bus/acpi/devices/INT3407:00/status:15
/sys/bus/acpi/devices/INT344B:00/status:15
/sys/bus/acpi/devices/INT3472:00/status:15
/sys/bus/acpi/devices/INT3472:01/status:15
/sys/bus/acpi/devices/INT3472:02/status:15
/sys/bus/acpi/devices/INT347A:00/status:15
/sys/bus/acpi/devices/INT347E:00/status:15
/sys/bus/acpi/devices/INT3F0D:00/status:15
/sys/bus/acpi/devices/LNXPOWER:07/status:15
/sys/bus/acpi/devices/MSHW0005:00/status:15
/sys/bus/acpi/devices/MSHW0029:00/status:15
/sys/bus/acpi/devices/MSHW0036:00/status:15
/sys/bus/acpi/devices/MSHW0040:00/status:15
/sys/bus/acpi/devices/MSHW0042:00/status:15
/sys/bus/acpi/devices/MSHW0045:00/status:15
/sys/bus/acpi/devices/MSHW0084:00/status:15
/sys/bus/acpi/devices/MSHW0091:00/status:15
/sys/bus/acpi/devices/MSHW0107:00/status:15
/sys/bus/acpi/devices/MSHW0133:00/status:15
/sys/bus/acpi/devices/MSHW0153:00/status:15
/sys/bus/acpi/devices/NTC0103:00/status:15
/sys/bus/acpi/devices/PNP0103:00/status:15
/sys/bus/acpi/devices/PNP0C0D:00/status:15

This output is the same for both versions.

>> There is probably a better option than straight up reverting this, so
>> consider this more of a bug-report.
> 
> Indeed.
