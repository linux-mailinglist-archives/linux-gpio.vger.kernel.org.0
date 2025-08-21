Return-Path: <linux-gpio+bounces-24753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E1B2FA5C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 15:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D08017FFBB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 13:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A8E33471F;
	Thu, 21 Aug 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnBgB5CT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8777334378;
	Thu, 21 Aug 2025 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782694; cv=none; b=QcWGiPyoep64c5GzbAYJ7EDqwNZSqe22YndGKhiDFnrAMBXdKnWCUhm9YAhKLHN8MFLc2nEjdE6DT0yV+D2K5vMPUy9cuE3onDTLg6AkLpCtR/2bYjmDLhN38ecbpCdSE+5YGiId4uT7rLuYBEYdV3ZbhJVW0MWkMjxfutxjuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782694; c=relaxed/simple;
	bh=76ReIJtXJzBwzWrjJa65Ko+8l//Yi0hjkZIdqxBBBC4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RmhO+oB7Llr+QsStDx+ilgypEj+cP/uDdKKac/A3bHaqoBuW25k3HVUzDO3MKwZtIXxHoTbmXtiEN24ctUyJvTMRewg2x+zgcVw9LT8ldX2ozSwK5lGgSbyoMf3h6FUx0lRVOYtT94saNgenVQo179P4RGFGm2oUmLaz8AmEPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnBgB5CT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFE2C4CEEB;
	Thu, 21 Aug 2025 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755782693;
	bh=76ReIJtXJzBwzWrjJa65Ko+8l//Yi0hjkZIdqxBBBC4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RnBgB5CTZ17kmiwkBbDAExo7pQlNQ7peebeeq092niVb2vM+IwmJxsaCAvlOS3f1A
	 1KXPgaHqN2qA+FxKYuTun7TaAYGIOyMoiJwznaRPhIPEf4jTowAINPvQa5U5Y/q2cm
	 31QZA8P9XHmdskehrqJbo59m7Mlp3EwsKBWt55rxDk06koyNoMi+dS8TV3XLfBuySg
	 BUN7JtkuVLrS9PAtC2+onlSRb59amhYyTZUBKjLNryTjslMPmnQOlFeQij1/xLGXTP
	 g87wdPfMA2peIEu6ojeGdw+oPlXqMg0JJ2c5MCSOLr2n2eQ+fqaYHiBWU7p3uiloB5
	 8ovoQJMVlfSvA==
Date: Thu, 21 Aug 2025 08:24:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: flora.fu@mediatek.com, chunkuang.hu@kernel.org, broonie@kernel.org, 
 linux-gpio@vger.kernel.org, mripard@kernel.org, 
 louisalexis.eyraud@collabora.com, mchehab@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, 
 conor+dt@kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, amergnat@baylibre.com, 
 netdev@vger.kernel.org, tiffany.lin@mediatek.com, 
 linux-input@vger.kernel.org, airlied@gmail.com, linux-clk@vger.kernel.org, 
 jeesw@melfas.com, yunfei.dong@mediatek.com, linus.walleij@linaro.org, 
 sean.wang@kernel.org, linux-media@vger.kernel.org, 
 linux-sound@vger.kernel.org, tzimmermann@suse.de, 
 andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, simona@ffwll.ch, 
 kuba@kernel.org, jmassot@collabora.com, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, 
 angelogioacchino.delregno@collabora.com, andrew+netdev@lunn.ch, 
 support.opensource@diasemi.com, maarten.lankhorst@linux.intel.com, 
 ck.hu@mediatek.com, matthias.bgg@gmail.com, pabeni@redhat.com, 
 p.zabel@pengutronix.de, edumazet@google.com, krzk+dt@kernel.org, 
 davem@davemloft.net, dri-devel@lists.freedesktop.org
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-5-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-5-ariel.dalessandro@collabora.com>
Message-Id: <175578240744.3438740.13033328475024605529.robh@kernel.org>
Subject: Re: [PATCH v1 04/14] net: dt-bindings: Convert Marvell 8897/8997
 bindings to YAML


On Wed, 20 Aug 2025 14:12:52 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Marvell 8897/8997
> (sd8897/sd8997) bluetooth devices controller to a YAML schema.
> 
> While here, bindings for "usb1286,204e" (USB interface) are dropped from
> the YAML definition as these are currently documented in file:
> 
> - Documentation/devicetree/bindings/net/btusb.txt
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/net/marvell,sd8897-bt.yaml       | 91 +++++++++++++++++++
>  .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------
>  2 files changed, 91 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml: marvell,wakeup-gap-ms: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/marvell,sd8897-bt.example.dtb: bluetooth@2 (marvell,sd8897-bt): marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/net/btusb.txt references a file that doesn't exist: Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
Documentation/devicetree/bindings/net/btusb.txt: Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250820171302.324142-5-ariel.dalessandro@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


