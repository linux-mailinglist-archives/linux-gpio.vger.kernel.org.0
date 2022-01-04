Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A66A48401B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 11:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbiADKsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 05:48:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55992 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231622AbiADKsK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 05:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641293289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=esRHqpeQQ4wZrYitvhSEIs3IxRXxgvfgrNrbGq3L/cg=;
        b=Vw+vG2eMyn7tZDzrqpshXiezbKI4WhFhWOmolQeNb5JrJHO2JzoNYl2s/mPM89mi+dlDvO
        rHWr1neDyb/h3Ip8FtNKokxOyBbdfQ8BTlmbWrhi0H/Ujyuhfdhy46b8Ssg0ty93tGOvuN
        sgNXpI6CXhtx79M7TSXmKlxAP4skzrE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-VnXEoHhNOae9SxSwPckvDQ-1; Tue, 04 Jan 2022 05:48:08 -0500
X-MC-Unique: VnXEoHhNOae9SxSwPckvDQ-1
Received: by mail-ed1-f71.google.com with SMTP id h6-20020a056402280600b003f9967993aeso4133867ede.10
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jan 2022 02:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to;
        bh=esRHqpeQQ4wZrYitvhSEIs3IxRXxgvfgrNrbGq3L/cg=;
        b=LYECJITr2ZjbfhP6lvdKK4MbjNwQtahZUny8N+ji8IkTF6FvQWEKiC6Ofavu9iKr6Z
         X3VhL98XLPBv8FbkGnVFJXNyCNh9cnckqChFZQ+dlmQ6MBPUGvXi9cniLvVUzFHu97b+
         Uo69rEuyQErrJ5uWm6UQuHfgkC8IeR0BbCoehhkx76KfyL8OwRbYklSYp42Qx+Jsw66D
         dYEEsmzv8ObNjsDUpABbHK48pB4cRJ8WxKCcr74tVoT17ZnoL/MybLvjFmspOW0NOitY
         EXIyx2qzuq34VZfBNFshBhFbs7h+wo1wrn61aELAhXFPOOPfBzeAGw2gBif73EkdjMp1
         Qz0A==
X-Gm-Message-State: AOAM530boAFvwGvHqJOLte+YcbrDByWrcRZKPRUtfYBIC7vKPC1Uhdf6
        u/jxPsRtumL9UzSTDzcOZi7M3EoSmY/EvluV/22yJXYG5f9CnksNKCxfwkxoJ7skmlNyyaUfYZp
        2vGbl91QEsED7BcfO7gG32g==
X-Received: by 2002:a17:906:a2c7:: with SMTP id by7mr37623395ejb.439.1641293287056;
        Tue, 04 Jan 2022 02:48:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx1luxPKWDkB7DLhFZZpY4NHdMn2Xv3UGxcxhy16V2M8nWPHsLG4SEWEpnypYYC7qr08RGqA==
X-Received: by 2002:a17:906:a2c7:: with SMTP id by7mr37623384ejb.439.1641293286847;
        Tue, 04 Jan 2022 02:48:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id qf22sm11390074ejc.85.2022.01.04.02.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 02:48:06 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------CjmxQgwXWgdu4wFCnyNxhaJL"
Message-ID: <60adc8c5-3d58-b7bf-6c53-70599118b83f@redhat.com>
Date:   Tue, 4 Jan 2022 11:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
 <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
 <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
 <c29e98f5-c8e4-1967-a249-a461776488ad@redhat.com>
 <65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com>
 <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com>
