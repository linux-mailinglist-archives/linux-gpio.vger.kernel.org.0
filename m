Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDBE63C021
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234300AbiK2MeR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbiK2MeN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:34:13 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD8E5E3ED;
        Tue, 29 Nov 2022 04:34:10 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="377243441"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="377243441"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 04:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674605782"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="674605782"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 29 Nov 2022 04:34:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1ozzoK-001ha5-00;
        Tue, 29 Nov 2022 14:34:04 +0200
Date:   Tue, 29 Nov 2022 14:34:03 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from
 the wrong register
Message-ID: <Y4X8O382eP+DKNA+@smile.fi.intel.com>
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-2-hdegoede@redhat.com>
 <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com>
 <9a4336d1-3222-fe50-f234-93ab175d606a@redhat.com>
 <CAHp75VdEd2-YMm2kGdRh2n7WwTJDEmOk68O4ydHU1m3W+Z83Lg@mail.gmail.com>
 <1eb61f7a-3b93-32a1-21bf-6929bbb40d36@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eb61f7a-3b93-32a1-21bf-6929bbb40d36@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 01:19:57PM +0100, Hans de Goede wrote:
> On 11/29/22 12:56, Andy Shevchenko wrote:
> > On Tue, Nov 29, 2022 at 1:27 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 11/29/22 11:22, Andy Shevchenko wrote:
> >>> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>
> >>>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
> >>>> so that the actual value of the pin is read, rather then the value the pin
> >>>
> >>> than
> >>
> >> Ack.
> >>
> >>>> would output when put in output mode.
> >>>
> >>> I don't see it here and haven't checked the context, but the idea is
> >>> to check the direction and return either input (if pin is in input
> >>> mode) or [cached] output.If it's the case, the patch looks good to me.
> >>
> >> No the idea is to always actually use the input register when reading
> >> the pins, independent of the input/output mode. Instead of always
> >> reading the [cached] output register value.
> > 
> > But why? This makes a little sense to me.
> 
> I don't understand what your problem is with this patch ?
> 
> This is standard behavior for GPIO drivers, the get() callback
> always reads the actual pin values when there is a registers
> to get the actual pin-values. AFAIK this is no different from what
> countless other GPIO drivers do ?

If the GPIO is requested is output and the pin in the HiZ mode, what value
should you return?

> >> The input buffer will still work when the device is in output mode
> > 
> > Does this hardware support HiZ?
> 
> Yes the 7 standard GPIO pins can be put in input mode, aka HiZ mode.

No, input and HiZ are two different states. If the hardware doesn't
support the latter, then your patch doesn't make any difference indeed, except
involving "in" buffer for "out" value. Which I consider an unneeded
step instead of reading [cached] "out" value.

[cached] here is used in a broader sense: either SW cache, or read back value
from the GPIO out register (not all hardware support that).

> >> and if somehow an external force is pushing the pin low/high against
> >> the output value then the input buffer will correctly reflect this
> >> (assuming the output is current limited and thus the magic smoke
> >> stays inside the chip).
> > 
> > Exactly, when smoke comes out, the hardware is broken and code,
> > whatever is it, makes no difference at all.
> 
> The GPIO part of the TPS68470 supports open-drain outputs, to correctly
> get the actual value on the pin from the get() callback, the GPDI
> register must be used. And being able to detect some outside chip
> forcing the line low in open-drain mode is important to be able to
> e.g. implement a software I2C master.

Right, but for push-pull mode this is not needed, correct?

> As I mentioned above actually using the input buffer value in
> the get() method is standard behavior for GPIO drivers, exactly
> for reasons like allowing a sw I2C master implementation to
> detect clock stretching or conflicts (in the multi master case).

> I really don't understand what is so controversial about this
> patch?

There are couple of remarks above:
1) what to read at the real HiZ mode ("in" and "out" buffers are disconnected
   from the pin) in case hardware supports it;
2) why to read "out" value via "in" buffer in case of push-pull mode.

> Note the datasheet describes the GPDO / GPDI bit 0  values as:
> 
> GPDO bit 0: "Control of the GPIO0 output"
> GPDI bit 0: "State of the GPIO0 input"
> 
> So clearly GPDI is the correct register to use for the get()
> callback, which is what this patch is doing.

-- 
With Best Regards,
Andy Shevchenko


