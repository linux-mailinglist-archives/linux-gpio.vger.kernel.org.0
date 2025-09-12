Return-Path: <linux-gpio+bounces-25996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A1B54284
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97EF54E183D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 06:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E27728313A;
	Fri, 12 Sep 2025 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jROHFO4O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413391DF270;
	Fri, 12 Sep 2025 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657265; cv=none; b=URUKLcTq39udHqW0WolWTCd9rqWLOhxZOvpCRCCsxX7q3CGgiNs8siMVFPc9DxhE9ij22Pk2DIa5V+gTY6ys8T+88H1X9nGqxFJ3GpPwGAgp0Hy4OXbLylGTHrys5Fkl1ltYU/Elj+eHIuXYH32OUWeJDdjfwpjFkgHUXVmw5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657265; c=relaxed/simple;
	bh=Orb+VsfkJaRzsj41NR7vEo3YY27Pbey1RakvGK1RuKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ic/+qPAqzeo0ZZj6+razG3AL4MBdgn9JlcGlSO9qKpWsjbAgzdj0FffmUvjXjR5gY3+OaoJKpX9/cKJT3z6zYRMagLASsUYX8ws53DyZBJ9Npvv3O/EHdfIeXmm/gPdwhkbWpCpIqLXVwkWgtTFR7vNu7hIokoxK9CVRoEF76u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jROHFO4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A93C4CEF4;
	Fri, 12 Sep 2025 06:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757657265;
	bh=Orb+VsfkJaRzsj41NR7vEo3YY27Pbey1RakvGK1RuKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jROHFO4OhNFjQA0LwB4XzJQ1Bald5dpNoHBInnMm4SwxCfSU/DOyUefTNvHSwsi7b
	 p5mlc7/j808w2wwrozVhRth2bXxKv/bUg7GFFDKqiFeQl1qI37ZezJKqBvSBVEc39g
	 FK7NmcUk6O7jMlm9okELv7RVWi6xNjI6nGP+JzEuSH1+HFLYnmhwHntwYzLDuJqtRQ
	 CMKzglUBwGwWTzMHuor4H7BMfN8gsx/hhYIMcFqyqyT1tYiWwKIZd+ZZXYDKdRQvnB
	 PpJOjZUXx3ep7XTHxtXpBJZqPi7f9E1veLLM2f7vG6o4k+O/J0kyASYvGMOxW3kXz8
	 3hZtAOwZjqXLQ==
Date: Fri, 12 Sep 2025 08:07:42 +0200
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
Subject: Re: [PATCH v2 02/12] dt-bindings: media: Convert MediaTek mt8173-vpu
 bindings to DT schema
Message-ID: <20250912-unselfish-quiet-hound-46689b@kuoka>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-3-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-3-ariel.dalessandro@collabora.com>

On Thu, Sep 11, 2025 at 12:09:51PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 Video
> Processor Unit to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-vpu.yaml   | 74 +++++++++++++++++++
>  .../bindings/media/mediatek-vpu.txt           | 31 --------
>  2 files changed, 74 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


