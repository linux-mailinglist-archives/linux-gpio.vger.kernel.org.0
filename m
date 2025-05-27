Return-Path: <linux-gpio+bounces-20603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9864AC5654
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 19:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00B344A5113
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 17:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B5027F728;
	Tue, 27 May 2025 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emQtfev7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEB61E89C;
	Tue, 27 May 2025 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366374; cv=none; b=FX20Cj3pEvI0ySs0MP41wzmNhx/fWVVOv/qhqVKo8VGIY6RUkaYu/tx+69TAWgfhqNbHbR4OFLoM3A8AllLalqeW89n4vTecDb+3DhE2MBlcth8G94es2PsD7A0CTxGtOSb2TK8Ju7nx37z2mmGOMAImoSvdzQHNHmoTYBI+vO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366374; c=relaxed/simple;
	bh=V6KK0vrVjoBtSVpGsL9SgSz+BPgl+O2Qn3gy97fDWvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5rAzv/6bFeMA6kOeB53ElH8pugD2F598p7Z0Dz1wtJDRwzYwiEg+kv9X0D8ofgOMh5I4IbffwnUTBVYTo0UBF7+t+KkDIb20M2fgI4mbPJ3VPzmXDe9wLgFaqJFg2evxmdKuEhrJNeYkep6fqch3/dR4G1CPjpIIDZgRZV3ng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emQtfev7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2FFC4CEE9;
	Tue, 27 May 2025 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366374;
	bh=V6KK0vrVjoBtSVpGsL9SgSz+BPgl+O2Qn3gy97fDWvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emQtfev7SvvzNtoS/R1u/NMWoKOUxRsHtFCjo/IoBFEzGB7m66Ny8j4wWoR4CyelN
	 3jMGtjIHCbdjjq7UqeB3w0sZhlcawrHVOLxWyK0Jjw9ARsqZssaq0bXDALyIbK/H6f
	 2aY045Nj3cb0wQgPWo2LeLZykIY4ZZrc2cguydVuok5qtnrWBklpaUZ5/QPa/ZuAzB
	 eBI3rqjyRpkhgM6O8kavTGoQAAchBxSwCqUDUMQT/Ii9AdgUxLT8dWSStPepP/wTpO
	 zXDqsdQgeoNAn4xcHr4qvBWP75AU2ZTcJjDdmMQvMvM9JUna1iB0fevc+DrMk+SLBi
	 YWn9Oew/+zICQ==
Date: Tue, 27 May 2025 12:19:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing
 constraint on allowed 'group' node properties
Message-ID: <174836637161.720465.9706133884573063023.robh@kernel.org>
References: <20250507215852.2748420-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507215852.2748420-1-robh@kernel.org>


On Wed, 07 May 2025 16:58:51 -0500, Rob Herring (Arm) wrote:
> The "^group-[0-9a-z-]+$" nodes schema doesn't constrain the allowed
> properties as the referenced common schemas don't have constraints.
> Add the missing "unevaluatedProperties" constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


