Return-Path: <linux-gpio+bounces-27911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B089DC26689
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 18:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB35B3BB4C1
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 17:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CC0248F7C;
	Fri, 31 Oct 2025 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Juhl6O2j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F71E412A;
	Fri, 31 Oct 2025 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761932321; cv=none; b=MeeXhcJtyOXTj3DHi/QmcVMmvzNp6MXpNIZAqT/TU5DML5id1r41Cx3h7bwutVdEDKefRadYKzWzdqwyyNR0HarjKlE8cnY4LSkM4Mg/ExGnD/XKok0SxCbv6rAkvJwu1EB6IkGRU4WAlth1Eol+RejtrVlA/g4OgnOhmZc2ihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761932321; c=relaxed/simple;
	bh=h7U8vInMfi/25e60Rx52NyArGmdxxPKz5GGups+Vg0w=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Q3Zq/fnyB3tp+MioJxzppP2DlPAU31U7ab2CKBppiUl4J+P/MXvFmpgqPFBtUNJ0SxyFVCF6RDljVmG3FdeTHckWN4yhzzrOfQboVecZD6qpJRI8BSHOeK+ur5mMZkGbKAbbNYRTngpX8CRwSpSPlxOrp6hLqrkJjnJoZxrM9kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Juhl6O2j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27BEC4CEE7;
	Fri, 31 Oct 2025 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761932321;
	bh=h7U8vInMfi/25e60Rx52NyArGmdxxPKz5GGups+Vg0w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Juhl6O2jrplhK7N67WhvY+NzZpuFIXksFR2zvpcHhaLTV38sKwkriBpfgs2x2lIl9
	 xc6fXMmzu15VJ1nj+ehSMPpU69u0DqOaQyGb/LWtujImqxkwHU3YquMUrOAzk77n/N
	 dx7dG1nsyZd4TFsXbxRsx7fepLegHgZtURI+ZKVCz4p1KJNHte2mzzWWbTZY295lfe
	 6dAu/Tyv/LURzd2ndXYKKG+XLhQ1Wptt39J0FVXNhVoTxAGtV1bP5pNkHBytqLhvqY
	 xY1OszN6eer5CLD4DKRsL5Thygc4pBG1pQrHmgK8rFeCDVBj2MtjoggXzCcpHYXHXU
	 sy7nPZMJ6ALpA==
Date: Fri, 31 Oct 2025 12:38:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
In-Reply-To: <20251031160710.13343-2-antoniu.miclaus@analog.com>
References: <20251031160710.13343-1-antoniu.miclaus@analog.com>
 <20251031160710.13343-2-antoniu.miclaus@analog.com>
Message-Id: <176193231933.1398035.17050264293227901993.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: adg1712: add adg1712 support


On Fri, 31 Oct 2025 16:07:04 +0000, Antoniu Miclaus wrote:
> Add devicetree bindings for adg1712 SPST quad switch.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
>  .../devicetree/bindings/gpio/adi,adg1712.yaml | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpio/adi,adg1712.yaml:75:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251031160710.13343-2-antoniu.miclaus@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


