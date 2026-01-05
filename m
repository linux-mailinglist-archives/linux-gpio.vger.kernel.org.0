Return-Path: <linux-gpio+bounces-30154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972CCF4824
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 230A1308F19C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8A4313279;
	Mon,  5 Jan 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7yQI5ie"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE722314D2A;
	Mon,  5 Jan 2026 15:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627217; cv=none; b=k8se0/cNmvFZb44IQOkYKfVh+Nh8b35fqTUdzq2XG067bz7LqZFqEyWKNE53GlLgQaxyGhxH273V/+oD6ene98cQQNhaLeM3yrAKhOm6KgSkvipuQ+ILrmiuKR+Mv1CWufoyPBTOcniLxMvJ8SLOve3/RENCDAfkaGpuv8O/eE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627217; c=relaxed/simple;
	bh=2TUnTwLALmyqSo0DDriwRQuhuvNAimlpfD0ngtNNIOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f19ZeVNtmh0IXxVNbRQ1h7v2fkVAm7muVWQkWVCR9Lr38rPGznD1r1NYB/yi7o+tRs+6jaUgz9cZl3FjWQOHasxmT7v/VFUazp6JCWCmxe6kvG3PE/iycUWnt+qAydLuHCYHZ8NLAvYooHC7Yiaos6uWzoQWySgf2vloYvh0HJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7yQI5ie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6D8C116D0;
	Mon,  5 Jan 2026 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767627217;
	bh=2TUnTwLALmyqSo0DDriwRQuhuvNAimlpfD0ngtNNIOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7yQI5ienAgMRw3pbOaficdtkhz6twRPt06VvCJwh9uG2ICys6fX0GZMr1omj7kIy
	 0KPlO7y3GlqzlN7HHktsBbaA1eWnABOrqvHYsUAZQEkZRp658usA1A2YZkpuRJx27G
	 Mcq5UslHu6lu4ejdS1CrC57Nvg3SPynD/M6oX3DjNwMWKWWgehhJvT8VrWDccQB1Ud
	 0SGz3kg3M7TDZ8+Xt7uVxP+hDs4ARneqRMnEW7bI8RMK8RcHja+lOFpQzLogtEeOv5
	 RqojFHgMv3lLwTbc24XkNjZe5D+7WNYgzy+ZZ2+USLRGAiJNG4Gnulb8MU4k8yA2Js
	 i+hpGySbB6EYA==
Date: Mon, 5 Jan 2026 09:33:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: intel: keembay: fix typo
Message-ID: <176762721572.2585201.4995593185766257457.robh@kernel.org>
References: <20251224123748.2875868-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224123748.2875868-1-weibu@redadmin.org>


On Wed, 24 Dec 2025 21:37:48 +0900, Akiyoshi Kurita wrote:
> Fix a typo in the documentation ("upto" -> "up to").
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


