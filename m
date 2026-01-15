Return-Path: <linux-gpio+bounces-30614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F5D27E65
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 20:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6818B300AB10
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 19:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DD12BE02A;
	Thu, 15 Jan 2026 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzQdeiOR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B112E1799F;
	Thu, 15 Jan 2026 19:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503673; cv=none; b=Avz/gGRQUIcJ8Zx//PDpQshwKWWh0VE3rihuz9VnHXLBiAzY8Cqh6W6ec2IkENrwtFCHDce0ISXLLb2U9+9q2EIDpAR0Kx4Uo9Jg1OImmzvApgxr3k6rdVUNtTpxPA2rfqbAoZHKqU2+xFC9VIpUczljiTNGziqw9fHFYpqxqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503673; c=relaxed/simple;
	bh=kbDE4I87P0BVWxV+dNPffz+z+PAooAzag8YpvFHu/SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHDXLw45+cm57RDtjGDBcjdznW3vqj/ijTWvFWOk34b+BMboPxwSbRM2qMfGIXsoz03Ol4m/F+R8H/E71I+Qcaji/rPQ7nmL3xjoKI1VtjwdMqHAcyLZLl7l7GQ1k3AucAxgPuocy3AZFHt5how8Jv9bT1/5WIhdVxqvo/tbD+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzQdeiOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD8AC116D0;
	Thu, 15 Jan 2026 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768503673;
	bh=kbDE4I87P0BVWxV+dNPffz+z+PAooAzag8YpvFHu/SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzQdeiORsmFVr3W2xywsEeCDLaLp7l83NC37XK+pawV9POmYfLWH7j3bTeU0/Foav
	 vh3KegliIHHQqPQC4/HVSBz9oh44YoXok+Zq8VSDfurZS/7WO/zx/S/I1GSiUUctIO
	 6flNjhHYBt2Fb1Z5VBbO3NHHw7hWix2ub+kbz85TC1pU9NwMAMj3c0bB9hzwGVMtLD
	 Ql2MWpIaeLI0OfoVyaGtefaA1v6Z7yBh2QUZKJiDVJ5aJuHVV5ySbhy5v6F/3ren1G
	 tXmVmDAkFmN1ucJGeMP611PUCSSQbtOiFLkca+AlQmh1q4SqNzELMGaW799fr/2ik+
	 NgIMAR8w1heHA==
Date: Thu, 15 Jan 2026 13:01:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: jens.wiklander@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Leo Yan <leo.yan@linux.dev>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org, Conor Dooley <conor+dt@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: pinctrl: document
 access-controllers property for stm32 HDP
Message-ID: <176850367158.1015177.14103390194697312038.robh@kernel.org>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-2-5475c7841569@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-debug_bus-v2-2-5475c7841569@foss.st.com>


On Wed, 14 Jan 2026 11:29:16 +0100, Gatien Chevallier wrote:
> HDP being functional depends on the debug configuration on the platform
> that can be checked using the access-controllers property, document it.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


