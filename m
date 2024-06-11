Return-Path: <linux-gpio+bounces-7376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E39045D1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 22:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5EBC28570E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 20:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60015152189;
	Tue, 11 Jun 2024 20:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxrc8EQj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FA712E61;
	Tue, 11 Jun 2024 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718138125; cv=none; b=gzGU9SZy2EvaGsVxDWbmx0cla5q3GroG4DXjSO8OUdd/WrgOvruLchy+FwOlaZlXHTbKTVW6aDST5KxgN7MmC6v0VNlhbxhwYDijKF2naaVybnISLnu0WBolIt8ULzJbmmNv9v+wsMnGLIbVugRHZj9lN1lrLQBQMOUPKZiOxWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718138125; c=relaxed/simple;
	bh=Jt8rKRPa7/P92ZHQ4z+Vuw/hztGwjZGN29K72DrkOnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT+8/1VmWmWt7yM+2UBabVYk6goAuKwUsJVCkSz5k+Ly1mHO3uYtg+A4yTkLkELfNlqOFwT1N/AV7whH2+t3aGatIE+y/NyR8ZGTQHQDsL2aVEuIdWcEZnZHTgeuBkYiPyLnQLZy5j7kIYKHvlTO8BKCeA6xlG7YZnFiVxNfp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxrc8EQj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CDDC2BD10;
	Tue, 11 Jun 2024 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718138124;
	bh=Jt8rKRPa7/P92ZHQ4z+Vuw/hztGwjZGN29K72DrkOnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxrc8EQjAq+8MBvImItsoM0G+Tf5SH5qNCLJGe0orXVS1NZbHlk0vSzg8b1xNX0mF
	 /mpGb4sEYTCtXy6DnCKTdw7LII5hA/5gAqSHUxX4hZXTQWZ9m3+tjLYPMIzqNwNoE2
	 wa7+FAzkZn3kdfUbrlM2r98Fcm5kIGzh7UstCuOHUvmkyg8w8YUlIm1hc1wm+gtS5A
	 7BkVVX3Z2dPfDmRzAzML2kOjYJP3RUmNJ2xvEwz48iNNwz/b8dKnxeBH/2T2xKa/Uy
	 3HhRrGHZSFgm5zgl6iKP0seToMKTkrNr+03ICB73bYnvuNYIlC3SmWJjyWZr2IkIn4
	 qLvRA/Znfzbtw==
Date: Tue, 11 Jun 2024 14:35:22 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: lsi,zevio-gpio: convert to YAML
Message-ID: <20240611203522.GA3021149-robh@kernel.org>
References: <20240611140034.24685-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611140034.24685-1-afd@ti.com>

On Tue, Jun 11, 2024 at 09:00:34AM -0500, Andrew Davis wrote:
> Convert Zevio GPIO controller bindings to DT schema.
> 
> Changes during conversion:
>  - Add used but undocumented interrupts property

An interrupt on a GPIO controller generally means it is also an 
interrupt-controller. Do you need to add those properties too?

> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/gpio/gpio-zevio.txt   | 16 -------
>  .../bindings/gpio/lsi,zevio-gpio.yaml         | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

