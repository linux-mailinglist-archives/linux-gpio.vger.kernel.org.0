Return-Path: <linux-gpio+bounces-26872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E016BBC15E7
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 14:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F7D3B4D66
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 12:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0502DCF41;
	Tue,  7 Oct 2025 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulr4Amvs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0481319006B;
	Tue,  7 Oct 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840363; cv=none; b=h7ocSsGsI913h262S/XHLDgqAwrLE2GzujhOjs0dBO6CDVmnQhbh+9AHzz0+02NXc9gYX0hwZJSwym/V9Yx1hqgl5RPdWSQPfsfo5h/0ffRQ8k0b6URCqP0+kH0xRMDF36HjhZHTMD1EESVS9lGI/0gEVXP0/zTXifuFTIMLNus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840363; c=relaxed/simple;
	bh=0OpRn6dVGYhKpaq+pw5bY3T5BROlnRo3ya60xdbIv1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gu8ulba7h+lanGNpQkNnhQR4L6HamGX52lVV38uDNSICE36G0R08VoSi70oiIZSJSd+kT2etaYgUzp+IWFuFJMUv+1vYUse/2feSQukD9JBu4un+zLkvQFrdDFprBbzrhKrHCD4fkwzkBBQjSEI95EiMgTByrAR/ZcY5PEUyeYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulr4Amvs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C46C4CEF1;
	Tue,  7 Oct 2025 12:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759840362;
	bh=0OpRn6dVGYhKpaq+pw5bY3T5BROlnRo3ya60xdbIv1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ulr4Amvs9BVUzN63T0gy0h03ZNTNmR1cjsz6JrsOwRrZMWM4UlY4bcqFnyN1j6Abh
	 g/lA6SACo7MzXea3SWubaWldh8GV5F1S3Wi4+M883+WUHc5MyDof2fPEMTfOSbNRdP
	 y0D/Gl89PyuU/COavEOfP4f9mxW6HDoG1Wk8wuBtqxf3imPjIejPiCshS+tnUjfW7c
	 msq3jxfzzVXxwp9qQim+H32GscD2ch1RXFufQbXRz4iW+tBhTi/gwngmnxuKQhXsfL
	 1O+zPjUzJdeQ6QBC5BSy9lm/I+PKTQl0f+PXY3rk7HA145XPm8oGYxgkn+jYOLdyyQ
	 WwU2E1Bs2x26w==
Message-ID: <e0632d6e-2e50-4fdd-890d-558cdf18bf2a@kernel.org>
Date: Tue, 7 Oct 2025 13:32:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
 <5550fc25-b571-489c-9855-5a9b08822c0e@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <5550fc25-b571-489c-9855-5a9b08822c0e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/6/25 1:19 PM, Mark Brown wrote:
> On Sat, Oct 04, 2025 at 02:31:16PM +0100, Srinivas Kandagatla wrote:
> 
>> Isn't the main issue here is about not using a correct framework around
>> to the gpios that driver uses. ex: the codec usecase that you are
>> refering in this is using gpio to reset the line, instead of using a
>> proper gpio-reset control. same with some of the gpio-muxes. the problem
>> is fixed once such direct users of gpio are move their correct frameworks.
> 
> It's common to have GPIO controls for other things, mutes for example.
Ofcourse, but this aggregation logic which is specific to the use-case
should not live in gpio subsystem which makes the whole solution fragile
and abused.



