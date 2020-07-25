Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6918E22D62C
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 10:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgGYIsS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 04:48:18 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49560 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726593AbgGYIsS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Jul 2020 04:48:18 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 8BA2F634C87;
        Sat, 25 Jul 2020 11:47:40 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jzFqG-0000kc-Bl; Sat, 25 Jul 2020 11:47:40 +0300
Date:   Sat, 25 Jul 2020 11:47:40 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v10 2/4] media: i2c: Add MAX9286 driver
Message-ID: <20200725084740.GD829@valkosipuli.retiisi.org.uk>
References: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
 <20200612144713.502006-3-kieran.bingham+renesas@ideasonboard.com>
 <1fb4a023-d177-744f-41f4-755aafbfa7f2@ideasonboard.com>
 <20200723222834.GC829@valkosipuli.retiisi.org.uk>
 <c4b0e30f-b0b7-1b19-f43e-36d417eb6d28@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4b0e30f-b0b7-1b19-f43e-36d417eb6d28@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kieran,

On Fri, Jul 24, 2020 at 10:32:11AM +0100, Kieran Bingham wrote:
> Hi Sakari,
> 
> On 23/07/2020 23:28, Sakari Ailus wrote:
> > Hi Kieran,
> > 
> > On Thu, Jul 16, 2020 at 10:02:24AM +0100, Kieran Bingham wrote:
> >> Hi Sakari,
> >>
> >> This is the output of checkpatch --strict on this driver. Sorry for not
> >> detailing this in the commit or cover letter.
> > 
> > No worries.
> > 
> >>
> >>> ./patches/gmsl/v10/v10-0001-dt-bindings-media-i2c-Add-bindings-for-Maxim-Int.patch has style problems, please review.
> >>> --------------------------------------------------------------
> >>> ./patches/gmsl/v10/v10-0002-media-i2c-Add-MAX9286-driver.patch
> >>> --------------------------------------------------------------
> >>> CHECK: Prefer using the BIT macro
> >>> #246: FILE: drivers/media/i2c/max9286.c:40:
> >>> +#define MAX9286_FSYNCMODE_INT_OUT	(1 << 6)
> >>>
> >>> CHECK: Prefer using the BIT macro
> >>> #251: FILE: drivers/media/i2c/max9286.c:45:
> >>> +#define MAX9286_FSYNCMETH_SEMI_AUTO	(1 << 0)
> >>>
> >>> CHECK: Prefer using the BIT macro
> >>> #262: FILE: drivers/media/i2c/max9286.c:56:
> >>> +#define MAX9286_EDC_6BIT_CRC		(1 << 5)
> >>>
> >>> CHECK: Prefer using the BIT macro
> >>> #268: FILE: drivers/media/i2c/max9286.c:62:
> >>> +#define MAX9286_HVSRC_D14		(1 << 0)
> >>>
> >>> CHECK: Prefer using the BIT macro
> >>> #286: FILE: drivers/media/i2c/max9286.c:80:
> >>> +#define MAX9286_DATATYPE_RGB565		(1 << 0)
> >>>
> >>> CHECK: Prefer using the BIT macro
> >>> #304: FILE: drivers/media/i2c/max9286.c:98:
> >>> +#define MAX9286_I2CSLVSH_469NS_234NS	(1 << 5)
> >>>
> >>> CHECK: Prefer using the BIT macro
> >>> #312: FILE: drivers/media/i2c/max9286.c:106:
> >>> +#define MAX9286_I2CMSTBT_28KBPS		(1 << 2)
> >>>
> >>> CHECK: Prefer using the BIT macro
> >>> #316: FILE: drivers/media/i2c/max9286.c:110:
> >>> +#define MAX9286_I2CSLVTO_256US		(1 << 0)
> >>
> >> None of those are appropriate to use the BIT() macro, as they are all
> >> entries of a specific field with a shift, such as:
> >>
> >> #define MAX9286_FSYNCMODE_ECU           (3 << 6)
> >> #define MAX9286_FSYNCMODE_EXT           (2 << 6)
> >> #define MAX9286_FSYNCMODE_INT_OUT       (1 << 6)
> >> #define MAX9286_FSYNCMODE_INT_HIZ       (0 << 6)
> >>
> >> Checkpatch is only picking up on the "1 << x" variant of each entry.
> > 
> > Ideally you should use "1U << x" everywhere. If you happen to have a
> > register with 31st bit signifying something, mayhem would follow. So the
> > practice is to make all such definitions unsigned.
> 
> Just to clarify, because of the location you've put your x, which is not
> the variable in the above case.
> 
> These definitions are possible field values with a shift (enum << y),
> not bit values (1 << x)
> 
> They can of course be unsigned though.
> 
> Is your statement that you would like to see these as:
> 
>  #define MAX9286_FSYNCMODE_ECU           (3U << 6)
>  #define MAX9286_FSYNCMODE_EXT           (2U << 6)
>  #define MAX9286_FSYNCMODE_INT_OUT       (1U << 6)
>  #define MAX9286_FSYNCMODE_INT_HIZ       (0U << 6)

