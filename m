Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70CF48D3A4
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jan 2022 09:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbiAMIbm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jan 2022 03:31:42 -0500
Received: from mga07.intel.com ([134.134.136.100]:14867 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233039AbiAMIbm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Jan 2022 03:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642062702; x=1673598702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zBSCeGpvzAtqDKvWZJfx1EfAagAQS0bA28xnY5r7s2g=;
  b=QQICgQa6U77mdOnSgXB37RFkbrSFf/b9yt/b6EtLi4qIJ4urDjrTP/mK
   bCQtu5RdAlJAO/1f9YE/2ugcXnEB1tQyUe8rgO1+6HGiYZkrnQP/Qr/1S
   3wqQ1BCCqV1kOPN7yyrX3c93PMf6buyLMAMzOznsc3R4/tznr9/Vd5WjI
   mmG/O1v8cXoKOzimSfEz+2X7QYMyXk7fkaveS9ZyPWO5Vx8F0u3LWpgh0
   7/j85zv5Cnh1zvrLaUr6gUeLpwacR3eJDL/dwy/n5RuCRV9qXYg/b60v4
   xuBrpA0EcEmTAjdwXB2nQMMCfJ1KuHqiWl/KDELnYsJrtjbrytUppj3ND
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307308544"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="307308544"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 00:31:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="691722589"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 00:31:39 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 13 Jan 2022 10:29:27 +0200
Date:   Thu, 13 Jan 2022 10:29:27 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <Yd/i54iSdRGv1peX@lahna>
References: <20220112210200.265429-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112210200.265429-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 12, 2022 at 10:02:00PM +0100, Hans de Goede wrote:
> Some boards set the direct_irq_en flag in the conf0 register without
> setting the correct trigger bits. The direct_irq_en flag just means that
> the GPIO will send IRQs directly to the APIC instead of going through
> the shared interrupt for the GPIO controller, in order for the pin to be
> able to actually generate IRQs the trigger flags must configure the IRQ
> as a level-high or level-low active IRQ.
> 
> Note testing shows that using edge trigger add the conf0 register level
> does NOT work, instead edge triggering should be set at the IO-APIC level.
> 
> I believe that the direct_irq_en flag connects the output of the GPIO's IRQ
> trigger block, which normally sets the status flag in the IRQ status reg at
> 0x800 to one of the IO-APIC pins according to the direct IRQ mux.
> 
> This means that the TRIG_LVL bit *must* be set, so that the GPIO's input
> value is directly passed (1:1 or inverted) to the IO-APIC pin, if TRIG_LVL
> is not set, selecting edge mode operation then on the first edge the
> selected IO-APIC pin goes high, but since no write-to-clear write will be
> done to the IRQ status reg at 0x800, the detected edge condition will never
> get cleared.
> 
> This APIC pin stuck high condition can be observed with the pin configured
> as level-high active, in the form of an interrupt storm. Clearing the
> TRIG_MASK bits of conf0 stops the storm, reconfiguring them as edge again
> results in a storm again as soon as the edge is triggered once.
> 
> Detect invalid trigger flags, log a FW_BUG warning when encountering this
> and clear the direct_irq_en flag so that a driver can actually use the pin
> as IRQ through gpiod_to_irq().
> 
> Specifically this allows the edt-ft5x06 touchscreen driver to use
> INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
> accompanied by the following new log message
> 
> byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing
> 
> The new byt_direct_irq_sanity_check() function also checks that the
> pin is actually appointed to one of the 16 direct-IRQs which the GPIO
> controller supports and on success prints debug messages like these:
> 
> byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (IO-APIC 67)
> byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (IO-APIC 69)
> 
> This is useful to figure out the GPIO pin belonging to ACPI
> resources like this one: "Interrupt () { 0x00000043 }" or
> the other way around.
> 
> The strict checking of valid trigger flags this introduces does result in
> FW_BUG messages on quite a few devices. E.g. on the Yoga Tablet 2 1051L:
>  byt_gpio INT33FC:00: [Firmware Bug]: pin 92: direct_irq_en set but no IRQ assigned, clearing
>  byt_gpio INT33FC:00: [Firmware Bug]: pin 93: direct_irq_en set but no IRQ assigned, clearing
>   These 2 also have mux set to 7 and fall + rise + level trigger bits set,
>   presumably something has written 0xffffffff to their conf0 registers
>  byt_gpio INT33FC:02: Pin 3: uses direct IRQ 1 (IO-APIC 68)
>  byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger (conf0: 2803cc00h), clearing
>   Most tablets seem to have this, looking at DSDTs this seems intended for
>   use with an I2C HID sensor-hub and is still set on devices without one.
> 
> To make sure this does not cause any regressions this has been tested,
> including checking disabled direct-IRQs are not used in the DSDT,
> on the following devices:
> 
> Asus ME176C
> Asus TF103C
> Chuwi Vi10 (with its Windows BIOS)
> HP x2 10-n000nd
> Lenovo Yoga Tablet 2 1050L (Android version, without EC, with buggy DSDT)
> Lenovo Yoga Tablet 2 1051L (Windows version, with EC)
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
