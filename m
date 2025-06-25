Return-Path: <linux-gpio+bounces-22221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9DAE8DFE
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 21:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A9217B092C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 19:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2CF2DFA4F;
	Wed, 25 Jun 2025 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qjs7O3FQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C52DA752;
	Wed, 25 Jun 2025 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878254; cv=none; b=BIyNh4oZIMJ6gzKoZFdQrIfq5+2P1VFMMotavwgL8WW7IsolQ4mVDZkeZHIkHU7b6oSaujM8Oy5fCXdSPms0qEzJQbxciZGeIGkFoq+nFM1zjRFCyfMys7thHsmMqFjgE1OxL19T76J/tnq63WXg7l8B3Uv2M5fj/GasR9KDjHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878254; c=relaxed/simple;
	bh=LUWB9Eb61V9HjLpTF0w5obOuUqX387nmjakU4den64w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bi+R74CWArKPtCwkjDogqnmLGqHZMTXoxSHnJDAprKPMxSLIJP8MK5CRhGLyk2maYuSaTsErNlUvbHflY+sMYOFi4gwZ6yidZa9BuAkGGgOa6jMivdXf6khDmYtYTK7rL70hePhph0R+MFXHmIFJJipmvl1lC/UhY9h2h6OK+x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qjs7O3FQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9053BC4CEF0;
	Wed, 25 Jun 2025 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750878253;
	bh=LUWB9Eb61V9HjLpTF0w5obOuUqX387nmjakU4den64w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qjs7O3FQiRGsi2y6To/++keHWR78/5TFsK6SYKyHHMYYxEJEeffMoT5pc4yiJU13a
	 vKebR8SzlbO0utXZFDZOCOUf+GySf6+SD8dfYl5B+v7IWN9OpxfOTERw0cxn9u2uGf
	 61wOjYwH11OYCjDBCn0oZYuVzSIAhD0HesvYW5aXA0n50iGpNzZyHUb/+GE9SxOtMI
	 IT+xxR5x8hW9fRnQwp4pon/eayH+OLvliC9G58jFc/HSCUoMnmr6PMfqzrRMUnZWWA
	 gbVPgWbfedsNIk2huEGJelVlaTl4TN49g99afx8x1UsLFenGj5SFN8Ptnk4EtKy+aT
	 /xSa8d54PG1EQ==
Date: Wed, 25 Jun 2025 14:04:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: devicetree@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel-team@android.com,
	linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	linux-samsung-soc@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Message-ID: <175087825207.2044005.6909193130559642909.robh@kernel.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
 <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>


On Fri, 06 Jun 2025 16:02:57 +0100, André Draszik wrote:
> Using lowercase for the buck and ldo nodenames is preferred, as
> evidenced e.g. in [1].
> 
> Convert the example here to lowercase before we add any bindings
> describing the s2mpg1x regulators that will enforce the spelling.
> 
> Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


