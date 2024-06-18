Return-Path: <linux-gpio+bounces-7558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBF390DBA3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 20:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 508E0B21F20
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 18:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE7415E5D6;
	Tue, 18 Jun 2024 18:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFjTk/1F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8C2139C6;
	Tue, 18 Jun 2024 18:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718735666; cv=none; b=LkK35FYTPv1QKdiesYh2MvcJ5kPUn/DvvI2lJacNjIBAfrI9yw8xr6DmC1024qaaN7iQhdU82wMwFy0jxww6XT+E9s8pTDSHYAtvQdCB4p6kSpSzVlFVUZiLb+19igW+nQUPUyMb4cKVYkKMpS9J0x5trAwW55ixXPk73PywMaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718735666; c=relaxed/simple;
	bh=/EH5ArnIxXTldmVKp85gUMBSXDolS923UymFh5hxdhU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Pb5NstSlZuL+rr4GQk91yIDCeOuWzwnJkTLIy1pvlFyFx0WzX5r5CjcTb/O6LsjkuAVQiTMoSpWfo+rz5btcCoQsymGA57eqvZP5BEqcgk4SVT19KvbTAlxmAYVi4vQNSWvTVeVNJpZS39t0SUAoyfahxH+XMQg7BIFGE4vA5cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFjTk/1F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7003EC3277B;
	Tue, 18 Jun 2024 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718735665;
	bh=/EH5ArnIxXTldmVKp85gUMBSXDolS923UymFh5hxdhU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZFjTk/1F4gbum5LBCqzQ1QbrfVJ83DPkE+2hCqYLIy2JHZO1pQl0GzMB4oU6OgOX0
	 yPFduL7Cdj2fI72uf48ShzVYeg28GWwfM62YJmBM/j5eWq1D4gg4KPJvqMQjhU1XZE
	 HKOMX0v5mJo0qYr/83ioJd3uYDap7CpiVrnLw54HN/19QvwMYaUtMJYCJ+IJASS3J0
	 GKlWWfB1K4VBoPaKTKv1hjOO88Abuz3pRMU4fnXABAlczQnKfxuMyaSiO0WOh0NyBo
	 gDasgLtpw0wUMJp0MZ73gHsiJz58yEGrsF30k/QVh97QeSUPTjrKXoL/OI7SVdKFcH
	 KHAuDAEHRLQKw==
Date: Tue, 18 Jun 2024 12:34:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>
In-Reply-To: <20240618165102.2380159-1-nm@ti.com>
References: <20240618165102.2380159-1-nm@ti.com>
Message-Id: <171873566448.3500109.16734660300499772836.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-single: Define a max
 count for "pinctrl-single,gpio-range"


On Tue, 18 Jun 2024 11:51:02 -0500, Nishanth Menon wrote:
> "pinctrl-single,gpio-range" allows us to define a dis-contiguous
> range of pinctrl registers that can have different mux settings for
> GPIO mode of operation. However, the maxItems seem to be set to 1 in
> processed schema for some reason. This is incorrect. For example:
> arch/arm64/boot/dts/hisilicon/hi6220.dtsi and others have more than
> one dis-contiguous range.
> 
> Arbitrarily define a max 100 count to override the defaults.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> I am not sure if I should call this RFC or not.. and if this is even the
> right solution.. I am on 2024.05 dt-schema for this check.
> 
> I noticed this when adding gpio-ranges for am62p platform:
> https://gist.github.com/nmenon/7019cd2f24be47997640df5db60a7544
> 
> It is possible that this is a bug in dt-schema, but I have'nt been able
> to track it down either.
> 
> behavior seen is the following:
> pinctrl-single,gpio-range = <&mcu_pmx_range 0 21 7>;
> generates no warning
> However,
> pinctrl-single,gpio-range = <&mcu_pmx_range 0 21 7>, <&mcu_pmx_range 32 2 7>;
> 
> generates "is too long" warning.
> 
> 
>  Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: properties:pinctrl-single,gpio-range: {'description': 'Optional list of pin base, nr pins & gpio function', '$ref': '/schemas/types.yaml#/definitions/phandle-array', 'maxItems': 100, 'items': [{'items': [{'description': 'phandle of a gpio-range node'}, {'description': 'pin base'}, {'description': 'number of pins'}, {'description': 'gpio function'}]}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240618165102.2380159-1-nm@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


