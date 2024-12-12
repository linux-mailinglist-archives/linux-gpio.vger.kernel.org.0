Return-Path: <linux-gpio+bounces-13835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1999EFAC3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 19:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7906618964E3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E6A223E61;
	Thu, 12 Dec 2024 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxqaiEU8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3E02288E5;
	Thu, 12 Dec 2024 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734027262; cv=none; b=BxRBoz/QKUOHhjeTwo3jfoKq7GtoYDNSmmPSlCr7fcdg2wILhM36mTKUm/iFwaWSD1qoj0bb8r/UFIJSEpexrltcgDZ+s24Ke1fKaEeG8w7MiFUxPIihBwtA8HrwDEu9wJ2nJS3+AD1GctKMBx2x7DP5OUwXHT+Fp4htKTFH/yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734027262; c=relaxed/simple;
	bh=Q3FhwQLAi7iHv2Gb7vKlZneQUQfSiQ7lD1L8nxume9I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TvKJgj3IzZ8be+O9KinqnGvPiC5BXLE+Wv2+o4l8+ED7XAokeD1mobM96DI1X/lTVF4nQkB3l+S3tpESqDP4EkaqLDEBRaGp5vqC6upvuldOUMi1vijBvW3Nt88YQVhe4DWlSAXzFt34nfI8OWuHiYDSliffG2OjRJo7dM5ZeQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxqaiEU8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B06C4CECE;
	Thu, 12 Dec 2024 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734027262;
	bh=Q3FhwQLAi7iHv2Gb7vKlZneQUQfSiQ7lD1L8nxume9I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cxqaiEU8GN7Zyexc5KF69Sd/zWlpRL4PDNrN0Ga6M4iUIwZ44iSCDz6qhOrYOZqqt
	 6VpUyRdeFS6YMOjtWJAyC4+q1i3kLEXQNdP91XMGL3FHZ6akxv0wIGSZ2Gko/53zj9
	 Hhz/HDBZyKX9BQQIjvMuOjZkt3E8QruwfD5HOFhqpOsP7rNMlTELzfaLmd5ClaBYwg
	 gnAsdZr/OdM5Fr5RglZiOGJk0YSEsbGWVjejw4dVTtIiZcpCFK3wibOPZaXLbvW9kW
	 4f/YPZsZeSJuxkSeZiYvoQ7gNQ49KCIFzPXiwsaLHmMtObsMvYIDaUsgpe0rSdm3Rq
	 A8cpB9Pf0m/OQ==
Date: Thu, 12 Dec 2024 12:14:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Stefan Wahren <wahrenst@gmx.net>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 Ray Jui <rjui@broadcom.com>, David Airlie <airlied@gmail.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Scott Branden <sbranden@broadcom.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Doug Berger <opendmb@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-1-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v2-1-35986e04d0f4@raspberrypi.com>
Message-Id: <173402726027.2935600.12242526873775357219.robh@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: bcm2711-hdmi: Add
 interrupt details for BCM2712


On Thu, 12 Dec 2024 16:18:51 +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed.
> 
> Update the schema to include the interrupt requirements.
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
>  1 file changed, 93 insertions(+), 14 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:59:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:67:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:76:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:84:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212-dt-bcm2712-fixes-v2-1-35986e04d0f4@raspberrypi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


