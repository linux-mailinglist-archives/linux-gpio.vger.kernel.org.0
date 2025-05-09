Return-Path: <linux-gpio+bounces-19867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC639AB173D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 16:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD30D9E18A5
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 14:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC2921A458;
	Fri,  9 May 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meV1szuP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1D219A7D;
	Fri,  9 May 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800488; cv=none; b=oQmd5rxc/rwM7Do2DcQUm/iqfSOiPfn5KVlor1KPkeTTVgEBmHGzd8SWnqYDOe73eJGzSjX1ZEyLZN449UsZqFDyFzDmJVxIzTI2dSsfTW4gmnxt2XxEfTAiCFwK25vleg0Cvxh+Mz7E3qwpG5kq6YC60fHPXj9sWg8F5BO0FpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800488; c=relaxed/simple;
	bh=sLqdIcgHD/DJtkIGdJq4bDKP2Ofo2cMVDy5Rm7hJjEA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SJVisRMuDMMQ/FyjhFcJfAJFpbfUuYML+VbfrO+TEDcT74yVOK8PmaD4X8DzzowNi7uypb4Dw1+ayJMTvAmw68/CCy1cJL6bzJB4kYD72PeZQmdd1gux1p/5xsK3HUjIhJhsQcw1uRV9I8WRP4lVmCL/UjKpgDHaNClUtoO0fDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meV1szuP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF06DC4CEEE;
	Fri,  9 May 2025 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800488;
	bh=sLqdIcgHD/DJtkIGdJq4bDKP2Ofo2cMVDy5Rm7hJjEA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=meV1szuPT6M7ayjOH5wAhtNtTD6ccORzJ1MnJIf+wzCVpWrGrCxUbzTqiYxa+3Ksi
	 CjNAnE2YJfj5j7369R1lY3SZ++y7Tm8/nb5w9Wkj/n4VSoc0JSFBiISKWLrrsui8H7
	 VzTYvmdphr5fKTbW4zAdABNVH/zdfrD+RV764kNZFZuow0TsYfcKtRNwpLc5l8S1tJ
	 nyjnfCcJPows2k7FQtyaSWoGABZmw1VZ9SV/kF070vBJ+bee1+8HEZh8yQKe22MJAM
	 8t2Lx/w1/OcPmwTBaEVzeMsjkN105oC1Ja7UeuJwd5ggO8wBSi2eozfc9mChxx3/19
	 Rbfxmegzi3TAA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
Subject: Re: [PATCH v6 0/6] Maxim Integrated MAX77759 PMIC MFD-based
 drivers
Message-Id: <174680048459.2927467.16331911843849143362.b4-ty@kernel.org>
Date: Fri, 09 May 2025 15:21:24 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Tue, 25 Mar 2025 08:27:01 +0000, André Draszik wrote:
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

[1/6] dt-bindings: gpio: add max77759 binding
      (no commit info)
[2/6] dt-bindings: nvmem: add max77759 binding
      (no commit info)
[3/6] dt-bindings: mfd: add max77759 binding
      (no commit info)
[4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
      commit: 7934db593dbc8b92cbd028af3f3740e9ef5c6e64
[5/6] gpio: max77759: add Maxim MAX77759 gpio driver
      commit: c4ff17482041f28a1e9454ce06f0c1ba1ad6cee1
[6/6] nvmem: max77759: add Maxim MAX77759 NVMEM driver
      commit: 8b24b312bf493a5e71d2418a2a7ee3eb33f33054

--
Lee Jones [李琼斯]


