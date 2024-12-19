Return-Path: <linux-gpio+bounces-14021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E50CC9F7BD8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 13:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6D4218876CA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 12:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BCD224AE3;
	Thu, 19 Dec 2024 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMS8FWqK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA1223E69;
	Thu, 19 Dec 2024 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612791; cv=none; b=FhBTMJYOcgq2VjC+46rguhxk4SUEXa2simeFkkRxK5zHBnOw9IdSVXtIbU0wnbEclQqjGUgnDBbq+Qnj/KBk5OxQFZ7RybDjSDgJBiE8/CzD/FjXoNAQjV236jSFV99YxwFuaH9ImH6aUHfYzOkSnP2oA68xQflyt4P0+xipwtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612791; c=relaxed/simple;
	bh=chkDZbIsspED3TbjbtffIlaqUyxh0yo/Es2WKYz1qUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itAYoGQ/S8N9BkA7jTku3X3TNpchlVwa3yfgK8NyL8eW5xoof5BMFVCfRCvz0lnkzSy3jz92yg5h/COxM0QuldAOW9BW0e3V6kdaNPnT9EJeX4tiCIcJddzo8Fpd9jRDC2l1T7AwGfNtbscODQBgzQrJP59HAVRAlA26KDwaqIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMS8FWqK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103B0C4CECE;
	Thu, 19 Dec 2024 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734612791;
	bh=chkDZbIsspED3TbjbtffIlaqUyxh0yo/Es2WKYz1qUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMS8FWqKyvMa6afamNOFkiOAg/3lQgy4nID7D1MD7TgC7HYHJLUBw1B1gnpUtKq+Q
	 5le9KWvnL7WAlq8t0a+VLoryqMkVSHlA0A9NH7An53oNwJeW50ztWcU8mBxU//Pb7L
	 PBUwKNR5wXLWq189DUc6xInmEVlnxMQYcRu24mmwtbHbMKgdUGEaq2bJk2yR+OF+wT
	 rqH8VO3OVZoEHy5Sd6BFjHroi1BYItnP3T8bsWr7Md1itamHlIjLgkgfHJxYwW7U4V
	 NI4xG9xUjTxzgsA5OHsVsluFDmnYoow+fPH1IseoF1rvAxC8osX2/T6g4j5aj1iA60
	 XG8TfGFpCzSbw==
Date: Thu, 19 Dec 2024 06:53:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <173461170218.4026495.15441109866406999660.robh@kernel.org>
References: <20241217085435.9586-1-linux@fw-web.de>
 <20241217085435.9586-4-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217085435.9586-4-linux@fw-web.de>


On Tue, 17 Dec 2024 09:54:28 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> changes in v6:
> changes suggested by rob
> - remove quotes around mux
> - use const instead of enum if only one value is possible
> 
> changes in v5 (so not adding RB from Rob given in v4):
> - do not use MTK_DRIVE_8mA in example
> - add _0 functions for pwm
> 
> changes in v4:
> - dt-binding: pinctrl: fix dt_binding_check fixed-string error
> 
> '^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
> 	hint: Fixed strings belong in 'properties', not 'patternProperties'
> 
> changes in v3:
> - limit conf subnode name with optional suffix like mmc on mt7986
> - match mux subnode without wildcards
> 
> changes in v2:
> - drop gpio-cells description
> - move ref in mux subnode up
> - order uart-functions alphanumeric and fix typo
> ---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 575 ++++++++++++++++++
>  1 file changed, 575 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


