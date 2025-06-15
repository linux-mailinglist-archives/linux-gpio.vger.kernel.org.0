Return-Path: <linux-gpio+bounces-21608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9299FADA0B4
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 04:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44313B4AD4
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 02:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0AB261568;
	Sun, 15 Jun 2025 02:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cjph3Bkv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF42609E1;
	Sun, 15 Jun 2025 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749956107; cv=none; b=Z7GZBf5HTejSAm1wY9Kc6GlG7oqCBar8YntXRHv2AQr2ZyUQnaGbbhUOjhTrIBSDOfVHgpejC1hDJoeUW5dhdKNCoVnzHMDD5XAT1Mp0R+0xDEcpwdKd1/pQSTZFtNqnm18/asx4+VVr3eq6yCbnRSVLhnbAvUAuFokj3tEN2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749956107; c=relaxed/simple;
	bh=lP+M1tHC6k+ERpDkYV+GZRpVMaVufRE54fR5PaAN/Tk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TVk14u6s26sjzPJojJKSmAdf6zlYY36D8V6MD0HlAM73jGVpo1YWtIZpSLv+sgRGHF8v8ZYkiPj5xZ/6RZeLL2g8I3QD5BTBukjmsQrG8U8km4XPXLNXUoh5e3m8KvIwnvDx/t3YqEPKTlPeo/UAjskQVOWFzBMA/+TGfq4VPF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cjph3Bkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C39BC4CEED;
	Sun, 15 Jun 2025 02:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749956106;
	bh=lP+M1tHC6k+ERpDkYV+GZRpVMaVufRE54fR5PaAN/Tk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Cjph3BkvQf+7BHCYIZcnzzDty7AqnGdjDZGfxRK8Ktn4CttdRumzhp14Nxa4RDPfh
	 kUO29FG7DHY2Qa4mURoW7utlBws42aiL+LrDzYBZgKEJWvPaUqgTmX3ZTDexPXo4kT
	 vaJX4M0adv0vHgK8M1qza8/6EZZuNuEejMokXCyXd7F7F5LY8FqCjmoCple6aFX0xA
	 w1T/5IQKr9xf8eCQdsSIdeyKHBtMD2E/ttYnBnIqFKsC6mToTsGYj/DhiEpHMJl5aM
	 nEsotaBiKfyZAMkL/xhzQzqNTLQeoen5oNvDrE/mVGNllfhX68nnUDIJyBWAedmWDM
	 ogWO7WmH4me5w==
Date: Sat, 14 Jun 2025 21:55:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Harshit Shah <hshah@axiado.com>
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-3-327ab344c16d@axiado.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
 <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-3-327ab344c16d@axiado.com>
Message-Id: <174995610418.3364372.5364960681855010915.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML


On Sat, 14 Jun 2025 18:12:49 -0700, Harshit Shah wrote:
> Convert Cadence family GPIO controller bindings to DT schema.
> 
> Changes during conversion:
>    - update the naming as per the other files.
>    - add gpio maintainers
> 
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  .../devicetree/bindings/gpio/cdns,gpio.txt         | 43 ------------
>  .../devicetree/bindings/gpio/gpio-cdns.yaml        | 81 ++++++++++++++++++++++
>  2 files changed, 81 insertions(+), 43 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-3-327ab344c16d@axiado.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


