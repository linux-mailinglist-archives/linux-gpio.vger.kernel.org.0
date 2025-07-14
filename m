Return-Path: <linux-gpio+bounces-23209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F57B03F2B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 15:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91645172C4E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 13:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04AA24C06A;
	Mon, 14 Jul 2025 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Al3u15G/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF3248F5E
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752498220; cv=none; b=Qgvla3VNjdSxrGeoGFWhoTybfR5HkzaDqVOZgPYOYl8djcg8tw0yH0Mp/d7FdnXVJEka8byIpJPWdkGVwCkLsuEHvt+5C+2k629yLznDHfI1iqDaqNGwq5ox2YsgUUaNdwEEcViMrA8U6qdPQYP2hNM1mx9JW7FgRS37ZaCgKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752498220; c=relaxed/simple;
	bh=hFa5B+vOhUzo10XdA1ePUXEFz1368621t2hx9gZBOfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hr/lhgAJiEdREN978puYuIIu2QyFYaK04OnvFFzZ0t0YywiPXrK7RcxZaFdjVGDMunm1g/Xt/eeQ6NTjhLinUiPrnbZB4LTemJvxcWy6cQBzfITdE0iaQqnNLAkwwDZCBOQhURXxfUQFRVKvtV67L9t/5xIaUDp1UNuU/zQN/TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Al3u15G/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752498217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ghp/oDHokGFDT4c0GtUH9Qm0zdrYdHDESxRMKCw2J6A=;
	b=Al3u15G/huocIJGucazTmuWGgfE1dGmzPPQchHIyZ5KxRZexZpxg9SOLyMCAQF8z/yMcae
	lmJv3AFnVg341CKXAn0R8ZQ4dRSMjwcU/EOu8yPlE+G9SDZ07DztSov7qrWHfFNzQB7Edi
	rVXxCsCicI7uq1NTTT3wj+eyda5sIWQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-j_4tPr19NO-8HcYelWHjjg-1; Mon, 14 Jul 2025 09:03:36 -0400
X-MC-Unique: j_4tPr19NO-8HcYelWHjjg-1
X-Mimecast-MFC-AGG-ID: j_4tPr19NO-8HcYelWHjjg_1752498215
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ae354979e7aso343054066b.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 06:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752498215; x=1753103015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghp/oDHokGFDT4c0GtUH9Qm0zdrYdHDESxRMKCw2J6A=;
        b=ZNXYmgaodh/1hCJydGISFYyJcymSQp5VYPW2yjLBif3GdpBY35CGhwbE5gu0JIX4L1
         EkWxkp00uQ0mjrV3CDy5mtEu7XrNjchm+IiFHOpIks1OhSKoi9bNggXWOY37u0Hveq03
         jd2hev+IJreFCNs/cJhPtPghUqqPqlRyQQvk6kREutOQBkNWaTjSkcftZZnJSXZRWzrV
         wsx0zv71/tfX+EzukObHaFgey0OQ3mLdhBaSoU/en2AF+3tSdOexbR5CrnxELMfvh+M6
         w5Icpo2vvB9PS/UkASNP+PcvsC+YiATEfQ1r2F4GvLCfgLJn13io3CwrPi3/I8U3hpct
         vW6A==
X-Forwarded-Encrypted: i=1; AJvYcCUuwNJa/opGfz2iCUjWR33bfYyEKTWj8p5VxRZ8WLS0u7V13Tjq0l6+4VW5D1rCtYHs5sN8HO0MftD4@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5NXmNLZgnH5H0fYufYA329YPaIPx/c6kWJerAUdoU3BJ7lT5
	j8BNRpdLc56rMMRxUFO0TDagggDvIsYG/1zyKxti5gMGSYzEWyonMoLcBdEOMWCVJQq6iCdPe2B
	mC5wicAY3apfAjchuvlZ9rIATeAXbZQsqRUAhVRWOqzm81Mx91Hts1DiaXCTvqKU=
X-Gm-Gg: ASbGncvfRd1CRiU4sBBnj2evKvZDL9PVsxY8cyBhXUc8UTtLKVcftX0fvtIcrYzXTEu
	AlyVTpd6EPxQpvXWgs3pFb0in1il3xrFXvSsJNGeP1Knoe4CrQHOvUapy5C5r3NDTHeG0RCGAYi
	b/fUEA+KHyjS24KViZ6UNT0Y6xWlm8j2s7ctao51yvI/A/quYZ4rwAG6t8mNi1vwXKbm/y9PK99
	1tQgPOda9mOu1hnXmClV7GPHirpic+R+GtyE5D7JjYE7AoAsf0QJaWGdsx//dE23cR3GjolUHXV
	AGGYf5gIEexG4SHRUPUwJ5JrsNgyBk8ZoGvl2zdkA1OP
