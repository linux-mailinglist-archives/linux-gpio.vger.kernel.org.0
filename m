Return-Path: <linux-gpio+bounces-21607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF7ADA0B2
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 04:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0DD77A783E
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 02:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A05260573;
	Sun, 15 Jun 2025 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bu2iLWLZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5141257D;
	Sun, 15 Jun 2025 02:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749956106; cv=none; b=SFncfi/8+2Bi0/jQPS2/A3IwvKvAWcWo4f4SVrR7XH1GvJVEgvbMDfxt1pn0UEBKwy7OgnmduvMa5sNbV13l7pyRx90LEmisYWw9TW3FiBmBHJpokBOXTNV4IHn8PFAs6bEaib72r+DJ8pn86ix8EaVtc/NJVGjEKMO7q1+hZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749956106; c=relaxed/simple;
	bh=Zd7fTt9VFyH1MjewTq6Q2zFD1dm/dKoqPPU2XlbqW0Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=N3/I1buDLV/GjzLv2c0kv4uz4m0qz/GwIvCxABiYC7LAapWzHsLwMQc5OoZK2wsva2XWovlMIe1ZLXwbx+a4Q7y7ihu2NJBGQY9IH0iSa1lAe0+OnfngPAR7P/uFQL5wpcRNAlRxIPE5uZjKAKICYsxfdlcYJMD3pDLwyTPCZKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bu2iLWLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA2EC4CEEB;
	Sun, 15 Jun 2025 02:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749956105;
	bh=Zd7fTt9VFyH1MjewTq6Q2zFD1dm/dKoqPPU2XlbqW0Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Bu2iLWLZO5mEr+yaHH1IxnDeEo014StFzRApEYUc5voiE1tCHJ11Qb23gIppjSgAE
	 ADM0yJdn4TBsUl+PdGmqRy8b6Hkc3S2wOGh6e7mBynlHmGdSWZ9v+GBsY0thOz1CHD
	 5NRPDDhsFHS6f0In3cEcgtldvxGSc4nZPBYT6msic2ITyFNRhH4Oaqj7AWR1O9tNJf
	 K3zRsEj4/ebNgGoYcPWE908T1MKY/j3QacLZu9xHD5xPERxBgLvCRxcG7iHmB8OxgQ
	 tWdP7Oq/zEPG8z+PNsKVP/Ix5qcLKiSd12HdH5sdqf5+kwaUSuG53gr680bqj0oN/X
	 I8l63XXkyFknw==
Date: Sat, 14 Jun 2025 21:55:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>
To: Harshit Shah <hshah@axiado.com>
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-2-327ab344c16d@axiado.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
 <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-2-327ab344c16d@axiado.com>
Message-Id: <174995610354.3364317.17258718728761199104.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings


On Sat, 14 Jun 2025 18:12:48 -0700, Harshit Shah wrote:
> Add device tree binding schema for Axiado platforms, specifically the
> AX3000 SoC and its associated evaluation board. This binding will be
> used for the board-level DTS files that support the AX3000 platforms.
> 
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  .../devicetree/bindings/arm/axiado/axiado.yaml     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/axiado/axiado.yaml:20:34: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/axiado/axiado.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/arm/axiado/axiado.yaml:20:34: found character '\t' that cannot start any token
make[2]: *** Deleting file 'Documentation/devicetree/bindings/arm/axiado/axiado.example.dts'
Documentation/devicetree/bindings/arm/axiado/axiado.yaml:20:34: found character '\t' that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/arm/axiado/axiado.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-2-327ab344c16d@axiado.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


