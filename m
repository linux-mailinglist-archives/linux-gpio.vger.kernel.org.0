Return-Path: <linux-gpio+bounces-16158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C9A3874B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 16:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E21B3A9630
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0138B223719;
	Mon, 17 Feb 2025 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OLZuZoX0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CAB153BE4;
	Mon, 17 Feb 2025 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739805235; cv=none; b=h/bmMFlIhof+CgTSONiKr48NcjrzaonO+YM+aq5/U9a4kaD262yRV1Jn5vv1bAOSNzuY+EhNt1ZNFY2c210qt9Vz7f3xcEtTsIaUV1/guZs1tQg5ZyVnWsmgD51ZD02MgQPVi6WL2F51J9jD708tcDJm+ptcNeT7YYLEcLudwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739805235; c=relaxed/simple;
	bh=4IwqyRNmeNmWY2pPTppluqov5K7ZxD3mXcgZMuOACNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3QOcJrwQc8oQXgdF3gBdzRNGEMW6FtWL+1tDZDnkRl0i82jriR/axmC9D0ELPqy6aEpjPRbvwIGJ0YK9UQmp1GNxEAUQ1JlxDPkZYGlan8CynjJeJzAZbQRSkgLMJu/+jiw1dQafE/sdj7I7gKw5iyECDWQ54lE3no+OAA51Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OLZuZoX0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE45922F;
	Mon, 17 Feb 2025 16:12:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739805150;
	bh=4IwqyRNmeNmWY2pPTppluqov5K7ZxD3mXcgZMuOACNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLZuZoX0U7kyRiwA0oYGdrPwfZVglVW6ApofXbPf8QFsAAKjx+9D3yAyhk6oK6KMy
	 gTYtmYvPvqpLUiM4eVV6s55AMJY1z5JCAHZAxMMco07iIlK4Oo54oOaVaXGSjnw1vD
	 FFBHmNKcNbhit4XVHOpze/F3m7VM5ktwAxIUxCgQ=
Date: Mon, 17 Feb 2025 17:13:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: gomba007@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add support for PCF8574T.
Message-ID: <20250217151336.GA12410@pendragon.ideasonboard.com>
References: <20250217-gpio-pcf8574t-v1-0-137e140df5fc@gmail.com>
 <20250217-gpio-pcf8574t-v1-2-137e140df5fc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217-gpio-pcf8574t-v1-2-137e140df5fc@gmail.com>

Hi Tóth,

Thank you for the patch.

On Mon, Feb 17, 2025 at 02:07:52PM +0100, Tóth János via B4 Relay wrote:
> From: Tóth János <gomba007@gmail.com>
> 
> Add the necessary documentation for PCF8574T.
> 
> Signed-off-by: Tóth János <gomba007@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> index 3718103e966a..cbe4cf96e942 100644
> --- a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> @@ -34,6 +34,7 @@ properties:
>        - nxp,pca9675
>        - nxp,pcf8574
>        - nxp,pcf8574a
> +      - nxp,pcf8574t

Judging from patch 2/2, the PCF8574T is compatible with the PCF8574, the
only difference being the package. It makes no difference from a
software point of view. It seems you can simply use nxp,pcf8574 as a
compatible string in your device tree for the PCF8574T, and this patch
series isn't needed.

>        - nxp,pcf8575
>  
>    reg:

-- 
Regards,

Laurent Pinchart

