Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAED483FC9
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 11:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiADKW5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 05:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35661 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229772AbiADKW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 05:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641291777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pMKheZLJccAHRq/Q3cWBS2qG+OaeDM5ZaPh8EMwH6PQ=;
        b=RtIPCdQ5xgf/inJV2yj/8IwYGddEvmIq2gKNrLz1GlvAFTHIRBCzNOzUXotDh86YHIsz3P
        xKz2aNJx0yJNBO1WdiEPUIeAPpjWsJlqnqCERz32Q/M31p2ufNRzy/oj5p1kSoQZ0ZPTmP
        603zAJSdY3kBDwNSc6iK2IExzg1tTjg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-_Jr7CecVOlWbnHpwySa1kw-1; Tue, 04 Jan 2022 05:22:55 -0500
X-MC-Unique: _Jr7CecVOlWbnHpwySa1kw-1
Received: by mail-ed1-f71.google.com with SMTP id h6-20020a056402280600b003f9967993aeso4090433ede.10
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jan 2022 02:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pMKheZLJccAHRq/Q3cWBS2qG+OaeDM5ZaPh8EMwH6PQ=;
        b=TOoZgsckOXN0v7MJFaryIxLpoP1vPZil+5Ug9h0h8xJM8EjRR/r8spOtUFiYZPDSxN
         K3zujIuU5VamCCqtH6QyHPPea37aWwYH4lmP6OjfH0nJ0jNdL1OVnprmghsMi/ZWRlU+
         SyEh8PzewUDXshmgJWHOA1EgWpF98ADaa5sIHeoY8sAY9h2uMEyfs7bsoQwCaQaj21qO
         Wo/7Q/nYSLelKod7u5Ei9RqLYYDcdlyZjcMjDOfZNT3n3j3qeb6ZjpVDCdNN3SfLq4+b
         uzZHiI9VQ35I4CWM4mT6puPH2QY951V6PEAG33dpusglg3+sU9gGYhsMNyGVpbcYEFJj
         HyEA==
X-Gm-Message-State: AOAM5338t7IxusWO6xUMSQj1fvXXZP7VkXDZkGm88F1uEpwMfiHo3CWh
        n4q+bdSO0XgiyL2U6abef+XCxy4MVlVwE5+OubJ+fZVEXAby5U9AO2Xw6+p0I8tQEPF9ulo70oJ
        gDUUuDhoHrct6Qn4yDyRjFg==
X-Received: by 2002:a17:906:d551:: with SMTP id cr17mr38727779ejc.500.1641291774690;
        Tue, 04 Jan 2022 02:22:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJVoUgBBYTD8iJw6i5Lb+RTROnlxUl/0N2D2TUy00fPOnZ2k0OQsbTcx11fYtkf7aYGPFRlw==
X-Received: by 2002:a17:906:d551:: with SMTP id cr17mr38727768ejc.500.1641291774481;
        Tue, 04 Jan 2022 02:22:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id nb20sm11240731ejc.25.2022.01.04.02.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 02:22:54 -0800 (PST)
Message-ID: <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com>
Date:   Tue, 4 Jan 2022 11:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
 <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
 <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
 <c29e98f5-c8e4-1967-a249-a461776488ad@redhat.com>
 <65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/4/22 10:43, Jarkko Nikula wrote:
> Hi
> 
> On 1/3/22 18:40, Hans de Goede wrote:
>> So we do eventually get an IRQ request for a pin using the GPIO controller
>> internal interrupt-line 0. But the IRQ triggers at least once before then and
>> even though we haven't set a handler yet, calling generic_handle_irq for the
>> GPIO-chips irqdomain, offset 0 IRQ does manage to silence the interrupt.
>>
>> I've been tracing this through the kernel code and AFAICT we end up in:
>>
>> arch/x86/kernel/irq.c: ack_bad_irq() in this case:
>>
>> Which means that this message should show up in dmesg:
>>
>>          if (printk_ratelimit())
>>                  pr_err("unexpected IRQ trap at vector %02x\n", irq);
>>
>> Can you confirm this? Also can you share the full dmesg output of this
>> device (with both patches, with dyndbg option) ?
>>
> Hmm.. don't see it. Attached dmesg_20220103 is with both yesterday's patches.

I guess I must be misreading the code somehow then, the pinctrl-cherryview code
sets the default low-level IRQ handler to handle_bad_irq and it does not
get changed to handle_level_irq / handle_edge_irq until we hit a code
path which also sets intr_lines[intsel] to the pin for which the IRQ is
being activated.

And handle_bad_irq() is:

void handle_bad_irq(struct irq_desc *desc)
{
        unsigned int irq = irq_desc_get_irq(desc);

        print_irq_desc(irq, desc);
        kstat_incr_irqs_this_cpu(desc);
        ack_bad_irq(irq);
}

So we should end up in arch/x86/kernel/irq.c: ack_bad_irq() AFAICT, but
I guess I'm missing something somewhere.

Anyways since my hack to enable the spurious IRQ workaround works and
a spurious IRQ is the root-cause here lets focus on that.


>> Note what we are seeing here is basically a spurious IRQ. Except on a few
>> known broken devices the cherryview pinctrl code relies on the BIOS having
>> configured things so that there are no spurious IRQs. I've attached a
>> quick hack which activates the workaround for known broken devices
>> unconditionally. This replace my previous 2 patches. I expect this to
>> fix things too.
>>
>> If you can make some time to give this one a test too that would be
>> great, then we have some options on how to fix this :)
>>
> Hack patch booted too. Attached dmesg_20220104-hack is from this test.

Thanks.

Andy, Mika, why don't we just mask out all IRQs at boot unconditionally:

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 683b95e9639a..8981755a5d83 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1552,19 +1552,10 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
 	const struct intel_community *community = &pctrl->communities[0];
 
 	/*
-	 * The same set of machines in chv_no_valid_mask[] have incorrectly
-	 * configured GPIOs that generate spurious interrupts so we use
-	 * this same list to apply another quirk for them.
-	 *
-	 * See also https://bugzilla.kernel.org/show_bug.cgi?id=197953.
+	 * Start with all normal interrupts in the community masked,
+	 * but leave the ones that can only generate GPEs unmasked.
 	 */
-	if (!pctrl->chip.irq.init_valid_mask) {
-		/*
-		 * Mask all interrupts the community is able to generate
-		 * but leave the ones that can only generate GPEs unmasked.
-		 */
-		chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
-	}
+	chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
 
 	/* Clear all interrupts */
 	chv_pctrl_writel(pctrl, CHV_INTSTAT, 0xffff);

?

I never really understood why the code only did this on models which are
known to generate spurious IRQs, leaving the IRQs unmasked before any driver
has requested them seems not useful? And as this shows can actually be
harmful at times ?

Regards,

Hans

