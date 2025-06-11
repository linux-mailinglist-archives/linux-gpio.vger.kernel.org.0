Return-Path: <linux-gpio+bounces-21353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1DAD4F56
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7D616426A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BD325393B;
	Wed, 11 Jun 2025 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRjb3C29"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8248254AE1;
	Wed, 11 Jun 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632693; cv=none; b=mtYdVrKqkFT6QSlRT+IVCV9STsPCCdONM8vHXko3YlOsy64sxuUtEfvg3+9dwWRN/wCIbF+3287dK7Jmq+Xb52QJNOo+Ga1w8DNI86+0f2WE11myyxfIO/OPCo9xbGKK+TQFwomsFi1nSp+Qa7hSyOzx0YUN5fH0UMHm04ico58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632693; c=relaxed/simple;
	bh=+knUBY0wvxz6nIYYFRCN+fyoBZnz6LAXSWTtX/9W9w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDk3Fqvc/p+/rpgIQTdR1aH7+VaodiQx2vunr7i3XlJw0/wyKlpPO+vI/dJtU0EGwpadMGesME86tH23L7JepsjmjO4TqOxYsp7b+tt1OJGzK0tGku4YPZK7Sk7DUvsSKkLHawtFD3kyCQL2LH4BdYTbXJGjBLees8Q3R5VvZ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRjb3C29; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FAEC4CEEE;
	Wed, 11 Jun 2025 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749632692;
	bh=+knUBY0wvxz6nIYYFRCN+fyoBZnz6LAXSWTtX/9W9w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRjb3C29LgJR4Is/+ulB0OwI4dJ+pTpVcsdCLVxMQ7YPRblojAfJePprIBk23hlvG
	 iKsEUCjsvCHqgZGi6nAh9RFUzOoVVNC/HvNcmD5oLP0zvneqOZWC53UxKMRlNnwFjL
	 RGgegLQyaVOoQjjBWBNuqoUn8RbPx7BKjLiY6t6LSxswH+wHPUFy5wts8pFsdvixjb
	 16Oy71peXXuo/N+0kZ3kNEkc3eGwcD2X5hGYrNCKyQyChbS0olrH+/eFSZMZZFhP2y
	 HsPOp88d4a1IRWbRKKk2/dvXf21k5zAAMScymNFR1LMeiYbYZrtZMny9JZzpEFTmln
	 b0YT7ee5Nnc1g==
Date: Wed, 11 Jun 2025 11:04:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Griffin <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Message-ID: <20250611-robust-vehement-dog-2bf6ac@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
 <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>

On Fri, Jun 06, 2025 at 04:02:57PM GMT, Andr=C3=A9 Draszik wrote:
> Using lowercase for the buck and ldo nodenames is preferred, as
> evidenced e.g. in [1].
>=20
> Convert the example here to lowercase before we add any bindings
> describing the s2mpg1x regulators that will enforce the spelling.
>=20
> Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bc=
bf@krzk-bin/ [1]
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

So this is also a dependency for the rest of the patches?

Best regards,
Krzysztof


