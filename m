Return-Path: <linux-gpio+bounces-926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA46802CA7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28849280D45
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 08:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0934CA59;
	Mon,  4 Dec 2023 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j6oD8z3R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Oru0SiJ3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A8AF2;
	Mon,  4 Dec 2023 00:05:49 -0800 (PST)
Date: Mon, 4 Dec 2023 09:05:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701677147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mQmyeYAKXR5sNCK52r1a6ZEMHQE3SqWqGZ+6/p6FiCQ=;
	b=j6oD8z3Rpoh+gYRI+/mo1ZjPafwzAfoW2xwyBrMGZNjaYQ0WtmxrIKKX3lymOmKdJX5grg
	lK/tz7LDqaTaobI7uhv1JlMDz8qty4Je0cfg56c6z6o1dMKn5MgF4kWUefF5w6TG6um+4j
	T0R22j7B40umPJk1kBvSvYypBxFj6pPvUGrXz8+CX8yGvwgUvBYvkG3WOapmwF+5lv2qZt
	2t7DB56V5AExSE8bStkUB7BmWVsz+d/+gOEd59sbIAijz987Bfg9qu/d8yleyQmvjArUh/
	2nMMj9EWuTj1br7R8Y2SSifIf1tVz9xOw6U1TwiD6oMxek9MzuzpTGbwrJGFgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701677147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mQmyeYAKXR5sNCK52r1a6ZEMHQE3SqWqGZ+6/p6FiCQ=;
	b=Oru0SiJ3hwLxBodXkETHIzVPdNq176mAy0HkpfNpAr6d3Q3ueQUnIXN4xVb0dU3G1gVWts
	EdWb+Kfw5z60tQCA==
From: Nam Cao <namcao@linutronix.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Huan Feng <huan.feng@starfivetech.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: starfive: jh7100: ignore disabled device
 tree nodes
Message-ID: <20231204080543.C8LyBqTM@linutronix.de>
References: <fd8bf044799ae50a6291ae150ef87b4f1923cacb.1701422582.git.namcao@linutronix.de>
 <fe4c15dcc3074412326b8dc296b0cbccf79c49bf.1701422582.git.namcao@linutronix.de>
 <CAJM55Z9CooaYqeTuZK0FARKupf_StTSfWBo7ziv4KtGq6pEVaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z9CooaYqeTuZK0FARKupf_StTSfWBo7ziv4KtGq6pEVaQ@mail.gmail.com>

Hi Emil,

On Fri, Dec 01, 2023 at 03:28:27PM +0100, Emil Renner Berthing wrote:
> Nam Cao wrote:
> > diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> > index 530fe340a9a1..561fd0c6b9b0 100644
> > --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> > +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> > @@ -492,7 +492,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
> >
> > nmaps = 0;
> > ngroups = 0;
> > - for_each_child_of_node(np, child) {
> > + for_each_available_child_of_node(np, child) {
>
> Is this safe to do? I mean will the children considered "available" not change
> as drivers are loaded during boot so this is racy?

I think if node removal like this causes race condition, we would
already have race condition with node addition too: "what if the nodes
are added while the drivers are being loaded?"

At least with U-Boot, the device tree overlay is "merged" into the base
device tree, before the kernel even runs, so no race there. I don't know
if there are any cases where the device tree overlay is not guaranteed
to be applied before driver loading, but those cases do not sound sane
to me: they would cause race condition, regardless of whether nodes are
added or removed.

> Also arguably this is not a bugfix, but a new feature.

I'm not sure myself, I haven't seen official documentation/rules about
this. But many people do consider this to be a bug:

"Though you can add/override 'status' with 'status = "disabled";' which
should be treated very similar to a node not being present. I say
similar because it's a source of bugs for the OS to fail to pay
attention to status property." - Rob Herring [1].

"Linux has widespread use of the "status" property to indicate that a
node does not exist. (...). Expect efforts to fix the kernel code to
respect the "status" property." - elinux.org [2].

And I do agree with them. When someone write a device tree with some
nodes with "status = disabled" for whatever reasons, clearly they intend
to exclude these nodes.

Though I must admit that I am still quite new, so please correct me if
my reasoning/understanding is flawed.

Best regards,
Nam

[1] https://lore.kernel.org/lkml/CAL_JsqLV5d5cL3o3Dx=--zGD37c5O09rL9AXyRFmceTfBHt3Zg@mail.gmail.com/
[2] https://elinux.org/Device_Tree_Linux#status_property

