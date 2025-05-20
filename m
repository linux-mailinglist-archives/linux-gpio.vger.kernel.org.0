Return-Path: <linux-gpio+bounces-20360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE278ABE39E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31A0D4A6AFF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 19:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B23926C390;
	Tue, 20 May 2025 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pm03hirf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CBD48CFC;
	Tue, 20 May 2025 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769105; cv=none; b=g0aYWdXlo6nfQoCz4VQf5mqkp71lDVEoUmQ97cgHRo5/lHDIT795IfrBB1Dd7TLd6Yitr75mR+xAgDt02VoJC1ej5Bc8f+EejsEvUn6xcj2g1tNkg9FGotbPPrkCoYWCDrQMmcNkMoDfA2ozoAdiZf9ElBF0zZP9LX6hxbV2eKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769105; c=relaxed/simple;
	bh=/YQuD/zXoYuchGtOXAaMXzL86e5ZTR1Z9Yg6aUdHmaE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TI0LkBWs6eWS0S/GEDNueTtvRp9rgrsLyzK1TUORureeO4311swlhU7OBUt47mXqUL9mgi8nbTNuX6WaOa+0GwFqFaKXmKMmVZPIcNdsAn8Ss/hDXUEKPtYgfcQxCszU/RX7fbJcpbxSoMdtU56ljyhzgSoDsMSpf1gUnN/WYg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pm03hirf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCD4C4CEE9;
	Tue, 20 May 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747769105;
	bh=/YQuD/zXoYuchGtOXAaMXzL86e5ZTR1Z9Yg6aUdHmaE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Pm03hirfXqvWbK011PvyDZTeKD4xh9DP40C0ABh/Ysw6K4+tq4abcOoIoCf0F1gGc
	 82Fb5HnxBy+bQUH3IAzfuz7EN9Eawm4UUWq11H8MUAh9KZiAY5m8NovoXz4SzLnNK1
	 wpxVLlCHpD9kfgNJOyrsuhqRgJipU4kGxs+WJxB/8/ZeA31BTTxj3ICMMZgXuUUXrF
	 Adh5Gst1HVJ3QHntXwLLmU0CdobimUXECalSIWjuUQxydJ9lr7Nkcmc207/6o6AQgk
	 K8Vp1fJwqpaY+pGsUqiWunkC3ZR6CajLGe+VGkn02DtTXzO9niJ0MdzAePbONXYh2F
	 WLiAll5knHuOw==
Date: Tue, 20 May 2025 14:25:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
Message-Id: <174776907517.1215979.15639504513287893325.robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: stm32: Introduce HDP


On Tue, 20 May 2025 17:02:28 +0200, Clément Le Goffic wrote:
> 'HDP' stands for Hardware Debug Port, it is an hardware block in
> STMicrolectronics' MPUs that let the user decide which internal SoC's
> signal to observe.
> It provides 8 ports and for each port there is up to 16 different
> signals that can be output.
> Signals are different for each MPU.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 188 +++++++++++++++++++++
>  1 file changed, 188 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.example.dtb: /example-0/pinctrl@54090000: failed to match any schema with compatible: ['st,stm32mp15-hdp']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


