Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C717B2182CD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgGHIq3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:46:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37824 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726519AbgGHIq2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594197985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vLJa7A8n8D9Z9dSnEAg8E4041t9X2BnIaSZR27lfC1Y=;
        b=PdHB5g8EmFlSTDx8NXJ8N5R/BGKcEf94jVnQweJ5mEJA1lPiBFNtRhOn6OxRyQ4hsPJSEN
        g+xW8uoVe9iELSLMhvUp7GC6Azh9eVk67fXtsv1sBqU55pIdcazXFYxE6yWcjxM+JXH04u
        oAKbI/u5tFnj/sELO3HuCGIc3cAoawo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-bhAh5LHGMY6OSd0inMBfpA-1; Wed, 08 Jul 2020 04:46:10 -0400
X-MC-Unique: bhAh5LHGMY6OSd0inMBfpA-1
Received: by mail-ej1-f72.google.com with SMTP id cf15so42681314ejb.6
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 01:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=vLJa7A8n8D9Z9dSnEAg8E4041t9X2BnIaSZR27lfC1Y=;
        b=oe6Lh4kCzORNgag2uIBkTPA/bfrY5Ct6IjbXtx7+d9u0ojBKRS4W26wc6WQ5aYG0eZ
         gETeZ+3FTbg/CkjyVHDnbjKZFtcnTDrp3ZBcN5AohLig3jdsIXX1FZYCsbC5W5JHg7/o
         ltDGKHsg6vVl/CNtI84SpSML8uILA6+DyMMpcwic+Cd4qPHqDNrXwGdAX9IOh7uxZg7w
         V/cMvbegXmPIXfJVK9jO7X8HJFDiBQNxYLNjNZAg2liseNoZ/kyonTrBv9x3zOdfHAxB
         JjLYrui7OwJFMSdi4epIc/YEbaS3UrE5l1Rx/JKHZxkCz2Z0r+j/a485fZeJ3LQxYs5q
         zw4g==
X-Gm-Message-State: AOAM532iIGn1HRZQ9rGDcoyf/xZc6/dXpPH7R52G/80UonxOjWcKlnE8
        ac+aCzs3Hr8bObm36kst6ote9KOJKORTTFTa+C07xKUatPomkNn74ayuqFCQGSvKUHQYbNrDQL9
        fUmceh8ICGVVL9/RfCOJXIA==
X-Received: by 2002:a50:d80f:: with SMTP id o15mr66916824edj.156.1594197969114;
        Wed, 08 Jul 2020 01:46:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwXnofstpGphobCb8ePN5F3W5+BI6p3q+OVeJYu8k8/UNHNFLPJgYKs2c3NsRMHqlYLIwNVg==
X-Received: by 2002:a50:d80f:: with SMTP id o15mr66916811edj.156.1594197968923;
        Wed, 08 Jul 2020 01:46:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f17sm1650529ejr.71.2020.07.08.01.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 01:46:08 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
From:   Hans de Goede <hdegoede@redhat.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
Message-ID: <7c7be6ed-63c1-5772-f9fb-742de8f11cb2@redhat.com>
Date:   Wed, 8 Jul 2020 10:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
Content-Type: multipart/mixed;
 boundary="------------E4237274E7939EAD95E95BC0"
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------E4237274E7939EAD95E95BC0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7/8/20 10:23 AM, Hans de Goede wrote:
> Hi all,
> 
> On 7/8/20 9:47 AM, Linus Walleij wrote:
>> On Wed, Jul 8, 2020 at 9:18 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>
>>> I installed Linux on UMAX VisionBook 10Wi Pro. It sometimes boots, but
>>> even then it encounters lags, soft lockups:
>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:0H:6]
>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [kworker/0:2:133]
>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>
>> Adding Hans de Goede to Cc, he often deals with this kind of weirdness
>> so he might have some ideas here.

Thinking more about this, we might need to do something like this
for chv too:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9291c65b01d1c67ebd56644cb19317ad665c44b3

Looking at the datasheet:

https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z8000-datasheet-vol-2.pdf

Section  10.5.54 / page 4949

The chv GPIO controller has a glitch filter too. This is controlled by
bits 26-27 of the PADCTRL0 register.

So I've gone ahead and written a, compile-tested only, patch
enabling the glitch filter on cht devices, as we are already
doing on byt devices. Can you give this a try and see if it helps?

I've also attached another chv-gpio fix which I posted upstream
a while ago, which resulted in a discussion and an alternative
approach. But I haven't gotten around to implementing the
alternative approach to the fix yet. Note it is unlikely this
helps, but you never know.

Regards,

Hans




--------------E4237274E7939EAD95E95BC0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-pinctrl-cherryview-Enable-glitch-filter-for-GPIOs-us.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-pinctrl-cherryview-Enable-glitch-filter-for-GPIOs-us.pa";
 filename*1="tch"

From 069365867e9c24f865aa7c44474d0cf2b86f03f3 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 8 Jul 2020 10:41:18 +0200
Subject: [PATCH] pinctrl: cherryview: Enable glitch filter for GPIOs used as
 interrupts

On some systems, some PCB traces attached to GpioInts are routed in such
a way that they pick up enough interference to constantly (many times per
second) trigger.

Enabling glitch-filtering fixes this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 571c02218bda..8f7b1ded9b64 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -36,6 +36,12 @@
 #define CHV_PADCTRL0			0x000
 #define CHV_PADCTRL0_INTSEL_SHIFT	28
 #define CHV_PADCTRL0_INTSEL_MASK	GENMASK(31, 28)
