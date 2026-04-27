Return-Path: <linux-gpio+bounces-35607-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBSeJaqO72mhCwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35607-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 18:28:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F000A4765F2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 18:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8926D30C3FE5
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DC534FF76;
	Mon, 27 Apr 2026 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLNgMfWD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B0F34EF15
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306228; cv=none; b=hQ+dRzbURTV29vb3MJLFxXqIOEy6yO6uVu+oijezlchkbyI48tTsbyZxcDuEKXZY6sdblBVf3tv1FTau6NybRZQOyyMuouUVqjXhUcJ3nHJ1eEfcgj0fhMSWxeq9T1ZkMmoCWSwUe809NTDUUzYIQ+NIDme5c/qj1vrKDoFYAzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306228; c=relaxed/simple;
	bh=O3b5Hfsq5QQMtIsV1KU3DRDtgUe//r6qxx6SaNnZbbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBCb9L9zFbZE2UM6l817VrVTVVfIgnlc3UuOzcL28n0EQkzbbEKZF1iz8Nobg6SDdGTIdMuCACsLdSAhv8iueq/o+7s2kqG9mwJvp6pzG9KXlpBXCOTS+2UMM2ep3abYIDCm5WtWLYIRwT0eOIEQWBg05Y2YvUhOT627gHpRjT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLNgMfWD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483487335c2so102695125e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 09:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777306223; x=1777911023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8idgF5PAApeXOc4W3N+QeI3qNm9yTPDywCTlHhUbFjs=;
        b=WLNgMfWDxII4ciCKMYdksBBhDpnqHbPAtQljQrOKeUpKODKo5qA/EUkoDm8ftNvHeQ
         29NtPgWnM6+HuI7IVKNES5AZQgiDcu3pyyBWgQ1JIDJ3kNkJpWJvYAWR5ivzzqueYoaP
         mv87YjRumXmHugM5UETItHfR80MrT6f5wGwymohqxOUglzxsh7kIFB5cAC2D21D6WFuM
         TCl8+lh1mzOIsNahg5HJfwwvEBnVFKBPd3CFNmywkJacdQPLxxTf73oo5xvNWzXiDT5S
         5vn6krwFnzdQJcOVa5PiJa5N8LfF96CsON8Z4iolv1HOKl/PZuaejZxAR2g2Uz1ZrKdA
         yJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306223; x=1777911023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8idgF5PAApeXOc4W3N+QeI3qNm9yTPDywCTlHhUbFjs=;
        b=QcoH9W43sr+xSYTVVnHB9tW/DR3DPYj7wsVA8f+/kPgqRwyYy8zoCVZu80O/JdGjRR
         PPSNeIOrkYVhRpyv+mEEfgtnTaZ9NThq6zSwfV9+lz4SazNzdYXUJtlLxuxZFZJkXPsm
         t/2NYCZgaTYvNTimxk0oTjWvaXKHyeCDqkTG44aBBPpTww9TnKE1VB16S+4UctQSGcdp
         ZddaB1oRJ4I8LRNSYyB6RgJx8Le/desBqMbyycgSw9QjQfhciDLs2gpshTKkIyfsWTNR
         wcD50wwproQuG2Sdsyoq438fFRKgolOfINX+RcJ/Nm3oPQkCc8Imzz8RcwSd854cJAVQ
         fDOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9y+KFmoK89mQovrTSYdNDr4e9uzwpnoeE2ID1TxfXrVOwoQTcM3rBPZ1NWj/Ujf3WxoY4BPPYSXovG@vger.kernel.org
X-Gm-Message-State: AOJu0YwFK0Lsm5iS34c9uQH+MfMSCqZ2WCtvoIuSOBICPFg3laWFMGUP
	ivpzl3yQxwlYH46DC/zF5vriI+IqA6HMj1otwY7YJZsRmNS63HMx65/t
