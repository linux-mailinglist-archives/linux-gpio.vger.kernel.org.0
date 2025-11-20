Return-Path: <linux-gpio+bounces-28892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14819C737FD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 11:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0FBD4E5CE9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9988A32C317;
	Thu, 20 Nov 2025 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Byxt52qN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47125205E25;
	Thu, 20 Nov 2025 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635230; cv=none; b=l/mTujD6g0Km9a6YOzHNuChdFVNUif2lKS3kq/Wl8F2fWaGjlHHP539iQAPzHLRq7y11xcUZwPjnf5o3rj1cUDojYNO1v1NMd43Jsn570yRM5T2uPIJg4q/FGPuJK8ZPwqThN9tZy9uiEJqAi74f46mNlYhNdXFe3q36WeeAX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635230; c=relaxed/simple;
	bh=yg3PEBAK0vXSHiYm6Rwl7vMN6RwX4AdDjEWGlDFXv3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TySTGOu7bF4tsQYGdG9fGKJpLopHmzx05wghC/4KhHPzkC0+Zkm/6w1XG2rsVafbyTitxNJsMzMY7ACfTYTjCDUTJignc3MeazFfy5Kru9u313Wyg+HD06hltt3Jjh5UFO2/8A3KhfKaGr8SfJHSCGYsgd+LGyUH01p0J9yLfVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Byxt52qN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEB1C116D0;
	Thu, 20 Nov 2025 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763635229;
	bh=yg3PEBAK0vXSHiYm6Rwl7vMN6RwX4AdDjEWGlDFXv3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Byxt52qNfc+rni6YhmiS1E0PWNeqKXddN+uHkoToywxnuRWMrfF05sSOi87AWE2c6
	 QaO82JC//B0IF/DPoI64FQUhoXp6gO0h4tnp4tWsAM0vI0CcWEC5vlFWejwbCPmF7s
	 6bIRyAtpqpAWnpgUYTQ3f9R7olHksYYp/5QZmFTutWvxlnkPT2dBjNJcnEw0LzcAm4
	 Wgwk3MuBBsZecV2FUPzKmGw5Lzj9cvE06e4V2Jgeu4Nmyl6fB/u4ZFgJHMkqV/ov9P
	 C5Ow4Rbzy0ajYBNu+/m17T8QlYmzPE7+A1rQXq7WRtML8B+zoKWN2tHPTJqdoTBOLc
	 VnWHvMV2rK3gA==
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
Subject: Re: (subset) [PATCH v4 00/10] gpio: improve support for shared
 GPIOs
Message-Id: <176363516985.564017.16048857931060018581.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 10:39:29 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Wed, 12 Nov 2025 14:55:29 +0100, Bartosz Golaszewski wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[10/10] regulator: make the subsystem aware of shared GPIOs
        commit: b871d9adffe5a64a1fd9edcb1aebbcc995b17901

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


