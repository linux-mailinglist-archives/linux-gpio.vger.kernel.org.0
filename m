Return-Path: <linux-gpio+bounces-26498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4DB92052
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 989A82A6536
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90902EB848;
	Mon, 22 Sep 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaTfLh17"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F72EACEE;
	Mon, 22 Sep 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555774; cv=none; b=sd6SxQHaHmo7at5HnQKMmnJ6MQ4aHdSp5bYYyW1sRCYySJk++gukQDK+l7n+pquI4CoJa3A4lByZ4p0J3zXN+3uGmtxHY0qVdlpCb3vd9laB17DNOgSzvrkykBRziuWXxQpXW2DEzclYIqRt9JbMXI28rGJosZMJdyQKrlwQKLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555774; c=relaxed/simple;
	bh=DtPB7vfAnTG/7K/fZ6mIHFQTPh+w/VV+8h+Wu3y3m9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lINj34xD7eDzxhuWtLWeT+Ed0cFoOEw9XfXwcm3hwiGDw6Ji9K9PS/E8mswkNcg1ii0lwfxgsHP+KgPEc0pDHysoacyf24qD10W+Na1s5nkWnEN8tJPEItO37PY2w8KB2ra+w5Z24eGUo/FEmC0mjWx65+b/ElDLTek5yW4HNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaTfLh17; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09444C116B1;
	Mon, 22 Sep 2025 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555774;
	bh=DtPB7vfAnTG/7K/fZ6mIHFQTPh+w/VV+8h+Wu3y3m9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaTfLh17dpRXzYzcDIQb1yD0zsY8wX+grH2gOJaS5RpZTgg03VKqiShxI2d7klVRS
	 v9limkgRECyhwuN5cVr6j8Hf8IJJbx/44WWKXjzGnLbcaKd6ZmvXHevim2hj8z5xmv
	 0yc4y3OuE94StLQrALV9F00iFHMItOcjydxvSCb+FLjSnfJhMwsmK1wzpSYyTXK2kN
	 aRlZd37t5sstUZmhu8FxmENPjO4mgYxROkys9EVHALvd4CCTsIp0cbLWGYpBewR8Ja
	 FcS2wrKlwHF5sApduJAA7uBT1XGOUDUIkRFPt6Tiial/6NQIibr8TxVACTsQKm0Wgg
	 v4p+rg/hU7NPA==
Date: Mon, 22 Sep 2025 10:42:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: samsung: Add
 exynos9610-wakeup-eint node
Message-ID: <175855577061.34473.4077205637098992576.robh@kernel.org>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
 <20250914-exynos9610-pinctrl-v1-2-90eda0c8fa03@chimac.ro>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-exynos9610-pinctrl-v1-2-90eda0c8fa03@chimac.ro>


On Sun, 14 Sep 2025 19:34:37 +0000, Alexandru Chimac wrote:
> Add a dedicated compatible for the exynos9610-wakeup-eint node,
> which is compatbile with Exynos850's implementation (and the
> Exynos7 fallback).
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


