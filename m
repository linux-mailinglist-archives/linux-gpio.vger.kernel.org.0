Return-Path: <linux-gpio+bounces-28527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA64C5F0FD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 20:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ABD454EA2F0
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 19:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1CA2F3C0A;
	Fri, 14 Nov 2025 19:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StIFBK5j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA92DECBF;
	Fri, 14 Nov 2025 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763148975; cv=none; b=sHrzUhng4B6l8lC2hHiFAPPwEuxc6xnCygx8kaoA4EOoDuwcKe0SUu7g7GBzDaj4MWZE7OMV9dGQOk2NfhsNZ/vXlmeT3fuZyLSkQ9RFTs6hC9fbJ9luYGTa4s5gTuNrSFRiceaiIfBXuBxd1Ky3/3sCEk47fsWBwqkCqvdTKsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763148975; c=relaxed/simple;
	bh=ITF00HrK0W0pMP4VKbSDERXlz8TM7Nt545N6LU03Cqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dk/QpNxlq00MxWH6Qw1Pc8Pnk8iR+3iJsFV78mPLP1cBz8KTt5d86cUUpQBA6rHD6T2uaGeS7RUaJnHi2jX9nkfOxiPb0zMUIIIoyP8gDwxj5A0moBfs9KuhM3V5lb7swaaLhHIf2l7wB7H7LrnIfL12EWe3kdiKEtagHThMlqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StIFBK5j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E120DC116D0;
	Fri, 14 Nov 2025 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763148974;
	bh=ITF00HrK0W0pMP4VKbSDERXlz8TM7Nt545N6LU03Cqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StIFBK5jd4GAuo9zZte+RK2fwQ52V4PCi1G0+AHF+OpYnuuoHbODPOO6Jrle2sEHw
	 p3n8I4Bhyue1WRD8BA3a1REz8sNPq1XSTEEYPFPlAVazWkCd82WOBA8y4mK5R5rBzw
	 3IH93v0uhYGxdmhY3m4nvdIYUW30up/W4uAHjZ0u12XAEYImTTR2agip0tcyAAjtwf
	 rT0fHV+xo34TMyw+8DRqcuWzrRI4GMmC0CfFsEKgEh6VqDXLR2NZYXJwW+X/SNxt/0
	 hgTaWGld3N+tdaRY1teQBx1wYcK53jQbvF6m6DbdmlNFqgm0trTP1hEYTJZOiDGwes
	 A56+2pphOc+Cg==
Date: Fri, 14 Nov 2025 13:40:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Message-ID: <ej6u7f55wfhhbhmxnrubgrrzbkcsd564tkr76yieodw4ufaptl@szofah7assqe>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>

On Wed, Nov 12, 2025 at 02:55:36PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -316,6 +316,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTRL if PCI
> +	select HAVE_SHARED_GPIOS
>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
>  
> 
> -- 
> 2.51.0
> 

