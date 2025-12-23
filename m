Return-Path: <linux-gpio+bounces-29799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD50CD79C0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 02:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F243032AA7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 01:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5467E2147E6;
	Tue, 23 Dec 2025 01:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Z0H9hVyI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B261F63D9;
	Tue, 23 Dec 2025 01:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766451979; cv=none; b=nWgDN57Rlh5qfw5dZ4y72bj3hw6Fjru/BhFC/FQuuOKR/1wIZX5/Rc0USvx4y71iCwoAwTMibVYuIiJXCuSZPEo4FZVyCvCVWJ6pooO9VHaxzxY7qqPURhi71Q4roIiL6R34VcdgTr1G5Bwd07ZRLIJfB5LCSlnlqysJ3MPe/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766451979; c=relaxed/simple;
	bh=vHUIN2MhSaYiq1ikZpzEh07Q9PjwN5ENuid+tFKOE7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqFs4qMUQ//LGzh2WopbP57qt7Yqrb0gu0rQgd/Jv/y+R4IQhQWLZNiK/wTainoUqnV5u6JHTwhdaTz2msTOr2k6edyKwhKmhBGjt3ctxqlGNLxUZ2opK1VHVXgauXvwgSFvLz9EtQ8zu3VQg398BHmSXWzsk7st9dV7z0coguk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Z0H9hVyI; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766451897;
	bh=tlnRc3+JeeFSrgov+0izuaI1AtYRIEdu/7YYdutYt6Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Z0H9hVyIipLGwzgDLrOSuTukr3aUWOF4xKUFvsr0iSHWWB5qwuwryepA7s87z9Ni1
	 aSiyE21xz9LEnM+4oySUduS/3xmzBSejk3gLf/WK3AKS8l6DnqJMwLLrd2uLv0uGvv
	 9TKLpxlej4M/6Q3XdE8YPB0ajppfIx6iUqLeqDqI=
X-QQ-mid: zesmtpgz4t1766451895te80ab387
X-QQ-Originating-IP: JtifH4K1sur0WoynFNkDk59IJfvD6Lz1xNwTmdgCjE0=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 09:04:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13030913243295314513
EX-QQ-RecipientCnt: 11
Date: Tue, 23 Dec 2025 09:04:54 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] pinctrl: spacemit: k3: add initial pin support
Message-ID: <B34F6DA41EF01479+aUnqtjkWf1sVJbmD@kernel.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-2-f6f4aea60abf@gentoo.org>
 <74FFF1F2D1BF3EFF+aUjsbTB607IkAY87@kernel.org>
 <20251222230338-GYA1980456@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222230338-GYA1980456@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NXFhtRYX6L9xy/OA70OGzMuEvQKnX6EezlhFJARYH/N2fZj3wBg93+Sn
	aYdm9J/xeTVr8KFf/+21hXt+C3+beB5ThxeVmB0IEmAs2CsDLe/KqGON4o2oBlH35qEnl79
	mRGGwjFCslfw6GixtEulWyUOJRtL7YWegBGTgkKaMf8oq0WJV9aOyrBRuuiRYaVEkfr2J+8
	wSVgIgL5f8R2XNeMxjDLo4YAtjUcCX5geXeCsW0ycbJkaExO8YPEK7oUfvGfu+jay25A+Bp
	7jIw5mqfDUSpp4qXL+YI5/X1vVFvFhxK1UUuRH67bKQnPTW1qOEDcmk6ILD6UEkGMF0tQLz
	jnWh8jyDuO1pfHEmCNN2YJ57gFFHtqr3qcKbQk+Pt+rY9BZQi3GAW/Qt5OVDzao4u8pwYqs
	hiEijfdUNpvg55JpwVMEqGb03oMuk+9KfOxkRva3X7Mbs0AkTP3yI6Gbqq9Xq5LnxVXDIiJ
	VwOuuE4GnTUQHTqUqHfzmE9NIZoujo7HQlwtJduq/4cohI79MOt5TWcnAKNS4gM3/8O8L6i
	VA73MkO1DCwWKNAB5GFujwHGoG26rffk/iFSU+cE5J4kpxpZnVDd8lsBZ7ZFAIKVrUiiVwg
	b7Px3GAP5X7bU09R1I0IIUl604y3dQxdJnt81FzoLci/afL6c4vGYYW/IcQc1HY/pn/+TGV
	kQ2wxoV9s3UsPrxFiUvXOmy4pQuQwjUXmZpJXSi6jlTOlOEhy9Oz/kDbH5SspzaB7mBCB6+
	7D6vtvAe+Teaz0o7qJPYwe/8yp4vpnHmdk661HusdIqBs7j5sAevBw7zCi+xqZGP3uVbcwO
	Ccgcwrfd9YD97TXCOmNO4b4CN5bqW8z5ThRD9RADav9fXz5CaUv+OCMFnR8k18s9ZptaLKx
	xz7JSpyE+/xViWWXKGU+ceO8ZoBnNT7IWn0xKIs08mBbbNgVOnJPj4dp/Zc9LsYYow3MTQX
	xznUrGq1Pyh6bolzLujkHu4CTt5oUyNETCMtSSC8Quj7E4jdEYMtBxoEi5LT1G6xuxw0BEZ
	M0c8EnsL/0pwdopUYFYKMqpHTS434snKtx3LsGlA==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On Tue, Dec 23, 2025 at 07:03:38AM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 14:59 Mon 22 Dec     , Troy Mitchell wrote:
> > On Sat, Dec 20, 2025 at 06:14:54PM +0800, Yixun Lan wrote:
> > > For the pinctrl IP of SpacemiT's K3 SoC, it has different register offset
> > > comparing with previous SoC generation, so introduce a function to do the
> > > pin to offset mapping. Also add all the pinctrl data.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  drivers/pinctrl/spacemit/Kconfig      |   4 +-
> > >  drivers/pinctrl/spacemit/pinctrl-k1.c | 354 +++++++++++++++++++++++++++++++++-
> > >  2 files changed, 352 insertions(+), 6 deletions(-)
> > > 
> > [...]
> > > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > [...]
> > > +static unsigned int spacemit_k3_pin_to_offset(unsigned int pin)
> > > +{
> > > +	unsigned int offset = pin > 130 ? (pin + 2) : pin;
> > Is this necessary? I think it's hard to read. Why not:
> > ```
> > if (pin > 130)
> >   pin += 2;
> > 
> > return pin << 2;
> > ```
> > This avoids the extra variable and makes the code clearer.
> > > +
> > > +	return offset << 2;
> No, I do not want to change, it's pretty much a personal taste here,
> I did similar as k1_pin_to_offset(), explicitly introduce a variable offset
> to let reader know it convert from pin to offsett, which is more readable..
This is a minor issue. both styles are acceptable to me.

                        - Troy
> 
> -- 
> Yixun Lan (dlan)
> 