+#define CHV_PADCTRL0_GLITCH_FILT_SHIFT	26
+#define CHV_PADCTRL0_GLITCH_FILT_MASK	GENMASK(27, 26)
+#define CHV_PADCTRL0_GLITCH_FILT_OFF	0
+#define CHV_PADCTRL0_GLITCH_FILT_EDGE	1
+#define CHV_PADCTRL0_GLITCH_FILT_DATA	2
+#define CHV_PADCTRL0_GLITCH_FILT_BOTH	3
 #define CHV_PADCTRL0_TERM_UP		BIT(23)
 #define CHV_PADCTRL0_TERM_SHIFT		20
 #define CHV_PADCTRL0_TERM_MASK		GENMASK(22, 20)
@@ -1389,10 +1395,14 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 		chv_writel(value, reg);
 	}
 
+	/* Enable glitch filtering */
 	value = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+	value |= CHV_PADCTRL0_GLITCH_FILT_BOTH << CHV_PADCTRL0_GLITCH_FILT_SHIFT;
+	chv_writel(value, CHV_PADCTRL0);
+
+	/* Store interrupt-line to pin mapping for this pin*/
 	value &= CHV_PADCTRL0_INTSEL_MASK;
 	value >>= CHV_PADCTRL0_INTSEL_SHIFT;
-
 	pctrl->intr_lines[value] = pin;
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
-- 
2.26.2


--------------E4237274E7939EAD95E95BC0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-pinctrl-cherryview-Ensure-_REG-ACPI_ADR_SPACE_GPIO-1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-pinctrl-cherryview-Ensure-_REG-ACPI_ADR_SPACE_GPIO-1.pa";
 filename*1="tch"

From 742406fcfbaa2311968e74170ab10a20b63eb373 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 29 Apr 2020 10:16:33 +0200
Subject: [PATCH] pinctrl: cherryview: Ensure _REG(ACPI_ADR_SPACE_GPIO, 1) gets
 called

On Cherry Trail devices there are 2 possible ACPI OpRegions for
accessing GPIOs. The standard GeneralPurposeIo OpRegion and the Cherry
Trail specific UserDefined 0x9X OpRegions.

Having 2 different types of OpRegions leads to potential issues with
checks for OpRegion availability, or in other words checks if _REG has
been called for the OpRegion which the ACPI code wants to use.

The ACPICA core does not call _REG on an ACPI node which does not
define an OpRegion matching the type being registered; and the reference
design DSDT, from which most Cherry Trail DSDTs are derived, does not
define GeneralPurposeIo, nor UserDefined(0x93) OpRegions for the GPO2
(UID 3) device, because no pins were assigned ACPI controlled functions
in the reference design.

Together this leads to the perfect storm, at least on the Cherry Trail
based Medion Akayo E1239T. This design does use a GPO2 pin from its ACPI
code and has added the Cherry Trail specific UserDefined(0x93) opregion
to its GPO2 ACPI node to access this pin.

But it uses a has _REG been called availability check for the standard
GeneralPurposeIo OpRegion. This clearly is a bug in the DSDT, but this
does work under Windows. This issue leads to the intel_vbtn driver
reporting the device always being in tablet-mode at boot, even if it
is in laptop mode. Which in turn causes userspace to ignore touchpad
events. So iow this issues causes the touchpad to not work at boot.

Since the bug in the DSDT stems from the confusion of having 2 different
OpRegion types for accessing GPIOs on Cherry Trail devices, I believe
that this is best fixed inside the Cherryview pinctrl driver.

This commit adds a workaround to the Cherryview pinctrl driver so
that the DSDT's expectations of _REG always getting called for the
GeneralPurposeIo OpRegion are met.

Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Drop unnecessary if (acpi_has_method(adev->handle, "_REG")) check
- Fix Cherryview spelling in the commit message
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 8e3953a223d0..a0aceaf52c6a 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1629,6 +1629,8 @@ static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
 
 static int chv_pinctrl_probe(struct platform_device *pdev)
 {
+	struct acpi_object_list input;
+	union acpi_object params[2];
 	struct chv_pinctrl *pctrl;
 	struct acpi_device *adev;
 	acpi_status status;
@@ -1691,6 +1693,22 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	if (ACPI_FAILURE(status))
 		dev_err(&pdev->dev, "failed to install ACPI addr space handler\n");
 
+	/*
+	 * Some DSDT-s use the chv_pinctrl_mmio_access_handler while checking
+	 * for the regular GeneralPurposeIo OpRegion availability, mixed with
+	 * the DSDT not defining a GeneralPurposeIo OpRegion at all. In this
+	 * case the ACPICA code will not call _REG to signal availability of
+	 * the GeneralPurposeIo OpRegion. Manually call _REG here so that
+	 * the DSDT-s GeneralPurposeIo availability checks will succeed.
+	 */
+	params[0].type = ACPI_TYPE_INTEGER;
+	params[0].integer.value = ACPI_ADR_SPACE_GPIO;
+	params[1].type = ACPI_TYPE_INTEGER;
+	params[1].integer.value = 1;
+	input.count = 2;
+	input.pointer = params;
+	acpi_evaluate_object(adev->handle, "_REG", &input, NULL);
+
 	platform_set_drvdata(pdev, pctrl);
 
 	return 0;
-- 
2.26.2


--------------E4237274E7939EAD95E95BC0--

