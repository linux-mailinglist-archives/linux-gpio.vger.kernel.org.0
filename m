Return-Path: <linux-gpio+bounces-19868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6C7AB1740
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 16:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336471898795
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 14:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551EC2110;
	Fri,  9 May 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n32x43Yz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F71219A7D;
	Fri,  9 May 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800492; cv=none; b=aaB+QJYB8tBrG3YjPKnyMWZ1/PoA5J9HRTR46VI6qz9ClQKyxVrD6zwbCgOPjHVBykOKhFCvHLYd5y20I71kdEY7B0D25Nn5Sywe+7IySwmIIWKeofpkh7PobL4e+pocgPHHbiuOwD4xk1bHsp18d4xKDBDdJ7XEkeSQnl1s8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800492; c=relaxed/simple;
	bh=f7zTVEe5aD0hTkmXyPBcDqsJb6NWA2toaHf5VkcvYYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XcQzRyXFBPkoomCWJT9j5GCvzLzAIfvrzBRgi+6irS5BS80c3vQnXTKf3lyZGCIxMJH5VF59OsJXkSorWDGgEXia/yJWsSeoAtSd6RilJ7Y82SjdvCWwCy1Atm+fYI1ahJB3Tin9D2x7kXdtm3pzyxuBnrOV5RaQkArvX9ctMpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n32x43Yz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9A4C4CEEF;
	Fri,  9 May 2025 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800491;
	bh=f7zTVEe5aD0hTkmXyPBcDqsJb6NWA2toaHf5VkcvYYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n32x43YzWKZqX53ozdjsX4Dl15HgLUFUUskqyGTlZ4gETTsCqPu5cR7CUiPyzpGYU
	 qHkgGgs9Ox0bGZ+NVHCBpXKlPuqXSshr2vzzttpqmGOiergEZQmYoizTb06XkrmfPB
	 mgu/z/cBQEXcYtXc+oryxjd4gzA3UsBLUlMANX3A6lkByvO5EkIne946PtMHWATZIp
	 NeOubU3tgDd6VxX+p1fo34GlRosgpAH7JdgZ1dOaPnwds1A3EN+vNKZFiINm+WUnv0
	 bBwoFGN8tWdPLPcxg11VlY9x8c5mSQDIaS9P55HSmPjmQK/4QshpOodPF2DJU1RzWM
	 UrM60aQ3ozfdA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
References: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
Subject: Re: [PATCH v10 0/3] Maxim Integrated MAX77759 PMIC MFD-based
 drivers
Message-Id: <174680048833.2927467.5021194102243558370.b4-ty@kernel.org>
Date: Fri, 09 May 2025 15:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Fri, 09 May 2025 14:22:38 +0100, André Draszik wrote:
> This series improves support for the Maxim Integrated MAX77759
> companion PMIC for USB Type-C applications using the MFD framework.
> 
> This series must be applied in-order, due to interdependencies of some
> of the patches:
> * to avoid use of undocumented compatibles by the newly added drivers,
>   the bindings are added first in this series
> * patch 1 ("dt-bindings: gpio: add max77759 binding") also creates a
>   new MAINTAINERS entry, including a wildcard match for the other
>   bindings in this series
> * patch 3 ("dt-bindings: mfd: add max77759 binding") references the
>   bindings added in patch 1 and 2 and can not work if those aren't
>   available
> * patch 4 ("mfd: max77759: add Maxim MAX77759 core mfd driver") adds
>   the core MFD driver, which also exposes an API to its leaf drivers
>   and is used by patches 5 and 6
> * patches 5 and 6 won't compile without patch 4
> 
> [...]

Applied, thanks!

[1/3] mfd: max77759: add Maxim MAX77759 core mfd driver
      commit: 7934db593dbc8b92cbd028af3f3740e9ef5c6e64
[2/3] gpio: max77759: add Maxim MAX77759 gpio driver
      commit: c4ff17482041f28a1e9454ce06f0c1ba1ad6cee1
[3/3] nvmem: max77759: add Maxim MAX77759 NVMEM driver
      commit: 8b24b312bf493a5e71d2418a2a7ee3eb33f33054

--
Lee Jones [李琼斯]


