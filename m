Return-Path: <linux-gpio+bounces-29202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 353B7C9772E
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Dec 2025 14:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A1BB4343DE6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Dec 2025 12:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E479C30DECB;
	Mon,  1 Dec 2025 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlLG1bv3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708830C608;
	Mon,  1 Dec 2025 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593976; cv=none; b=GM2cCNLJvKgTnt8VoCuhpmZZJvfXjRKTgAWv3V+9ZPnqARhXz2Wjic/slg/uanmEJNi7Y7GqxsTojSXM4OYu7jwhzRzsoT5pft7xZg5Tm2n807DVnunEhywLk3eSdAqTFFDtTscX4M3fBtI3MWaMmbgRLWNEVVSh9WeSejJnO1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593976; c=relaxed/simple;
	bh=7IrvfZCnhHhrqTkTyCux4zzyumsKPggknQbCm+CYDjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyzOYts0nOJcs2RVZv45UXsMKsTv0WDoOnoZqlNSuKcYxrXM68qdwGhoW7R3P5BcbKrTPs6/v1jpwsoTprC2F7XhXhmSm9fexO2VxDBBA/5Gks/byCDacK4IOZcqwOkGtj8LKPIPsYe8S/F7XMbd7wN5WcDquV16AqZf4QJomnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlLG1bv3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD63AC4CEF1;
	Mon,  1 Dec 2025 12:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764593976;
	bh=7IrvfZCnhHhrqTkTyCux4zzyumsKPggknQbCm+CYDjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlLG1bv3qPdAiuw2BjeBJA4V1OfVX+WOn0nBONHr+PoYx4Fr4SqgDGTOlcK9rpjij
	 P4KzLyKCsc+FmlXb4CV6+KM1VN3+Awd4l7da997s/bLHC+UFfnhNc54oN9Fwu2dUrS
	 vCCW/aaAuvbkVYYlwf8xfWJlcVwfVcZBFcdOKJl0RBsDUKONApuLT98KYx1QL4btul
	 UnUbnJO5ODwWqNh9/wrPGrkaf+ACpQQ7q24OEfv8rMGIhRJzLlajS09+PAZGI55l0v
	 iFdSUgZI9IMG54dXZiVuOY4Nmt40LiKX7n1fTlMCfqaQUQLZe6TrE1IgKfc0JREpcq
	 Yaz0CSEoJMTiw==
Date: Mon, 1 Dec 2025 06:59:34 -0600
From: Rob Herring <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/3] drm/vc4: Fixup DT and DT binding issues from
 recent patchset
Message-ID: <20251201125934.GA3004948-robh@kernel.org>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>

On Fri, Dec 20, 2024 at 06:11:10PM +0000, Dave Stevenson wrote:
> I missed the DT errors from the recent patchset[1] (DT patches
> in linux-next via Florian, DRM bindings patches on dri-misc-next)
> as Rob's bot report got spam filtered, so this is a fixup set.
> 
> Largely it was changes to number of interrupts or clocks in the
> bindings, so those are now covered.
> 
> I've fixed up the missing "interrupt-controller" flags for 2711
> and 2712 whilst here.

I found this is still warning a year later, so I fixed up the commit 
messages and applied.

The comments were a bit nitpicky for a v5 version IMO. However, you went 
to the trouble of preparing 5 versions of the series and we spent our 
time reviewing them, so why abandon them? 

It would be nice if the Broadcom folks spent some effort fixing the 
remaining DT warnings. I see little progress.

> 
> I can't get my head around what is meant to happen with ranges:
> "soc@107c000000: firmware: 'ranges' is a required property"
> The meaning seems obvious.

Adding "ranges" is probably not correct. Generally, 'firmware' is not 
MMIO and should not be under an MMIO bus (i.e. simple-bus).

> 
> However if I add it then I get:
> "firmware: '#address-cells', '#size-cells', 'dma-ranges', 'ranges' do
> not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

If you add properties to the 'firmware' node, then you need to add those 
properties to its schema.

> 
> There's obviously some other flag I need to set in the bindings,
> but I can't work it out. We have similar errors for all the Pi
> platforms for one or more nodes.
> Please advise and I'll happily fix them all.

