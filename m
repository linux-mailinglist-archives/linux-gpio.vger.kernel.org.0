Return-Path: <linux-gpio+bounces-19126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A45A964BA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 11:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E33B91771E4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 09:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605BD2045AD;
	Tue, 22 Apr 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="qicOSTEy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46125202978;
	Tue, 22 Apr 2025 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314912; cv=pass; b=q28cUzj573RP6p3s8beAfMSZhp2gNzAjvS99aZhMjVPipV/zc7epS7hWfsl656IMd9kQtQFdW4c/LW2aUMzHmwmQJbszmmlj/6sSYZGbUtsTggNqC0AclLOWsiAShCVFkXbLbQ1o0/u/+Mh1nBaXFWEkpahYIntT10XmJsh8Q0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314912; c=relaxed/simple;
	bh=uTkwJ/WbfW8Z/8nTRxZWDGPgqfutEjIO92axs+CnfSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxRMAbDlpAkIjwSC7K6xW2HRTWGMOeLekWqK1kNa//QdG2M/PDPTU/w7dCF8ng2BzrOZZSsRYCk9TwQiGduxnWbWNu74i1nZb4PIVcTfw2ULDP+FYLuhJwAukIIm8O9k2kqmNpbEDX860af+XaPemTnkzQtLVjcU0CGd1WUdXVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=qicOSTEy; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Zhch549X6z49PyD;
	Tue, 22 Apr 2025 12:41:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1745314903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzvWMTOgzf7if1kVHwP1oNPdQ8L2Mw7WSkfk2wPslAk=;
	b=qicOSTEyYc7sA/QjKA1qVWdj64vEms6wfD9eCtL982tlFiPR5EfNDge0EsDD0Rm+jpge2j
	CAfBkEmK6Fr0nftqByv8zbzMxbT3iRY1m1WKs18Ospo8cRMyduw3dS7CuOticjIkS2baE4
	8JmElRG3BKbGjVghANskc/6HOyKY+guYKWVs0HTjHzk+CuDqWaD5/iKiQtKv4zDparrtRK
	wQW/56Mz6EBBoqNDr5acYv8axo7BqQgOfgsfXDB1ydLX6TiS7nIg5F++nFep4rwU/fDcRQ
	Uj0qPMzQb7ZLx47l8Y4V34EoyhzEsvg1vk4id1sKiiVVRJEvPyUNnTi4qYj2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1745314903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzvWMTOgzf7if1kVHwP1oNPdQ8L2Mw7WSkfk2wPslAk=;
	b=lzGE7zO0JUUMDNrHFh3uJsZQ+U4EdY7juQQiKLS1ywqDgnQNesDLA+T7RtBQssH3GsRmnM
	gG0WBZWdTBQu1ayW6qRIjmLlmo1H6SlP/uin6YexU+vxjYTOjumRnFwii2Dw7CX+nsB30p
	V8UodkZZ7BNy+7NRNbNuEWa7yB88l73FnynAb7itUYxmSZOX2cfTSf1mVdKSepRB7P1pQH
	qWs2n4IZq5gq4R8jLdZyDPj3cBx5KYxuSlwh47UbO0mQpiyOX1epEew2YLsenqzB5eHD3/
	9Pz/km3linE+lQDXQ1jr6RMf/nfHBRkFzCmMPssbG/xDNX4iGI2QjnQ1MKTgBA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1745314903; a=rsa-sha256;
	cv=none;
	b=VK2WE+/pL6Dw/fkdQpef2bUsSxujW7pRl2Lj0yM4hRuPe4xSJu/1VGzys80G9u5b6wBaa/
	QXFsEclTUUb6p1cHK3DRw7YaEcgkmkHbVFac109QVQFhU/H/ZpQpYwiJSOHN03C0939eLc
	pXRVeK6lfE6Qs1lPQQafA/ynlHojsthOJZcYzJcDfTdhOwJgck6IqpOMBv2T+ZUUp2Jwjj
	1Oneens2wkNC7UfVnPLQH16xryMz65H9DUclnBi+/qA4WBjK1avG6rrZZ3xgeGSGI4tsNJ
	5lZ2kKzqVqjjlaWd+qr4GUnN01iOCkoGQNIwF1XELsw6VGjzOwqbw/KALqm8wQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1AA02634C93;
	Tue, 22 Apr 2025 12:41:39 +0300 (EEST)
