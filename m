Return-Path: <linux-gpio+bounces-18138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C996FA7745C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 08:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD4BF1888843
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 06:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B0E1DFDA1;
	Tue,  1 Apr 2025 06:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNymlsUa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC161D8A10;
	Tue,  1 Apr 2025 06:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743488033; cv=none; b=jytVXtNP6kSt4NDEBTG5jSGyrenyhv5qLSWgcVzDKArfcqNLen+Ppofz87lg/RzJ0xvwl7F1bFMwanvMJ+heJaPwinmU4PJ1fj65LJ9yh00YPz9sB5kP7+wJIQ+JZ1KNCwGb19cuF50t4TG/xl8bTkclz5GkRcEQCsdAME0biW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743488033; c=relaxed/simple;
	bh=a/WBWaI1GRijiNVhX5FXEpnwkrIb9sOyftFgp32l9+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCBoaMy06sE0GNEuS1D+QUktZ9Gn5xxl8dNZWe3qsVZ8HEfVXzIb314nPMa/zEdo9xXDIBdqS/8mSdIBg1+M4yQ4ujqvxSxnlMvcSSa6fDtnHzGHKutqlyZIM9TuhEcOdPfnPaDcIIjavg8erw85vtEx2aN5vUPjP8ORZxayZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNymlsUa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42742C4CEE8;
	Tue,  1 Apr 2025 06:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743488033;
	bh=a/WBWaI1GRijiNVhX5FXEpnwkrIb9sOyftFgp32l9+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNymlsUa/smbZNP5cRJtDeGbNZjsIVNja4x7dB9r+sVZdWnd5hWwiKB9CRvQsFeJe
	 Zp2BVuP5TDBpX+8K4PJ6IlnjXD23NVrptNeVecJQtqHl8LIwNdlF4feRJHDEjq3G4J
	 4/fSDq6auzVqB8pY1se8oupuPSaxBsDNH6RT87HikgM9BDj+IqWlb21+hYu9KOh3sK
	 aIw+G163YeCtXjUrdu1LmKGBOQPOzNd7B5yxhmrM5zMnxgyiWorK7NYeR9a1D/XGcW
	 8djMi/ZIcjD3UPkdjNV+6dVMi3F4GPqjvzUYfcQD8lJIOZtC9PAn1r87ZIyrgtthxO
	 0pFvcrsHWlSUg==
Date: Tue, 1 Apr 2025 08:13:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Message-ID: <20250401-meteoric-perfect-cuttlefish-abd62d@krzk-bin>
References: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
 <20250401-a5-pinctrl-v2-1-a136c1058379@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401-a5-pinctrl-v2-1-a136c1058379@amlogic.com>

On Tue, Apr 01, 2025 at 10:06:21AM +0800, Xianwei Zhao wrote:
> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
> no need for an extra compatible line in the driver, but add A5
> compatible line for documentation.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> index 8eb50cad61d5..3bebccaf0c9f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -14,8 +14,12 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: amlogic,pinctrl-a4
> -

Do not remove blank line.

Best regards,
Krzysztof


