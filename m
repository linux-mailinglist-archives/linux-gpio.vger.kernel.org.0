Return-Path: <linux-gpio+bounces-17444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEBCA5CCF9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5793AF0A2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE2E26388F;
	Tue, 11 Mar 2025 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rzo9hpQV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAB184F;
	Tue, 11 Mar 2025 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716027; cv=none; b=D5k/21FahCmcwBL0qxO5bqSwmtF9unumNxNjS6CY8PBWB7nV9jgG5TNzpejlM4XLflzz5OvsxhTQbjmynYEb06oU1O8ejRkVQiOerwTNptKDMWL/INSFTlYro9jF6D8xl6GthGFvH7/jTUcfnwXN1OQYiHmsS/U8O0ihzVvM0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716027; c=relaxed/simple;
	bh=L1Cb7EESZgqFczyBEHcCr+eebvdU5d0Tk4r2MQmfBX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU3LgF6vJuFT/8CIv73/AtCa2J/nqWTERQVoJqFWmu8vnrxn5J9Z7nFkk/ARdEJ6mNmY8sZ3mwwnboOERg04H6QId86tBgdugHUjO0WKfj+pv+Zl76KSe3bIVRaHdzVbwQcMD8gm3VoSKon628WuYBmWnG6zddCdzjKMpzGAPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rzo9hpQV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A57C4CEE9;
	Tue, 11 Mar 2025 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716027;
	bh=L1Cb7EESZgqFczyBEHcCr+eebvdU5d0Tk4r2MQmfBX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rzo9hpQVVuTQrj2ul6guqj4v7EgzwsUuP+2HHaQphifFX5nbJ15MWW3uZAGzOHxL6
	 oP8Ulrp+ueyCnMb4IJK+2xWIh1ea3fnFBG/zpkMzlZZN8egGOC7MA5wuJgoI3UDSKL
	 R/1670wr6YDhsM4DkjSvo1mzBEQNmyZKsmY0X7twN9QqSMwa3S4FTvZWSR7dyCAF1c
	 AGnXrZVUpGpy1s8e8xeOe5yG3b+1qLCYeaLZfNM1j3m0CD35+JhtJBIn+s3zBARQu1
	 v8L1kOyNYDpOwXGdWcuKnp8EO1UMTIun1VXfuq9Snpi/TsgmUhns4EQ1NIlHAbMTSh
	 rW1ZpgL4rkSsQ==
Date: Tue, 11 Mar 2025 13:00:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add missing
 gpio-ranges property
Message-ID: <174171602460.3890634.5672219037612779159.robh@kernel.org>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
 <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>


On Fri, 07 Mar 2025 18:08:19 +0100, Lorenzo Bianconi wrote:
> Introduce leftover gpio-ranges property for Airoha EN7581 pinctrl binding
> 
> Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


