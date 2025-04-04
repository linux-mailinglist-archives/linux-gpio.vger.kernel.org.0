Return-Path: <linux-gpio+bounces-18243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B0A7C3E6
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 21:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F3C7189ED0D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 19:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F1821D3DC;
	Fri,  4 Apr 2025 19:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ditv9oqI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C7A13BAE3;
	Fri,  4 Apr 2025 19:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795417; cv=none; b=kjSBue1MNhJ2NBX1zrtuih766PPltwwMIGma7LFVcfPM7jAStK78U6WJUW9GF6Zc5JyXDvd3ezw2T+SPHB1UvNu5kCRO9xfKytL3vCXtAvDWmjKn9WzkeddBF0ysVyRTRtkbh56g3Z4NG0miI9S4lZS1WAagpbvV4raBNZ81tkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795417; c=relaxed/simple;
	bh=FSMtCfn+ZP9lfYPEpSyVY65JEMOJGb5IqLQ76rti0xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AO+96JzDpwVsyoIGOM9Dgg+laX+UuISSIoUwnId0U5UWsFzBaGjVvVQc9rkbOiW9aaA7yqPqFuKSI4bEeI82Kfz0s6L6qMFLuLWS+2Auy8a3x2EsEaNBw/tLgOr1iVUfpcVAmp1bfqCLGN75m59KjV+kbcqyyLmVf51jAl0Xm7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ditv9oqI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2685AC4CEDD;
	Fri,  4 Apr 2025 19:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743795416;
	bh=FSMtCfn+ZP9lfYPEpSyVY65JEMOJGb5IqLQ76rti0xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ditv9oqItPmNmw2WkMNBFu8JedACDJ+5+fRkBqDqgN0uDrs6HHUCzxHva8QRMRn1F
	 6DxC0boeLiwpeSLY3Coh9+H6B84p/BfwBdYZTa/kGtaQnKA0uoLSIvX0rr0+xjPNxN
	 0vqCPPIWUTz4FMpmPyuaryBe0n2G9G1gIwAbtn1NmiX0SBlM4j98E6tOPZq/Nnz3+c
	 qlHbECaAkpmFIjrgegJ94qYnJQCtDKpaddaSH8sUQ6FISP+lw0wtDbT9ROYwXhtqm5
	 yFZ+DYPi4lAMyGWaVx8D7jzksdXTKgNbW8X39FFfNzLvue/YQGpBfenBzxVrv9nWP8
	 AZOLxtsFxgY+g==
Date: Fri, 4 Apr 2025 14:36:55 -0500
From: Rob Herring <robh@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: usb: usb-device: Add orientation
Message-ID: <20250404193655.GA158858-robh@kernel.org>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-5-1a0cc595a62d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-uvc-orientation-v1-5-1a0cc595a62d@chromium.org>

On Thu, Apr 03, 2025 at 07:16:16PM +0000, Ricardo Ribalda wrote:
> For some devices, such as cameras, the OS needs to know where they are
> mounted.

Do you have a usecase that's not a camera?

> 
> ACPI has a property for this purpose, which is parsed by
> acpi_get_physical_device_location():
> https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> 
> In DT we have similar property for video-interface-devices called
> orientation:
> Documentation/devicetree/bindings/media/video-interface-devices.yaml
> 
> Add a new property orientation for usb-devices that matches the already
> existing orientation property of video-interface-devices.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> index da890ee60ce6e71a11910c565b6f805470782e4f..bbcda28ec7d5695307efa797f57180044afda77f 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml

This is a binding for *all* USB devices. This property should only be 
added for devices where it makes sense.

> @@ -42,6 +42,10 @@ properties:
>        port to which this device is attached. The range is 1-255.
>      maxItems: 1
>  
> +  orientation:
> +    description: If present, specifies the orientation of the usb device.
> +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation

Reference the schema from the top level and drop 
'/properties/orientation'.

What about 'rotation'? Seems like you'd want that too.

> +
>    "#address-cells":
>      description: should be 1 for hub nodes with device nodes,
>        should be 2 for device nodes with interface nodes.
> @@ -101,6 +105,7 @@ examples:
>          device@2 {
>              compatible = "usb123,4567";
>              reg = <2>;
> +            orientation = <0>;
>          };
>  
>          device@3 {
> 
> -- 
> 2.49.0.504.g3bcea36a83-goog
> 