X-Gm-Gg: AeBDietUe57qCvNsQ2cMPNVWYIL5xfNJ0Zt8i4mFKSsUbs6T1JKvymNGQpro2kd8dxt
	Pux3q/LhASrK7eXJ/AjLi+cLyqRKkoy/Qd5N/v63av8MnsVguaiapsd6KN98cG2CCtg30kCPXka
	SI9ycljnMgWCHAs8kGg+dHlhymuDHyEYw8fFYlU7Cce0y8OpeiGWQlpmPMwPGyUy5B+TLfjC5Y7
	KDyrKQCWf/cS2jNtNJjKnfsUlOzHZDkXYuSbTkqEoGAbWQ3LpxyBN9D1kfgh5pebd371NOXlRy9
	5bnBRNrOkG813uZdwSv3FE+28R9ggoLGcjR4h57kgRl/JDS7GoiKnVH53PpHE3rnXkCXSatNhyx
	n6vR7RNRdnNR3NuHU+XooKcUFKRqyeeRBJJmnN7Ka6If+LgwSOZ+mkFSxyJ0odMtb83nbaWfyyY
	74ywTTHZTC/RA33t6ecZ7ULIsGi0mZISdG5PxqKWROwWUD5a8G6PfPZ5zxEJ1bTPx3TiGUdZp5A
	zDAfUX/dcDotYyMbQ==
