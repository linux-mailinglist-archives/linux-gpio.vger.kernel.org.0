Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46E8271E2C
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 10:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgIUIkc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 04:40:32 -0400
Received: from mail1.nippynetworks.com ([91.220.24.129]:43210 "EHLO
        mail1.nippynetworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgIUIkc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 04:40:32 -0400
Received: from macbookpro-ed.wildgooses.lan (unknown [212.69.38.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-256))
        (No client certificate requested)
        (Authenticated sender: ed@wildgooses.com)
        by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4BvyZ30kVwzTh4s;
        Mon, 21 Sep 2020 09:40:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1600677628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LVd16FYLAMdC77Pdt6rdb96AvyWmEeiXLvGQqj9O3xg=;
        b=oSP21rLmM+DskM36Tkxc2MyX5WdkQ1Upwv2ISYIyM+5PgHbwmJchPF1fqVHqV+vZH8xk/t
        U5xtvLfG2GaeSJXIltvBDbpq0W+nC1toZQeKUgcx3hrq8PTAY6C0JWdxrxioEEQpICPd5Q
        pzU0Ezhp0bfAuESig/gpPcJ+o6I8ca4=
Subject: Re: [PATCH] gpio: gpio-amd-fch: Fix typo on define of
 AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Eckert <fe@dev.tdt.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20200920203207.25696-1-lists@wildgooses.com>
 <CAHp75Vd2uz-QrEFshUr=e719VBX2zYzvOhVC07BpHfvi0WDgOA@mail.gmail.com>
From:   Ed W <lists@wildgooses.com>
X-Tagtoolbar-Keys: D20200921094026454
Message-ID: <deb07bad-2d84-723a-7237-2b625a3c4de8@wildgooses.com>
Date:   Mon, 21 Sep 2020 09:40:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd2uz-QrEFshUr=e719VBX2zYzvOhVC07BpHfvi0WDgOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/09/2020 08:55, Andy Shevchenko wrote:
> On Sun, Sep 20, 2020 at 11:33 PM Ed Wildgoose <lists@wildgooses.com> wrote:
>> Schematics show that the GPIO number is 55 (not 59). Trivial typo.
> Does it still DEVSLP0? Perhaps you need to drop that part as well.
>
> ...


In the PCEngines schematic it's labelled as "G55/DEVSLP" (no 0)

(In contrast G59 is labelled "G59/DEVSLP1")

What is the quorum opinion on name?

Thanks

Ed W


>
>>   #define APU2_GPIO_REG_LED3             AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
>>   #define APU2_GPIO_REG_MODESW           AMD_FCH_GPIO_REG_GPIO32_GE1
>>   #define APU2_GPIO_REG_SIMSWAP          AMD_FCH_GPIO_REG_GPIO33_GE2
>> -#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
>> +#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
>>   #define APU2_GPIO_REG_MPCIE3           AMD_FCH_GPIO_REG_GPIO51
>>
>>   /* Order in which the GPIO lines are defined in the register list */
>> diff --git a/include/linux/platform_data/gpio/gpio-amd-fch.h b/include/linux/platform_data/gpio/gpio-amd-fch.h
>> index 9e46678ed..255d51c9d 100644
>> --- a/include/linux/platform_data/gpio/gpio-amd-fch.h
>> +++ b/include/linux/platform_data/gpio/gpio-amd-fch.h
>> @@ -19,7 +19,7 @@
>>   #define AMD_FCH_GPIO_REG_GPIO49                0x40
>>   #define AMD_FCH_GPIO_REG_GPIO50                0x41
>>   #define AMD_FCH_GPIO_REG_GPIO51                0x42
>> -#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP0        0x43
>> +#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0        0x43
>>   #define AMD_FCH_GPIO_REG_GPIO57                0x44
>>   #define AMD_FCH_GPIO_REG_GPIO58                0x45
>>   #define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1        0x46
>

