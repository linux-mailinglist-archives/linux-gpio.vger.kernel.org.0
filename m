Return-Path: <linux-gpio+bounces-19866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA17AB1738
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 16:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2743BD550
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 14:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C622144AE;
	Fri,  9 May 2025 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnZeRuET"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB155C147;
	Fri,  9 May 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800485; cv=none; b=OU1nWXx6ZfKtMq2uHtMhDhbG31fBbKYispSNBMcax2YERAVcEs1wpp/DqGZPHQS9L0JuWP7xHDzekNtYvxNQYQAyDG31X2aGu4EmGf1sc5xSMB/M+IAcLUzsupalkc720ZJbx1zFfusxJHI82/KQKhrx9C3I/ZyTrjyA+yhF/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800485; c=relaxed/simple;
	bh=mx/RLyWJj3QHlcLB44376v1EXXEpIUxqxwhBlaK674Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X9bBQX++4jJitKfXnmih3AllYTxpa24PJjfAnNkEv5gnm8A6lnML4Yp8bv1CuNvuMaOz1YCZ+wQb6q+ZMmHbFQUbVBLigk0nuvhERL2ZSPCPPhSHyQNT/o9cbcv5DO2VfOlB6XFRPv4QJqt+TK/65As6y5505HDgmOHjve9eQZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnZeRuET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C60C4CEE4;
	Fri,  9 May 2025 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800484;
	bh=mx/RLyWJj3QHlcLB44376v1EXXEpIUxqxwhBlaK674Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FnZeRuET8Ets5JGEyxI9ww3yiK/ML5XdxcVKBKGzY3zl+fAqj43XxKkwheF9yBN+e
	 +pHZLX0bf1xsqHdfTXUzoblZpG6HEcWIUguqvg2RNLvTs8SA4ON0wplowW975ScJke
	 wkUc1L2kkTbb+s1BxnygTqr7F6AguDQXDcax81t5JDBOUJnYRtIfrNLTLJOC/BzuG/
	 xj5AnBBH5pJC96bSlv8gg/ZjKN+2MIBEbQcCIIDhcXMUtMoEUdHQJ7eFwhJYOTQPLM
	 be2xcO8U0DgW0Lexl1OW6rHJZ0z4hFrEq/wsh6441irkVROc1JP5k/VhmLUmiGH37d
	 ZTdItAgDKvoVg==
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
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250325-max77759-mfd-v6-4-c0870ca662ba@linaro.org>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
 <20250325-max77759-mfd-v6-4-c0870ca662ba@linaro.org>
Subject: Re: (subset) [PATCH v6 4/6] mfd: max77759: add Maxim MAX77759 core
 mfd driver
Message-Id: <174680048099.2927467.9514671718448289584.b4-ty@kernel.org>
Date: Fri, 09 May 2025 15:21:20 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Tue, 25 Mar 2025 08:27:05 +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> Fuel Gauge and TCPC have separate and independent I2C addresses,
> register maps, and interrupt lines and are therefore excluded from the
> MFD core device driver here.
> 
> [...]

Applied, thanks!

[4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
      commit: 7934db593dbc8b92cbd028af3f3740e9ef5c6e64

--
Lee Jones [李琼斯]


