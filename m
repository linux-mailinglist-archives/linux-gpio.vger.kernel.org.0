Return-Path: <linux-gpio+bounces-1335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9B80FBA8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 01:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F73D1F219D4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 00:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23B12F2E;
	Wed, 13 Dec 2023 00:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rr+8sXVa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0828F7;
	Wed, 13 Dec 2023 00:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C07BC433C8;
	Wed, 13 Dec 2023 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702425643;
	bh=P4ZmKF2m1aszLr/cpUggGxXzp94xFrO2iZjJ8pMqg+E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rr+8sXVaCR0cZJfv25f5QiVFngRPZpU9NmLl4uCO7WxxK3BPCXWN1Wh+LmpLBBu2a
	 ClLlVD7V0O5cpv+vf6COEK3i6JxOcNQyV0Dnixbb7Xb5cWW5u4fY0ICqclW2zB1DGN
	 3e/DE0Mkib942xdPVP+h0rZ/bkRQiBfy17+afZz67kdJDPRhEt/JIPT0lQQCgn0dQO
	 q7oc2gvw17TkeossVqF6P4nUL0UyfHPd0Z6cn5zvBMS8S3Bo7VTmIjQTSF3oIbjV7h
	 vwGtq/DqUKlSMsfBSA4VS0yTlCtaKUYrk/yN0YD6rzwi0hZhROXhX9nFATIMhKDzAp
	 S1J94Ehdjyoxw==
Date: Tue, 12 Dec 2023 16:00:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] Add support for framer infrastructure and PEF2256
 framer
Message-ID: <20231212160041.59c93d8a@kernel.org>
In-Reply-To: <CACRpkdYT1J7noFUhObFgfA60XQAfL4rb=knEmWS__TKKtCMh7Q@mail.gmail.com>
References: <20231128132534.258459-1-herve.codina@bootlin.com>
	<CACRpkdYT1J7noFUhObFgfA60XQAfL4rb=knEmWS__TKKtCMh7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Dec 2023 23:15:38 +0100 Linus Walleij wrote:
> here is an immutable tag for the PEF2256 framer, as promised.
> 
> I have already merged it into the pinctrl tree for starters.

Pulled to net-next as well, thank you!

