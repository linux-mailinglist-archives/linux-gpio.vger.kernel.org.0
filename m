Return-Path: <linux-gpio+bounces-630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7D17FCC57
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 02:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859D22832A9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 01:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E6A1C10;
	Wed, 29 Nov 2023 01:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TR7LDDkV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F4EDD;
	Wed, 29 Nov 2023 01:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F8AC433C8;
	Wed, 29 Nov 2023 01:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701221472;
	bh=3caMJWJeVZjBQlyKic+6DCHNZavxkUt0zeNOwgUSrSE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TR7LDDkVbXOW8SzNakJv84D/UX1XWnaooE31BQPE49tzM71ucT4w0ovTmNEtsLUZg
	 OlTtZSj1dXT9W9ytswDB5k6LSeblH50zZ3GpnLBWXRXayh/Ae/LWaAgT+oMYv2+kmB
	 M/SG7UW9pMOaPLs2rKdxLDSSOE9xZulN2mm4FmOfVkm97FY38kHRbCAc0IGl7OkRni
	 gfLJM33vVsLzJSsgDYPptivlQzizJgVEUv/+DWbfbFUK6pNBiJuctfYWzyGZgRkRLv
	 ftlSjLr/r25wae6EY0swOzXjnbiCarR7NYKcRweo+AKhVDAeR9GzSGshX1Lr7Ux+XK
	 4dPmgIhbiPHbw==
Date: Tue, 28 Nov 2023 17:31:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Herve Codina
 <herve.codina@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] Add support for framer infrastructure and PEF2256
 framer
Message-ID: <20231128173110.0ccb8f53@kernel.org>
In-Reply-To: <CACRpkdYmN4318b1wXwUOeFjPN0S2w8M9FpXHOs3LtFa+XoTxVw@mail.gmail.com>
References: <20231128132534.258459-1-herve.codina@bootlin.com>
	<17b2f126-f6a4-431c-9e72-56a9c2932a88@sirena.org.uk>
	<CACRpkda5VMuXccwSBd-DBkM4W7A1E+UfZwBxWqtqxZzKjrqY4A@mail.gmail.com>
	<511c83d1-d77f-4ac0-927e-91070787bc34@sirena.org.uk>
	<CACRpkdYmN4318b1wXwUOeFjPN0S2w8M9FpXHOs3LtFa+XoTxVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Nov 2023 15:51:01 +0100 Linus Walleij wrote:
> > > I thought this thing would be merged primarily into the networking
> > > tree, and I don't know if they do signed tags, I usually create an
> > > immutable branch but that should work just as fine I guess.  
> >
> > Right, I'd expect a signed tag on the immutable branch - it's generally
> > helpful to avoid confusion about the branch actually being immutable.  
> 
> Makes sense, best to create that in the netdev tree if possible
> I guess.

I think you offered creating the branch / tag in an earlier reply,
that's less work for me so yes please! :)

FWIW I usually put the branches / tags in my personal k.org tree.
I don't wanna pollute the trees for the $many people who fetch
netdev with random tags.

