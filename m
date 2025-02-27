Return-Path: <linux-gpio+bounces-16707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E9FA47E43
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF563A348E
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA75D22DF8E;
	Thu, 27 Feb 2025 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmnW+UKX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420922C322;
	Thu, 27 Feb 2025 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740660706; cv=none; b=b4xfWxef+YU69z6RJ7moQUaBP7U5LVHcsbrGinBtp+5Jv1YCF2v7dSK4UBhiCE/G5GDuVnkQri9L4xon0ID9uqJkoWCTvy2yxJVFqZe/BvzvkdWDoeCOCMTPiraE39ZTbG7r3K24uMWcCPsV8TypKNEHlHVOt0tIUxv7I+Pr/jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740660706; c=relaxed/simple;
	bh=qaS3Sot0jP2/TYM8y64qZBKAz9Pu1JxQ1gDYVWPX2+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uB99xMKbwTDhjMY1dWdDoym0OWQyghnqfdYUrFIBmmcHptqAtI3kb+qn324U3/OrqcnyZHqC7Q7zqiRfpChfB86ELBlXshkH4VHTF81p6BNytv7wYOjWcTjpCBglVaTcUFZBWxOV40+Xso5tTpQRHOJzWOpMrQcUYV4282ozdww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmnW+UKX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DA8C4CEDD;
	Thu, 27 Feb 2025 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740660706;
	bh=qaS3Sot0jP2/TYM8y64qZBKAz9Pu1JxQ1gDYVWPX2+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmnW+UKXFZonSZhPI64oufkWiFCNHjWMwGh8iwW+Z7kKZiW7leSaxQrNk64r3iUnZ
	 ERLrbcpYL17EzzshKEChATN3WgleKpcCbYXWNQCY0PcseWSzMCyUwy/taP5XeKo3OL
	 xRE40CK9dLjV0ss4IjCGBDchiSIalN3t3Xh6Vx6ZYi98a3lYl27rNDRRkzPoUgrWQH
	 5cFs56A3dsUrgtg06NInTp4hxtBC9CLX7wjdd6WO9jldZsn7m9a2ZJmN+ZPu97mwA/
	 0DR/0hiyQd15Il6NP8MSltPKG3FdaQ795q4aUzrwl0lfFBV+vOuKbEXv5m0jB9c/BS
	 cVOxwHyE31KLA==
Date: Thu, 27 Feb 2025 06:51:43 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	devicetree@vger.kernel.org, Kees Cook <kees@kernel.org>,
	linux-gpio@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Conor Dooley <conor+dt@kernel.org>, kernel-team@android.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: gpio: add max77759 binding
Message-ID: <20250227125143.GA1672649-robh@kernel.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
 <20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org>
 <174060184807.3654907.17826939583833772128.robh@kernel.org>
 <f3db83179b405ca056fd55abdd6c38adaedbaea0.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3db83179b405ca056fd55abdd6c38adaedbaea0.camel@linaro.org>

On Thu, Feb 27, 2025 at 11:19:55AM +0000, André Draszik wrote:
> On Wed, 2025-02-26 at 14:30 -0600, Rob Herring (Arm) wrote:
> > 
> > On Wed, 26 Feb 2025 17:51:20 +0000, André Draszik wrote:
> > > The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> > > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > > Port Controller (TCPC), NVMEM, and a GPIO expander.
> > > 
> > > This describes its GPIO module.
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > > 
> > > ---
> > > v2:
> > > * drop 'interrupts' property and sort properties alphabetically
> > > ---
> > >  .../bindings/gpio/maxim,max77759-gpio.yaml         | 44 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  6 +++
> > >  2 files changed, 50 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > 
> > 
> > doc reference errors (make refcheckdocs):
> > Warning: Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml references a file that doesn't exist:
> > Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> > Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml: Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> 
> 'make dt_binding_check' doesn't invoke 'make refcheckdocs', unless
> I'm doing something wrong - and therefore 'make dt_binding_check'
> doesn't print any warning, contrary to what seems to be implied by
> the paragraph above, If I run 'make refcheckdocs', I do get the
> error, too, sure enough.
> 
> I've never come across refcheckdocs, and it wasn't on my radar.

Or anyone elses until Mauro started sending out 10s of fixes every 
cycle for it. I think he got tired of that thankless job.

> 
> The error is because the binding's 'description:' references the
> mfd binding using the complete path and the mfd binding is added
> in a later patch only in this version of the series:
> 
>   > ... For additional information, see
>   > Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
> 
> the error goes away if a relative path is used instead:
> 
>   > ... For additional information, see
>   > ../mfd/maxim,max77759.yaml.

No, just ignore the error. I believe it gets fixed with the mfd binding 
applied. I'm not too concerned if refcheckdocs is bisectable.

Rob

