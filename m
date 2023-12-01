Return-Path: <linux-gpio+bounces-878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7580148A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 21:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B58E1C21086
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 20:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7460B4F1F3;
	Fri,  1 Dec 2023 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuIUSC2K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2C157866;
	Fri,  1 Dec 2023 20:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346A3C433C9;
	Fri,  1 Dec 2023 20:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701462949;
	bh=/TnZS0HuOiZtqdpeKk51Z32DjLXO4zdmRL4p1KDlMX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuIUSC2KcV7FM+30c0UfS9RFJL5UdaqyTsZOK2FqD//8T/b276NdoI8m+YF20LoNM
	 5wAuKZj+wKVShIfyEbd0MimM68YPFpDzxA10NbkGhZcV2ocC944n6CGWfkSL8q0iRd
	 P0ntSTShaDcjjILKCAngWAUTu3Z8lG7OJJIIJAEGqQ+hbcWsVNKpTFQ1GmjZUJNGa9
	 6A3jugUlzCutWP3a2Wuuw1n8V7ee7oqzm41Jgxnh9KN6/EJKgcPnt31wN3mj2dmaLr
	 i/EORjhhBN18rLz0bPJ7Fpvs8AlrLISUe7+BPUT/l/k+0HU9p/LC0AA3kX2yocc8m2
	 J7z/uvgG7yMDQ==
Date: Fri, 1 Dec 2023 12:39:15 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] pinctrl: Add lock to ensure the state atomization
Message-ID: <6jlui5h7d2rs37sdvvwmii55mwhm5dzfo2m62hwt53mkx4z32a@aw5kcghe4bik>
References: <20231201152931.31161-1-quic_aiquny@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201152931.31161-1-quic_aiquny@quicinc.com>

On Fri, Dec 01, 2023 at 11:29:31PM +0800, Maria Yu wrote:
> Currently pinctrl_select_state is an export symbol and don't have
> effective re-entrance protect design. And possible of pinctrl state
> changed during pinctrl_commit_state handling. Add per pinctrl lock to
> ensure the old state and new state transition atomization.
> Move dev error print message right before old_state pinctrl_select_state
> and out of lock protection to avoid console related driver call
> pinctrl_select_state recursively.

I'm uncertain about the validity of having client code call this api in
a racy manner. I'm likely just missing something here... It would be
nice if this scenario was described in a little bit more detail.

The recursive error print sounds like a distinct problem of its own,
that warrants being introduced in a patch of its own. But as with the
other part, I'm not able to spot a code path in the upstream kernel
where this hppens, so please properly describe the scenario where
touching the console would result back in another pinctrl_select_state().

Thanks,
Bjorn

> 
> Fixes: 4198a9b57106 ("pinctrl: avoid reload of p state in list iteration")
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> ---
>  drivers/pinctrl/core.c | 11 +++++++++--
>  drivers/pinctrl/core.h |  2 ++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index f2977eb65522..a19c286bf82e 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1066,6 +1066,7 @@ static struct pinctrl *create_pinctrl(struct device *dev,
>  	p->dev = dev;
>  	INIT_LIST_HEAD(&p->states);
>  	INIT_LIST_HEAD(&p->dt_maps);
> +	spin_lock_init(&p->lock);
>  
>  	ret = pinctrl_dt_to_map(p, pctldev);
>  	if (ret < 0) {
> @@ -1262,9 +1263,12 @@ static void pinctrl_link_add(struct pinctrl_dev *pctldev,
>  static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>  {
>  	struct pinctrl_setting *setting, *setting2;
> -	struct pinctrl_state *old_state = READ_ONCE(p->state);
> +	struct pinctrl_state *old_state;
>  	int ret;
> +	unsigned long flags;
>  
> +	spin_lock_irqsave(&p->lock, flags);
> +	old_state = p->state;
>  	if (old_state) {
>  		/*
>  		 * For each pinmux setting in the old state, forget SW's record
> @@ -1329,11 +1333,11 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>  	}
>  
>  	p->state = state;
> +	spin_unlock_irqrestore(&p->lock, flags);
>  
>  	return 0;
>  
>  unapply_new_state:
> -	dev_err(p->dev, "Error applying setting, reverse things back\n");
>  
>  	list_for_each_entry(setting2, &state->settings, node) {
>  		if (&setting2->node == &setting->node)
> @@ -1349,6 +1353,9 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>  			pinmux_disable_setting(setting2);
>  	}
>  
> +	spin_unlock_irqrestore(&p->lock, flags);
> +
> +	dev_err(p->dev, "Error applying setting, reverse things back\n");
>  	/* There's no infinite recursive loop here because p->state is NULL */
>  	if (old_state)
>  		pinctrl_select_state(p, old_state);
> diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> index 530370443c19..86fc41393f7b 100644
> --- a/drivers/pinctrl/core.h
> +++ b/drivers/pinctrl/core.h
> @@ -12,6 +12,7 @@
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/radix-tree.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  
>  #include <linux/pinctrl/machine.h>
> @@ -91,6 +92,7 @@ struct pinctrl {
>  	struct pinctrl_state *state;
>  	struct list_head dt_maps;
>  	struct kref users;
> +	spinlock_t lock;
>  };
>  
>  /**
> 
> base-commit: 994d5c58e50e91bb02c7be4a91d5186292a895c8
> -- 
> 2.17.1
> 
> 

