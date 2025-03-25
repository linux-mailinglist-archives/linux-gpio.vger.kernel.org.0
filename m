Return-Path: <linux-gpio+bounces-17963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC82A70306
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 15:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 452CA3B6B50
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 13:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5A12580FF;
	Tue, 25 Mar 2025 13:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTPcYtDi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517842580C3;
	Tue, 25 Mar 2025 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910875; cv=none; b=qKAO+ByQzwycGt8AZ1IsiKT6gdRrofsmBdFXu/uo6YhTx2CpxP2SGNNpEr++5PYVkRp2zfipTD3hzOW7jFNhuqLKpziQNCgc6dtcH4ClpVWU2M1Ehmr9TiigiDcnZC0E8o3qKn2nJpSQGL2pyM2e9ZVbhW39Zen3rSNy2qIvCJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910875; c=relaxed/simple;
	bh=xoMvBcSgjUKFJ3Qcp/yF9ZqQZG2wG/vYLbflix1L8ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5H8JOGvTP6CGsiKnOKmqN5dlHrekdspJU2QmHL+qUDMQyHpT2xtLu3UPdonaG2dzAKRt2g2TZnm1sM/LlQQwQmaHR1M9A6PN6Poi7HBJDkV2LUjbMvlsTG1CZbEI1zU34zeWdIacJW48JNz/Of48jcLQG72k9X/W/y0dGeTF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTPcYtDi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F7EC4CEE4;
	Tue, 25 Mar 2025 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742910872;
	bh=xoMvBcSgjUKFJ3Qcp/yF9ZqQZG2wG/vYLbflix1L8ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTPcYtDivYGAgRq2hP7eACqfpz8ybDg3Up4mlgwwiPp7O9yaH38CtWOksHF59OjmP
	 DVqE1Cw5tKeR3uMSDBpYAancvcwn+02EM2UL/Zb1jpCMfjbIF7G4rF2Bk2Hm7uyBqX
	 22626H5bSRmFRQzDLkALzHIpoZVVPXAHjvIhAIpBQhABA6TSggPR4NDuRSRFg727L5
	 yqAaCx5TfWRNy2VuqM0gKuSzK+6e8d1jNJu3qnYIgKn/8ZUEC2JAHZd1tiufwJcAHd
	 3AGlLUrSPm0xYj/k/N+gmCXJnGY8W612f4jvrQWxbm5knYS6Jbr9QriocBOqIyvk65
	 82T6yoolTVkzA==
Date: Tue, 25 Mar 2025 08:54:31 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>,
	kernel-team@android.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/6] dt-bindings: nvmem: add max77759 binding
Message-ID: <20250325135431.GA1819862-robh@kernel.org>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
 <20250325-max77759-mfd-v6-2-c0870ca662ba@linaro.org>
 <174290730682.1654974.16103236890365619009.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174290730682.1654974.16103236890365619009.robh@kernel.org>

On Tue, Mar 25, 2025 at 07:55:09AM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 25 Mar 2025 08:27:03 +0000, André Draszik wrote:
> > The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > Port Controller (TCPC), NVMEM, and a GPIO expander.
> > 
> > This describes its storage module (NVMEM).
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > ---
> > v2:
> > * drop example as the MFD binding has a complete one (Rob)
> > 
> > Note: MAINTAINERS doesn't need updating, the binding update for the
> > first leaf device (gpio) adds a wildcard matching all max77759 bindings
> > ---
> >  .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 32 ++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml: Documentation/devicetree/bindings/mfd/maxim,max77759.yaml

This can be disregarded.

