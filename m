Return-Path: <linux-gpio+bounces-28446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69058C58099
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 15:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C42235845B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 14:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA64283CB1;
	Thu, 13 Nov 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkzPYgLG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29227FB32;
	Thu, 13 Nov 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045351; cv=none; b=dHbvDoxd5WseqpYCvOLIJjUf644WtDt3+G7IxFftnHL9UWJVagBwCVELaHakrN3Owm8ieCIFuhzrg4awlL83LBpSZPeEJEADytBYIdeTL9sXHWCvK+H8CkwedvYlevlkx7MzyRpKDkOuM8FFqg9WuMftFudwWR53+pTOrANeFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045351; c=relaxed/simple;
	bh=FdVmpdDUbZwHGgLMT+/m8It7zc41QV2tQXjcxfON4kw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K2vAnbVnJK4pNX3Rctd8l6P9FXvXFnQp6SdhNck+mF/5rnKS0uKkA8N2GcHgA+yLsVORT0IXy5t8KhSENRyXei5/Z1aNCS6XDH4kJ0T3qkOk1+2Av0tvIyq2ft+9imN/zTR0229EjK1L8KI+U7a2MEdgmOP95nBM8DCDISYHUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkzPYgLG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C269AC113D0;
	Thu, 13 Nov 2025 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763045350;
	bh=FdVmpdDUbZwHGgLMT+/m8It7zc41QV2tQXjcxfON4kw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JkzPYgLGQFPYrbj3e+UPESTbLZHTqraYbHFRkB8J9uYPL8YTu9c8y6M3P2oexJgNJ
	 gUALEjvT516oX7pZN+4GjNPwR/viIpxGzl7cTO8KJ42GoeGipgqm9ExNRg2VNvs3oq
	 Vcnv02ecTcxhpU0ycj2iixb7jZm+7hM/Jet44of5u+gcGrT3I+xZVBd5u+z2bSqrOE
	 54uf0lk7L9qJKw9FqzsQzaTQj7T8wiZDAbf43J3GwX8YfX223uIL1TdIITy5sdsEjP
	 JQ9DeOc6Zm44kdguoN0hr9Y9ZqYWPxqpUv3VWBQ2I2hMJmn1WPvSOluWQVdn6M/24M
	 VLQtSRqKj9Fng==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251023-sm7635-pmiv0104-v3-1-27f1c417376d@fairphone.com>
References: <20251023-sm7635-pmiv0104-v3-1-27f1c417376d@fairphone.com>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: mfd: qcom,spmi-pmic:
 Document PMIV0104
Message-Id: <176304534750.1520777.7335912828661331707.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 14:49:07 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 23 Oct 2025 13:29:01 +0200, Luca Weiss wrote:
> Add the PMIV0104 PMIC which is found on e.g. boards with Milos SoCs.
> 
> 

Applied, thanks!

[1/2] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
      commit: 02a3bf382418e517dfb3072d0567dfda6c7b280d

--
Lee Jones [李琼斯]


