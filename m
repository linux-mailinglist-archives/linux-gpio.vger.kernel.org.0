Return-Path: <linux-gpio+bounces-30252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36342D02EFA
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 14:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60B573006991
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 12:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB73238759F;
	Thu,  8 Jan 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/NT5vT+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2D3815F8;
	Thu,  8 Jan 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862754; cv=none; b=Wlg7ZrX6VhwT2/DNkPkSSLk9D9zt93NSn4bdThwVaVhwa+80M3QejTHm5QbYJEVGxnluGOvhogm+OeCdwPaUUPacjW1bpIQl601J1SrZvzPgE82mj9Rof3Itftu4QdmaoxMKvsEgFBF+fX294BB2fJJ+8oO3sVWS1rHgnuIWjkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862754; c=relaxed/simple;
	bh=gBfi7dSIZ8ZiN8dKK2LAmLnRIxw52URBuFs7ifEZ1Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMEYHwCshyTqGfieyFWHf/dY2C0i3iwGpE9ZSUtoFWcBwjwyUX9oursowvvQawxzK7malCIpF2/gStfeQrnyxszb2/rvDSyRHBKdeXbPx56URSeYreuGaCDC3kTUqZ4KRpAO1H5ZeR37rmImft9XDOEJM4TFc/nQewlOOD0/cMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/NT5vT+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC6BC116D0;
	Thu,  8 Jan 2026 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767862753;
	bh=gBfi7dSIZ8ZiN8dKK2LAmLnRIxw52URBuFs7ifEZ1Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/NT5vT+ttmEKNsA+F5mVfpAzduM5N7jS8XXxN9WrGGMvujCNlCTtYL3IBJAkeWcW
	 gVZKHMUbASLg1J9Efic08SgHJ4kjR1aE0TnZQh3yJ+uNuMlb4AC+AFxq2xR6Ln5lxE
	 Kbyrw1Q9OAYGnbVAYo6ZfSWOwqetPAMLNe1JUszNGOTs6jg9kUZVi0eGFFSQUAFKfk
	 GrYrwzpR6h2KDnLhXwUaycMSimNNo9uP0GItN7OzqG15uAPDN1v46ElxeZSZDa8sJQ
	 jFYMRsnTjIzwPwpKte2Jb2A8IFYlrw3YwicaH4uhkH0NY+xJ4QNS8YZPjbrOm/MrJg
	 aEIDK5pY3aQVw==
Date: Thu, 8 Jan 2026 09:59:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl:
 qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P LPASS pinctrl
Message-ID: <20260108-outstanding-transparent-weasel-ca531b@quoll>
References: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260107192007.500995-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107192007.500995-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Thu, Jan 08, 2026 at 12:50:06AM +0530, Mohammad Rafi Shaik wrote:
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +    lpass_tlmm: pinctrl@3440000 {
> +        compatible = "qcom,sa8775p-lpass-lpi-pinctrl";
> +        reg = <0x03440000 0x20000>,
> +              <0x034D0000 0x10000>;

Lowercase hex. Just look at other files, e.g. sm8450.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


