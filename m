Return-Path: <linux-gpio+bounces-6479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2018CA11D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 19:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B707E1F210E3
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 17:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C443D137747;
	Mon, 20 May 2024 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SR2x9wwg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAB7138487;
	Mon, 20 May 2024 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225350; cv=none; b=L6IXdXK6jy0Or1xHQl3QnoGKmO3GRClGxCb2Rl5WEJgfLiksY54YTDgu7s4bG/OHyi7gaKj4bECRwLqOyLF5JMgaUBs6rJbYxUws47lWCHY6IpwEE084LHza9nZg89A03FmdaLKPB+jyEQbdd48Du/MHlowYxEGLNpkb19lapc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225350; c=relaxed/simple;
	bh=9OHh++1FUQFyyipccjCfWvE0th+xdBKW3ji9fykzPJc=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Lz6fP+vWgd/bYVLBgXy45cLP3CGMXPt0cbxbDN+D1ySLClkEdAc+9aBhZoEAGXKbgvE1uDvwXGkZdWXAOiX4Iqewb/2rpSOZzSv334y1cINw2GtAM9giq8g9/GYVNIxvvfYDvfphmVFBwyC3gxi9sb+144xPmq5gUwtX4tJANf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SR2x9wwg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDD0C2BD10;
	Mon, 20 May 2024 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716225350;
	bh=9OHh++1FUQFyyipccjCfWvE0th+xdBKW3ji9fykzPJc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SR2x9wwgsHzxb93Yd2U+znlvDRB6PlhYj66mRnsYtAF6bFT4fcBY92CwO7QYaetJ4
	 rwsUVgEgmnX07A8VF13/IZ20ZKk7EsZBbPmJMlLwAx7a15JCV0dknXGbOY1Ta4JrDv
	 Mrb8f0vlKYpIgoWstHsjLxcOGcZN5h5gCE702aXmTxAjOTpfT1yo4T4YiiUAWinWSe
	 wmIpgQiD6xQ+K3uR9esRlG6eIXGtLgMlpAdifZMwUDDYGtE0PoFI14YwaKfQmEsPN+
	 5bhnCbRJ960sOIQ3BETn1aZHmxczudi9sEfJjcovh9iQnPGN2tNpdV55K7tp55DqnM
	 30dqNFR7LusWw==
Date: Mon, 20 May 2024 12:15:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pratik Farkase <pratikfarkase94@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Pratik Farkase <pratik.farkase@wsisweden.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20240520154711.7991-1-pratik.farkase@wsisweden.com>
References: <20240520154711.7991-1-pratik.farkase@wsisweden.com>
Message-Id: <171622534905.1035434.3869181780414186085.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: gpio: lsi,zevio-gpio: convert to
 dtschema


On Mon, 20 May 2024 17:47:08 +0200, Pratik Farkase wrote:
> Convert Zevio GPIO Controller from text to dtschema.
> 
> Signed-off-by: Pratik Farkase <pratik.farkase@wsisweden.com>
> ---
> Changes in v2:
> - Renamed file from `gpio-zevio.yaml` to `lsi,zevio-gpio.yaml`
> - Fixed the space indentation in example
> ---
> ---
>  .../devicetree/bindings/gpio/gpio-zevio.txt   | 16 --------
>  .../bindings/gpio/lsi,zevio-gpio.yaml         | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/gpio/gpio-zevio.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240520154711.7991-1-pratik.farkase@wsisweden.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


