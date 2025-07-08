Return-Path: <linux-gpio+bounces-22913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB451AFC577
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 10:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DB86562F60
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 08:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1F62BE7AA;
	Tue,  8 Jul 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh3rMP0s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDB8259CBE;
	Tue,  8 Jul 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963023; cv=none; b=BgIdcb+mcmQgZ3LKFgHWiKgh9qUvdw4bqYYel64bTjQsuHIdJjM+nnCdzWwuvFWC8FVbrv1aGtiagd+6cqn6L9K05q512c2yUmxDrliSXTEB4SlfiepdwPYhLROFo9N61IsKHwVZX5WgAQDnSxjxgjxaxnmmKKHdiTLbZnvea8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963023; c=relaxed/simple;
	bh=04fxKIPR7A/qlWWH38RuP8SatwNUghLoerN0uo/s0iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYuRu4EiOBC8qjb3OxLksKDkCI/5T10XxYMSsH5+EHoCujOlBJ9P+P0aykU+fzUix2O2iApavI4Gk/TS0rNgZOI6sCcvvrEJ+QKkPf203SiqWw7X740p+e1SkpNym70ajl1R7W/j7NVchk0LIfumF6HWqVAuDWHMFrDgmRB5Qr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh3rMP0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0062BC4CEED;
	Tue,  8 Jul 2025 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751963023;
	bh=04fxKIPR7A/qlWWH38RuP8SatwNUghLoerN0uo/s0iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh3rMP0s3+3HAsTZ7OUQ0u9yqkkuo75AfyvZFwBV9NqosfYqF24aBYZMJI6h/mljv
	 +UkXKoEjKeeBjJ9BjcvdD1lfC0fvkfiUB7VoBlwWcQf80rXGF6nAjMK4zW3afZpxFH
	 wzMDo/EFEX1CQD3OOKGD60Z4kOa17kL6bgRB+vMQiDUyQkLfyIDys65TPj6Owp+kyn
	 qQU5P2zScHWoeDiTkgz1bCoMblhBik5M7zepyqD1iqHOBNOhNbEoc5iUa7gxb+jX3v
	 qF1LM+NjuQfK09E6OTOg072DA75S64r0yDqrPWXLa9pF0WT6ruA/Zr9wkmvOplODCN
	 l5cEpQomjQ7Pg==
Date: Tue, 8 Jul 2025 10:23:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104
 support
Message-ID: <20250708-thundering-binturong-from-mars-417ba9@krzk-bin>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-2-68d287c4b630@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmiv0104-v1-2-68d287c4b630@fairphone.com>

On Wed, Jun 25, 2025 at 11:18:03AM +0200, Luca Weiss wrote:
> Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
> to include the compatible string for the PMIV0104 PMICs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


