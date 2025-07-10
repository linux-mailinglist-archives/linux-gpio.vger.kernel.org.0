Return-Path: <linux-gpio+bounces-23112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D98B00E66
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 00:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 985E05C4715
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 22:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F2328C036;
	Thu, 10 Jul 2025 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTOqF03s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBB16A94A;
	Thu, 10 Jul 2025 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184893; cv=none; b=PwE77jBYNUmU8idKOLwzo+ZNWRScyefXLpi7BaybVc9DSD3VxdkhW/hY2UU8JA+/7MOJDghJgHRKXDKGbg0SwsJuuXVe7mCpaV6q/9/FNg4+gJGj9IE7EdxQnPsmwljVHE5m4rCHZV+PdXAxbuIsIISh1fOSUl2ur8Ap8JyNY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184893; c=relaxed/simple;
	bh=7aAzz1o5S+01R78QDUVFrJ+DlKfEpY+7TzVUQpp1E6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/P9hzil+ScnYU42H2cPnnDJ13P0V67R3nk0VWVEPmeyaAjnV74Hzjz80VE6psDKeecbo5TnieMPKyK2cIcOYWvEPXDWTmAfayRRE3TXsLFwahE2+nOxSsmw7noNy7v0VhlHLVw0vL2hUqJiNNa9ovyYPiF9ugK9Er3eH7VvE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTOqF03s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E02C4CEE3;
	Thu, 10 Jul 2025 22:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752184893;
	bh=7aAzz1o5S+01R78QDUVFrJ+DlKfEpY+7TzVUQpp1E6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTOqF03sSwmZHeR156aYiCot5scR9c+CPH/640u/Iu3vF/A1U1a9FW0MQqOTs1LHD
	 e4+qzT+l1k3CsdL30DbRG7rxrJhmmdW/h9725uOokiuut1H3s1lR2XG+pFi27cKKvI
	 D65EEJx2RJC+cJuqDcgR+4UmhWdjQfqkjKGjC2ym0SSOLmoPGrDlXnyiV1MmgBvMZq
	 sLzdWZ/EjVI+Yufy9dSr4pkKec1LgA/7cqJqlMoMCsgYnGR0+Cw/I/ApJo5G7s96Qp
	 Ag1Q3zKCqN3Zr614m+Bj/05uy6PS3AqSiCXEC/wUGpbuBl5Yrx81XX6OH5TcpLmWRM
	 S2yOTOGZnymIA==
Date: Thu, 10 Jul 2025 17:01:32 -0500
From: Rob Herring <robh@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpio: add bindings for the QIXIS FPGA
 based GPIO controller
Message-ID: <20250710220132.GA4038128-robh@kernel.org>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-2-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709112658.1987608-2-ioana.ciornei@nxp.com>

On Wed, Jul 09, 2025 at 02:26:50PM +0300, Ioana Ciornei wrote:
> Add a device tree binding for the QIXIS FPGA based GPIO controller.
> Depending on the board, the QIXIS FPGA exposes registers which act as a
> GPIO controller, each with 8 GPIO lines of fixed direction.
> 
> Since each QIXIS FPGA layout has its particularities, add a separate
> compatible string for each board/GPIO register combination supported.

This could be covered in my proposed trivial gpio schema[1].


> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  .../bindings/gpio/fsl,fpga-gpio.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> new file mode 100644
> index 000000000000..dc7b6c0d9b40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl,fpga-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO controller embedded in the NXP QIXIS FPGA
> +
> +maintainers:
> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> +
> +description: |
> +  This module is part of the QIXIS FPGA found on some Layerscape boards such as
> +  LX2160ARDB and LS1046AQDS. For more details see
> +  ../board/fsl,fpga-qixis-i2c.yaml.

Or this is simple enough, just add this as a child node in that schema.

Rob

[1] https://lore.kernel.org/all/20250701225355.2977294-1-robh@kernel.org/

