Return-Path: <linux-gpio+bounces-10973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F612993263
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A7BA1C238FD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9071D9673;
	Mon,  7 Oct 2024 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgDlgFVt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925C1E520;
	Mon,  7 Oct 2024 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728316944; cv=none; b=l7RmWXhqaB7HH0E0zAkkhljyOweLazDpzvnD34rGM5O1ltI/x1vEt6hkfYYSvMXt4iFDCmjjaTUIuZWjhgQwl/83AvLVYJaIWQyIRNrxRHiKg/RqrnSJY7g9OZDYpzhmjw0wcSzy7NWGA7tWELftdE6i/rEx2wmU05E8U+lz3sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728316944; c=relaxed/simple;
	bh=806jNc2mizzwBfHn3ArzLEx2D5C2yoYYUNpl5mYv32c=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=qJoy1awPGdzk2McrF0bYC+j0TH5v9DkZuSxTUeBEEVCjl7abxx3QK+7I4l4KYQBCRHUVKlvpbLi3O3deGOZKpFzHMplqUjkFZ67x6gxW5mIky2vyYhXPnBCanxd7SwFSUoaduXyPGEjTyC50eJw5hR56ZS4uL8iy3pUEAJ6CYK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgDlgFVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA85C4CEC6;
	Mon,  7 Oct 2024 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728316944;
	bh=806jNc2mizzwBfHn3ArzLEx2D5C2yoYYUNpl5mYv32c=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YgDlgFVtTQHHg6zNLABaPqJoFAFjy5vCsh4MroD1s28BtDc62nqXeVFEzeEvNolqK
	 x47/P9+MQZAtq5TTiGXWO91a7+8raFCETtLc35MAHaVqNHVpS0ReKIbCupN8260g2Y
	 YRDk0g3ZERDesTgSVZBfHs6hf1YY0RsiE750sfEcuYmEu8NSCzpW/6xIklp5tNJ1d1
	 I+DS+syfrQjJHBbai+3QkR4/QdQgPNs1zYeQpivqIHqQj8ZHmDsq8BZxEdTEuMRANf
	 8x6d26ytwi1FjPCelYvxWCiZ1uxCGJ959JVEXF057/T3US6YwkCeBwHrgR8HjRvVPl
	 2B8EXGt39SVWA==
Date: Mon, 07 Oct 2024 11:02:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 linux-gpio@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org>
Message-Id: <172831694232.937294.6889037408108312834.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl:
 amlogic,meson8-pinctrl-aobus: add reg for aobus pinctrl nodes


On Mon, 07 Oct 2024 16:16:25 +0200, Neil Armstrong wrote:
> While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
> reg property for Meson8/b aobus pinctrl node was ommited, fix this to finally
> pass all bindings checks.
> 
> Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.example.dtb: pinctrl: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


