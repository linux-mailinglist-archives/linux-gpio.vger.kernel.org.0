Return-Path: <linux-gpio+bounces-16765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B3A49201
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858F23AF895
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B310C1C5D42;
	Fri, 28 Feb 2025 07:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKIUnSu8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682C4276D12;
	Fri, 28 Feb 2025 07:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740726981; cv=none; b=O46Z0ANDJXnNE9YD9U9pkMVwcbAC3N/yoBaOTW9Z5MNnSKRNB+q+cV5xe4zwOmU4F5MY0DH7Ry7HP2oyg3uVIw/uGbkRHFigM6ff5cbEnWIb9dO7N9LyAwYiPf2tRjQhfgTiOSsYuSKadP1zyYqGcbEY8+d6++m/cP0DZ1sHJQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740726981; c=relaxed/simple;
	bh=yTAonuXu9g+7b403MqlF70eqbtyFbgQ9pVocq4PQpQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJ8TbwZliZF5Ozx88WUykIHc8ZAHyQ3vEL/3ZNhpATYhmikVWdt05bnREqyiW7H3wyMcsqOdFDe7rVV6CbYZoZDuaIFTk8TY8rVvnLppfgRPzG21MVu4uTzLWctPqCT5fMt3df8zPuGkb0OMFdUzSEg5SZF3qNcC9mo76RJXOYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKIUnSu8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF080C4CED6;
	Fri, 28 Feb 2025 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740726980;
	bh=yTAonuXu9g+7b403MqlF70eqbtyFbgQ9pVocq4PQpQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKIUnSu8RkmgEFcxIbrDi1ImE6coM4nmXEmlshwXl48ohFX4lvxDySibsdIBx/9oS
	 6r/ncceId1/ytctKFr2W/xnLgijpF1aJ6n06etKCjsTNnZty/elmZodbyNIqhoO47T
	 X23+3V+pvJvuFiibc01fXeZpgc0XZAiqWYhURcjqi9JjEj1SSXCnDm1lZCdMg7Jbbp
	 MZVPO3y2paINJUQt+6YyZYDqLuFBf+Xp3BMNAzYS39dSCz6YZxCa9H6ZMeAccrnsVg
	 BcL00bHf3qFwXKIbs0oEJatJSZ4n18N55MOuCIzI9qFFc273m8Hwz0wRdhY3bLaLnm
	 gvReSNISlgd2g==
Date: Fri, 28 Feb 2025 08:16:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu =?utf-8?B?KOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lei Xue =?utf-8?B?KOiWm+ejiik=?= <Lei.Xue@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Wenbin Mei =?utf-8?B?KOaiheaWh+W9rCk=?= <Wenbin.Mei@mediatek.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	Guodong Liu =?utf-8?B?KOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>, Yong Mao =?utf-8?B?KOavm+WLhyk=?= <yong.mao@mediatek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"sean.wang@kernel.org" <sean.wang@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, Axe Yang =?utf-8?B?KOadqOejiik=?= <Axe.Yang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Message-ID: <20250228-encouraging-trout-of-action-cfcd5a@krzk-bin>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
 <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
 <174070957527.867625.13463640154036333781.robh@kernel.org>
 <d5bf6e1b6c277e6431cffeef66a4766f59f94fe5.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d5bf6e1b6c277e6431cffeef66a4766f59f94fe5.camel@mediatek.com>

On Fri, Feb 28, 2025 at 03:11:41AM +0000, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=
=A9=B7) wrote:
> On Thu, 2025-02-27 at 20:26 -0600, Rob Herring (Arm) wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > On Fri, 28 Feb 2025 09:16:25 +0800, Cathy Xu wrote:
> > > Add the new binding document for pinctrl on MediaTek mt8196.
> > >=20
> > > Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> > > Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> > > ---
> > >  .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 241
> > > ++++++++++++++++++
> > >  1 file changed, 241 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-
> > > pinctrl.yaml
> > >=20
> >=20
> > My bot found errors running 'make dt_binding_check' on your patch:
>=20
>   Sorry, this patch depond on another patch:
>  =20
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250228011702.=
16493-3-ot_cathy.xu@mediatek.com/
>   In this case, does the dt-binding still need go first? If so, I=20

This means your series are non-bisectable but even re-ordering will nto
fix it. You understand you target different trees?

> will include the dependency information in the commit message of=20
> the next version. Thank you~

No, decouple from dependencies.

Best regards,
Krzysztof


