Return-Path: <linux-gpio+bounces-18137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CADBA77440
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 08:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93D2C7A2FDC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 06:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9CB1DD0D4;
	Tue,  1 Apr 2025 06:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlbyM+re"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC791372;
	Tue,  1 Apr 2025 06:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743487602; cv=none; b=CnaZVPc+DwUnjN1Vnb9/oyQISEHNf6HBb6YViXz/3hzZkfmXbabCyOSXdAgprHXCdgQt2EfPeQZL0I8AvVM/hwY3zm8fcJM+Ka/kfiSZDCyMPYgBFvTQcDdJZs1aihHQIiHeHxY+/axiTA0iEUmFZYEpgUVRtIuqtTXjINeAshE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743487602; c=relaxed/simple;
	bh=oLzH5RkSicuMVNftyvLlNjjRZ70ibDG36k7ChxEokbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqFbbrTgt/4vLyjIAWmwznEsjwnOt64VxQM5oj+MaW5MJKtzgDpw133fOi+Qmq0l7fipwn2x2yJFnUqCm9HOCG55govI5xkUqOVUQCch/qwbfv1nmjtudOEiTn/mhMztW92Wla/edkhYrkoV4hhTx/x2fcfcDGW8rdn3vcAD5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlbyM+re; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECC0C4CEE8;
	Tue,  1 Apr 2025 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743487602;
	bh=oLzH5RkSicuMVNftyvLlNjjRZ70ibDG36k7ChxEokbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlbyM+reilMLWDp1hOkToL15MKp3RlG7mm7J+8Y/Z5KNotQYHe6yrnielSmpmknQM
	 QxigIlTn9FKn0e46cZIiVtB5VNgMRPXZQzeWS7jYj12kEkGa8YMIHYVAS+WFbayUYR
	 PzRlVHCmrVUz3Cs564m7WAQpWm+PSaZkZvEcSACVrwMUbfQUe8usjUqC3+/rDj//bi
	 Cd8WixEmJqDtAHMbN69h0i6qQF2BKUuAAwD6YYo2b3bh706TzRgTUeWqxsVz+/gQEh
	 Ya8bsQZ2Efn6+a9jYQexhwrkDch+tKsHfjEHTkpS3fCW5sn043fa1XbizeaO30HRTW
	 PdjVz8I4fQ9pQ==
Date: Tue, 1 Apr 2025 08:06:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, yong.mao@mediatek.com, 
	Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com, 
	Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Message-ID: <20250401-glittering-bouncy-yak-7e63ee@krzk-bin>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401054837.1551-2-ot_cathy.xu@mediatek.com>

On Tue, Apr 01, 2025 at 01:48:10PM +0800, Cathy Xu wrote:
> Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 220 ++++++++++++++++++
>  1 file changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


