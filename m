Return-Path: <linux-gpio+bounces-26183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B9B58368
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 19:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 892A37B3D21
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 17:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA4E2C3756;
	Mon, 15 Sep 2025 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kk/wIOVo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B82848A8;
	Mon, 15 Sep 2025 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956840; cv=none; b=ROlpwmt35xm2AOlLRgk7+dBpAsmAdzZ0rs9Vwo4VCEJxfKCMy3Zwj5/5IQEDEzsW69LsYEk8z5h+pyPwjPUhDNHTg0jNb8IL/N838+L8Dr5t/ARhzbu8LsHJ2WBUlUqctJ5mgciVpeoucbi5UGkbyVB80iRwberRVCIMDmsX56Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956840; c=relaxed/simple;
	bh=IpDEJIKERU1JCTNIEi7Bdle/d8rWWRqcg2dcv69TTj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJ42w4WrUXhGMjMaBTwsSGU/Wy4WufHUHUGhcyCO+kancN6pYEiHS0hajnr3YHIv0YrcwDcpKwoO+DuOdqCn8U7OR5+A/nLDCrIaLZEX0/HVdi+vgkL6cSnYjIOPPHCzypzApuxCQ5SVCI/z64upeuIUAJ58DRXi40ha3xAHj5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kk/wIOVo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2725C4CEF1;
	Mon, 15 Sep 2025 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956840;
	bh=IpDEJIKERU1JCTNIEi7Bdle/d8rWWRqcg2dcv69TTj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kk/wIOVoJARgFTwbJ31RhqUlmthMISBT5ZrvLG3733qp63L6xV4JuDFUNRObL1T8I
	 OluLwHjftnqeqvt/LyM90jqvcD9szTona6pBQ0L8/vwUy9+b4ROeqj2tiBdjwh3qqr
	 goV072M3LdPHXlV43F8TQMpBr6addvBsJinTpi0a8IGGGyN33iufCItKg7jyzsM8QS
	 HEFAIUr9nl/46ZCc7gmMsvpycJMcnhpYOJnrbVKs93ITomcpQRzz3DJBbI8bNjXhk0
	 rRXEhpC5BpqKGcBmEHrMLghe7VjHciHqIsKNFtOUWimaPmm1VEu4lOQWLBjVJb0nOC
	 KRYZx0LCiLDaw==
Date: Mon, 15 Sep 2025 12:20:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: minghsiu.tsai@mediatek.com, krzk+dt@kernel.org, kernel@collabora.com,
	linux-bluetooth@vger.kernel.org, louisalexis.eyraud@collabora.com,
	chunkuang.hu@kernel.org, pabeni@redhat.com,
	yunfei.dong@mediatek.com, houlong.wei@mediatek.com,
	airlied@gmail.com, angelogioacchino.delregno@collabora.com,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org,
	maarten.lankhorst@linux.intel.com, devicetree@vger.kernel.org,
	simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
	edumazet@google.com, netdev@vger.kernel.org,
	support.opensource@diasemi.com, marcel@holtmann.org,
	broonie@kernel.org, lgirdwood@gmail.com, davem@davemloft.net,
	linux-sound@vger.kernel.org, amergnat@baylibre.com,
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
	dmitry.torokhov@gmail.com, p.zabel@pengutronix.de,
	andrew+netdev@lunn.ch, mchehab@kernel.org,
	linux-rockchip@lists.infradead.org, jeesw@melfas.com,
	tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org, mripard@kernel.org,
	linux-media@vger.kernel.org, flora.fu@mediatek.com, kuba@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, luiz.dentz@gmail.com,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 09/12] dt-bindings: regulator: Convert Dialog DA9211
 Regulators to DT schema
Message-ID: <175795683847.2967801.14952293094675548520.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-10-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-10-ariel.dalessandro@collabora.com>


On Thu, 11 Sep 2025 12:09:58 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
> Voltage Regulators family to a DT schema. Examples are simplified, as these
> are all equal.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
>  .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
>  2 files changed, 104 insertions(+), 205 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


