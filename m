Return-Path: <linux-gpio+bounces-23561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C5B0BDAB
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E73CD3A920A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868A728153C;
	Mon, 21 Jul 2025 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpYd+4wE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337821D540;
	Mon, 21 Jul 2025 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083122; cv=none; b=GmPpw92uKxrl/EraSP+2YuZrnGrTrSRws8glOKGpqNXtTg/VVJHQI2Jl+JxBmHZEWJjDBenFkuZKxiikqHzDZjTCkgn5UHR1Baibb+bk3LHgxjDufti/cRR3qkYVgnpukP9V2ztPQUrn/osegG/6/7xXpKyiOt4tHG3Z/cQmj90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083122; c=relaxed/simple;
	bh=v4jaJI+zODjIi7ygyiCAzyHL7gwrHh8tG2mTQ16ZT0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ68PTZ2z4cMOoppbvvqeIyFz7JVpEcooylC0Fy0GLAYV+JuTa/czeEufSwALePVHyLC+ZVVsGxSEKFd1yoBzWmd5ymwZisoWH4gK1CNzD0JEp0uszjjy3Da77MNVYE2nx8AuvDaJVOkhkxyh66stcRFFUVtFOC1wsiK3DboW8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpYd+4wE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3943DC4CEED;
	Mon, 21 Jul 2025 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753083121;
	bh=v4jaJI+zODjIi7ygyiCAzyHL7gwrHh8tG2mTQ16ZT0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpYd+4wEKCvEl0Yz/4VyHmP7R4RbBzDp/O6J6peUobimJcNxbQccxWseSj5l8zu/z
	 /m9fDuH1kMncfLNSlE2xBuMfri/lm0cpK1rlbuIz9ztpeNiVj9DidYOK5D7gTO/TPh
	 nlGVGD+iA3RBgN456Sdz7jXilfGBtckZIGSr5OcS0lZm62Z6RbAHu734G+LHtHvyuO
	 enC+os5FxmKZDT9pMia4rkAksAaq83Q7KSSuvIfDH+dX5ccdTwMCnnzWQhl0qQFY59
	 o+FPtYdWqWZWM/6Y8qZxOeZCvG9f3TjrwIy7QRNGmlt6XtFdi9N0YoksRr2Cq7zJby
	 x+uwDrDDku4bg==
Date: Mon, 21 Jul 2025 09:31:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	kernel@oss.qualcomm.com, Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/9] dt-bindings: pinctrl:
 qcom,sc7280-lpass-lpi-pinctrl: Document the clock property
Message-ID: <20250721-guan-of-therapeutic-champagne-eee16f@kuoka>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
 <20250720173215.3075576-3-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720173215.3075576-3-quic_pkumpatl@quicinc.com>

On Sun, Jul 20, 2025 at 11:02:08PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Document the clock property in sc7280 LPASS LPI pinctrl node.
> Clock settings required for Audioreach solution.
> 
> The existing SC7280 platform only supports non-ADSP audio solutions.
> To enable audio functionality on ADSP with the AudioReach solution.
> additional core and audio hardware clocks must be configured.
> Without these clocks, the ADSP will crash.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


