Return-Path: <linux-gpio+bounces-20409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF43ABEF56
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DEDA1BC06B6
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C633723815B;
	Wed, 21 May 2025 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDC5FeBY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A92135893;
	Wed, 21 May 2025 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818982; cv=none; b=fs9fgJus8+TaDN+mtOj3Cxbq1GH6NNsKt0j/URZ933xD2IokJlq2Grw8qyWA4hYxs+ufRuHuylJoafAnfyIdcUtVizL8gPJObrWOp68FSNN6He3LwRlMUKwaOC+xcJk0cWjSe6JMrFNrtSTD7vDtaeScmCvFixkC30rqEN+5hT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818982; c=relaxed/simple;
	bh=YdZDRVKPRJnM6bMhkKAe136v5iLTjMpExrfXyqbjbXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDLMT6BxOWcMpXrWc7yMMD+MqMYqmZbZCKVOw9bYsTP/dFcZyGeV7QXlRco99wnfYnxEVFyyEocSeA7XqcFSL+D4LSmu/KyCEUb2KJWZY/lkNQyZwg9M7hEJYgXnbU6lEmaP6WvISj0kkKWhNE4sB2D4w6b/faLRyNHOLffKnuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDC5FeBY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F6FC4CEE4;
	Wed, 21 May 2025 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818982;
	bh=YdZDRVKPRJnM6bMhkKAe136v5iLTjMpExrfXyqbjbXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDC5FeBYzkfOTxctuEWJFzsysW85GdkXbucVPeAeFcT3r86V+qIe1Ey+ddKED3/2X
	 Pnj5fU78RgQifFoSa4aR0LcB/aLF6vstearUjI3Es7B8WG40PFOD/10z5GgGpXEFVl
	 BqqJnjgYX8YKNCzkG3SG8sV6mS9Zq5p2Uq23ThRJFlu9CQPl4hLavfafa2qwzA7kvM
	 3xhhaYkAZF1rNYXgUoKmXO0yHZnQV/9nrFcg9rzO0msicWQyuOObv14/sk+64sZ5Mo
	 KM0lu6ayEy2W1AOE3hYrZKUO7TRFpXZMsYF/ZvD4DjowKHvacKXS7ftCTiE45Qvmml
	 6L+CvnDxtOL6w==
Date: Wed, 21 May 2025 11:16:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S6
Message-ID: <20250521-foamy-strict-tuna-3ffad7@kuoka>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
 <20250521-s6-s7-pinctrl-v2-3-0ce5e3728404@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521-s6-s7-pinctrl-v2-3-0ce5e3728404@amlogic.com>

On Wed, May 21, 2025 at 11:19:57AM GMT, Xianwei Zhao wrote:
> Update dt-binding document for pinctrl of Amlogic S6 SoC.


Just squash it. Three one-liners is pretty close to a churn.

Best regards,
Krzysztof


