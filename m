Return-Path: <linux-gpio+bounces-5304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742789FF5A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 20:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6F2A285326
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 18:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C5E17F375;
	Wed, 10 Apr 2024 18:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AINa+PdN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7B168DC;
	Wed, 10 Apr 2024 18:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772113; cv=none; b=g6YmE2Ty10bWA5m2VvmA6G4MC+dp7C4raYBJ0krxPFCWveAOIL7AlQSpeZNgEBQgX1evUB70KuOXNM7BdVhnZHJ7Lw4FZ+p8pTSySQwpj8Gt53HUqNjsh6G2R1jxY9+dLFySdKPiNdBy6Qhw/tzLFlYTZOgR8tpJy/63mUPamy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772113; c=relaxed/simple;
	bh=MZz1uscgJjUE91n5tjQi9OI3q1nd+HG3AgIM789afzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahbGt8bm5+zOVQONHK4VG8Bz0WrF1v/lwUfvbqaIYNz1Nf+EcBrG3G6tE3TtuX7AQ5RTwvwjLY5K4gSrpSdBLWkPtTEGZJ2/jwGAs51XFLIY782sGw4puhV3XI5URJj+l7yIMy4TpSAD8BuBcx/qDWy6xdw8CtLPDQsNFqA3I9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AINa+PdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD29BC433F1;
	Wed, 10 Apr 2024 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712772113;
	bh=MZz1uscgJjUE91n5tjQi9OI3q1nd+HG3AgIM789afzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AINa+PdNFp2FCpEmv4ZIW+885N91+KeYCUrAbRLFpl4pInTP8rlhn2mkDVfSsGCsR
	 z806KoDPRzdBHefAaGd2TRxSL7hWDmJFKoZWRYobgjg+vnc/mxKc/Pm9qDuuH9ACxC
	 f1eVJ5+U++lOzsq6HK4ZAveKtAviN/DRE0eSjuE3ohKXpI7QpqIxQCEZ2rYBwgE+fL
	 19I9oUKzh3N8ZPrJifJ1GaBXV7uaPFAnAn3pjsqW2FyNCw9OB3LdQfI+czpnWVsiCe
	 1y6VRlLNokRsjeU+Zr/60RPDs5+TzGECHdxxQNx4w1sXerguZKGL6LQ29r5mY7TFbK
	 xNoahGyNrXH3w==
Date: Wed, 10 Apr 2024 13:01:50 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: mt7622: fix array
 properties
Message-ID: <171277210827.817137.5601296332288288674.robh@kernel.org>
References: <20240408090506.21596-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408090506.21596-1-zajec5@gmail.com>


On Mon, 08 Apr 2024 11:05:04 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Some properties (function groups & pins) are meant to be arrays and
> should allow multiple entries out of enum sets. Use "items" for those.
> 
> Mistake was noticed during validation of in-kernel DTS files.
> 
> Fixes: b9ffc18c6388 ("dt-bindings: mediatek: convert pinctrl to yaml")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 92 ++++++++++---------
>  1 file changed, 49 insertions(+), 43 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


