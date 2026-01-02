Return-Path: <linux-gpio+bounces-30056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D04CEE3E1
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B532B3007C9C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BED2DF3FD;
	Fri,  2 Jan 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7lh3g6a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6022DEA83;
	Fri,  2 Jan 2026 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351678; cv=none; b=GxuM4F6Oi/QT5QUdtBcr1SGZPMHKPfCtdAguNkdYl5tbco3KknOO0cLDQnofjC6eAq8+7hSkC44PjZkmXBTUVcumixy9JkSBhBtGF21q5IxoRUc76Jtve5Lm8xTlBjx9d/oYGGzJ81VTRKeHxpgAPDlfVK7LiUVpPFzB86elubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351678; c=relaxed/simple;
	bh=MwKJwpnCxjSn8BMhS1akxq/00lr/MQbNFr63/39YNgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/8xPnyyovNYqU9KuVEnBYUgMB559sFl8jvtVPHgPT8Ze+8WoKXE8XEHyUVXxMQRni7jYzG2Q721nDRpxd4xoNTV8JsnIvfXrvMO5rpUS6Y1PzxwAKx3HzTWQf05OO7qWvLnu8GOMsme1MH8sqVTK9ThGEVCeZ+i323ZbvfE20c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7lh3g6a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5913C16AAE;
	Fri,  2 Jan 2026 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351678;
	bh=MwKJwpnCxjSn8BMhS1akxq/00lr/MQbNFr63/39YNgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7lh3g6ahEyHGXjbaXZexuZsffnHf0OXeZgyWbcXOnlC+RuGon9px64K6XqfkOVPR
	 Xi1sM1UqqSlMgOPVL2M3rRdSMTHYpWRZav8npIyjLMrjm9CjZF2w1MXgzNKYHECNEg
	 34eqZelSzMk5zXpaHqzOeGjukT81I3MU6idWvWGmAXsXEke1w0WQAaG+Fsh9kYWbLj
	 KuC12x8CeJTd9nM5NU5vHSFdjOoylBJ2ls2+Nhd/k9iw50tc5kvQR0r/JHzCi+5k3v
	 DeY9UcQ2+9Stp6+4R8T9Kvph336pQKYLUF17Yle/9eiR8CkCvWGLrDfdw6nrlNIqv3
	 zVNIbvVITwnYQ==
Date: Fri, 2 Jan 2026 12:01:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: convert drive
 strength to schema format
Message-ID: <20260102-mottled-albatross-of-fame-0e7efe@quoll>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
 <20260102-02-k3-pinctrl-v3-1-30aa104e2847@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102-02-k3-pinctrl-v3-1-30aa104e2847@gentoo.org>

On Fri, Jan 02, 2026 at 03:00:22PM +0800, Yixun Lan wrote:
> In order to better extend the pinctrl support for future new SoC, convert
> drive strength setting from free form text to more standard schema format.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml     | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


