Return-Path: <linux-gpio+bounces-24830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC466B31FDB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 18:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBDFE1D28717
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBA2242D86;
	Fri, 22 Aug 2025 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBUykIQB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA322135B9;
	Fri, 22 Aug 2025 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755877979; cv=none; b=umQCuzzWJUZ3SZJfFVgxGgiDvdhCE2GHpiIi11quPThnErCbuTnn13Oq77nXuFjHaHk3nPRTNptUF6mOZF8gdqvdLZh7EIeJVkLEF5kmILn3SVcNC+u6eq2Y5LyFL1lx4xVj5CBSPawQOxYJsXu22mlqRi2Zx/ypSCCAbuXrUZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755877979; c=relaxed/simple;
	bh=GZcqAUhind1yPvp4zhhO0FBJJvpJTi5iPD/E6Y6N6GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQQ4/79tJQEVAT+ycz/GACP1Pki2ZebAruBw4fkZzrpcmWTAgDUkHU/Q4d/DP72JzVQ+dQmXNJrPG5lAE+hG9o9n5DkzXrSTU101gShN/i3XrZ+jly9UkS1Qd+c6f/QVMRFFTj5Pi15hHYpyg1bQpI93MHrIkZqNIRTM4+RwLJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBUykIQB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8FAC4CEED;
	Fri, 22 Aug 2025 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755877978;
	bh=GZcqAUhind1yPvp4zhhO0FBJJvpJTi5iPD/E6Y6N6GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBUykIQBRStiihtAnJe0AVIVB3jiv164suytchNLOiHzXp4/+sT3VdYIWELtCxQ/S
	 k+XB53PnA2SVEHhRTUS7U4pZc/6+NTJUkZY7CKASmPvQ9QpYCcufIcSzgpR7NWVkSi
	 jp9XGx5f+pZpXKidRSPAs6K+jdBokudQq0L+JSHKIQsakl6rBCtx53/+fKmRYU7AE5
	 FMyFc2btLCA2xVryygJW3jkoBWIeiRMncRcBrhZrVRERgO/U1xU0HV1QVl4Lxov6FV
	 dzjxYmwhLLY/zdK180LgDdUc1uFpRhZ4yyM60sjdxOlRcDnYbBAtClKHQaXm10ebIj
	 AcsRl3MiOJs+A==
Date: Fri, 22 Aug 2025 10:52:57 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, broonie@kernel.org,
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
	davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
	jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
	simona@ffwll.ch, support.opensource@diasemi.com,
	tiffany.lin@mediatek.com, tzimmermann@suse.de,
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
Message-ID: <20250822155257.GA3865729-robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-14-ariel.dalessandro@collabora.com>

On Wed, Aug 20, 2025 at 02:13:01PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
> controller to a YAML schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../input/touchscreen/melfas,mip4_ts.yaml     | 55 +++++++++++++++++++
>  .../input/touchscreen/melfas_mip4.txt         | 20 -------
>  2 files changed, 55 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
> new file mode 100644
> index 0000000000000..170fd4212467e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MELFAS MIP4 Touchscreen
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +properties:
> +  compatible:
> +    const: "melfas,mip4_ts"

Drop quotes. With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

