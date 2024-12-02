Return-Path: <linux-gpio+bounces-13422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B19E076E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 16:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 267FC280478
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648083D0C5;
	Mon,  2 Dec 2024 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nno5o5gi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C14CB5B;
	Mon,  2 Dec 2024 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154403; cv=none; b=j0TPaR2GsVbfc1rhVMX8V+AaL6kYc9iJXj1dzzIFViu0kR3iJIxYEuPN1ilBz2p9euezkDJFEKOQzHGInoD4YrB5UsMirKtUmuw4Z4RRRwVzGTmJLSkc4zSeAubqDPrryPNSCaRRyGkGo+JE42zCDkixCUKEQmEvWSGTVMygnno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154403; c=relaxed/simple;
	bh=nq9CApm2lwU3fpXbg/FXX6NMDF+2uS9tBRO+bf3mRTs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EUjc5alotiSdT84/e0ed+GtHIdcp0ieLuBvgG2kZcu/xwV42A8rqNbp8tScaMdVBvg5LDr6uAkx1PQRtw5YQs2PGS7jBTARylvC17f9ztR6utWYBI1PEnoqaZBeNbiuhWG1x+pmtlTycY3+w61C7vmq64tBahO00+1lQIbFO9ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nno5o5gi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D32DC4CED1;
	Mon,  2 Dec 2024 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154402;
	bh=nq9CApm2lwU3fpXbg/FXX6NMDF+2uS9tBRO+bf3mRTs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Nno5o5ginogysZYOoinMPACfcmzLi+NvkvWdGsltRWpC9rd1iSKUzbuKi+dexEVC6
	 VBtR9WlggSfrnvBoqJqs0HkfdK/167+6KxETARnP6EwNHRD5jVdxn6m4avfERluDb/
	 5ss+bMZ4iGWtGQLEFZOa0nDNjhIxHi04yO8djXxrhWaRqpQhQhA8pJ/JeB/71CnHT9
	 kIqWc4NVCgwZBbPXFy041BMzFegKtLFI70GfYZJZCjncRo2oi8cdWiCwxHRpyXWc3S
	 npTdtucykpJxCkuIpL0b+1MP4REnLr1rGA+BZP8TpUGuEANUx/62bgjJYSDFun9x1z
	 ReYvBWoS/hrYw==
Date: Mon, 02 Dec 2024 09:46:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Doug Berger <opendmb@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Simona Vetter <simona@ffwll.ch>, Ray Jui <rjui@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Linus Walleij <linus.walleij@linaro.org>, 
 Scott Branden <sbranden@broadcom.com>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com>
Message-Id: <173315440083.2722567.15501799626521434805.robh@kernel.org>
Subject: Re: [PATCH 1/7] dtbindings: display: bcm2711-hdmi: Correct
 bindings for 2712


On Mon, 02 Dec 2024 14:31:54 +0000, Dave Stevenson wrote:
> The previous patch just adding the compatible missed out that the
> number of interrupts changed
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 44 +++++++++++++++-------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:59:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:67:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:76:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:84:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


