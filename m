Return-Path: <linux-gpio+bounces-20408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D1DABEF53
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F2A3B4F34
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745D1239E8C;
	Wed, 21 May 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axkvbxKJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE5C239E74;
	Wed, 21 May 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818937; cv=none; b=poibooXJ70pNsNfG+tqhiGe5LohMiD9JoF7Y3F8SCEzSudo6sK8J6sJ6uyMaRn7p10GIPYd0Y51EjkbNAKiuZO79YtBKBSe6ZXDJ6oAItu5HWhjcaF9+2YlMrgD5y2uDO5yvQgxeEhU5/VHnPpBeKTCSwdGXNm+pCnX8B8Qmh3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818937; c=relaxed/simple;
	bh=Ac1qjRLgENN/x/3NhLFz+/OEtJ22b5k//0P8ES5W7vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg+m/Ti3SPNKqq7AWewNavZfL8ilAdFyENAYFVkXvduuHEa7HYmtk2u18cKbSIg7AjTWVDNZNQCuMMQksrK6wZsSRIrjFuAGHelIADjnL9n3OUe01wlZRtCcTCwQ3QIM/4CYfseHTuR10h6o6qOcog/a0OHfy99eY7SNEmQE9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axkvbxKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094A5C4CEEA;
	Wed, 21 May 2025 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818936;
	bh=Ac1qjRLgENN/x/3NhLFz+/OEtJ22b5k//0P8ES5W7vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axkvbxKJYTwsYQU8tUXkUbC3fZodTNzKKfMfzDHrAYOsyJ5U9Wzijd2s2SmuA7joT
	 h/8QhCOthYBrGUuQEw2aZY/6Fbe0tM7Srlr0pdmgODd/uK91IMV/Y285oqnCY51HQk
	 zCdTYsjqdPI781iUP53706ytYhJfql0bwfG/NpAZ8UGuJqA0c2gcHPh6w7fuEKfN1k
	 uFPEQftaSUuC+q7XzglHLoTzHxff7SRhU4Ysw5PNmWa+P/1nFRBe6ZHp4TGfG7XXTP
	 /OzQap1HUhcJE1tweOTL3vKQBfOghkOTcZpNfSRno9TAJgxBabbGnX5bDJZMFUJOId
	 mcVkpR0mbQcug==
Date: Wed, 21 May 2025 11:15:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7D
Message-ID: <20250521-azure-cougar-of-modernism-f35481@kuoka>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
 <20250521-s6-s7-pinctrl-v2-2-0ce5e3728404@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521-s6-s7-pinctrl-v2-2-0ce5e3728404@amlogic.com>

On Wed, May 21, 2025 at 11:19:56AM GMT, Xianwei Zhao wrote:
> Update dt-binding document for pinctrl of Amlogic S7D SoC.
> 
> Amlogic S7D SoCs uses the same pintrl controller as S7 SoCs. There is
> no need for an extra compatible line in the driver, but add S7D
> compatible line for documentation.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Squash it with the previous patch, so it will be obvious that s7 is
documented.

Best regards,
Krzysztof


