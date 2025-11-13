Return-Path: <linux-gpio+bounces-28449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7678C582E0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 16:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F11A43A7A9A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 14:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD3F2D6612;
	Thu, 13 Nov 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWlTLJsq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3C1EE7DC;
	Thu, 13 Nov 2025 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045666; cv=none; b=Y8O3pDuMrEiJsVWSHSf2YDnyVxmquLEYaGzscA2aj4jJS+fqlj4Tk+ndJ//mrq8U63ruHygWR2yMS+LOSFR/gnp9hwO/t1rTSdgX7WvUGRzYOo44WFJDEMPdkbiD18nScugkcTfphMLHoLR8UJ7iyzcIoz99xks3Fqn7/jiZ+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045666; c=relaxed/simple;
	bh=1iW0BrdcYuWfbmGBaOox1kc2EnS9Qxrta7UYgGT6S3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lvs1RFIcDJ7DQQ/8sucSXbkknZbphBr6+bB5aBHpa2ZuByLcS3n/+CTAE24IfUkp3sMFNHUm0RpWHG8e4B/EdRsrmrrJ1xjjMjOlECLzOJQTs46Qs0CDT4BsYqXNSJq5C6XU/26BY6eoEldl5bb8ICYeCdlC8kG4ZcyO1+FkWdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWlTLJsq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2516C2BC86;
	Thu, 13 Nov 2025 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763045665;
	bh=1iW0BrdcYuWfbmGBaOox1kc2EnS9Qxrta7UYgGT6S3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uWlTLJsqOgHLEu+jQ0/l8hm/65beOx5bgEXT5VVF6mAR5DyNjPdjdqx7pt67Vskjf
	 iCfmwP/8s1SLH4f0f4zYLcDfU+kdIHqOViTyEMFobJ/VY+bOQL6uFYAwnnbaBJQiCZ
	 +n8XfRTlmAKpTOInjn6L3G9rEJczXLha5vFZWfZxIZ4UJjWtWoS8OmxCzBKK6TNOPf
	 y0S1bHfySn2OLON0IjxBsZQ3q8uV7ErdBER8bP/B8L0YCgX2MyPJywu5n7TZn1qgju
	 nKYj3ZX5YwsEKDPpGmCXve3sDYxOcI8Up7iVvj7oK7f7KGvzsKVu+UogAdtB2vhid/
	 Pll0HgghN9MaQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20251023-sm7635-pmxr2230-v3-1-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-1-f70466c030fe@fairphone.com>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: leds:
 qcom,spmi-flash-led: Add PM7550
Message-Id: <176304566170.1524829.17792235625966794976.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 14:54:21 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 23 Oct 2025 13:32:25 +0200, Luca Weiss wrote:
> Document compatible for PM7550 Torch and Flash LED controller.
> 
> 

Applied, thanks!

[1/3] dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
      commit: c42b91c426a12523b8d02bc6041f7931f199a301

--
Lee Jones [李琼斯]


