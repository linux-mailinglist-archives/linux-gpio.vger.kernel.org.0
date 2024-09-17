Return-Path: <linux-gpio+bounces-10230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81E97B424
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 20:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5690287549
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 18:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F5E183CB7;
	Tue, 17 Sep 2024 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odhQpa8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA24409;
	Tue, 17 Sep 2024 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726597901; cv=none; b=oH+A9eNMY7+0J+bRkdSOcvAhZ7OJLy960TtBlqsb+oprq23hFnAtDxT6vhtThADJ+qgLvkLXpIVjUUYvsFq/ESAZrphTUap0tdKlb4yeH0dJ71VTRnIwfjiDb1QHfNSnAjzLE0h/IFeROeptZnbXnOGpCNMkoA8mekG2I0uHoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726597901; c=relaxed/simple;
	bh=ZAEq494/sqZBPlCB/otHcchttqR1q7YJ76nsR57lccA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Qr3e1f7nh2PckVHVxvrtNcAfftDFMs+QlppNgipZAwr/3fCtEIDv6cyi/Df9SH1bX1KEfi4nY5DxYmZ1t01CvAycqw8TAcP0lCCSu8f26z/6dtb6c8i+JRuVUUHSGB+KbgmrNO1+Jkz2lrWaJw/Te76rjbaaWaEJ0hjU+w9F9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odhQpa8e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03293C4CEC5;
	Tue, 17 Sep 2024 18:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726597901;
	bh=ZAEq494/sqZBPlCB/otHcchttqR1q7YJ76nsR57lccA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=odhQpa8enI+U01sKCdvyE3tAWUdBQLUSmjtYJa71dQvV5X+vRV1EfDRcoisLs0ZiS
	 x2yM4e/+hvpKWGpzWNY73dMkzV3adv6bjPI8d/hgigKvPbPMK2GLBhqoJtMpjMdsmT
	 09A/zmErGTUXDRvj+1AwjgMyZhP/mNWzBAEUaPlS21lxR9Mt9tej14Mga4HU9/+I8Z
	 keugS7sCqZwzoVsxhN2VMfacjsh4MOmbUp3FopSCgqZ+eaCiXDxH7w7x0I0mUfKUQT
	 NpIYdMYxwFExB+e4u64vDeuKhVIQsTB6an2qf9fwRD3yiBfGD6phXBb8U3xVqtEsTf
	 UaEMKBvKfL4eA==
Date: Tue, 17 Sep 2024 13:31:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Chris Paterson <Chris.Paterson2@renesas.com>
In-Reply-To: <20240917173249.158920-2-fabrizio.castro.jz@renesas.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
 <20240917173249.158920-2-fabrizio.castro.jz@renesas.com>
Message-Id: <172659789985.3765128.16547421763148970852.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: renesas: rzg2l-pinctrl: Add
 interrupt-parent


On Tue, 17 Sep 2024 18:32:44 +0100, Fabrizio Castro wrote:
> All the platforms from the renesas,rzg2l-pinctrl.yaml binding
> actually require the interrupt-parent property. Add it.
> 
> Fixes: 35c37efd1273 ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the properties to handle GPIO IRQ")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dtb: pinctrl@11030000: 'interrupt-parent' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240917173249.158920-2-fabrizio.castro.jz@renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


