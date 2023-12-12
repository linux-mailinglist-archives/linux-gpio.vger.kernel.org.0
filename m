Return-Path: <linux-gpio+bounces-1296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B850A80E85F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 10:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66EC61F212F9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 09:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4666F5915D;
	Tue, 12 Dec 2023 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rk79/zp7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9955A6;
	Tue, 12 Dec 2023 01:59:18 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89DD2FF803;
	Tue, 12 Dec 2023 09:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702375156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0/3Sh2eETJdeZKVLmp2oI+wYLwADP2lZuTfmz4YhfQ=;
	b=Rk79/zp7ossMcvHhiqp98keiVcv2gf1k87JOuYi/QLilq8f6xx+Gh19mWu7nDU4GeYpq5Q
	lRAq+xxqZKFZMqfm3v4apQZT8Eo9qLKTSvd08PZJt9pgPyMHVvNPn3vGh/gy+jkcjjZu5r
	wCvV60IHuTJoUZ/9pXNbrDOHs/6pqvz4+6vJDPlffMiVNhwS5sKlSDDoJbM/82dbwdegCM
	e/wzYFgh3Eyy3Q4vUTWXVi+n7g+kWD2I4tihNRFoZePsrg5xf0CTlntvsMEHd0sUIf5F+a
	GeETxE6cLFojuL7k1GfrfDLArZPz425zbHBa/uR6Zj/b3legUK3tmLo+C1qbLA==
Date: Tue, 12 Dec 2023 10:59:14 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Mark Brown <broonie@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] Add support for framer infrastructure and PEF2256
 framer
Message-ID: <20231212105914.7eeb092b@bootlin.com>
In-Reply-To: <CACRpkdbrH-WWVrVWx6MvReUuUW8tU_J8Mb7nW3G8fJGAoiS38g@mail.gmail.com>
References: <20231128132534.258459-1-herve.codina@bootlin.com>
	<17b2f126-f6a4-431c-9e72-56a9c2932a88@sirena.org.uk>
	<CACRpkda5VMuXccwSBd-DBkM4W7A1E+UfZwBxWqtqxZzKjrqY4A@mail.gmail.com>
	<511c83d1-d77f-4ac0-927e-91070787bc34@sirena.org.uk>
	<CACRpkdYmN4318b1wXwUOeFjPN0S2w8M9FpXHOs3LtFa+XoTxVw@mail.gmail.com>
	<20231128173110.0ccb8f53@kernel.org>
	<CACRpkdbrH-WWVrVWx6MvReUuUW8tU_J8Mb7nW3G8fJGAoiS38g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Linus,

On Wed, 29 Nov 2023 15:00:40 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Wed, Nov 29, 2023 at 2:31 AM Jakub Kicinski <kuba@kernel.org> wrote:
> > On Tue, 28 Nov 2023 15:51:01 +0100 Linus Walleij wrote:  
> > > > > I thought this thing would be merged primarily into the networking
> > > > > tree, and I don't know if they do signed tags, I usually create an
> > > > > immutable branch but that should work just as fine I guess.  
> > > >
> > > > Right, I'd expect a signed tag on the immutable branch - it's generally
> > > > helpful to avoid confusion about the branch actually being immutable.  
> > >
> > > Makes sense, best to create that in the netdev tree if possible
> > > I guess.  
> >
> > I think you offered creating the branch / tag in an earlier reply,
> > that's less work for me so yes please! :)  
> 
> OK I fix!
> 
> Just waiting for some final reviews to trickle in.
> 
> Herve: nag me if it doesn't happen in time!

As you tell me, this is my reminder.

Best regards,
Hervé

> 
> > FWIW I usually put the branches / tags in my personal k.org tree.
> > I don't wanna pollute the trees for the $many people who fetch
> > netdev with random tags.  
> 
> Aha yeah pin control is relatively small so I just carry misc sync
> tags there.
> 
> Yours,
> Linus Walleij

