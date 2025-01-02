Return-Path: <linux-gpio+bounces-14436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AB9FFE87
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F0D3A03A5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6421B4143;
	Thu,  2 Jan 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVgeQX0V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E8B1B423C;
	Thu,  2 Jan 2025 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842783; cv=none; b=g+9XFFyiXjKqflKBRwc3FgNVVSGXLcDKwp1iWV1la7ZkW5NlnJVWYME3JWa61AkdaD54kaUO1kmUL/27LwBc4QjZug4C2cwAn9fCe221QIRrAWZRJKUIVyahyPTDl7m4GnTEr5nLpBwSAfMM/ydnfVOlihvWd3IhVwN7wprhChs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842783; c=relaxed/simple;
	bh=UjEECV2OYSxcOpzZEVTi6fE/Ry2EC9P3VeBTY9KETxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6VsrOwB2O+8Gn4//0Igj96ZWUigfTJt2+AFvKC6Y0hUJ3iQI5VRxLBMvlEdoJ0N6DP6B2TJPcGl9AiyW4oqOkY6TyXlOwFHdYi8cAhflqCUUUq5MtTrpWFbr3490OITbu2hmByIxvtQgji2Wfdn8O5Crq86Rw4OYeK14gsCWZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVgeQX0V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA51C4CED0;
	Thu,  2 Jan 2025 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842782;
	bh=UjEECV2OYSxcOpzZEVTi6fE/Ry2EC9P3VeBTY9KETxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVgeQX0VWK/gf5RCiSZI5tmeDbVBKw3kNXsXmg+qJtsaVC+Ti/8v+fkkz/1Mzzrov
	 Dtulglya7gKLsv9xJHaIBQgU6K2LdgQMS7UlhJPOz/xRaCjdemuejMKjrGvsBItBFv
	 nE3ygjWS8415cRksqfxyMOcLloBC5IrSsX+mHehTTnsGSfdoYdL89DqvBWdxpNuj+X
	 hW823+Ifuum8IGoxVAcvqTlmypW9s1ru/Vf51+lKZNM1qAYhzsvItaolOu7LEUw13g
	 Du8rbq/OLTuUgodPE/G5il8mf8QKQmlGgJVTtbUiKq/gDJ4V7mEe6u2UhajhowfUUL
	 moZuLjMj9+kJw==
Date: Thu, 2 Jan 2025 12:33:00 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: fairchild,74hc595: Add On Semi
 MC74HC595A compat
Message-ID: <20250102183300.GA236291-robh@kernel.org>
References: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
 <20241224-gpio74-v2-1-bbcf14183191@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241224-gpio74-v2-1-bbcf14183191@posteo.net>

On Tue, Dec 24, 2024 at 09:02:10AM +0100, J. Neuschäfer wrote:
> The On Semi MC74HC595A/MC74HCT595A is another part that is compatible with
> the Fairchild MM74HC595. This patch adds it to the DT binding.

To make the binding match what you say here, what you really should have 
is:

compatible = "onnn,74hc595a", "fairchild,74hc595";

And then no driver change is needed (until you have some difference you 
want to handle).

> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> v2:
> - Add Linus Walleij's R-b
> ---
>  Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> index e8bc9f018edb1253d700945f006e19598efb299a..629cf9b2ab8e4a63fbe17f56792a46d2066d40c3 100644
> --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - fairchild,74hc595
>        - nxp,74lvc594
> +      - onnn,74hc595a
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.45.2
> 

