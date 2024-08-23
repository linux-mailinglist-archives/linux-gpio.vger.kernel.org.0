Return-Path: <linux-gpio+bounces-9017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D15095C354
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 04:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C31A5B2394C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 02:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F060D20B33;
	Fri, 23 Aug 2024 02:37:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6691D364AB;
	Fri, 23 Aug 2024 02:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724380627; cv=none; b=hH3IkQWM8d+eIwjpT0mACXwZK8MtaXdSs878+1Z5OebMgOCbksoXQB8OJXLColQd0vH6VP+jNjNqWyqtrzfdXif6fbpOH1iyctmqyYAzCTNkdVxm+xYdQozrl+cvaYM/ShCBfdYFhvkNfG5nCfhPO6eu7j6faw8TypLWx5EUq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724380627; c=relaxed/simple;
	bh=9KBRN+uaalolKKdODoaz7qP+X19sfZ0ncDoTDYrTJ5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JWXJu4CtGhU5j1Q9FWMiu9/kIo0gQe9xlE0nNcF3Lw7kEPFGddII6tJqHwiE7/TnCP+GgQw9dICF4HI6dH+70ooG4FNoNhym/5ouHcC0hiRWDBBAQbM2sgh2xkUpRHKI0gL6ICpYM9qkFAoM1ghZ0KZDx76z7x2ZW79LkLyJ5pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-01 (Coremail) with SMTP id qwCowAC3vUm89cdmPBV6CQ--.44906S2;
	Fri, 23 Aug 2024 10:36:55 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: akpm@linux-foundation.org
Cc: haojian.zhuang@linaro.org,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	make24@iscas.ac.cn,
	stable@vger.kernel.org,
	tony@atomide.com
Subject: Re: [PATCH RESEND] pinctrl: single: fix potential NULL dereference in pcs_get_function()
Date: Fri, 23 Aug 2024 10:36:44 +0800
Message-Id: <20240823023644.1778013-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821151604.7fbb834fa1503d11b373212b@linux-foundation.org>
References: <20240821151604.7fbb834fa1503d11b373212b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qwCowAC3vUm89cdmPBV6CQ--.44906S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1xWr47Zry3KF4fuw4rXwb_yoW8AF1fpa
	yfAry5CrW5tF48JryUJw4rCFy7Ww4xJFyfGa4kKryqva15WF1DtFWDKr1q9a1vkrW8CrW0
	v3W3XF909ryDAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Andrew Morton<akpm@linux-foundation.org> wrote:=0D
> On Wed, 21 Aug 2024 14:21:32 +0800 Ma Ke <make24@iscas.ac.cn> wrote:=0D
> =0D
> > pinmux_generic_get_function() can return NULL and the pointer 'function=
'=0D
> > was dereferenced without checking against NULL. Add checking of pointer=
=0D
> > 'function' in pcs_get_function().=0D
> > =0D
> > Found by code review.=0D
> > =0D
> > ...=0D
> >=0D
> > --- a/drivers/pinctrl/pinctrl-single.c=0D
> > +++ b/drivers/pinctrl/pinctrl-single.c=0D
> > @@ -345,6 +345,8 @@ static int pcs_get_function(struct pinctrl_dev *pct=
ldev, unsigned pin,=0D
> >  		return -ENOTSUPP;=0D
> >  	fselector =3D setting->func;=0D
> >  	function =3D pinmux_generic_get_function(pctldev, fselector);=0D
> > +	if (!function)=0D
> > +		return -EINVAL;=0D
> >  	*func =3D function->data;=0D
> >  	if (!(*func)) {=0D
> >  		dev_err(pcs->dev, "%s could not find function%i\n",=0D
> =0D
> Maybe.  Or maybe pinmux_generic_get_function() must always return a=0D
> valid pointer, in which case=0D
> =0D
> 	BUG_ON(!function);=0D
> =0D
> is an appropriate thing.  But a null-pointer deref gives us the same=0D
> info, so no change is needed.=0D
> =0D
> btw, pinmux_generic_get_function() is funny:=0D
> =0D
> 	if (!function)=0D
> 		return NULL;=0D
> =0D
> 	return function;=0D
Thank you for your response to the vulnerability I submitted. Yes, we =0D
believe there is a similar issue. As described in [1], =0D
pinmux_generic_get_function() could return as NULL and lead to a d=0D
ereferencing problem, and a similar issue exists in this code. It is better=
=0D
to add checking of pointer 'function' in pcs_get_function(). The discovery =
=0D
of this problem was confirmed through manual review of the code and =0D
compilation testing.=0D
=0D
[1] https://lore.kernel.org/linux-arm-kernel/CACRpkdYwBNjGzODYqvz+oScsO3u=
=3DR0dXMkP4UfqmosDugPFWRA@mail.gmail.com/T/=0D
=0D
--=0D
Regards,=0D
=0D
Ma Ke=


