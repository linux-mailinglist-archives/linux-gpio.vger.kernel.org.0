Return-Path: <linux-gpio+bounces-23204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2868BB03859
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 09:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C451B178FE4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 07:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EA9235BE8;
	Mon, 14 Jul 2025 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdGuz8X+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8823816E;
	Mon, 14 Jul 2025 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479594; cv=none; b=K63cVi6wawg9q+tkk9o+2XUfDMD3pgadliw5pjUeZZMDeGaJvxa/Tn7muq5xKh1cs8YVc7TZ7HR0VyvR8ongP5whujvWjEdgc2Yd++m6lEQdCN1q6Zi1POUZTXsKSN6Q7Nj2Kw7DNLapDBEk/vyEBdOGc9Gf6Zzz6wws3djfAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479594; c=relaxed/simple;
	bh=WyBsH6Kxr3hdAgdiGisPWnZhro430nfyV/zbVdiDpHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFZ8FhpPP/bioegmA3hNg0dVYlHIS+TVfTOcKNo4Owlxt9JGGN9UGuWOyPuKZHqirlXABhwKXBEAmPO2AiobGs77vfkUVCDKBS85+rgcw92A5viieAofT8jzWXrig9FHyg/01J2OL85+PaJrX1AU/DyAm9Orh8JCEgl82q/CLvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdGuz8X+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA81C4CEF6;
	Mon, 14 Jul 2025 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752479593;
	bh=WyBsH6Kxr3hdAgdiGisPWnZhro430nfyV/zbVdiDpHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdGuz8X+SZTnxwRMQ4Ku8I12IdU7nKmsXDcpINxZz5/DsmmIHHJpfNLG8lRvr22mh
	 a5SvxkgfZhurFFI+qwC4YuYhdlIpFrS1UkEf724svoHxVTdNGATDEMS2RDNGDrkEwV
	 FR1Rm7RfhP3mhKOIJKIqfWM33qJNgs9uEDbC7t4b9SnAt1uI7cy+C6681LoIrZxkJU
	 jVHUnuM/NIlMd/sDXGrBLAduvled/NyiUZMqYPe2dxNUluVeOmti4bGcafgAVreiQr
	 PGFQJ+iOakMytLzmYAcfjfVh1uNfP5Fb00OfGRczZeI2xG24R2vXH5souGsXCIKz3h
	 sGucDBULIbGvA==
Date: Mon, 14 Jul 2025 09:53:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Message-ID: <20250714-subtle-ambitious-penguin-c4a8c6@krzk-bin>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>

On Fri, Jul 11, 2025 at 05:44:56PM +0800, Cathy Xu wrote:
> This patch series introduces support for the MT8189 pinctrl driver,
> include the driver implementation, new binding document and pinctrl header file.
> 
> Changes in v2:
> - Modify the coding style of dt-binding.

This is too vague. Anything can be "modify" and anything can be "coding
style".

What exactly happened here? There is also no v1 link to actually check
previous discussions.

Best regards,
Krzysztof