Yes, please. This avoids shifting a non-zero bit to the 31st position of a
32-bit register.

> 
> 
> Or that you would prefer a macro'ised version:
> 
> #define FIELD_ENTRY(value, shift) (value U << shift)
> 
> 
> Or rather, I could just convert them all to use FIELD_PREP:
> 
> #define MAX9286_FSYNCMODE GENMASK(7,6)
> 
> #define MAX9286_FSYNCMODE_ECU      FIELD_PREP(MAX9286_FSYNCMODE, 3)
> #define MAX9286_FSYNCMODE_EXT      FIELD_PREP(MAX9286_FSYNCMODE, 2)
> #define MAX9286_FSYNCMODE_INT_OUT  FIELD_PREP(MAX9286_FSYNCMODE, 1)
> #define MAX9286_FSYNCMODE_INT_HIZ  FIELD_PREP(MAX9286_FSYNCMODE, 0)
> 
> If you want me to change these entries, I suspect moving wholly to use
> FIELD_PREP/FIELD_GET throughout the driver would be the best course of
> action.
> 
> A bit of churn, but I can do that if you wish.
> 
> --
> Kieran
> 
> 
> 
> >>> CHECK: Macro argument reuse 'source' - possible side-effects?
> >>> #399: FILE: drivers/media/i2c/max9286.c:193:
> >>> +#define for_each_source(priv, source) \
> >>> +	for ((source) = NULL; ((source) = next_source((priv), (source))); )
> >>
> >> This warns against possible side effects, but the 're-use' effects are
> >> desired ;-)
> >>
> >> If you'd prefer this macro to be re-written please let me know.
> > 
> > Works for me. Some warnigns are just not useful. I bet quite a few macros
> > elsewhere in the kernel would trigger this.
> 
> 
> I think we'll just leave this one ;-)
> 
> 
> >>> CHECK: Lines should not end with a '('
> >>> #1372: FILE: drivers/media/i2c/max9286.c:1166:
> >>> +			ret = v4l2_fwnode_endpoint_parse(
> >>
> >> Full code block:
> >>
> >>>                         ret = v4l2_fwnode_endpoint_parse(
> >>>                                         of_fwnode_handle(node), &vep);
> >>>                         if (ret) {
> >>>                                 of_node_put(node);
> >>>                                 return ret;
> >>>                         }
> >>
> >> That one is awkward, and I chose to keep it as a lesser evil.
> >> Of course now that we can officially go up to 120 chars, I could move
> >> this line up.
> >>
> >> If you'd like this to be moved to a single line now we can go over 80
> >> chars, please confirm.
> > 
> > I don't mind that. Mauro, any thoughts on this?
> 
> 
> And I'll let Mauro decide that as it will impact my line-length choices
> in the future ;-)

I think it's actually much better to end a line with opening parenthesis
than have a line longer than 80, but I recognise there are differing
opinions.

My terminal window width is 80 and having more terminals is more useful
than being able to see a rare line over 80 completely.

-- 
Regards,

Sakari Ailus
