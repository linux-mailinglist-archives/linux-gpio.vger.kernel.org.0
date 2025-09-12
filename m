Return-Path: <linux-gpio+bounces-25997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43857B542A9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC56C3BE480
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 06:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E87C27FB2D;
	Fri, 12 Sep 2025 06:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAfBsjAS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5F134BD;
	Fri, 12 Sep 2025 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657975; cv=none; b=X7pYdzTJOpdaWp2TbcJS6Nkyj24dzj893fNKUzf4mZnkSIHtBJKnFJxcgQbGm/jJhiouxHvz7m/+kuls99BtBlwt4HcwDSPkchsscIn/3sfnto8Mn5zWvG8c6iO7eco5gcWd8aCaSGGc/GyoyfdotE9X0CWJ6AnL1zvBcF3C93g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657975; c=relaxed/simple;
	bh=o8hk3zQNATXcYNezfLWUb6kcglAXSeb1kRjCzbDhJIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzgtSpF6mXwH7jDAD0UqGaW4ZaBURKsxuu4G0cKnTfdcHrUTsyR7kP0VkgByDFvoYyoSaetRZQXv7ZELQvPeFo1jEMDbOyxe34CD8LU4fszuk7WG64CWy/fUc+P7FmVOExaLT00SGdPUUOYH6Y+MTzdayE9Nxs4l92uAz5Mvqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAfBsjAS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1432C4CEF4;
	Fri, 12 Sep 2025 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757657974;
	bh=o8hk3zQNATXcYNezfLWUb6kcglAXSeb1kRjCzbDhJIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAfBsjASg0j47G0aj71WpPiHwEzVjLh8frxE9MTlUre9o4kgdD0AT9C2l8NxGKnp8
	 7IFEcYbPKl8ue4IGOaLDKbEJWbquIJXUUac3GR9E8dEo3Jh7cz5KyP8qh3mPDlVArz
	 meCJadPxluLfi2gaQmclFasUpdycrQpAxtv6mRtBuVlbMKoWoMt6LIpZ7jlivjF0dg
	 SBAPM4eomEn87Qqye6+Q6x4eBzcUHZ4H1iHg9AmOB6gpsAuvBFvm28piizL42FE7pD
	 /GR042vD8YIz4ZS/9nvYqbhp9jXT7LOUgXCQDvL0U4FZWriZxiFMJkIGihya5dMtB1
	 KwwnUs4bBEHfQ==
Date: Fri, 12 Sep 2025 08:19:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, heiko@sntech.de, 
	houlong.wei@mediatek.com, jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, 
	kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, maarten.lankhorst@linux.intel.com, 
	marcel@holtmann.org, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 06/12] dt-bindings: display: mediatek,ufoe: Add
 mediatek,gce-client-reg property
Message-ID: <20250912-innocent-polite-cricket-05dbd8@kuoka>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-7-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-7-ariel.dalessandro@collabora.com>

On Thu, Sep 11, 2025 at 12:09:55PM -0300, Ariel D'Alessandro wrote:
> Currently, users of Mediatek UFOe (Unified Frame Optimization engine) DT
> bindings set mediatek,gce-client-reg node property, which is missing from
> the DT schema.
> 
> For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
> causing the following dtb check error:
> 
> ```
> $ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> [...]

You can drop above 4 lines, they are obvious. Your "dtbs_check error"
message already defined that.

> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: ufoe@1401a000
> (mediatek,mt8173-disp-ufoe): 'mediatek,gce-client-reg' does not match
> any of the regexes: '^pinctrl-[0-9]+$'

The warning message should not be wrapped, so this should be two lines.
Maybe entire warning should be in one line, at least that's what I would
do, after dropping "arch/arm64/boot/dts/".

Anyway, no need to resend just for these. Thanks for the update.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


