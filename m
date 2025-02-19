Return-Path: <linux-gpio+bounces-16247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB65A3CB4E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 22:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39868176A25
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 21:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2266257428;
	Wed, 19 Feb 2025 21:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqsPhmw/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1DE1B87EF;
	Wed, 19 Feb 2025 21:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740000126; cv=none; b=k7utzbuW8bMwlzVLfEFhF60p2O82S9X2Z/ZKmv/0+dS+K+r8KC9IrjHpu8MAY+jSu+KlvsJEWebmKSDtTgYNjpsmL+H5biZEUhWwKtKKo+Mojj7yMc2DgVbBpuKtE1J7mELXftXsFZQyY0X0WqDy/1n1tMqqyOb8ZMjC/Wf5+W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740000126; c=relaxed/simple;
	bh=5vfdv1IWZ57ad6RST56MifY1lxkn1jnqlk1jC8vaDbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNqMCHjOJkycEmdYqwbPVbVkAdfipRdzSlrRhQeZkDEPRtZdPMX5U8SXlq+0GLgEHAz+U5yUkTuduzCJJyfICeY37V1Pv2IainfedUHQ99OUroIrsCJ7X7kh8vhquEFPe6az4KKHZDx+M36CGM1rTPT5Ku+gruZMcDAJijl6U1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqsPhmw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0681C4CED1;
	Wed, 19 Feb 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740000126;
	bh=5vfdv1IWZ57ad6RST56MifY1lxkn1jnqlk1jC8vaDbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqsPhmw/qK0EANe/CvcEJA+8Z7bk/OxllNIVXqaqjXdKJa9fPaJ5OVNUTm11/oFnA
	 GbgQw0Y8scZzq9p/96ioYDwCEMaPUPxOoglzl1CHxEP8QGyEY/WZBfrZgoQY6NLFaa
	 +qxeTdGSE9i/bKK8QQIFqJf+COujvnJAewLTHnWIGeftIVwzmX62fuOYyQip1YQuvn
	 ITkVywFW5CwyA2+mF6tjJA7Ut0FfHfUrbfJ8tSL7ySfoeVzGPmjvyhaZV4zIssUOC/
	 9ea8OB0wJcEkk6Ifgn1aBTC6ncW/P51mCYd7Oj3Za/s++P62Gmxz4OVAsjKyMTZcIy
	 L9kkJ6SaKnw7g==
Date: Wed, 19 Feb 2025 15:22:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: pinctrl: Add pinctrl for Sophgo
 SG2042 series SoC
Message-ID: <174000012333.2976359.11039865592765348897.robh@kernel.org>
References: <20250211051801.470800-1-inochiama@gmail.com>
 <20250211051801.470800-6-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211051801.470800-6-inochiama@gmail.com>


On Tue, 11 Feb 2025 13:17:53 +0800, Inochi Amaoto wrote:
> SG2042 introduces a simple pinctrl device for all configurable pins.
> For the SG2042 pinctl register file, each register (32 bits) is
> responsible for two pins, each occupying the upper 16 bits and lower
> 16 bits of the register. It supports setting pull up/down, drive
> strength and input schmitt trigger.
> 
> Add support for SG2042 pinctrl device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../pinctrl/sophgo,sg2042-pinctrl.yaml        | 129 ++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2044.h  | 221 ++++++++++++++++++
>  3 files changed, 546 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2044.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


