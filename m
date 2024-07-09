Return-Path: <linux-gpio+bounces-8133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5392BEDE
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 17:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6E21F21955
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 15:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6549619D896;
	Tue,  9 Jul 2024 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu0EpuVH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24315C9;
	Tue,  9 Jul 2024 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540452; cv=none; b=R/1SgvH/Nbz1xRQr5SqcgPAK0WZq2Eu4iVEY70Y6bcs55T1NMKIglG+0mHaC90KIU9hcsFx8Uu82BYoGIyYvW7aJMx7s9gVMIXQ+9MxGq07i1meIMEaq4zX02AO31fifuduL81i4XkVMXLDFS9EO7vKPZwIXoMSAJPJPU5u5UCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540452; c=relaxed/simple;
	bh=EoM5whDwCCG8XGdwUwCMcCTzrzGxwu8TOBiSd0x7Zrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FM0ZwuIea2vURt6EdAgF3v6LugD2RenBMN3Q0Cr1B/rSHOlp3mSSRPbltNtqmj9vvWuG+LKlspMRlqLnBwvKWRtZrRdhzbwT0ttb9UjK3/oVFr6LCZdkxLo4vNBbWS5vqKrD/xtGqHn6icAg15Hj6bkuuzBRYVFledt2ORV8J1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu0EpuVH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E2EC3277B;
	Tue,  9 Jul 2024 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720540451;
	bh=EoM5whDwCCG8XGdwUwCMcCTzrzGxwu8TOBiSd0x7Zrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eu0EpuVHa6HsPSiQ4C8rdDW92k1PUfh0er0dDuQtrSfnSdY2fUTnUuQPWcs9x93ry
	 aBBEsbSk+svTm6PNvNjFgX2IOdzlz567dhoL/dTZu/Y0jAI+geeNoV9Q//ErYKycuO
	 M+kRcavvkXU2ORaixkcR9QXMNMZo/peGrmo6Ka40UpjBF5oduSQ/40c2oXgBBPGPsH
	 gussLIlZ7gagNc9ndyr87LoaS/5KtFkR13RSIt/bl8qSrTVfInvWCp/iIytYUhRTWf
	 64fnHSNzhk2fGog0twJ2zs2KsUltmgcNkA6dflF8SPxRb4bJwSZL058bXCJA7WMiyK
	 uCHr20sNR90SA==
Date: Tue, 9 Jul 2024 09:54:10 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linus.walleij@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de,
	durai.manickamkr@microchip.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: gpio: convert Atmel GPIO to
 json-schema
Message-ID: <20240709155410.GA3589336-robh@kernel.org>
References: <20240709092354.191643-1-manikandan.m@microchip.com>
 <20240709092354.191643-5-manikandan.m@microchip.com>
 <172052434347.27822.16864713604407945517.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172052434347.27822.16864713604407945517.b4-ty@linaro.org>

On Tue, Jul 09, 2024 at 01:25:51PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Tue, 09 Jul 2024 14:53:53 +0530, Manikandan Muralidharan wrote:
> > Convert the Atmel GPIO controller binding document to DT schema format
> > using json-schema.
> > The at91 pinctrl driver uses "atmel,at91rm9200-gpio" compatible string
> > to find the number of active GPIO banks and identify the pinmux nodes.
> > "atmel,at91sam9x5-gpio" and "microchip,sam9x60-gpio" have additional
> > registers to handle drive-strength, slew-rate,  pull-down to drive the
> > pinmux configs.
> > The new compatible string "microchip,sam9x7-gpio" is added.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
>       commit: 337049890b8cbbb4fb527c58976ea19f4dc747a0

Patch 5 depends on this one.

Rob

