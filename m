Return-Path: <linux-gpio+bounces-23116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C05B00E91
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 00:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 643585475EB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 22:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793092BCF45;
	Thu, 10 Jul 2025 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKyQmibn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328B23506E;
	Thu, 10 Jul 2025 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752185657; cv=none; b=FnMVSEugSWfnoyyGAX7Qr2fLvLz+TeJrn5tViYONwB0wAPCEpGfxDcb9+S4abpZl8nVvBh/ltnbFTlSrA9Ay5IeHllK5y+myHTJNzo9xSxuF/mx+GNtj4Vj1h1Y34EDKP+c1qo+f/E5fp6+rtPlxKuG1Cn6eKe8HRGaT8jp9/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752185657; c=relaxed/simple;
	bh=o5IXUwWPDUsm8lLGJ+shwSp3vHoSCZBgUXuMkESsBa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRx1jbejmcx4kKROE//CmYkVTFxVnIGF/mrAnN4jyXn01EQwwTbapVsLj7v0mOwnCqlT6hWGu3ynVKiB2pp1QRxFVfNujsI3SgK6MWAC0b+zAGB116ARIlnei9agV9euY9mB1u7TmS37iRhrn1eKKxFMZzhPh/lIVlQXiXjcZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKyQmibn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAD8C4CEED;
	Thu, 10 Jul 2025 22:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752185657;
	bh=o5IXUwWPDUsm8lLGJ+shwSp3vHoSCZBgUXuMkESsBa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKyQmibn3qtUqqAyDkCWf7hV8+ch/punqAwMj41wn1DntlTrxp7Dj1F7gQ2ctcAjI
	 6lOJbuAZJVz0kg5TrMInl8GSQPfsE1E+DqkjpXyY7mY9Lv/vpyWzSVoiwARBkEalDu
	 ji6AtM3F0usVC7LGXFXBXuqKcYTyMPuuxZBrtaB1OLa7qnxFjz8mOEnidobwQfps91
	 kRr/6tYWbSZnFdHLC1mga6jV14dPsCCoRFu8zK32qr2ko3vJV/pzIJnegjZdjDOp7K
	 hBjyhYQFiRWIleLO+h3UzpUgHmsNIKzkdRcEyLjHDiodrgSlHr5bqgpc9OpciG1ABX
	 IxieEE4PF5JMg==
Date: Thu, 10 Jul 2025 17:14:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: pinctrl: qcom,pmic-gpio: Add PM7550
 support
Message-ID: <175218565537.4115517.16491441533941935003.robh@kernel.org>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
 <20250709-sm7635-pmxr2230-v2-3-09777dab0a95@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-sm7635-pmxr2230-v2-3-09777dab0a95@fairphone.com>


On Wed, 09 Jul 2025 13:46:34 +0200, Luca Weiss wrote:
> Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
> to include the compatible string for the PM7550 PMICs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


