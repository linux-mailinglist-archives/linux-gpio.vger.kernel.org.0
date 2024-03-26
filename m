Return-Path: <linux-gpio+bounces-4652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4CE88CB70
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 19:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77096321E1F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 18:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0F8208A7;
	Tue, 26 Mar 2024 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h/knSa3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F41F934;
	Tue, 26 Mar 2024 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711476040; cv=none; b=N7xLCYs+JpUtZ4K/Ao/f7TxJg2vJZhCHYT3pPkCZANoYT9z/cSPhLaC0ubacGyyxp7m6IPERG7JtqP7OSRNwcW1i7A+w8E5R//67bCW1tr51uX51oTV1EyqLO2wUfK68t/OsvjQyJ8xDxgeRVafH7XtcbW19IiZCGl7iO/O/vxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711476040; c=relaxed/simple;
	bh=DZjayx3kexfczWd9TVgaUG5W03PTWRVpWbCHajC9RkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2cBeRJEbaYUSCBzJwYvoR8W1lCsM+WhlZWjprLzWR68RRq4U0/g3+0LJdEp1eAwIwvMTBRyXDpZZKargXuba6gV9Aul743EeltT7UpZPTyqdqrVAlPbWyEAJfOmL+kSWCBVeDAEJnXhS4Tqb3CKXK9Fn7VF/uOWsJb3g0rshKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h/knSa3h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 665941815;
	Tue, 26 Mar 2024 19:00:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711476002;
	bh=DZjayx3kexfczWd9TVgaUG5W03PTWRVpWbCHajC9RkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/knSa3hYzOqFkDpRgh23aJsqiIrvgI3MSsuSILUGDEDw4K6Qd5qYFRxdCs/yAwPG
	 JUTB1w0jB1YuM9e2LoGOnwQaZh9M64xR+o5SZCip471CKVG9gS+9//aTf1vVZnfloZ
	 UFrRC54hVt0YMlogfguJ15Mgl3T3YEzFtTtydIlE=
Date: Tue, 26 Mar 2024 20:00:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware:
 Add missing properties
Message-ID: <20240326180025.GC17067@pendragon.ideasonboard.com>
References: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
 <20240326004902.17054-2-laurent.pinchart@ideasonboard.com>
 <6cc81b1a-12e6-4d81-b6c4-6297c213d5c9@linaro.org>
 <45242028-edf7-49fc-80bf-be9eb242b4cd@gmx.net>
 <20240326171837.GB17067@pendragon.ideasonboard.com>
 <e6334490-501c-4967-a48b-168868acfd39@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e6334490-501c-4967-a48b-168868acfd39@gmx.net>

On Tue, Mar 26, 2024 at 06:40:52PM +0100, Stefan Wahren wrote:
> Am 26.03.24 um 18:18 schrieb Laurent Pinchart:
> > On Tue, Mar 26, 2024 at 12:47:34PM +0100, Stefan Wahren wrote:
> >> [add Dave since he's working on DMA for Raspberry Pi 4 and maybe have a
> >> opinion about this]
> >>
> >> [drop Emma Anholt old address since she is not involved anymore]
> >>
> >> Am 26.03.24 um 08:06 schrieb Krzysztof Kozlowski:
> >>> On 26/03/2024 01:49, Laurent Pinchart wrote:
> >>>> The raspberrypi,bcm2835-firmware devices requires a dma-ranges property,
> >>>> and, as a result, also needs to specify #address-cells and #size-cells.
> >>>> Those properties have been added to thebcm2835-rpi.dtsi in commits
> >>>> be08d278eb09 ("ARM: dts: bcm283x: Add cells encoding format to firmware
> >>>> bus") and 55c7c0621078 ("ARM: dts: bcm283x: Fix vc4's firmware bus DMA
> >>>> limitations"), but the DT bindings haven't been updated, resulting in
> >>>> validation errors:
> >>>>
> >>>> arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges', 'gpio' do not match any of the regexes: 'pinctrl-[0-9]+'
> >>>>           from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
> >>>>
> >>>> Fix this by adding the properties to the bindings.
> >>>>
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>
> >>> Children do not perform any IO on their own, because everything is
> >>> handled by parent. It is really odd to see dma-ranges without ranges.
> >>> Referenced commits might be also wrong.
> >
> > Comunication with the firmware goes through a mailbox interface, which
> > uses DMA transfers. See for instance
> >
> > rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
> > {
> > 	u32 message = MBOX_MSG(chan, data);
> > 	int ret;
> >
> > 	WARN_ON(data & 0xf);
> >
> > 	mutex_lock(&transaction_lock);
> > 	reinit_completion(&fw->c);
> > 	ret = mbox_send_message(fw->chan, &message);
> > 	if (ret >= 0) {
> > 		if (wait_for_completion_timeout(&fw->c, HZ)) {
> > 			ret = 0;
> > 		} else {
> > 			ret = -ETIMEDOUT;
> > 			WARN_ONCE(1, "Firmware transaction timeout");
> > 		}
> > 	} else {
> > 		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
> > 	}
> > 	mutex_unlock(&transaction_lock);
> >
> > 	return ret;
> > }
> >
> > int rpi_firmware_property_list(struct rpi_firmware *fw,
> > 			       void *data, size_t tag_size)
> > {
> > 	size_t size = tag_size + 12;
> > 	u32 *buf;
> > 	dma_addr_t bus_addr;
> > 	int ret;
> >
> > 	/* Packets are processed a dword at a time. */
> > 	if (size & 3)
> > 		return -EINVAL;
> >
> > 	buf = dma_alloc_coherent(fw->cl.dev, PAGE_ALIGN(size), &bus_addr,
> > 				 GFP_ATOMIC);
> > 	if (!buf)
> > 		return -ENOMEM;
> >
> > 	/* The firmware will error out without parsing in this case. */
> > 	WARN_ON(size >= 1024 * 1024);
> >
> > 	buf[0] = size;
> > 	buf[1] = RPI_FIRMWARE_STATUS_REQUEST;
> > 	memcpy(&buf[2], data, tag_size);
> > 	buf[size / 4 - 1] = RPI_FIRMWARE_PROPERTY_END;
> > 	wmb();
> >
> > 	ret = rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_addr);
> >
> > 	rmb();
> > 	memcpy(data, &buf[2], tag_size);
> > 	if (ret == 0 && buf[1] != RPI_FIRMWARE_STATUS_SUCCESS) {
> > 		/*
> > 		 * The tag name here might not be the one causing the
> > 		 * error, if there were multiple tags in the request.
> > 		 * But single-tag is the most common, so go with it.
> > 		 */
> > 		dev_err(fw->cl.dev, "Request 0x%08x returned status 0x%08x\n",
> > 			buf[2], buf[1]);
> > 		ret = -EINVAL;
> > 	}
> >
> > 	dma_free_coherent(fw->cl.dev, PAGE_ALIGN(size), buf, bus_addr);
> >
> > 	return ret;
> > }
> >
> > fw->cl.dev is the device for the firmware child node. That may be where
> > the problem comes from, shouldn't we use the mailbox device for DMA
> > mapping ?
> 
>  From devicetree perspective this is the mailbox DT part [1] and this
> the matching dt-binding [2].
> 
> [1] - https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm/boot/dts/broadcom/bcm283x.dtsi#L100
> [2] - https://elixir.bootlin.com/linux/v6.9-rc1/source/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.yaml

That's the device performing DMA, so I think it should be used for DMA
mapping.

-- 
Regards,

Laurent Pinchart

