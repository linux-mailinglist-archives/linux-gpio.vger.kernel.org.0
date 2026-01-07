Return-Path: <linux-gpio+bounces-30218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 543AACFD786
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 12:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70F2E301B659
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 11:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A4230CD82;
	Wed,  7 Jan 2026 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rcl2csMn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBED22DC323;
	Wed,  7 Jan 2026 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786443; cv=none; b=hcCLKZZBRduCefel3inVlj8/yjTX5WC/FKrI3kN4Au8YmO+4z5LJ11XNYGuwxpKMD4dMnKJuB4z72q0Za+nynkVt0MAVSb0j3otavLoPH0f3u6gI0cn5n/u1xCkGklD4OKBmR+Pj5/lzORLORulvuAfiZ+o4958K07myS2ifXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786443; c=relaxed/simple;
	bh=DbwTdP4jDDEoLRymmPjZBvZFpaB6/3NUZbTNMK7TrhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuFAx8b1dHPHOtOzs9z+FoTtrndbldLarAHYASFnfx1wJv5418cJJYYL01XQRS0Cwcyk3hLVLUY+Wlxn3dbc2VFsvcKdGeW/7mL1ccDcEPzRcII0Y8xn/MtfPuQxk9zP35curllOrvkbUX8u1njlevw7Aa055RI0Y+NONuOz+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rcl2csMn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E27BC4CEF7;
	Wed,  7 Jan 2026 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767786443;
	bh=DbwTdP4jDDEoLRymmPjZBvZFpaB6/3NUZbTNMK7TrhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rcl2csMnB6fun62KvYW7R8q6mrwH2Y3ZHyS9XmSrAooaYob23EatHJ8bnJmkYMNC0
	 IJ23o9xHxk31/exhmLeNcEEmd3C2LDHRuULaz+fOHJn+2hzKZwaz5T4NfCWhZZz7Vl
	 4QEnhBmqPHkUVzYSE7SvoeueAKDXz/T1cGUUuP5pRXvMxHqt7Pp10nl83viknXsyWC
	 xfS+f6AmQQLLktViVf8y68WsClclGSQcfYQLbzdLhgoTlM9hBK1iDNJvAd8aFUPPml
	 xludPXekC5s+OeWxvKqrgQ/7y7QXMK6lCQMdbupd4uYJucc0f9pCvceNqcJcoSVyIg
	 I+s2aRpyoo8Gw==
Date: Wed, 7 Jan 2026 17:17:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Message-ID: <uc7utm7tbtmkk6osaoydibd5evtpm246sjrpkx3lpclpk4srea@a4g65oduswau>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux>

On Wed, Nov 26, 2025 at 06:27:13PM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 12, 2025 at 02:55:29PM +0100, Bartosz Golaszewski wrote:
> > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > this series however impacts Qualcomm platforms. It's a runtime dependency
> > of patches 8 and 9. Would you mind Acking it so that I can take it into
> > an immutable branch that I'll make available to Mark Brown for him to
> > take patches 8-10 through the ASoC and regulator trees for v6.19?
> > 
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just hand
> > the same GPIO descriptor to all interested users.
> > 
> > The proposed solution is composed of three major parts: the high-level,
> > shared GPIO proxy driver that arbitrates access to the shared pin and
> > exposes a regular GPIO chip interface to consumers, a low-level shared
> > GPIOLIB module that scans firmware nodes and creates auxiliary devices
> > that attach to the proxy driver and finally a set of core GPIOLIB
> > changes that plug the former into the GPIO lookup path.
> > 
> > The changes are implemented in a way that allows to seamlessly compile
> > out any code related to sharing GPIOs for systems that don't need it.
> > 
> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
> > 
> > I'm Cc'ing some people that may help with reviewing/be interested in
> > this: OF maintainers (because the main target are OF systems initially),
> > Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> > in audio or regulator drivers and one of the goals of this series is
> > dropping the hand-crafted GPIO enable counting via struct
> > regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> > to also cover ACPI (even though I don't know about any ACPI platform that
> > would need this at the moment, I think it makes sense to make the
> > solution complete), Dmitry (same thing but for software nodes), Mani
> > (because you have a somewhat related use-case for the PERST# signal and
> > I'd like to hear your input on whether this is something you can use or
> > maybe it needs a separate, implicit gpio-perst driver similar to what
> > Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> > last week in person and I also use the auxiliary bus for the proxy
> > devices).
> 
> Hi,
> 
> I'm sorry if this was already reported and fixed. On Qualcomm RB5
> platform with this patchset in place I'm getting the following backtrace
> (and then a lockup):
> 

On Rb3Gen2 this breaks UFS:

	ufshcd-qcom 1d84000.ufshc: cannot find GPIO chip gpiolib_shared.proxy.4, deferring

But MMC acquired the GPIO successfully,

	sdhci_msm 8804000.mmc: Got CD GPIO

But I can see gpiochips registered as well:

(initramfs) ls /dev/gpio*
crw------- 1 0 0 254,0 /dev/gpiochip0
crw------- 1 0 0 254,1 /dev/gpiochip1
crw------- 1 0 0 254,2 /dev/gpiochip2
crw------- 1 0 0 254,3 /dev/gpiochip3
crw------- 1 0 0 254,4 /dev/gpiochip4

Let me know if you need more info.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

