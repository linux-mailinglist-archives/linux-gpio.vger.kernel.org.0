Return-Path: <linux-gpio+bounces-16637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE5A465D0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 16:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1140A3A8070
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 15:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A2D2904;
	Wed, 26 Feb 2025 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCvVLYNl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9D21D5A8;
	Wed, 26 Feb 2025 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740585355; cv=none; b=XHbsU0FDRu0C92bXMkCsnNIeHtWxdSj+ioOSEUck3yEK5mwBcedX/uC6SkvnaCKeQs0WziRVs+YhF8rZaTXwTt0bU1TxoZovQomHxc12ZeIwpmkSq3acgrvlqFPe7zMBR3bsyHLkh8TUCsMkeJJRG9fMNS53wDjBmpUzW+NIgtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740585355; c=relaxed/simple;
	bh=2b/0jmiET26RzTFkTnCeyD691GwyGBvbl6ZzIxxMzBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpo8r7jBA5RpdIG3kbE5+nbem1tBpQ+NpA5UdUspFVnPIP6+PuniF7nyk8oDy4dbxyaAKGrKhRHFvS3k72DBn0wdPqsUZ6z3ui2xMmQkb6UPfYklFtD/9dchEpoZYEpa35+eJWRJ8WoV7/iWwmMXQB3OLlSmhoZ8Dnd/x4Ve9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCvVLYNl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880C5C4CEE9;
	Wed, 26 Feb 2025 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740585354;
	bh=2b/0jmiET26RzTFkTnCeyD691GwyGBvbl6ZzIxxMzBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCvVLYNl/BDsnaShGUmbG2XfXhp7YkwSQPo2z31Zh+BrguxCktqVKeTxq/nCVPSV7
	 yrH8LApkaemi3jyzNA8FJIbyi/WOfZSF5oEYnphgr5mPDmAgzIsR3EX7i31YGK7kG6
	 sC01lAwwrqlEXvKb3FXFz4lUT7BB6T+dEGU/78Hrv6d6Wv3e5diyU/v8Miwnc9I0Lg
	 Yj4i2icq3VyziG/Z3uTdQRPAOJuExBbLP3KCHxa62ogm0wc7XR3aPGEVh1OLBKGHqD
	 qhCvmfTo5PlRk2mhcEmV7QH1AqRGaBRk78vS+mvYTXlB/PHSuwtGZbW7jbeTOD2Ftn
	 PQCd2eAg4QyVg==
Date: Wed, 26 Feb 2025 09:55:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	spacemit@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Alex Elder <elder@riscstar.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <174058535208.2501613.753521033662405764.robh@kernel.org>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
 <20250226-03-k1-gpio-v7-1-be489c4a609b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-03-k1-gpio-v7-1-be489c4a609b@gentoo.org>


On Wed, 26 Feb 2025 08:41:17 +0800, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, falling edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


