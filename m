Return-Path: <linux-gpio+bounces-1382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A92811804
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3938F1F21964
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ADA59553;
	Wed, 13 Dec 2023 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffta2sAi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F15954F;
	Wed, 13 Dec 2023 15:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AB6C433C9;
	Wed, 13 Dec 2023 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482146;
	bh=GcusTtDa/xUz/eWeRnRe/jGZ7M5e05jlT9WsJ3wX1Aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ffta2sAir1jM4m+st2G1XjKJwbMxZHgj5f/t5FIM8J+TcIpJrMm8ZOXt4C8IZbTZ0
	 4/6nUIZ29UyleFKeoEJh151Bb5llzinRSD+j7HupWYTI0AUbMDl3X+25t/AeCfiAPj
	 qRgrcm+QNlJaBI+gdjJ5TxOLmrGcWtiyXdzbHBVrLS2d3YhZhGOe0c3yDWjAAPGO+N
	 V96sYnmzxLWgMsOkZOCKuBHivNFd8XHm/eEGh0c9dhTahunm4NCvdY35yMb/XSiKhG
	 13Rb3fQ5R2FdKldI6F1mbkyCiZ/FM62m3qEwDmsjVfUh7Sar3EBewWHexBp8X3JSel
	 gGGnrJxo0E0BQ==
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
In-Reply-To: <20231207161513.3195509-2-andriy.shevchenko@linux.intel.com>
References: <20231207161513.3195509-2-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v2 1/1] backlight: hx8357: Convert to agnostic
 GPIO API
Message-Id: <170248214388.988965.2531555627636674132.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 15:42:23 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 07 Dec 2023 18:14:32 +0200, Andy Shevchenko wrote:
> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
> 
> 

Applied, thanks!

[1/1] backlight: hx8357: Convert to agnostic GPIO API
      commit: 7d84a63a39b78443d09f2b4edf7ecb1d586379b4

--
Lee Jones [李琼斯]


