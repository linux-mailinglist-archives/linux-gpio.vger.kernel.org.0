Return-Path: <linux-gpio+bounces-23115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505CB00E88
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 00:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E01615807BE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 22:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315D02980CD;
	Thu, 10 Jul 2025 22:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5NdhdlG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16323506E;
	Thu, 10 Jul 2025 22:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752185524; cv=none; b=oUYHevlJK+CXuOUuniH0O+vTsf78J0upJUwm/Z3V4kzesXJNHlcxanIrGb5+moCioMPwqXPIh27PgXNXmXYVQ6SmFbc2KzxSbOv5MuTk05/Qwdosikimwj2C8/udwv7hgxjt3BU0QW6S8MJ9ne0xUxi9edGsmpjiF9QY7uEUoUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752185524; c=relaxed/simple;
	bh=XrP9H0gBp9rW3yZpPO7JOp98dW8cHyadMLjd7OhLBi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAeHhJMmrf7Qr/od57GSYpFYHHMuETGBMCB56w8iiqaZacj/5CO9IZS+KGePjk3ZicVwM9RWhluhlrHHSpmnQ/WzS8KvhwmZnFuJDe1H1awbfW7/Wh6lKmWIycDIT/qFvTTQzAeX18JVXGEMuJamrNOn2sh/YX8mgYsHnXEbytI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5NdhdlG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77802C4CEE3;
	Thu, 10 Jul 2025 22:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752185523;
	bh=XrP9H0gBp9rW3yZpPO7JOp98dW8cHyadMLjd7OhLBi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5NdhdlGLhRUzK6rJSS7ffmMMMRVasaGgxYKjmmFrKVysoK1yUizfh2x/OdTED/eS
	 GcthgOce55mjTHNt3gbQgDvLZt2GqKM7koIpbbvYt7fmdY5yPkYsTQjWOCxlx3cHgJ
	 KYT3g/kyLDTL2jeVT9cuSpKl9FawaOm57ew/pplCBcOJ8HvSeYwVVEA2tm1UwkRmJd
	 99fdK0GhSnI9YwbcdBJ38WITMO4Nxz3kAe3Jj6Nj576qgUxG8WTGFRnvIF7ubH/pwZ
	 1bG5xRvbh7oH6sql+cJt6ZsTBni1C3BdS1h9eR9L0/3HaOvNIyNWzTy+BBaqMCUUp6
	 NtAeSO0XlJejQ==
Date: Thu, 10 Jul 2025 17:12:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: phone-devel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>, linux-leds@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550
 PMIC
Message-ID: <175218552201.4092766.13231190561987745978.robh@kernel.org>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
 <20250709-sm7635-pmxr2230-v2-2-09777dab0a95@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-sm7635-pmxr2230-v2-2-09777dab0a95@fairphone.com>


On Wed, 09 Jul 2025 13:46:33 +0200, Luca Weiss wrote:
> Document the compatible string for the PM7550 PMIC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


