Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A7B48460B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 17:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235388AbiADQho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 11:37:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49394 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235378AbiADQho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 11:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641314263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IIK/HkD6koON2nRRKZHikH39fqIG3Q8hOLbofLBF46g=;
        b=X5WZJfU/MA3T6aQHiRJUAb93C1fpLnp/QXTPP1e9vwaXJlm5U0IXkrc3THpsvsR33vcStz
        Vg7+FWb468rwNf3QIVcpSiZPe4IyJYpxAw19LwZ1sfhDyk91XdRNci4rtD6WLwXsIa3J1W
        46wt/yfQI3HJl+7RzMlo/+S7xDsYAns=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-ZjAbu8QgPLygrZM38MC3LQ-1; Tue, 04 Jan 2022 11:37:42 -0500
X-MC-Unique: ZjAbu8QgPLygrZM38MC3LQ-1
Received: by mail-ed1-f69.google.com with SMTP id ay24-20020a056402203800b003f8491e499eso25677469edb.21
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jan 2022 08:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IIK/HkD6koON2nRRKZHikH39fqIG3Q8hOLbofLBF46g=;
        b=PfR604gM3KDq4GRHMq5X/snU52lfMfB7dFbOEPqJWrFJYHkDJq1u5QytCGH6jvcqF0
         UbFxtGy+g1pCLNo3fTzLGd7sghoF8jE9PTIxKmFGY8IcXEPg1Q7MwhGjGM6aXfRJZwGz
         4kijjJ7A0fsn7qkkDzY7shRKQIlTydZu0drs8U//u2M21TmcU8s2Yq2vE0DlLM35GD2H
         Cdw0PT5b00aSxbHm55Br9ApQR3CDzZKHoxQ7n10mUP68ZNZ+qUqIXRhsXKXUPBtrzmzS
         Cdn4k4zzp2d//TAap5SJT8rL81ArrftEbQNGDnVAC8nL9op1DATVpb2MzAb5hpVGDXNZ
         /Mgw==
X-Gm-Message-State: AOAM533nlFjRiJ/ZGyGbubnnSe50iAiOMx6q6xt5VF2m55SVmKTGIvF2
        5myebZChMQIpnsREgrOHpqToiYzePxDbfuD9Xaeq7hw0VK8hw2nZQ5X0pVNkicjwk3AaRfPTDJT
        PvoTB83AdWYoaEtvsISVeow==
X-Received: by 2002:a50:9e0f:: with SMTP id z15mr49435214ede.278.1641314261030;
        Tue, 04 Jan 2022 08:37:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw90gRixw5nW3o0Z3QqbfoNqJrNwjDHSllfkecZ5q6zyuEeMZufaRJaPOdB8BzEAmNQ6fTufQ==
X-Received: by 2002:a50:9e0f:: with SMTP id z15mr49435204ede.278.1641314260883;
        Tue, 04 Jan 2022 08:37:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c8sm14752078edu.60.2022.01.04.08.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 08:37:40 -0800 (PST)
Message-ID: <1d094a1d-61f3-ec0f-c072-243839ecb55b@redhat.com>
Date:   Tue, 4 Jan 2022 17:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
 <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
 <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
 <c29e98f5-c8e4-1967-a249-a461776488ad@redhat.com>
 <65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com>
 <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com> <YdRnExZuPuvdfXgT@lahna>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YdRnExZuPuvdfXgT@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/4/22 16:26, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Jan 04, 2022 at 11:22:53AM +0100, Hans de Goede wrote:
>> Andy, Mika, why don't we just mask out all IRQs at boot unconditionally:
>>
>> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
>> index 683b95e9639a..8981755a5d83 100644
>> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
>> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
>> @@ -1552,19 +1552,10 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
>>  	const struct intel_community *community = &pctrl->communities[0];
>>  
>>  	/*
>> -	 * The same set of machines in chv_no_valid_mask[] have incorrectly
>> -	 * configured GPIOs that generate spurious interrupts so we use
>> -	 * this same list to apply another quirk for them.
>> -	 *
>> -	 * See also https://bugzilla.kernel.org/show_bug.cgi?id=197953.
>> +	 * Start with all normal interrupts in the community masked,
>> +	 * but leave the ones that can only generate GPEs unmasked.
>>  	 */
>> -	if (!pctrl->chip.irq.init_valid_mask) {
>> -		/*
>> -		 * Mask all interrupts the community is able to generate
>> -		 * but leave the ones that can only generate GPEs unmasked.
>> -		 */
>> -		chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
>> -	}
>> +	chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
>>  
>>  	/* Clear all interrupts */
>>  	chv_pctrl_writel(pctrl, CHV_INTSTAT, 0xffff);
>>
>> ?
> 
> IIRC masking them all broke some systems at the time. Unfortunately I
> don't remember the details anymore :(

Ok, so since this may hit other devices to I think we should go with one
of my first fix attempts for this then:

From 46aba0f423b890a8ee21c76b5d460d8ba5c205f8 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Mon, 3 Jan 2022 11:16:00 +0100
Subject: [PATCH 1/2] pinctrl: cherryview: Trigger hwirq0 for interrupt-lines
 without a mapping

Commit bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark
an interrupt line as unused") made the code properly differentiate
between unset vs (hwirq) 0 entries in the GPIO-controller interrupt-line
to GPIO pinnumber/hwirq mapping.

This is causing some boards to not boot. This commit restores the old
behavior of triggering hwirq 0 when receiving an interrupt on an
interrupt-line for which there is no mapping.

Reported-and-tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index abffda1fd51e..1d5818269076 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1471,8 +1471,9 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 
 		offset = cctx->intr_lines[intr_line];
 		if (offset == CHV_INVALID_HWIRQ) {
-			dev_err(dev, "interrupt on unused interrupt line %u\n", intr_line);
-			continue;
+			dev_warn_once(dev, "interrupt on unmapped interrupt line %u\n", intr_line);
+			/* Some boards expect hwirq 0 to trigger in this case */
+			offset = 0;
 		}
 
 		generic_handle_domain_irq(gc->irq.domain, offset);
-- 
2.33.1


Which works around this because calling generic_handle_domain_irq(gc->irq.domain, 0)
somehow shuts up the IRQ until it gets assigned.  I guess it ends up getting masked
by the low-level handler because there is no action assigned to it.

But I cannot find the code-path doing that masking for an irq_desc
with its handler set to handle_bad_irq, which is what the handler
for offset 0 should be at this point in time AFAICT...  Anyways this
fix has been tested and works (it basically restores the old behavior
for unmapped interrupt-lines, with a dev_want_once added).

Given that the hardware which Jarkko is using is pre-production hw
I believe that there is no need for a DMI quirk for that special hw then,
as this fix is sufficient to fix things there.

I'll submit this patch upstream in the usual manner right away.

Regards,

Hans

