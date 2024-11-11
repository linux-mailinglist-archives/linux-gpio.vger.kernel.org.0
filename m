Return-Path: <linux-gpio+bounces-12830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055B9C4891
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 22:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A994C283DB2
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 21:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6391BBBE5;
	Mon, 11 Nov 2024 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYveXlPW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95B038F83;
	Mon, 11 Nov 2024 21:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731362083; cv=none; b=m/YUh37zyvphju0ykpgCvGbK53ulEeCPzMCNwtaxPZ63Opt6ohA6lTwA55zYTJMivJEbBVWKUIkh3S6/ofJpsqTcyYmZq8YtLvbzrOWhQxBfw/kXGykHHCMC7hJ543Ot3MZOfBG7WYqKSFxcc/hzMizYhNxRApYYYSUwf+GYt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731362083; c=relaxed/simple;
	bh=DqR3k8brOadv8bcg1GsVIfynuocPyt+daDjnYYPFCR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQyd7u+0XSLsqRBp7+8Ta8Ep6n6XIG1qTaGq5OPtrnTdpqpid/fntIt7YTqPZNEqaMvFGDE6jcLmcL/t10PksSrFlt0Ae0KyK3wvszY9CmudIdLwlxzdvVq6Q5Zcc3m5wCcM+EyY1A3QFHru6VprTR2OwqwAel7O/qqEqp2Bvrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYveXlPW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3157C4CECF;
	Mon, 11 Nov 2024 21:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731362083;
	bh=DqR3k8brOadv8bcg1GsVIfynuocPyt+daDjnYYPFCR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYveXlPW7LodRFcqnTNh5rMxLLwOnUfN2WqUe1ERMapVG11AD5at5202tinfCKRip
	 MCcwPHh8vWZusY2flxVi2Wv38KpUBcRg++G7WOqvmfn0ouXtzvhB/XDgdlHgSpnnnF
	 JqGXlwyKx4BPf+NQ9iRcC/lgONredUYJKZ1XnZOsqOXAugbFgCpgWN+D8DshFD1+VG
	 QYyADNUJNpuhdfq2QOx1S9SGtEmtFkGQk4qi4jJTFI1gIVnGLEiAiRTMHiEUcZpRxz
	 dUQEQJS6RPXpgmyDczgRnnBSMAYyy25bFj/WfuK8Ba48YMHU6PEkGuTv51uqky5H9I
	 Dny3Z0X5bTeyg==
Date: Mon, 11 Nov 2024 15:54:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
Message-ID: <173136208008.2010062.9879027626457168051.robh@kernel.org>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
 <20241106100741.173825-2-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106100741.173825-2-y.oudjana@protonmail.com>


On Wed, 06 Nov 2024 10:08:33 +0000, Yassine Oudjana wrote:
> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
> 
> The only DT that currently gets affected by these changes is mt6797.dtsi.
> It is modified to match the new bindings in a following patch.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


