Return-Path: <linux-gpio+bounces-12566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C329BCDF2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 14:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD1CB282808
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 13:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D701D8DE0;
	Tue,  5 Nov 2024 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCf9YKwZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CD81D6DBB;
	Tue,  5 Nov 2024 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813683; cv=none; b=TDhmp66GozDxu2u/FoW92b8ru+KHhqLdefSd2HSf05aTPejvp3n3egbuoao7oUYclirX2UCJQlfKOBePcpoLE8e5+LKn/sRRcuY9FJIlrUqe4ENplv8YdCNTGPQ+I9FQep59aW9M+I3TJpTVvzHWrPzEGNW9mgRKZGv18ERqbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813683; c=relaxed/simple;
	bh=f+dltnIbONF+ddlfH/eH4Kjbf7iN7W4LgqnVSQXYzsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvXDjrcG+zwsnTH6MH0/pDSCXdNs8nuYs42YLLYOiwR7pd99N1QIyyDf4xDw5DUb2WZl2Z0UHXj8ncgLRTzkGgysnHxlaNEo+A55/hu2iQYGnXHh0JDOrsREQs6GtTIlUELyF+fWgisG779NZY1vaXuFEDIA8K4RixrAp///Vk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCf9YKwZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D377C4CED3;
	Tue,  5 Nov 2024 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730813683;
	bh=f+dltnIbONF+ddlfH/eH4Kjbf7iN7W4LgqnVSQXYzsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCf9YKwZ3dWnonKa8ESMw8CHnRDs3pxRMAjKtIPiqn77AslCYcwJmM00f3GVr8AVj
	 D9csyB6lKmZRf5dE0m1YAN++ESgyUvF1Zvf6fjyDAKyifYM0ixsGLOHyFtmxiS0080
	 eiPqYQ4Rw5bvRhI6z/nP231kDs6eB36gDJADZZPHBhNJ8hXoyMHCJUjAs4wO/g0N7n
	 3n7dGzwUg7i7YUOoXlmrbTXpYWI75JU6fxL9ZRvQy3SLSIxWFyRoAdpT44jz4qTcYu
	 Ez8FCFNJT9Hfb3696Z9zXYEuX64LU/5shOuCxMDd1SApKgjPuDQcnkFS++E5jYbAOE
	 I2r3RQIh1W3mg==
Date: Tue, 5 Nov 2024 07:34:41 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 1/4] dt-bindings: pinctrl: Add support for Amlogic
 A4 SoCs
Message-ID: <173081368066.3086220.14112409084743616798.robh@kernel.org>
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
 <20241101-a4_pinctrl-v4-1-efd98edc3ad4@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101-a4_pinctrl-v4-1-efd98edc3ad4@amlogic.com>


On Fri, 01 Nov 2024 16:27:17 +0800, Xianwei Zhao wrote:
> Add the new compatible name for Amlogic A4 pin controller, and add
> a new dt-binding header file which document the GPIO bank names of
> all Amlogic subsequent SoCs.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
>  include/dt-bindings/gpio/amlogic-gpio.h            | 50 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