Date: Tue, 22 Apr 2025 09:41:39 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for
 v4l2_fwnode_device_parse
Message-ID: <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org>
 <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
 <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
 <dd471b51-333b-4537-ac58-29ad2a10f1e2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd471b51-333b-4537-ac58-29ad2a10f1e2@redhat.com>

Hi Hans, Ricardo,

On Tue, Apr 22, 2025 at 10:44:41AM +0200, Hans de Goede wrote:
> Hi Ricardo,
> 
> On 22-Apr-25 2:23 AM, Ricardo Ribalda wrote:
> > Hi Sakari
> > 
> > On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> Thanks for the patch.
> >>
> >> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> >>> This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.
> >>>
> >>> We initially add support only for orientation via the ACPI _PLD method.
> >>>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
> >>>  1 file changed, 52 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> >>> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> >>> @@ -15,6 +15,7 @@
> >>>   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >>>   */
> >>>  #include <linux/acpi.h>
> >>> +#include <acpi/acpi_bus.h>
> >>>  #include <linux/kernel.h>
> >>>  #include <linux/mm.h>
> >>>  #include <linux/module.h>
> >>> @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> >>>
> >>> -int v4l2_fwnode_device_parse(struct device *dev,
> >>> -                          struct v4l2_fwnode_device_properties *props)
> >>> +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> >>> +                                      struct v4l2_fwnode_device_properties *props)
> >>> +{
> >>> +     struct acpi_pld_info *pld;
> >>> +     int ret = 0;
> >>> +
> >>> +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> >>> +             dev_dbg(dev, "acpi _PLD call failed\n");
> >>> +             return 0;
> >>> +     }
> >>
> >> You could have software nodes in an ACPI system as well as DT-aligned
> >> properties. They're not the primary means to convey this information still.
> >>
> >> How about returning e.g. -ENODATA here if _PLD doesn't exist for the device
> >> and then proceeding to parse properties as in DT?
> > 
> > Do you mean that there can be devices with ACPI handles that can also
> > have DT properties?
> 
> Yes it is possible to embed DT properties in ACPI, but I don't
> think that is really applicable here.

This is determined by
Documentation/firmware-guide/acpi/DSD-properties-rules.rst . So rotation
and orientation shouldn't come from _DSD properties on ACPI systems.

> 
> But we also have secondary software-fwnodes which are used
> extensively on x86 to set device-properties on devices by
> platform code to deal with ACPI tables sometimes having
> incomplete information.
> 
> For example atm _PLD is already being parsed in:
> 
> drivers/media/pci/intel/ipu-bridge.c and that is then used to add
> a standard "orientation" device-property on the sensor device.
> 
> This is actually something which I guess we can drop once your
> patches are in, since those should then do the same in a more
> generic manner.

DisCo for Imaging support currently also digs this information from _PDL
(see init_crs_csi2_swnodes() in drivers/acpi/mipi-disco-img.c), but this
is only done if a _CRS CSI-2 descriptor is present. It could also be done
for devices with the IPU Windows specific ACPI objects and it would be a
natural location for handing quirks -- there are some
unrelated Dell DSDT quirks already.

> 
> > What shall we do if _PLD contradicts the DT property? What takes precedence?
> 
> As for priorities, at east for rotation it seems that we are going
> to need some quirks, I already have a few Dell laptops where it seems
> that the sensor is upside down and parsing the rotation field in
> the IPU6 specific SSDB ACPI package does not yield a 180° rotation,
> so we are going to need some quirks.
> 
> I expect these quirks to live in the bridge code, while your helper
> will be called from sensor drivers, so in order to allow quirks to
> override things, I think that first the "orientation" device-property
> should be checked (which the ACPI glue code we have can set before
> the sensor driver binds) and only then should _PLD be checked.
> 
> IOW _PLD should be seen as the fallback, because ACPI tables are
> often a copy and paste job so it can very well contain wrong info
> copy-pasted from some example ACPI code or from another hw model.

Unfortunately that does happen. :-(

-- 
Regards,

Sakari Ailus