In-Reply-To: <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------CjmxQgwXWgdu4wFCnyNxhaJL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/4/22 11:22, Hans de Goede wrote:
> Hi,
> 
> On 1/4/22 10:43, Jarkko Nikula wrote:
>> Hi
>>
>> On 1/3/22 18:40, Hans de Goede wrote:
>>> So we do eventually get an IRQ request for a pin using the GPIO controller
>>> internal interrupt-line 0. But the IRQ triggers at least once before then and
>>> even though we haven't set a handler yet, calling generic_handle_irq for the
>>> GPIO-chips irqdomain, offset 0 IRQ does manage to silence the interrupt.
>>>
>>> I've been tracing this through the kernel code and AFAICT we end up in:
>>>
>>> arch/x86/kernel/irq.c: ack_bad_irq() in this case:
>>>
>>> Which means that this message should show up in dmesg:
>>>
>>>          if (printk_ratelimit())
>>>                  pr_err("unexpected IRQ trap at vector %02x\n", irq);
>>>
>>> Can you confirm this? Also can you share the full dmesg output of this
>>> device (with both patches, with dyndbg option) ?
>>>
>> Hmm.. don't see it. Attached dmesg_20220103 is with both yesterday's patches.
> 
> I guess I must be misreading the code somehow then, the pinctrl-cherryview code
> sets the default low-level IRQ handler to handle_bad_irq and it does not
> get changed to handle_level_irq / handle_edge_irq until we hit a code
> path which also sets intr_lines[intsel] to the pin for which the IRQ is
> being activated.
> 
> And handle_bad_irq() is:
> 
> void handle_bad_irq(struct irq_desc *desc)
> {
>         unsigned int irq = irq_desc_get_irq(desc);
> 
>         print_irq_desc(irq, desc);
>         kstat_incr_irqs_this_cpu(desc);
>         ack_bad_irq(irq);
> }
> 
> So we should end up in arch/x86/kernel/irq.c: ack_bad_irq() AFAICT, but
> I guess I'm missing something somewhere.
> 
> Anyways since my hack to enable the spurious IRQ workaround works and
> a spurious IRQ is the root-cause here lets focus on that.
> 
> 
>>> Note what we are seeing here is basically a spurious IRQ. Except on a few
>>> known broken devices the cherryview pinctrl code relies on the BIOS having
>>> configured things so that there are no spurious IRQs. I've attached a
>>> quick hack which activates the workaround for known broken devices
>>> unconditionally. This replace my previous 2 patches. I expect this to
>>> fix things too.
>>>
>>> If you can make some time to give this one a test too that would be
>>> great, then we have some options on how to fix this :)
>>>
>> Hack patch booted too. Attached dmesg_20220104-hack is from this test.
> 
> Thanks.
> 
> Andy, Mika, why don't we just mask out all IRQs at boot unconditionally:
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 683b95e9639a..8981755a5d83 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1552,19 +1552,10 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
>  	const struct intel_community *community = &pctrl->communities[0];
>  
>  	/*
> -	 * The same set of machines in chv_no_valid_mask[] have incorrectly
> -	 * configured GPIOs that generate spurious interrupts so we use
> -	 * this same list to apply another quirk for them.
> -	 *
> -	 * See also https://bugzilla.kernel.org/show_bug.cgi?id=197953.
> +	 * Start with all normal interrupts in the community masked,
> +	 * but leave the ones that can only generate GPEs unmasked.
>  	 */
> -	if (!pctrl->chip.irq.init_valid_mask) {
> -		/*
> -		 * Mask all interrupts the community is able to generate
> -		 * but leave the ones that can only generate GPEs unmasked.
> -		 */
> -		chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
> -	}
> +	chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
>  
>  	/* Clear all interrupts */
>  	chv_pctrl_writel(pctrl, CHV_INTSTAT, 0xffff);
> 
> ?
> 
> I never really understood why the code only did this on models which are
> known to generate spurious IRQs, leaving the IRQs unmasked before any driver
> has requested them seems not useful? And as this shows can actually be
> harmful at times ?

So although masking all regular (non GPE) interrupt-lines at boot fixes things,
I was thinking that if we somehow still manage to hit the new if() which prints
the "interrupt on unused interrupt line %u" message, we should still do
something to avoid the interrupt storm.

So I've written another patch, which I believe is something which we will want
regardless of the question if we should mask interrupts at boot or not.

I've attached this patch here. Jarkko, can you test a linux-next kernel with
just this patch added?

This should still lead to the "interrupt on unused interrupt line %u" message
getting printed, but hopefully the system will actually boot despite this,
since the code path printing the msg now acks the interrupt.

Thinking more about this I believe that this is likely the correct fix for
the caused regression, because the spurious IRQ was always there already.

Fixing the spurious IRQ is still good to do but is a somewhat separate issue
really.

Regards,

Hans
--------------CjmxQgwXWgdu4wFCnyNxhaJL
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-pinctrl-cherryview-Ack-spurious-IRQs-to-avoid-an-IRQ.patch"
Content-Disposition: attachment;
 filename*0="0001-pinctrl-cherryview-Ack-spurious-IRQs-to-avoid-an-IRQ.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkNTdiNjdiMjMyNzQwMzdlZDY3ZjFmNTFkMTJkZWFlMDVmYmE3MzVjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBUdWUsIDQgSmFuIDIwMjIgMTE6NDI6MDcgKzAxMDAKU3ViamVjdDogW1BB
