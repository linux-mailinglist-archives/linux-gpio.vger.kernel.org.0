Return-Path: <linux-gpio+bounces-23831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C6B1255D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57FD1CC1F8B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7206825A34B;
	Fri, 25 Jul 2025 20:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCV5qzX5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D16259CB9;
	Fri, 25 Jul 2025 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475303; cv=none; b=YMMzQ/GOt2AjG0Q/DzMM9yJlolqYvhg4lWU0/PxcSWNAAIKWd6uUkJ7DqIkNwjLQfrXOw7ugzz6J4mprQD2zuB/GF0ihkDsBhLREjwpBOnl5eQ+67dTUMsKpdttpMh+j6LGw/AFFA/TzKPZqYhcnG8LvhnPWL1hDGf5qMFkHOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475303; c=relaxed/simple;
	bh=90YjidsW0zLfZ2EVgtXoscfqDLtrHgB9m/jDQVG5PWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poN5paSHAcJMxmajYP0YQEaODsqoFKocUdZc0aR4YBwP96UxuN4g8X6HqksuW15Gg7z3ShoW19Ot0Ld25Am0s9RjeC4hgOw3fjEoayq3olpqTfYl5hyLL5h8T/LAd9fe++rBUNhGwGvqgffobvIPsPJglcncU/1V9ji4uNrkdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCV5qzX5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DE1C4CEF6;
	Fri, 25 Jul 2025 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475302;
	bh=90YjidsW0zLfZ2EVgtXoscfqDLtrHgB9m/jDQVG5PWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCV5qzX5FcJQA4jUKlOvPOf0uPNZFnxjS8SpjO4vPyWdTLmiiniC01y1vRcAEqpuQ
	 ch5awJmTQUZXLkBsqHUw8LR+DvmjjRGNmsiUY3gnWa8juFrOwKLkFaNAywPkRH6X1L
	 2T0Rm+Hnl3I7WH874DB9G1Cfg/rBdOomAfOL9Z0F4gujhwDlk7z4Qvs41FKYpl6kvB
	 +oKfi+dcjn9xFtoLqSl9eOho8FtJ+BZkG4T8okai1wn2zzuXT59v/kd0lUfL7zYJ5a
	 5n5RQAebqjE94nWw6X5XcvwBXf1t/4PmAN0PROqQuBvwdbxGx/oE9W1UiLZLYeAWPz
	 ipk20JnM64rnw==
Date: Fri, 25 Jul 2025 15:28:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	chunkuang.hu@kernel.org, atenart@kernel.org, ck.hu@mediatek.com,
	sean.wang@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	airlied@gmail.com, olivia.wen@mediatek.com, frank-w@public-files.de,
	sam.shih@mediatek.com, krzk+dt@kernel.org, simona@ffwll.ch,
	eugen.hristev@linaro.org, fparent@baylibre.com, mchehab@kernel.org,
	herbert@gondor.apana.org.au, tinghan.shen@mediatek.com,
	jiaxin.yu@mediatek.com, linux-remoteproc@vger.kernel.org,
	jitao.shi@mediatek.com, linux-sound@vger.kernel.org,
	mripard@kernel.org, matthias.bgg@gmail.com, jieyy.yang@mediatek.com,
	broonie@kernel.org, shane.chien@mediatek.com,
	linus.walleij@linaro.org, davem@davemloft.net,
	jassisinghbrar@gmail.com, kishon@kernel.org, lgirdwood@gmail.com,
	granquet@baylibre.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, andy.teng@mediatek.com, linux-kernel@vger.kernel.org,
	daniel.lezcano@linaro.org, mathieu.poirier@linaro.org,
	linux-phy@lists.infradead.org, p.zabel@pengutronix.de,
	tglx@linutronix.de, maarten.lankhorst@linux.intel.com,
	andersson@kernel.org, houlong.wei@mediatek.com,
	linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-media@vger.kernel.org, tzimmermann@suse.de,
	chunfeng.yun@mediatek.com, vkoul@kernel.org,
	linux-gpio@vger.kernel.org, mwalle@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 03/38] dt-bindings: mailbox: mediatek,gce-mailbox: Make
 clock-names optional
Message-ID: <175347530117.1835509.4802205566620946645.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>


On Thu, 24 Jul 2025 10:38:39 +0200, AngeloGioacchino Del Regno wrote:
> The GCE Mailbox needs only one clock and the clock-names can be
> used only by the driver (which, for instance, does not use it),
> and this is true for all of the currently supported MediaTek SoCs.
> 
> Stop requiring to specify clock-names on all non-MT8195 GCEs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


