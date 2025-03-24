Return-Path: <linux-gpio+bounces-17901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85973A6D5CD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFB213B3331
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEF425D206;
	Mon, 24 Mar 2025 08:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOgNvj+4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E718C25D1E8;
	Mon, 24 Mar 2025 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803438; cv=none; b=tvpuCj84ltkr3ECa/IC4gt9WmD2sIsN1PSzN7BbY2Y3nn23anrURlFvj/mRs0XmRkkCW/LQLa42WNo8+EtvQQX+vzmMteLlMTV33X82owg/fSzaSbxZZHuBnsoPpJWJOodV+z8r8KyplMoMEir0w+fHk2t/EpPI6X6EVWJPFT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803438; c=relaxed/simple;
	bh=bVc8ppawXuFZXap+bB2SZMErDGCzppriuGtA2w5+FAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OokueUvgb59LmMQMywgEqoYwY/n85SuC/oJ5ddh7Vgz14cIJTIsFcAOF1p0sjpRgXkB/BZvKTv4lTLhqgitpCxbrwTVB/zNkyaX03unqUpQWChfBv6nUs2auCUIv+Tozt0EZ6x7AU0qgd2pWlAiubizlCJB+ECV03kaBmQnCu6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOgNvj+4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3279BC4CEED;
	Mon, 24 Mar 2025 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742803437;
	bh=bVc8ppawXuFZXap+bB2SZMErDGCzppriuGtA2w5+FAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOgNvj+4vU03obYi+4rPDzBTYcup6VXKdy48bVjZY6PqjIisLRYuY3vw6mZlt/36Y
	 Qp8RlSvpnNGvrkfVDldpl463p3uAyBim2nJUr97B1zXu0vL4sDVBUDHTz3B91gM9pG
	 pF0t2ToYS+gmDEc2gVDUHqSiBc4XpuDBmZKaNEtX83WtvcxKtbL6/a4IwVj4EEzGHA
	 RQs5HW+XG6Rv+xUIvvLWndqebzugrx9yh5iVcDQKb7zd3otnRekULB1b7urTymwzpH
	 QtxZBeqNN5N40hvz+WNY6e+BCNfQDGVbMZnnl2B5p3anES6LaWIHIBjefo9fyjUE1j
	 QhLzPg5V7a4Vw==
Date: Mon, 24 Mar 2025 09:03:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, yong.mao@mediatek.com, 
	Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com, 
	Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: mediatek: mt8196: Add pinmux macro
 header file
Message-ID: <20250324-cunning-ruby-lorikeet-aac6bf@krzk-bin>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
 <20250321084142.18563-3-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321084142.18563-3-ot_cathy.xu@mediatek.com>

On Fri, Mar 21, 2025 at 04:39:13PM +0800, Cathy Xu wrote:
> Add the pinctrl header file on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h | 1574 +++++++++++++++++
>  1 file changed, 1574 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
> 

Where is the change adding the pinctrl nodes to the DTS?

Best regards,
Krzysztof