VENIXSBwaW5jdHJsOiBjaGVycnl2aWV3OiBBY2sgc3B1cmlvdXMgSVJRcyB0byBhdm9pZCBh
biBJUlEgc3Rvcm0KCkNvbW1pdCBiZGZiZWYyZDI5ZGMgKCJwaW5jdHJsOiBjaGVycnl2aWV3
OiBEb24ndCB1c2Ugc2VsZWN0aW9uIDAgdG8gbWFyawphbiBpbnRlcnJ1cHQgbGluZSBhcyB1
bnVzZWQiKSBtYWRlIHRoZSBjb2RlIHByb3Blcmx5IGRpZmZlcmVudGlhdGUKYmV0d2VlbiB1
bnNldCB2cyAoaHdpcnEpIDAgZW50cmllcyBpbiB0aGUgR1BJTy1jb250cm9sbGVyIGludGVy
cnVwdC1saW5lCnRvIEdQSU8gcGlubnVtYmVyL2h3aXJxIG1hcHBpbmcuCgpBcyBwYXJ0IG9m
IHRoaXMgY2h2X2dwaW9faXJxX2hhbmRsZXIoKSBnb3QgdGhlIGZvbGxvd2luZyBjb2RlIGFk
ZGVkOgoKaWYgKG9mZnNldCA9PSBDSFZfSU5WQUxJRF9IV0lSUSkgewogICAgICAgIGRldl9l
cnIoZGV2LCAiaW50ZXJydXB0IG9uIHVudXNlZCBpbnRlcnJ1cHQgbGluZSAldVxuIiwgaW50
cl9saW5lKTsKICAgICAgICBjb250aW51ZTsKfQoKVGhpcyBjYXVzZXMgaXQgdG8gbm93IGNv
cnJlY3RseSBpZGVudGlmeSBzcHVyaW91cyBJUlFzLCBidXQgd2hlbiB0aGVzZQpoYXBwZW4g
dGhleSBub3cgY2F1c2UgYW4gaW50ZXJydXB0IHN0b3JtIGJlY2F1c2UgdGhleSBkbyBub3Qg
Z2V0IGFja2VkLgoKQXZvaWQgdGhpcyBieSBhY2tpbmcgdGhlIGludGVycnVwdC1saW5lIGJl
Zm9yZSBjb250aW51aW5nIHdpdGggY2hlY2tpbmcKdGhlIG5leHQgaW50ZXJydXB0LWxpbmUu
CgpUaGlzIGZpeGVzIHNvbWUgc3lzdGVtcyB3aGljaCBoYXZlIHNwdXJpb3VzIElSUXMgZHVy
aW5nIGJvb3Qgbm8gbG9uZ2VyCmJvb3RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdv
ZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvcGluY3RybC9pbnRlbC9w
aW5jdHJsLWNoZXJyeXZpZXcuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJsLWNo
ZXJyeXZpZXcuYyBiL2RyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJsLWNoZXJyeXZpZXcu
YwppbmRleCA4OTgxNzU1YTVkODMuLmZhOWQwZTU0MjFiOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9waW5jdHJsL2ludGVsL3BpbmN0cmwtY2hlcnJ5dmlldy5jCisrKyBiL2RyaXZlcnMvcGlu
Y3RybC9pbnRlbC9waW5jdHJsLWNoZXJyeXZpZXcuYwpAQCAtMTQ3Miw2ICsxNDcyLDEwIEBA
IHN0YXRpYyB2b2lkIGNodl9ncGlvX2lycV9oYW5kbGVyKHN0cnVjdCBpcnFfZGVzYyAqZGVz
YykKIAkJb2Zmc2V0ID0gY2N0eC0+aW50cl9saW5lc1tpbnRyX2xpbmVdOwogCQlpZiAob2Zm
c2V0ID09IENIVl9JTlZBTElEX0hXSVJRKSB7CiAJCQlkZXZfZXJyKGRldiwgImludGVycnVw
dCBvbiB1bnVzZWQgaW50ZXJydXB0IGxpbmUgJXVcbiIsIGludHJfbGluZSk7CisJCQkvKiBB
Y2sgdGhlIGludGVycnVwdC1saW5lIHRvIGF2b2lkIGFuIElSUSBzdG9ybSAqLworCQkJcmF3
X3NwaW5fbG9ja19pcnFzYXZlKCZjaHZfbG9jaywgZmxhZ3MpOworCQkJY2h2X3BjdHJsX3dy
aXRlbChwY3RybCwgQ0hWX0lOVFNUQVQsIEJJVChpbnRyX2xpbmUpKTsKKwkJCXJhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZjaHZfbG9jaywgZmxhZ3MpOwogCQkJY29udGludWU7CiAJ
CX0KIAotLSAKMi4zMy4xCgo=
--------------CjmxQgwXWgdu4wFCnyNxhaJL--

