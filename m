Return-Path: <linux-gpio+bounces-25850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07027B50ADA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 04:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFCAE1C63116
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 02:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2658D23815D;
	Wed, 10 Sep 2025 02:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGQRiSC6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A0238C3B;
	Wed, 10 Sep 2025 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470218; cv=none; b=fvQZNEKmenRETIhuVqHA+XGjOK7wJz247x1xDciqjGV5sv41YR8bbJXjHkn81aDa/3nEX0QMjHaWledLFMr4SP4pufmPGl1xs4bzRgLkW3FnaLlmXG5aVLSLvI3U/PY+4mpZu6JnpIH0N7U4JGuCvDGNzEsqDsRqH3ydtKPIA7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470218; c=relaxed/simple;
	bh=/NMz5XCTrhQRZtCAewkKfQnSTyNwhw8EMFsxenzy7vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hjl2RhIT+bnUrCgv3YiO/SeW8wFhfY1BKlErRyuWwWzeXeQ9kwxTrH7WcGba8B+gg0GA0gMTl6PhSNXxxEXkftwo7806Cn8TLQNSgF8uwU1pcNYAuhpD2Rxk71RrFBAeG8zw8Fj/UAkqs5BKHJOuW/smRsPt1R7w/2W24jBKmFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGQRiSC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB0DC4CEF8;
	Wed, 10 Sep 2025 02:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757470216;
	bh=/NMz5XCTrhQRZtCAewkKfQnSTyNwhw8EMFsxenzy7vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGQRiSC6AM+KaTvn8KrTJ3VH1tnQsN6wTWZGjGeB/WWsq3ERmw6Pv1i3Rcy2GzWur
	 ZbUTRPHXmkm03tv3xpfu8kx6ZFO3R1GFIlFo7zBFf5MPgPP/VEkdB9n4KgqnJeLuVI
	 cYDLG0Ug6Qvlhbmur/RYnCa7GoQRg/GsWFUp1OWL+45O793A7NV2fnGaUU0mUqyUcJ
	 9McAK6Q33tliEqVCxqn+Ddvpl7srf6oGXYrZZDc6pwZwMXMbGrIPAK6C1WsCLZ31RP
	 BheSW+JiS1Pl0ygcnvXntu+5P3uqjKFwBCvBplTsfQQ6b4YNx0FjcyZamw53z9EEVY
	 1h5O2/SX+iOlQ==
Date: Tue, 9 Sep 2025 21:10:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 8/9] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
Message-ID: <175747021462.3634607.17013207905541885888.robh@kernel.org>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
 <20250905135547.934729-9-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905135547.934729-9-antonio.borneo@foss.st.com>


On Fri, 05 Sep 2025 15:55:46 +0200, Antonio Borneo wrote:
> Document the support of the I/O synchronization parameters:
> - skew-delay;
> - skew-delay-direction;
> - st,io-sync.
> 
> Require 'skew-delay-direction' when 'skew-delay' is non zero.
> Allow the new properties only with compatibles that support them.
> Add an example that uses all the new properties.
> 
> Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