X-Received: by 2002:a05:600d:8448:b0:489:1f3e:5f69 with SMTP id 5b1f17b1804b1-48a76f7a30dmr114005e9.18.1777306223053;
        Mon, 27 Apr 2026 09:10:23 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:2329:3f37:4392:9142? ([2a01:e11:202b:40:2329:3f37:4392:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm240435405e9.5.2026.04.27.09.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:10:22 -0700 (PDT)
Message-ID: <9959ecd7-6af1-432d-836f-5444491ce689@gmail.com>
Date: Mon, 27 Apr 2026 18:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Hans de Goede <hansg@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
 <c55b55ea-a8d5-481e-916f-eb92aeb2e06d@kernel.org>
 <20260427122806.GN557136@black.igk.intel.com>
 <edac84e9-93c0-4248-b28f-c121583b9f65@gmail.com>
 <f8efd77f-6c49-4ec1-9d16-a855c2577908@kernel.org>
Content-Language: en-US
From: Marco Scardovi <mscardovi95@gmail.com>
Autocrypt: addr=mscardovi95@gmail.com; keydata=
 xjMEae9cbxYJKwYBBAHaRw8BAQdA87PkpEc/V9AjPUZtgCt1HozYZOv2i7DmtWO9bufzcXbN
 Jk1hcmNvIFNjYXJkb3ZpIDxtc2NhcmRvdmk5NUBnbWFpbC5jb20+wokEExYIADEWIQRyXlTt
 5wtfOVmei6r6GFPSqT1V1AUCae9cbwIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEPoYU9KpPVXU
 bIEA/jcKrvvxQhFrLMIj5P2MOG1zMmjNViG8i1HKfockEPmoAP45CR30ML0PkQQglMR2Wpxl
 n9WUeA151rzqTrGbkZxeCs44BGnvXG8SCisGAQQBl1UBBQEBB0Ao3nuNtHI9dr8Lg4xpvFE3
 dIX9HNaBa/2zz5suxiV+MgMBCAfCeAQYFggAIBYhBHJeVO3nC185WZ6LqvoYU9KpPVXUBQJp
 71xvAhsMAAoJEPoYU9KpPVXUUmAA/jfx6umko6uNFGpFcDX5wrxh/eTL7x+4YORx9Z+bwti7
 AQCiGVnEL8Hd3zRVp0u5UaQs5CfD22sPYLGpkJEuCDo0Cg==
In-Reply-To: <f8efd77f-6c49-4ec1-9d16-a855c2577908@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F000A4765F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35607-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.21:email,0.0.1.99:email,0.0.0.24:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


Il 27/04/26 17:30, Hans de Goede ha scritto:
> Hi,
>
> On 27-Apr-26 14:41, Marco Scardovi wrote:
>> Il 27/04/26 14:28, Mika Westerberg ha scritto:
>>> On Mon, Apr 27, 2026 at 01:46:03PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 23-Apr-26 07:15, Mario Limonciello wrote:
>>>>> On 4/22/26 23:42, Mika Westerberg wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>>>>>> Assuming all the variants suffer the same problem would it be ok to use a
>>>>>>>>> wildcard for it?
>>>>>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>>>> index a0116f004975..e3a6111854e8 100644
>>>>>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>>>>>>>>                  .ignore_wake = "VEN_0488:00@355",
>>>>>>>>              },
>>>>>>>>          },
>>>>>>>> +    {
>>>>>>>> +        /*
>>>>>>>> +         * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
>>>>>>>> +         * causes acpi_gpio_handle_deferred_request_irqs() to
>>>>>>>> +         * stall for ~36 seconds during boot so ignore the two
>>>>>>>> +         * interrupts involved.
>>>>>>>> +         *
>>>>>>>> +         * Found in BIOS G614PP.307.
>>>>>>>> +         */
>>>>>>>> +        .matches = {
>>>>>>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
>>>>>>>> +        },
>>>>>>>> +        .driver_data = &(struct acpi_gpiolib_dmi_quirk) {
>>>>>>>> +            .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>>>>>>> +        },
>>>>>>>> +    },
>>>>>>>>          {} /* Terminating entry */
>>>>>>>>      };
>>>>>>> As for now it seems working. I've reverted it on my kernel as I prefer
>>>>>>> remain as much as possible close to the CachyOS' one but hopefully it will
>>>>>>> be implemented on 7.1, if someone propose the patch and it is accepted. It
>>>>>>> would be amazing to see Asus more interested on Linux and more strict with
>>>>>>> their BIOS but in the end I understand it's like asking for the moon.
>>>>>> Okay thanks for checking. I guess this is what we have to live with for now
>>>>>> until someone finds a better way of dealing with these.
>>>>>>
>>>>>> @Francesco, would you like to submit a new version of the patch similar to
>>>>>> above or you want me to do that?
>>>>> Hans suggested that we might want to look at ripping out this edge triggered events at boot earlier in the thread.
>>>>>
>>>>> https://lore.kernel.org/platform-driver-x86/20260423044211.GD557136@black.igk.intel.com/T/#mdca882e6606d3a894ec7499d3b742d040933dbdb
>>>>>
>>>>> Hans - as you pointed out that the Surface lid state is the only real issue left and you happen to have one do you think you could work up some patches?
>>>> Right, so I read further in the thread that Armin has a maybe better suggestion,
>>>> after that has been merged I can check a bunch of the current devices with
>>>> .no_edge_events_on_boot which I still have and see if those quirks can be
>>>> dropped now.
>>>>
>>>> But the above quirk for the ASUS ROG Strix G16 (2025) does not use
>>>> .no_edge_events_on_boot which just disables the initial run of
>>>> the ACPI event handler at boot. Instead it uses:
>>>>
>>>>               .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>>>
>>>> which *completely* disables the ACPI event handlers for the mentioned pins.
>>> Oh, I've completely lost track of all the quirks that were added after I
>>> did anything with the ACPI GPIO stuff :(. Sorry about missing this. I will
>>> stay silent from now on ;-)
>> Hi Everyone,
>>
>> @hans, I tried it and can confirm it does the trick as well.
> Great, that is good news.
>
> Thank you for testing.
>
> Can you try Mario's patch from:
>
> https://lore.kernel.org/platform-driver-x86/f4979d43-f61f-4387-8490-ccec7043c940@kernel.org/
>
> That changes the run-edge-events-at-boot behavior to only run
> under the same conditions as it does under Windows (according to
> the Windows docs). So maybe that will fix things without needing
> a quirk ?
>
> If you give this a test please remember to remove any other
> workarounds like the kernel commandline option.
>
> Regards,
>
> Hans
Tested on ubuntu 26.04 and it worked nicely. The patch definitely makes 
the trick on my pc
>
>

