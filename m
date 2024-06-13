Return-Path: <linux-gpio+bounces-7435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C33069078E1
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 18:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D648286733
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 16:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923891494D6;
	Thu, 13 Jun 2024 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4Xvw7Bg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926C146A7B;
	Thu, 13 Jun 2024 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297764; cv=none; b=tR+9bOEsDV/Dsc2xG4ywnjpTneyWU0M8I2rXnIKdfxJ3AwBU/VcsSVuUnBjq/BJHm4FDNpCtO2f6fpqCwylMZiW6AWhlyzLZYL0FXoYrEptZuNpDRT4PrYsTLoxc4m0CRFDPCXws6yhQBuDa9FnN8bHX60Kgw7EHwR9QJr23r9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297764; c=relaxed/simple;
	bh=j9VKT+5uLDR/9V3z3CWPlahYa1LVlU+XKjjYY+mzRPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/MX8htWAdV0ikO8YRzX8GSbnuaECO79rXv5gP85GD5rpLPtPJqOxAvzZ5uCFS57WNR64cPT4WXZYkqc8hHIq1ersbmo6Kup15N2lHy5vi8pQlLPLkeTa+tWDA8Lv9a9ZscyiwzHjS4xTQK6EzaSQEkekc8VJmKyECYbGcgoHP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4Xvw7Bg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA8AC2BBFC;
	Thu, 13 Jun 2024 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297764;
	bh=j9VKT+5uLDR/9V3z3CWPlahYa1LVlU+XKjjYY+mzRPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4Xvw7Bge6TLJ4L6tzwg58eqzAlvAmp3tCERy+VkJBbXTpl+GisshBcA0hwSox2DH
	 QVMogq717E0lGUPBOzW5oV4XBoqJVDi79siVvbClwp6WKQIxocJZ8bBmPbdpNc4C16
	 HvvuRJRxPew+X64K965+jkSS5TRhHqG01Pv5qZEBclhgiB154fe4HKcm7X5HmWIxAT
	 yaGXEMtU2GVKRWl9JWVdo0Dl1yK8P1FK6Kk011hr0GoIneB+GkGrCo1p5t7wC9Qr9B
	 sgRp3nDLHm/I6AfuYzvgWPoTrH7TA+PkMWAx3yNJU2l1YIeUa/It9UaBxUj+JSi/hE
	 yJZm7KK//3JFQ==
Date: Thu, 13 Jun 2024 10:56:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: xilinx: Add support for
 function with pins
Message-ID: <171829776082.2018524.17283616546345596945.robh@kernel.org>
References: <20240610223550.2449230-1-sean.anderson@linux.dev>
 <20240610223550.2449230-2-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610223550.2449230-2-sean.anderson@linux.dev>


On Mon, 10 Jun 2024 18:35:49 -0400, Sean Anderson wrote:
> Support specifying the function per-pin. The driver doesn't care
> whether you use pins or groups for this purpose.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v3:
> - Express groups/pins exclusivity using oneOf
> 
>  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 349 +++++++++---------
>  1 file changed, 180 insertions(+), 169 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


