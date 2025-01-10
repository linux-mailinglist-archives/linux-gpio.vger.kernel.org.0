Return-Path: <linux-gpio+bounces-14672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E8A09610
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 16:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5173A9C56
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 15:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D74F2116F2;
	Fri, 10 Jan 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csOH5GaB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A92066E5;
	Fri, 10 Jan 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523666; cv=none; b=tSu0MoV3Cuks3rJCjFA8y+hpq+wviBxmXs2Uyo78GArKhdrJzwtIHAX94SiUUIJoiShnAvc5qy/2kkVkCIY/xIfWGIN1y81pahNJHAddtsqX2xd3cloF+lPudOLxGAlN7kP50U826JkZdsEi+hQWG5jGy0QVVhjKdavd52IMBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523666; c=relaxed/simple;
	bh=Fz1hdRpMSaNxgYitNuIdWW/Q+HmiuFoLhZClbSqU+5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxP0Fjf/FO//7fGC/scTQq2lqNKm1OcSki7hALlPuPW3ZS+KKyNCQQ0xN4MQ9VLSEDSSiTZH152lp+/0yUnY25T3guImMdn9fKbBuYTxKSahnAf98r9S2BfkIPuGl9IqbDlhwSs70RaDDkFim6dereh20gg1K/p82B9Yg9zVtvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csOH5GaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB2CC4CED6;
	Fri, 10 Jan 2025 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523665;
	bh=Fz1hdRpMSaNxgYitNuIdWW/Q+HmiuFoLhZClbSqU+5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csOH5GaBLGUkXLKqbMmlyMLCK4kS4AsqClm5SXDSSpcYTDUl+H+BW3QLqllLG1+9v
	 OLo1qD2zhk7rZajbRe2JsURbMwozC+vTIE1OAhub5uB1RjgVhNLdFmLwCF4vDVV8nw
	 bkr4IxHePQQuHodzG20XM+hzgTXfy4FUka3w+4tGvP/o91CQkEaZhWfREz/G/bB+Vi
	 fyZ3XaXFIPo5CXaJLHor9MiEanT2tz4OBSpK2t5YrIGP9bbCHrRkoDkg6qmhAqAU+q
	 +KotOiCSZWSvh8wKgkTcTLwff4zmlyOXEtikAZH04E6jMpe2sOWBRPVx3QWZeyXQIn
	 ptpCQRdVEI7Mw==
Date: Fri, 10 Jan 2025 09:41:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	devicetree@vger.kernel.org,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, TY Chang <tychang@realtek.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: Correct indentation and style in
 DTS example
Message-ID: <173652366373.2919481.16688678408505042633.robh@kernel.org>
References: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>


On Tue, 07 Jan 2025 13:58:34 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 64 +++++++++----------
>  .../pinctrl/realtek,rtd1315e-pinctrl.yaml     | 50 +++++++--------
>  .../pinctrl/realtek,rtd1319d-pinctrl.yaml     | 50 +++++++--------
>  .../pinctrl/realtek,rtd1619b-pinctrl.yaml     | 50 +++++++--------
>  .../bindings/pinctrl/xlnx,pinctrl-zynq.yaml   | 53 +++++++--------
>  5 files changed, 130 insertions(+), 137 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


