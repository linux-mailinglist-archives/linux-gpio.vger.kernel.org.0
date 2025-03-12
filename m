Return-Path: <linux-gpio+bounces-17479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5CA5D91C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 10:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70B63189ED9F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 09:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1804023A986;
	Wed, 12 Mar 2025 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3PKEM1O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63E2F43;
	Wed, 12 Mar 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771105; cv=none; b=NNU1wsDjrKi2wxvaibVSgaGqWA70/wDgdwCBnGCi4uZEtq0cnqxyVblkSA6kifyaBVKMSGe9z45v3MknBv2YlYFgELvfjLfzkwSXOGHkla3wmQq+XNm/EoOSZZvVBKI1E3AZIMMEqXGcUh6m/HLzk29notVR39tXUVP0CQ9rh/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771105; c=relaxed/simple;
	bh=L5LRFen0oPnHLLLTll7iSQFwMAp6pxeYh/KddPhM9fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMWPmB+cx4Vhzu9ytzV7Hvhh+if8ElqekKkafHdBPjdrpwtCcmuTABimH7yZM5zRZKjFzVWr2suOGpGdjCxcZFeyaJirMHkr+yuLKcm4jB+Fmwgg4fT8QP7G6Z/i/b7S/bK7WeWZMu7OIU1pgn2UunnyLhM+kTY0bsbrX0b4v2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3PKEM1O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D306C4CEE3;
	Wed, 12 Mar 2025 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741771104;
	bh=L5LRFen0oPnHLLLTll7iSQFwMAp6pxeYh/KddPhM9fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3PKEM1O5Q9QFmPBJypbkEgsY4Qe4QIo7anP/XfUx4kJkzUEHLAPGIxTCAVrjI645
	 xFPQbMyHjZJwpvK3mOWxQM32nBITXOYhhWlq6ZUHaxbaTyL/iRa3jsW2LgdIJTW+4+
	 QU64vc7XE24WX+P9gg/Zig3iEUZ1bOg0BdEgeN9OXXLImAaChJsYyPDolDqDUSL3Fr
	 miWDSSgQHGTBKOT8uh2dfqm+M3wv5cyYq2o2cz5NRg+nB7EpiODEL16+bEMkXG/wl7
	 R/Z7qAiTPwXQ2CAMob88dWIjaVTEejKdBb8ICCKJM08gT6e/3ajp5s+WM4BD4cmRst
	 8uZVu3iWEIjaA==
Date: Wed, 12 Mar 2025 11:18:19 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sa8775p: Enable egpio function
Message-ID: <l7yq5kdyfeb36tv5oighkh2qjnuo4u4afy4gybzq3jq3ufdb3c@dej5twju4c2r>
References: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
 <20250312072509.3247885-3-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312072509.3247885-3-quic_wasimn@quicinc.com>

On Wed, Mar 12, 2025 at 12:55:09PM +0530, Wasim Nazir wrote:
> Egpio feature allows IsLand Domain IOs to be reused as TLMM GPIOs.
> sa8775p supports egpio feature for GPIOs ranging from 126 to 148.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sa8775p.c | 58 +++++++++++++++-----------
>  1 file changed, 34 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

-- 
With best wishes
Dmitry

