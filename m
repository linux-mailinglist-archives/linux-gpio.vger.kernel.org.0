Return-Path: <linux-gpio+bounces-28916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA665C744F6
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 14:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0209B2EFB1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 13:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0497433E359;
	Thu, 20 Nov 2025 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcXQuW+f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71430B51B;
	Thu, 20 Nov 2025 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645801; cv=none; b=NL5sFSxAdwKwXVnE6ZRTt9JfJCZ3roouojq/C0m6Nh9q+LvPGBr/XNrpJrz6vveS2F6vkXec+Uy6mSV7U6cWQ0SGdI/a0qjjYtBjps/0Uvxdv3qyWKp859lE9aVlvpq2LW7P4SIGeFqG05r0xSdw60IgiOyQySAkb6sUuo2TJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645801; c=relaxed/simple;
	bh=QeW3CEvdKqBT0Wu8GYf8ydAdxWMl51xnLxLsaTIhg8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gwdapDkovA0Uopujc4Jssd6G5XY9BxF2T1YaGKdoC1dYkFa1TAgat0Ehw0v2IHvz0DNA+/E/HT7WzAfIVCKU7LQG/eUTQU6N7VuIXlhzUIbttuKo+FOJKHNjwP06Guo1CzHcy3mHZ6A4DeD/jeNLOmqWVuHJKb4XUwH2w7wJLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcXQuW+f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21794C4CEF1;
	Thu, 20 Nov 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645801;
	bh=QeW3CEvdKqBT0Wu8GYf8ydAdxWMl51xnLxLsaTIhg8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kcXQuW+fGb4qfDsyuPDFmOZC0Z9xPTm2xTJ1Jf4La0K7lR8FldEsLV/mGaYiyHOha
	 jJ//TH/ycZasivIDTgclaoZbBuAQEjj5qQZcE5oJAlwq0df4aBYDvbm8XS2XipOR3i
	 3Kj/HU9CVbdHbdOyNaJ7LiPlaoSPUrL1+H0FLQgRv+cfbXzFRztc9Emt4aKJ8GC+33
	 JCVq4NjXkPdAKcxsPKi+s7c7dsXsA2UnKSVjNL1IS7aem813+30mF4v2RJtOuV2mVi
	 Pp+x3uKTpf4ySJfKrzNKLzrZiZA77hJB5jkUY28IIxCJQiX3QbXIkC7YMXiwfE6j59
	 pqLW6I39zzOJA==
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
Message-Id: <176364579587.23444.3839651662930349117.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 13:36:35 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
        commit: d01fbee5c0d3d3061fb16235b71f5a117128e2c1
[09/10] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
        commit: 7a0a87712120329c034b0aae88bdaa05bd046f10

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


