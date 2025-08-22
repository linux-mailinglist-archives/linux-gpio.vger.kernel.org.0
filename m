Return-Path: <linux-gpio+bounces-24821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57095B31E1C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 17:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA6DBBA5E73
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28BF2E7BC3;
	Fri, 22 Aug 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeX8kKa/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D20F21FF3C;
	Fri, 22 Aug 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875861; cv=none; b=qrTmOT+qRNBwOl14A4J8cr/BfWHzmn1Kf2GhvXqXpr2AEAa1uR8Ehf1jbF0XAKOD8cOedgq8DUt1ekbeQ5vooz41V7p5x//dYDMjxNzyuqrshPvDaGL0NkpZYgJ4HCUp7DBi3yGy/R4RkWHY6lxwsxO6cMQcTTa3DSmt6oerRrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875861; c=relaxed/simple;
	bh=XdRY7HKsACkQeqSKAyGk2v2Vlf2LTnVd6fqMdVcahtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Czl6QWIv7P2Jv+AeBqK62oCLcrtAWtzNrNj3B2A+X0i4AeIWVax3cLiJUzYwHo+PqS/KM5G3HQ+thIadnOSaZWLPkd7MHxHXqO6m0wAZUk0CVp91dk4YxwFSG9O5nwHoYCmf6B8wmqdBI+cgLNCECNwyz0v24ZL46YG+duZ9M1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeX8kKa/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE912C4CEED;
	Fri, 22 Aug 2025 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755875860;
	bh=XdRY7HKsACkQeqSKAyGk2v2Vlf2LTnVd6fqMdVcahtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aeX8kKa/dZgcRh5rVfaqoe1CC8NN0aLGou2XiuH7yWo6zZoT0QIhl5aMWgudGWbFY
	 PPJfl4qu/m+btSrUwCgNWzdEyti9DSk+4yNowmd5ObzKp71SEHpVRe1OG/T15oBtg8
	 9AN3tUi+2Dlzatpa4sax+YkIVrb7+SqyD5H2awAnfF1PN1l3gHGmcimjHYyWWl0XLS
	 KDwELS31Lh0WKfWDKLUMyqgWU4sIpyzrjgQzSw4ldlERimgWAAjaK0Yyi7mXII7kK2
	 bMuRspo3WJffjr3/yeEtypJUPrix/S0g2/97MTyC+C1McOGFXza9L3Cz4L8nB3UHw8
	 +rd3s0ZGFUt4Q==
Date: Fri, 22 Aug 2025 10:17:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, matthias.bgg@gmail.com, krzk+dt@kernel.org,
	louisalexis.eyraud@collabora.com, minghsiu.tsai@mediatek.com,
	dmitry.torokhov@gmail.com, support.opensource@diasemi.com,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	edumazet@google.com, kuba@kernel.org, jeesw@melfas.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, andrew-ct.chen@mediatek.com,
	linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
	davem@davemloft.net, mripard@kernel.org, ck.hu@mediatek.com,
	maarten.lankhorst@linux.intel.com, linus.walleij@linaro.org,
	yunfei.dong@mediatek.com, houlong.wei@mediatek.com,
	p.zabel@pengutronix.de, linux-clk@vger.kernel.org,
	tzimmermann@suse.de, chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com,
	simona@ffwll.ch, linux-mediatek@lists.infradead.org,
	jmassot@collabora.com, linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, amergnat@baylibre.com,
	broonie@kernel.org, sean.wang@kernel.org,
	linux-media@vger.kernel.org, tiffany.lin@mediatek.com,
	kyrie.wu@mediatek.corp-partner.google.com, pabeni@redhat.com,
	flora.fu@mediatek.com, andrew+netdev@lunn.ch, mchehab@kernel.org
Subject: Re: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl:
 Allow gpio-line-names
Message-ID: <175587585960.3825744.17420648666303158652.robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-10-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-10-ariel.dalessandro@collabora.com>


On Wed, 20 Aug 2025 14:12:57 -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


