Return-Path: <linux-gpio+bounces-22229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4410AE8F02
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 21:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36A464A5ECA
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 19:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB5D2063F3;
	Wed, 25 Jun 2025 19:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="seDyqdw1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25741494C3;
	Wed, 25 Jun 2025 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881163; cv=none; b=PCr0HuYy+7NdM5vLOxcd+VIVD3jjYDGmBM8buVG/0dw+YnBeWRttBMfTFokccS0orPsfa9I2mNgb2yuf60/LKkoNtjV+pVtSjg3o0ST30oJ667f7JPrJiHX77JkzdwMWRdSWNMXwTUzH/33nyfxUCUffbOgbGawjP3Y/7BLn4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881163; c=relaxed/simple;
	bh=VDiFnUxzpQuStKAHouo51b9DQbguX6DQSHvm/hd/xaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbT9AgpMne37nNu2nEITdqLSIivptKYJ65LzaseegBougBgzNO2fDYhTNJAaHJ4KRD6SkU9rdLl22ZjBmBrao0GPrAsEP9L8NxThXzNFMv5HumeTU5DxpUQHNsXoVcK43QzvGJpPutwNr0f9bo/GqEsso2/b363oVIbtU4uugMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=seDyqdw1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C74C4CEEE;
	Wed, 25 Jun 2025 19:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881163;
	bh=VDiFnUxzpQuStKAHouo51b9DQbguX6DQSHvm/hd/xaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=seDyqdw1PJyKNbIhPu45Et06m6kzdAoVPPVwGA4LGIRHvchPiRZ9ODsLXKvcJcrLk
	 pSoj+DrmWFvbqFEZtv5RQ5V30UjtwuGoCtsNcCIh2zKFvwQQ/s5x88UnPqBJIwVP+t
	 xe4xflhWUVB+h9fm5VABSduTzYtI6plFNNV6didbcpYOl0WUjXU/IKWWvDWi00jUsy
	 oQMgVmJ/tb9+VJFDD0/SwMB30iasbolNySCZJjjmAc6zRnG/+DlxXYhuYUxbXjrVq8
	 ZfKseo/ULwtZwf3zcoT7/rcHi/kske3yf9fF7ahLnpg2YHPEz9jf6j1pArLJXfL18K
	 /TIiewH4Inj2g==
Date: Wed, 25 Jun 2025 14:52:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 5/5] dt-bindings: pinctrl: stm32: Add missing
 blank lines
Message-ID: <175088116219.2109196.794723987719315841.robh@kernel.org>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
 <20250610152309.299438-6-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610152309.299438-6-antonio.borneo@foss.st.com>


On Tue, 10 Jun 2025 17:23:09 +0200, Antonio Borneo wrote:
> Separate the properties through a blank line.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


