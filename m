Return-Path: <linux-gpio+bounces-228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A57EFCBC
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Nov 2023 01:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EB331C208DA
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Nov 2023 00:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1871EBF;
	Sat, 18 Nov 2023 00:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQs7w7qt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B011A3C;
	Sat, 18 Nov 2023 00:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8519BC433C9;
	Sat, 18 Nov 2023 00:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700268468;
	bh=t57+RslQFeKnJM3h8s2TI3ZEoZEyxEDagVoPEqzUmqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IQs7w7qtKk/3FDjQkfTHKofphFehwcjkn9sjAVqiiHlSDHnFUcUkqWO8Pgy3/zFmE
	 AYMxPhjIt2GLa120lU8rpSUpci65qybU5kUTOhFbIfkFH3RLmL0sN3R9pYs16YqCSF
	 XRxSzYGV2+s2rvQbEXVZ4MHsne/RFlWGj9KeEMZjxZdhMEnzuEyTkQv/OnyofsMWZZ
	 CaTDitfbHF8ZXhHsP7bVr9bMIlJ4g2xPv9dMUPOon34EIUZXPEStD4TybsNM0X4xAW
	 O8zkdi3a45WxLIZPa8lYBeydEX+isHSwUwieWbWg0ggRi230gqABIRCwmK0BxaEy1j
	 Q5HjtqnDzNerw==
Date: Fri, 17 Nov 2023 16:47:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>, Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231117164746.0589e955@kernel.org>
In-Reply-To: <20231115144007.478111-1-herve.codina@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Nov 2023 15:39:36 +0100 Herve Codina wrote:
>    - Removed Patches 6, 7 and 8 (patches applied)
> 
>    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
>      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'

I thought someone (Mark?) asked for the networking stuff to be put 
on a branch. If that's still the preference - is it possible to factor
these out as a standalone series, too?  Will they build on their own?

