Return-Path: <linux-gpio+bounces-19885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47643AB1D53
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 21:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2EBA23ADA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 19:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94FB25E446;
	Fri,  9 May 2025 19:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KroXXuQD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C41425DD15;
	Fri,  9 May 2025 19:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819201; cv=none; b=Udum8qA1FOQ5P7ZUBwxRklVmyL9i0UFN4y8PB1nqMHN2T7Z6ToTnswmGh/iODa7FLlek9OKqr34wFPCADKYS4IPPGQZrf1tOftTpaoSqUYMt9TAIvXwb4S1z5rR6qxwagDSjBaonKwsVSf0jEEe1wDakjxny3fjuI+9SCRzxuyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819201; c=relaxed/simple;
	bh=cZWsn/WrnUyJlqVoRWFaa3KbmyBy8OY6VZ3uYwdOOwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWmVYcoHUESPtNihy/h8D5ACsDXTaCwAKL35YPv7g9uBAxnqjTssS4NZ8awJ621WVRyy0ZGsFMLxKlzM5qU+VBGX0Gb5YNVdK9v6XnxpXU3tMMjxiTZMTYHezgmKI/+1FiXhllRAmDNjredqdVMwMTJA/jHV0DZ+NToQOZTYZ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KroXXuQD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE610C4CEE4;
	Fri,  9 May 2025 19:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746819201;
	bh=cZWsn/WrnUyJlqVoRWFaa3KbmyBy8OY6VZ3uYwdOOwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KroXXuQDolo1Hiahq3uDYvpHeBlb5HGZvzcIL/rS4/z4Im3aDJkNQ7otdc8LQ3Ncl
	 GqXyu05gzQi36SWoPZRz2XzRnq5+b8cBwwU4LBrr28SKQ3iOAd1b4Q3Q+W5UkXnRjb
	 fCvKn01YZoDwkwPQrMk3keRhhFvqViA6Jf5aqwEAkGz8lzYWamTj/N2WEKvEg8FK1W
	 vIlHaiYW33N4pSB0/wUS8YMtxZaWonvaLorNTW21V7Org6BGjbN0jGq33MwPOJQ44s
	 tbI5/p+zc+lWm7i6KxBNmEi4kpeEOHDmo36tNaX213ZPQpSAgOPpm8/6QIeaL/8i34
	 p5W8NBv2PCzZQ==
Date: Fri, 9 May 2025 14:33:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-tegra@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: gpio: tegra186: Add gpio-ranges
Message-ID: <174681919863.4074988.5888386840789996730.robh@kernel.org>
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
 <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>


On Tue, 29 Apr 2025 16:33:31 -0500, Aaron Kling wrote:
> Add optional gpio-ranges property.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