X-Received: by 2002:a17:907:720e:b0:ae6:df9e:736c with SMTP id a640c23a62f3a-ae6fbc8d8d6mr1350142566b.21.1752498213133;
        Mon, 14 Jul 2025 06:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmcjs17OWp2mBZdxtCVdScokbQNauUNY8FA5TyZCIo3LHQd4tRBh7KK5QdtcHV7XwRDZxtgA==
X-Received: by 2002:a17:907:720e:b0:ae6:df9e:736c with SMTP id a640c23a62f3a-ae6fbc8d8d6mr1350118366b.21.1752498210569;
        Mon, 14 Jul 2025 06:03:30 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264fa0sm803554666b.88.2025.07.14.06.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:03:30 -0700 (PDT)
Message-ID: <a02801c8-4be0-4a53-a037-e38bf0f05db1@redhat.com>
Date: Mon, 14 Jul 2025 15:03:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] media: v4l: fwnode: Support ACPI's _PLD for
 v4l2_fwnode_device_parse
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-2-5710f9d030aa@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250605-uvc-orientation-v2-2-5710f9d030aa@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Jun-25 19:52, Ricardo Ribalda wrote:
> Currently v4l2_fwnode_device_parse() obtains the orientation and
> rotation via fwnode properties.
> 
> Extend the function to support as well ACPI devices with _PLD info.
> 
> We give a higher priority to fwnode, because it might contain quirks
> injected via swnodes.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 85 ++++++++++++++++++++++++++++++++---
>  1 file changed, 79 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..379290ab3cfde74c8f663d61837a9a95011b5ae0 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -15,6 +15,7 @@
>   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>   */
>  #include <linux/acpi.h>
> +#include <acpi/acpi_bus.h>
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
> @@ -807,16 +808,65 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
>  
> -int v4l2_fwnode_device_parse(struct device *dev,
> -			     struct v4l2_fwnode_device_properties *props)
> +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> +					 struct v4l2_fwnode_device_properties *props)
> +{
> +	struct acpi_pld_info *pld;
> +	int ret = 0;
> +
> +	if (!is_acpi_device_node(dev_fwnode(dev)))
> +		return 0;
> +
> +	if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> +		dev_dbg(dev, "acpi _PLD call failed\n");
> +		return 0;
> +	}
> +
> +	if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET) {

"!=" should be "==" here. So that we set it when not set already,
rather then leaving it unset when not set already.

> +		switch (pld->panel) {
> +		case ACPI_PLD_PANEL_FRONT:
> +			props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> +			break;
> +		case ACPI_PLD_PANEL_BACK:
> +			props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> +			break;
> +		case ACPI_PLD_PANEL_TOP:
> +		case ACPI_PLD_PANEL_LEFT:
> +		case ACPI_PLD_PANEL_RIGHT:
> +		case ACPI_PLD_PANEL_UNKNOWN:
> +			props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
> +			ret = -EINVAL;
> +			goto done;
> +		}
> +	}
> +
> +	if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET) {

Same here.


> +		switch (pld->rotation) {
> +		case 0 ... 7:
> +			props->rotation = pld->rotation * 45;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown _PLD rotation val %d\n", pld->panel);
> +			ret = -EINVAL;
> +			goto done;
> +		}
> +	}
> +
> +done:
> +	ACPI_FREE(pld);
> +	return ret;
> +}
> +
> +static int v4l2_fwnode_device_parse_dt(struct device *dev,
> +				       struct v4l2_fwnode_device_properties *props)
>  {
>  	struct fwnode_handle *fwnode = dev_fwnode(dev);
>  	u32 val;
>  	int ret;
>  
> -	memset(props, 0, sizeof(*props));
> -
> -	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
>  	ret = fwnode_property_read_u32(fwnode, "orientation", &val);
>  	if (!ret) {
>  		switch (val) {
> @@ -833,7 +883,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
>  		dev_dbg(dev, "device orientation: %u\n", val);
>  	}
>  
> -	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
>  	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
>  	if (!ret) {
>  		if (val >= 360) {
> @@ -847,6 +896,30 @@ int v4l2_fwnode_device_parse(struct device *dev,
>  
>  	return 0;
>  }
> +
> +int v4l2_fwnode_device_parse(struct device *dev,
> +			     struct v4l2_fwnode_device_properties *props)
> +{
> +	int ret;
> +
> +	memset(props, 0, sizeof(*props));
> +
> +	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> +	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> +
> +	/* Start by looking into swnodes and dt. */
> +	ret =  v4l2_fwnode_device_parse_dt(dev, props);
> +	if (ret)
> +		return ret;
> +
> +	/* Orientation and rotation found!, we are ready. */
> +	if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET &&
> +	    props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
> +		return 0;

As Sakari set, this can be dropped, with the 2 checks above
fixed to be == v4l2_fwnode_device_parse_acpi() will become
a no-op in this case.

With these things fixed:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> +
> +	/* Let's check the acpi table. */
> +	return v4l2_fwnode_device_parse_acpi(dev, props);
> +}
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
>  
>  /*
> 


