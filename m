Return-Path: <linux-gpio+bounces-14128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9E9FA4B8
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 09:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2B441884CDB
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 08:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F82A16BE3A;
	Sun, 22 Dec 2024 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7rl/SuX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55823944E;
	Sun, 22 Dec 2024 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734856443; cv=none; b=gaqaMo+g7WwFLWdMvDRMhj0hDpH2AMqiFOWBjL0E0Wp7LPW3NZ+pKVWff0DgQJomm+C1t2QJ2mvcgWFCZUrlLa/bJl76XpMZHob7sbIdPgs0S1fCCZi0kar0GwCy+UWTP7fHjEyHo723IJ6KMww19MdfPnM7s83pPWeaow1zA/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734856443; c=relaxed/simple;
	bh=yDbyvGBdhFbBbtYL7NrJkhEr0MAnlnSnZYd3unoDI28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEMCbEGQ5g7e7nf3V2Htn9HOm/HJbFr02SXjQfE4JuLC8HjaATS6y5bAkUHeb96dCSRBXEWoG/dvSsESiGwkCLXeKojrEe5BOMYHtBD6u61OKChj5tK6IWYNnO8cJPp49RZM3gUMsgXa6zym7kOa1zldXGrgDygohCmOf9EroKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7rl/SuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE59C4CECD;
	Sun, 22 Dec 2024 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734856442;
	bh=yDbyvGBdhFbBbtYL7NrJkhEr0MAnlnSnZYd3unoDI28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7rl/SuXPGhlaYVxYM+DrLi8GTmYNY3vwGUg+9HhvSx9IM0OeHyxZsGtHTyCQDg1+
	 tuP0TfHKSs36Blj+KVVhGrRkMXosOhVS4THMA/9gwh2pWI7rv1oQKbQpWYjybyyE2T
	 dfCREPG4BscrsRk55zDGHn4AvOFMdIzE+W6Q8aCKwlm8EyIWFo2yE63g01xyc1Hbbg
	 lkaOJSLAFLksulbrhlZgprKvrCvcXi6zEZpFjczSrkmNBZ7jrX+mfULRSDHkaUZsfG
	 oTftkjd6nNbCt2ghgVP7OOrAiVkGFHQFm1KcqJxea+KsuwUFVTE1Ii9UQ/1QkD0h2I
	 B01KqEA/BAJtw==
Date: Sun, 22 Dec 2024 09:33:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Message-ID: <mnvl24bydpajn7dyumq7cqt6dl6iyrzk6e7rksojt3ig2f7qbc@uytpnoa4t76o>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
 <20241220-dt-bcm2712-fixes-v5-1-cbbf13d2e97a@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-1-cbbf13d2e97a@raspberrypi.com>

On Fri, Dec 20, 2024 at 06:11:11PM +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed, and for BCM2712 the driver changes[1]
> required that the interrupts are named.

I dopn't get what "interrupts are named" means here and I kept asking
about it, so the explanation is supposed to be in commit msg. Do you
mean that driver requires it? If so, then "the driver requires
interrupt-names since commit foo ("bar")" (and use Linux commit style of
referencing commits).


>  
> Update the schema to correct the interrupt requirements for BCM2712.
> (Requirements for BCM2711 should be unchanged).
> 
> [1] Commit 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI
> controllers")

I cannot find in this commit requirement of interrupt names. There is no
call to anything requiring names. Maybe I miss some context, like other
function introduced that? Can you point me to specific line of that
patch?

Because if you refer to external_irq_controller than I fail to see how
2711 works without the names.

Best regards,
Krzysztof


