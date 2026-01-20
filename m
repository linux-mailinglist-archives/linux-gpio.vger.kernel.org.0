Return-Path: <linux-gpio+bounces-30759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E66D3BEEE
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 07:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4DCB4E8C36
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 06:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B85732BF26;
	Tue, 20 Jan 2026 06:03:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3872EC2EA;
	Tue, 20 Jan 2026 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768889021; cv=none; b=E0YC7DIaSoj71BZilaSwHKKLhfh3JthDNb4zAlcz9r1m3WF3mTE84gORYkw/V2UeLnXJgCZPZPowekGDvJC9isTQcMaAvf4Zlpy6P3fs6Fw86FgowcK6hZNS01O4QGeR4QrnZk5U++SgGu5KwTaIIPAHFYhaIfTVgMxro5Xzy14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768889021; c=relaxed/simple;
	bh=EPpoYfxx1tizPpYQl75tskQojeGcYOI3bMbcyeRn3PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfjDuYgYrryyzLI6x+OycG1wb34Ieo+B46Eoz3TsIOhzrM/iVDAS8+BF22XlalVvhVNdWvqYRsQyMKcxmXHFnuSLXdCktGGHYr3wDF3JY1fnnOeH+GqGPvTyhH52x9P/5Ktq2LbrndY3JYRNIYgtIMAIYIxQoGuiq7YYgGq0+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.206.31])
	by APP-05 (Coremail) with SMTP id zQCowABn+w6sGm9psVe6BQ--.38261S2;
	Tue, 20 Jan 2026 14:03:26 +0800 (CST)
Date: Tue, 20 Jan 2026 14:03:24 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: linusw@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH v2] pinctrl: canaan: k230: Fix NULL pointer dereference
 when parsing devicetree
Message-ID: <aW8arOPzmpigRW+a@duge-virtual-machine>
References: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
 <aWiLFFnk9aAiMMJI@duge-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWiLFFnk9aAiMMJI@duge-virtual-machine>
X-CM-TRANSID:zQCowABn+w6sGm9psVe6BQ--.38261S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1UWr1rZryDZF4xGFWDXFb_yoW5Jw13pF
	4fJa98Kr4UJr48W34jva1UZFya9an2y34fCw17t3s5K3Z8tryDJ3W5WrWUZ398Crs8CF1f
	tr45tFya9r4DXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2VbyDUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Thu, Jan 15, 2026 at 02:38:14PM +0800, Jiayu Du wrote:
> On Sun, Dec 28, 2025 at 11:49:47PM +0800, Jiayu Du wrote:
> > When probing the k230 pinctrl driver, the kernel triggers a NULL pointer
> > dereference. The crash trace showed:
> > [    0.732084] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000068
> > [    0.740737] ...
> > [    0.776296] epc : k230_pinctrl_probe+0x1be/0x4fc
> > 
> > In k230_pinctrl_parse_functions(), we attempt to retrieve the device
> > pointer via info->pctl_dev->dev, but info->pctl_dev is only initialized
> > after k230_pinctrl_parse_dt() completes.
> > 
> > At the time of DT parsing, info->pctl_dev is still NULL, leading to
> > the invalid dereference of info->pctl_dev->dev.
> > 
> > Use the already available device pointer from platform_device
> > instead of accessing through uninitialized pctl_dev.
> > 
> > Fixes: d94a32ac688f ("pinctrl: canaan: k230: Fix order of DT parse and pinctrl register")
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > ---
> >  drivers/pinctrl/pinctrl-k230.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-k230.c b/drivers/pinctrl/pinctrl-k230.c
> > index d716f23d837f..20f7c0f70eb7 100644
> > --- a/drivers/pinctrl/pinctrl-k230.c
> > +++ b/drivers/pinctrl/pinctrl-k230.c
> > @@ -65,6 +65,7 @@ struct k230_pmx_func {
> >  };
> >  
> >  struct k230_pinctrl {
> > +	struct device		*dev;
> >  	struct pinctrl_desc	pctl;
> >  	struct pinctrl_dev	*pctl_dev;
> >  	struct regmap		*regmap_base;
> > @@ -470,7 +471,7 @@ static int k230_pinctrl_parse_groups(struct device_node *np,
> >  				     struct k230_pinctrl *info,
> >  				     unsigned int index)
> >  {
> > -	struct device *dev = info->pctl_dev->dev;
> > +	struct device *dev = info->dev;
> >  	const __be32 *list;
> >  	int size, i, ret;
> >  
> > @@ -511,7 +512,7 @@ static int k230_pinctrl_parse_functions(struct device_node *np,
> >  					struct k230_pinctrl *info,
> >  					unsigned int index)
> >  {
> > -	struct device *dev = info->pctl_dev->dev;
> > +	struct device *dev = info->dev;
> >  	struct k230_pmx_func *func;
> >  	struct k230_pin_group *grp;
> >  	static unsigned int idx, i;
> > @@ -596,6 +597,8 @@ static int k230_pinctrl_probe(struct platform_device *pdev)
> >  	if (!info)
> >  		return -ENOMEM;
> >  
> > +	info->dev = dev;
> > +
> >  	pctl = &info->pctl;
> >  
> >  	pctl->name	= "k230-pinctrl";
> > -- 
> > 2.52.0
> > 
Hi Linus, sorry for bothering again. Could you please take a look at
this patch? Thanks for your time.

Regards,
Jiayu Du
 


