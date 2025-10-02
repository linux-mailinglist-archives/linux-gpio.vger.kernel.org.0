Return-Path: <linux-gpio+bounces-26748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA866BB24C0
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 03:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF3C32303E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 01:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7561411DE;
	Thu,  2 Oct 2025 01:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnjpTqpb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22EA18024;
	Thu,  2 Oct 2025 01:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759369966; cv=none; b=JeTN/+9e7Zym3Gy7RnJh9L+y4eotcxmBIfzl8DULUGj+ms4XIwv1u3ZDm9C/P7MvM4lt+1UTh0MQO3MbyyRM8A0rlOZ91CFgPkMHEUOSSIpRUZOD6fBHwWyajYKnuNYJ5ZOZEJPgDErluJH8bqnn4lK1HCjG17lveTAgK8DTFWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759369966; c=relaxed/simple;
	bh=tspc5d34DMU8IoQ9+1NwNhd7W1LOMvs3/Io1z+Hqf/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2kMN7o1BUe/xsoZ52LL48E391FPs7Bdu4BCly+XXqp89aJG4yo5t+Aby5x/lhDQd+ucZSiI1Ugn2hZqVd84r/jU53Il1QT6JOOQnLKhnsY8QZEDu23XEcDVNXzhPk78rImbg10lGyfQ1F2FWGviyGUcw4pQbqU7wbLFhoqpg1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnjpTqpb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294D2C4CEF1;
	Thu,  2 Oct 2025 01:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759369965;
	bh=tspc5d34DMU8IoQ9+1NwNhd7W1LOMvs3/Io1z+Hqf/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnjpTqpbFG9MFq6gvjiBtfQVNK4EwzZChhlbPJLMjbxdmuRiewsYbSUm9ebQExjtB
	 nkSyZUyL2K0c4psuhC7Wp878c1IvuromCF7g91w9nNDi0cC1rj12zCgcDuXswV5U/d
	 BZA82QlODS8ZzZm0bPYrGZgBvbz3aHe4mUFSo0JSLNXseU2uktQlcVrTAyHovwUCo2
	 0BE6u4QQbXO9B4MU9ZSjI+RGQtQ0nUhI7tEqGz72GElbWO9RArlWZbDuRRjbt2X0Cc
	 vQOn6kxILSquGwQWbgUxaawS5DmEuyDhuqsL65/ntNYq54bPiaLYnkxz4UZ0sjvWaj
	 Pac/IUS0OLt8w==
Date: Wed, 1 Oct 2025 20:52:44 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 20/22] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20251002015244.GA2836647-robh@kernel.org>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-21-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925151648.79510-21-clamor95@gmail.com>

On Thu, Sep 25, 2025 at 06:16:46PM +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> new file mode 100644
> index 000000000000..817b3097846b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 CSI controller
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-csi
> +      - nvidia,tegra30-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks: true
> +  clock-names: true
> +
> +  avdd-dsi-csi-supply:
> +    description: DSI/CSI power supply. Must supply 1.2 V.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#nvidia,mipi-calibrate-cells":
> +    description:
> +      The number of cells in a MIPI calibration specifier. Should be 1.
> +      The single cell specifies an id of the pad that need to be
> +      calibrated for a given device. Valid pad ids for receiver would be
> +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 1

Sorry I didn't bring this up before, but is this ever not 1? If it is 
fixed, then you don't really need the property. I prefer it just be 
fixed rather than getting a bunch of vendor specific #foo-cells.


> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: channel 0 represents CSI-A and 1 represents CSI-B
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maximum: 1
> +
> +      nvidia,mipi-calibrate:
> +        description: Should contain a phandle and a specifier specifying
> +          which pad is used by this CSI channel and needs to be calibrated.
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Sounds like only one entry? Then 'maxItems: 1' is needed. If you drop 
#nvidia,mipi-calibrate-cells, then you need to define the arg size too:

items:
  - items:
      - description: phandle to ...
      - description: what the arg contains.


