Return-Path: <linux-gpio+bounces-21141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F8CAD3071
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 10:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 500C616BE11
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 08:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F033220F28;
	Tue, 10 Jun 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNUnm/0d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CD61D555;
	Tue, 10 Jun 2025 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544377; cv=none; b=WSJyQj6o3GeY2sw83lscGsK5Ud/uZuEg6hOQqsMua1VPJaX1mtO6UuhzSNV3FCbIp8tsEEemPVmAR0UB3STY87XpXxnrD82MZ4YC6AlJBfnyJ8EHvXLeaGRQngmdzER8fpj6bxH0iGeddC8SSVkC/KHqUQid7KLTer7l1f4rEO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544377; c=relaxed/simple;
	bh=SeM2fX3V7rJHEICuoUesxqz8Z/Gb6XXlCMnMM8yJjo4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=LzyNRNp0d9ABMWoimqOC1hZCqQvhHCri7HnKGfsdumfe+KrbPn3M3NtJXlVKCN2xbJBj2UqyVXwTJ6RPw6ZuZ1pVUIAsAB+EyNDvY2yL2GRhfvgdq0ElmN/01ILKSKc690e3+4UFr/ngJP24UwcyW0gmluA+2zs1BPXwCF22L2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNUnm/0d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0218C4CEF0;
	Tue, 10 Jun 2025 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749544376;
	bh=SeM2fX3V7rJHEICuoUesxqz8Z/Gb6XXlCMnMM8yJjo4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oNUnm/0d0NSyV1KpxCElUMuB7NV/RWA1VylR1xJD38v2VZ4vXD3fAj7l+Purr3T+G
	 /w/H19u1gmrtKw+9nu9ac/G594YLZ75qXNFE+b+9H7NQ8M5tX3xVKDyBXDZFw7Q3Lu
	 S9j+gsEf1XeyyIHIGHQ8A2SIsJS+/tNlxu2XN6KS2GwnkIEYEMId6Vacjj8ONvLmxi
	 oqAVfxRELEdUbuR9ifYUEhSNJooDSuS75RT2mDhOsV6yQ+d5wYsHDZlKjKjshtNQgi
	 OOHBu58tOtWzhqK7ce88/rmpeD+7hiMN2A1s6BUpimb+E2FhHARmuVa9gP9VgRmosL
	 WZverJznxiS6w==
Date: Tue, 10 Jun 2025 03:32:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, michal.simek@xilinx.com, 
 monstr@monstr.eu, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Neeli <srinivas.neeli@amd.com>, 
 git@xilinx.com
To: Michal Simek <michal.simek@amd.com>
In-Reply-To: <dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com>
References: <dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com>
Message-Id: <174954437576.4177094.15371626866789542129.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-xilinx: Mark clocks as
 required property


On Tue, 10 Jun 2025 09:34:31 +0200, Michal Simek wrote:
> On Microblaze platforms there is no need to handle clocks because the
> system is starting with clocks enabled (can be described via fixed clock
> node or clock-frequency property or not described at all).
> With using soft IPs with SOC platforms there is mandatory to handle clocks
> as is explained in commit 60dbdc6e08d6 ("dt-bindings: net: emaclite: Add
> clock support").
> That's why make clock as required in dt binding because it is present in
> both configurations and should be described even there is no way how to
> handle it on Microblaze systems.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
> Based on discussion at
> https://lore.kernel.org/lkml/20241002-revivable-crummy-f780adec538c@spud/
> 
> Actually this shouldn't be only targetting GPIO but also for example
> xlnx,xps-timebase-wdt-1.00.a but I would like to check it first on gpio
> before starting to check other bindings.
> 
> ---
>  Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/fpga/fpga-region.example.dtb: gpio@40000000 (xlnx,xps-gpio-1.00.a): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


