Return-Path: <linux-gpio+bounces-23120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DFAB014CB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 09:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27B977AC17D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 07:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7911EFF8B;
	Fri, 11 Jul 2025 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDiyKLTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5D1EE7A1;
	Fri, 11 Jul 2025 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219404; cv=none; b=A4LFswNRR5dkEH0GDUgZoVTZygSMZA14iM3+OKa8KRMy6D0R9bhgZJ8KXqyzDY1IWFFaUZp3btttyhAPNLiquP9vbcopMs8OvL3F+Dp3bOwWkfv8+J0BQPYVav6677XxmtmLExjkftzOHjnYl6i/m2wh1U9kA6gAEvMFL1fOnQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219404; c=relaxed/simple;
	bh=a0wdQROj3hyxjpHmI3TPp1B/1v9dnKkpod7Q3zxg27o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ou7dClAW4i9Etu2VgHSC9yQFojiHxF+gUrjk9t7xwG/H1PCZakEJn0wlOz4U1hL4/1qP05Rfg/DiVT+ycojZ1cXrxVdiHEh/FP1mYTCbb4DhvEKDWj+3QyMsVjUGApTCaPy2cqIo6evkDqdY4kPyVFT4Z6mNdOhkqMj255Z9Tqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDiyKLTj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A59FC4CEED;
	Fri, 11 Jul 2025 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219404;
	bh=a0wdQROj3hyxjpHmI3TPp1B/1v9dnKkpod7Q3zxg27o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDiyKLTj2+sXbOPoA09zNCj+YoGUJjOjlVrtsiy2CXqLzoOX57nGU7EqPOQre5vS5
	 SA9h4C+3e0Itmc0CPM/zi7oX76RjAbolfE8D1d8V6CHKfAbiXJnudy5TmDfu2QMuNP
	 y5L9Ese8GdUsfdKg9WekbMeczMdcyvsPUBBsN9boSbSzQovZVqAsCBRiWoINqgINJ7
	 vYFi2Pexu7Sl1acSNEPKZiYH/RUIQjzmcNmIxTcnDXIiZM28G/+QHuqjpiEmKSpvqR
	 QzR9ipvKvQR7nUJh2Sq2wINeUPQO3Y0XtsJGgt20qywberxIUO1y6y8sXM93YskG9H
	 2d+YQDEjcDTZg==
Date: Fri, 11 Jul 2025 09:36:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com, mbrugger@suse.com, 
	Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev, 
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <20250711-fluorescent-malamute-of-glory-b1c585@krzk-bin>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>

On Thu, Jul 10, 2025 at 05:20:24PM +0300, Andrei Stefanescu wrote:
> Add the dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


