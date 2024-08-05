Return-Path: <linux-gpio+bounces-8588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C854F9482FC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 22:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53DD5B213A1
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 20:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8C816BE3F;
	Mon,  5 Aug 2024 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aovcIPLP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1294116B388;
	Mon,  5 Aug 2024 20:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722888749; cv=none; b=IvAWEwM+CzOkn4d4xzLXPOo3bt/cs+SNxJvWX/SVT6uO3LvM+pcssGqAAvwhHQKvbVmGGDSg7+QzQC/QlrWxze/RnxpZoZcKnwa/nRbVq6V/ofJ4sMS9pul6o0NE+veZ5OvyUVgTqyWdkSwR1fzq6EuYEywmHZO01Hx6VW4aRHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722888749; c=relaxed/simple;
	bh=qYBvaHL3vD4VHbkp3Ybz7XYW3bPDmyd8NoKhaj/sNmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfxjcuqOV6v9vgZyT0zyv2koU+QMPZyavGFR68MqMim+cWhg5tzc80Rmqf3Gqpbkd770M09/sS1sWMXgSocwGReFfayO1p/rJVd1orV1k2aXNkyg2NTSKTyjrBRu6WOSzU409pZwxXjKTy3mnfOlyi9bmWJekdR9yXjKqcAnyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aovcIPLP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64130C32782;
	Mon,  5 Aug 2024 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722888748;
	bh=qYBvaHL3vD4VHbkp3Ybz7XYW3bPDmyd8NoKhaj/sNmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aovcIPLPARzezThzuLLHwIqhKDUu8VXJPp/l7XNL2hAx5LmhKDpUb+pTvo2HDSZ3z
	 WkTTqszt2lxUUL4yEr/ECGL2raULibk++qIU5aZPxX1OGtLIl1kHpKC6WCms1iR0EH
	 10ZhMT3IzDgODqzgSrldtxSdYhtg1N0b/upbLqhZjVM1chy7upSkoNQfd5BHYAjQoF
	 TfcqY+FHbF4+P8aFA9ryf3aTfbFKNnUERfsUkqHLb1MG1d0EA9U66/DRvh/J3Iz5xD
	 QBtGYggbK7ZrDBbJN38u9SzzrJLqnSCNZtWctHkOn4QcY93zFC7b/fOzzvUC++uHNq
	 Z83SRnp20XKTg==
Date: Mon, 5 Aug 2024 14:12:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>, devicetree@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Liu Gui <kenneth.liu@sophgo.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID: <172288873889.3218811.8560482319769136077.robh@kernel.org>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>


On Fri, 02 Aug 2024 08:35:16 +0800, Inochi Amaoto wrote:
> Add pinctrl support for Sophgo CV1800 series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 122 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
>  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
>  6 files changed, 537 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


