Return-Path: <linux-gpio+bounces-11823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95D9AC149
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DC4E1C22019
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB6B15749A;
	Wed, 23 Oct 2024 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWRwiKoj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3091014B953;
	Wed, 23 Oct 2024 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729671420; cv=none; b=BwmEjRMFbMY7wZ6VVcpscIDVMm9KqZP0YkedXbX9MflsvzYgZBvaV+TlOYHAAR8AF6jgOY038VX+QF/gPybK9a9aIecv+SN5WPDDcUaqIQ1GCB6bZZPOanaIcY2/62ym0xE9SJsz0qzGjHMa8rEr9hr+WPXuCnQBhswpP7MH0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729671420; c=relaxed/simple;
	bh=QYHajk3T2JF3OLGAlZUyM1OjxiGZo1CHneOwHWEGwDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1yrhMYO1J+ICHgjd/sUrMwdUJiGAVjsQfZ9waWl7bdcLxSq8i0PYEAwaC3a48bLoDia2VzRq+Q/goFdqgTuoWHFNiNrMcX69RbWUbdhmop4QFbjAGgrBy63ZbdmnD3YChu7Ovc8oGAVTdCFXG3KWj5dVR0Lk505OCs9DICc004=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWRwiKoj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BC4C4CEC6;
	Wed, 23 Oct 2024 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729671419;
	bh=QYHajk3T2JF3OLGAlZUyM1OjxiGZo1CHneOwHWEGwDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWRwiKojER4NGGEyFOnV9joYwXAkbnzCaUaUQJGAa5GsQ0sRutjL7bPfQTiAk/Rep
	 kxNjMBssoPWkMy67XRsI9lFPyG0JwUxqSSBtyj3qnlhnLWB6OB7aiwOzfAETKQO+sK
	 yFK0RRkFlKLXzOIJtCt8yEc+8WE+3imf7UcjqRgbh5OMD+MR7NJLESr2/QoIbnnX+f
	 PZyAMJHOLoXnFsX+lqNBhrpZ64lRK54A5/jGjieq5Pc3gLgRZr/70z48mCg+1B7ovo
	 pL5+h6o1zYB/NxBgvRy0XQwmOunkyS9hDCxWMs3mNPpnoDT6K5Wiz7IppuwpI3XKvx
	 fUS9I0U0FJ2KA==
Date: Wed, 23 Oct 2024 10:16:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8750 pinctrl
Message-ID: <3jkkbycv7eckchz5cm2afmafrm5e67egttzylvt6n2amvyzu5r@25vp6rkostth>
References: <20241021230414.2632428-1-quic_molvera@quicinc.com>
 <20241021230414.2632428-2-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021230414.2632428-2-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:04:13PM -0700, Melody Olvera wrote:
> Add documentation for the Qualcomm sm8750 tlmm.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,sm8750-tlmm.yaml    | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
> 

With issue pointed out by Bjorn:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


