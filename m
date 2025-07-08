Return-Path: <linux-gpio+bounces-22939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0295AFCCAD
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 15:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC7077A4A7A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33AF2DECB3;
	Tue,  8 Jul 2025 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8sBNIiO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13E2DEA81;
	Tue,  8 Jul 2025 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982843; cv=none; b=cUhLUxs0OCNGIr2QICWrdDSYZVHT33ofkEuhlZeSPeNmkvJ6bFMzIzaYokp0rJRXtyPF22SZ5nhnd+zhjrIADFprZdm52VmZ2LJxNfvnBY0L4x96HPMBHcGVbwt/B3pijHfSPknMxUrhRfocXFhyya2K297XN3+K2oZ9yb4HRPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982843; c=relaxed/simple;
	bh=2U7WIwbZsGcHH5yL4JdEazTDUBXTpSpRvg0hBKcmjqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=prABNDpOK6YuEDa46S8U20cXQInQSqaf7YaYKCD9uFyNs7Y3quOLZyjfSjVkzEvfvirmqaYSV9jBj3KQF95gWiC951HF8Yg3mMoLnlG5QIsNCcNVtSuMfWLaqCUwZK2YyLNmXQbskgjAJevgOfeK7rnVKDbpCaAGOE10f6zsmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8sBNIiO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D550FC4CEED;
	Tue,  8 Jul 2025 13:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751982842;
	bh=2U7WIwbZsGcHH5yL4JdEazTDUBXTpSpRvg0hBKcmjqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X8sBNIiOd6uk+UYh8EL2eKZ2EgO+H/NE+Ja/5Z75Ov71NXKpDheZLnpjzAV69LDOw
	 7NZ35yZQDcc5z0XnxDu8R9dSRmWkqR9YkS15CSEV/JC0LqrIsUpBa6xlUw+XhyOzr6
	 rfFF9aHOorMmMkZrwXHgnWAgAQRLjJ+8TjjPpDPB6JADIj64/o19CadbyMCXy41X7v
	 mjwSBXFRz7i0tYNsACayQVTGeR/I13lV7mzZ5JY4zTFFLljRobbxnUuimEKMjqS9W6
	 4kMynfdmC0QoAKVLQdXrW+W25Y43vaLwecZQYz+mIHdx7SMe0OZGxiehHeliZrorDS
	 qLFUDbqMdd1ZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20250629095716.841-1-jszhang@kernel.org>
References: <20250629095716.841-1-jszhang@kernel.org>
Subject: Re: [PATCH] regulator: sy8827n: make enable gpio NONEXCLUSIVE
Message-Id: <175198284045.435800.10793506955504985146.b4-ty@kernel.org>
Date: Tue, 08 Jul 2025 14:54:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9

On Sun, 29 Jun 2025 17:57:16 +0800, Jisheng Zhang wrote:
> On some platforms, the sy8827n enable gpio may also be used for other
> purpose, so make it NONEXCLUSIVE to support this case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: sy8827n: make enable gpio NONEXCLUSIVE
      commit: 5054740e0092aac528c0589251f612b3b41c9e7b

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


