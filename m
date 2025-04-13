Return-Path: <linux-gpio+bounces-18755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F38A8716F
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 11:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2976A16F592
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 09:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C67E194124;
	Sun, 13 Apr 2025 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="TUcqzPtc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04911A927;
	Sun, 13 Apr 2025 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744537818; cv=pass; b=EjDgXwXxDOOParWt0sK0ehn/2MZ01VCRQ+EyLWhPOIWyhPVXMNitSER9hwjaZLvYtr88Wv5bpqHYT1w8iCNH8DzuDEJICp58pDAr7IvErpQ0qDD+P2zqb9E6TUED7Wt3pIYqVVjuE4Yn3VLvMpDMJoFaJ3ZHR/INkM2eSx4v6DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744537818; c=relaxed/simple;
	bh=kiaPdcZIaFmz86b20HLXekIG3ETiUjCIkSRj0UBr8j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iK6V7T4xKd8wSnpOe1YK0TvEJrTrYU0PwYGSQsG8K06zo3Kw2ii/BkAxjpqvhxowx1rFaop3fhlqxKdXWOo2fP45l42SbKuX8fsu7hn5yQVrToNxrlPtj/v6HZfHuTZkBWOs6uUSUtN7fy6NshHO4tMIrTGFryePw++ZveUADBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=TUcqzPtc; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Zb5Hs2gYrz49Pyv;
	Sun, 13 Apr 2025 12:50:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1744537803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2BQGV2KYv+aKhHgtS/6teQ8FYrfge2xbaHRLBUN2W+U=;
	b=TUcqzPtckMjPhNZbXGwHc6ciTa06AFP08cYyywm0X0hcyTUGJTkBZ8KLHx885xSIcoPNqN
	45gnDBNqu4tDD5oDdUaQMo7EPasKTK3kgfnQxQKF4hUeJRYgP3qp3Vl9uS+foBUKuwz52D
	S8NgVi0RV8oSrNxoI8Dl2UFmRYTuNauh3KrMRow/35QEUzs8oj59LkmHSliryICsha7Thf
	ui1NfwxfKv0AzMho3GvlULGX5xRXDKVfM+AACvkvyXIrkZ/qsDLm5EYCp7tH7ZAG5ItYgM
	5LPYGu63gy0477V7XQ7BgxCX4YEsx0habknDuv4q8XA8pK/DbUwwcSzPrpPzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1744537803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2BQGV2KYv+aKhHgtS/6teQ8FYrfge2xbaHRLBUN2W+U=;
	b=gWohZq68wor8SVJOhwlq12RGqg+b0iPVIa0sUx7TWIFaxUC4v/XuR148PBaERFDL+psvRf
	R1ebs/r+j+PzAXd31Mbk3mRpsQblVVULXLO43Xvf9Php9UXG+25D1M+SAmygfC8puJdOTX
	Qzko8PF4Pc6R+1izOcwdyKdgFxOfF+G747sL/tiL1vH2MP/8D5CLAgFftx+2PKLHJj22lH
	kWPOUHjfxEri0jtZuCO8/75wdHxq4Jc/MpU+rXkJh+fXbIyXfTTG3gKNDAMVzc2B7RoY7D
	QrTHKWmRZvwXUPybI5JFdn285k/soL2jng1C1imRPNotuzHIQ4PBf8agfkoWAg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1744537803; a=rsa-sha256;
	cv=none;
	b=BlI69a+FFfREcxp6xgn95zX8ACf630wy7aI04BXjWr9Z4sbvk9cKLga9AtIOZSosGW5slB
	qoTk3FY7NU1J5RdhfMJbzwz+PQs5DgxhQ6FlbdA7HIS5vrU9CvoUgZtT08e4hghdSGPhjo
	R4VieI7BUwjnxu4tUbwP0qzDfsmKK4EsGaVn0hqKihQ8bAVAjF18s3mYn5bsYx3ngho1a5
	CurfExlr6d17ZLBF8oD8ovqzuZKlfhadr8KfRaC1dlJYF3YL1Xmo5DU3QD4wWiyfIsi7mq
	Xu0IHoJsiEX7k47gMvs8kMdUh42+p5dFOABEI3opwgNp1EIQmG3LTmpaFsPr5g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AD353634C93;
	Sun, 13 Apr 2025 12:50:00 +0300 (EEST)
Date: Sun, 13 Apr 2025 09:50:00 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
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
Message-ID: <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org>

Hi Ricardo,

Thanks for the patch.

On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.
> 
> We initially add support only for orientation via the ACPI _PLD method.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
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
> @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
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
> +	if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> +		dev_dbg(dev, "acpi _PLD call failed\n");
> +		return 0;
> +	}

You could have software nodes in an ACPI system as well as DT-aligned
properties. They're not the primary means to convey this information still.

How about returning e.g. -ENODATA here if _PLD doesn't exist for the device
and then proceeding to parse properties as in DT?

> +
> +	switch (pld->panel) {
> +	case ACPI_PLD_PANEL_FRONT:
> +		props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> +		break;
> +	case ACPI_PLD_PANEL_BACK:
> +		props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> +		break;
> +	case ACPI_PLD_PANEL_TOP:
> +	case ACPI_PLD_PANEL_LEFT:
> +	case ACPI_PLD_PANEL_RIGHT:
> +	case ACPI_PLD_PANEL_UNKNOWN:
> +		props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +		break;

How about the rotation in _PLD?

> +	default:
> +		dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
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
> @@ -833,7 +865,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
>  		dev_dbg(dev, "device orientation: %u\n", val);
>  	}
>  
> -	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
>  	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
>  	if (!ret) {
>  		if (val >= 360) {
> @@ -847,6 +878,21 @@ int v4l2_fwnode_device_parse(struct device *dev,
>  
>  	return 0;
>  }
> +
> +int v4l2_fwnode_device_parse(struct device *dev,
> +			     struct v4l2_fwnode_device_properties *props)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +
> +	memset(props, 0, sizeof(*props));
> +
> +	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> +	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> +
> +	if (is_acpi_device_node(fwnode))
> +		return v4l2_fwnode_device_parse_acpi(dev, props);
> +	return v4l2_fwnode_device_parse_dt(dev, props);
> +}
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
>  
>  /*
> 

-- 
Kind regards,

Sakari Ailus

