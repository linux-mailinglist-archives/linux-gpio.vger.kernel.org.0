Return-Path: <linux-gpio+bounces-36098-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MFrDvAs+Wkq6QIAu9opvQ
	(envelope-from <linux-gpio+bounces-36098-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:34:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 062D54C4DA1
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 078D6301C6FC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 23:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8C33DE429;
	Mon,  4 May 2026 23:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NIZxlofX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8818D3DD532;
	Mon,  4 May 2026 23:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937645; cv=none; b=BPn0BJi63gLfbRJeP1J9Rhs1s09MtNDNN8QrBm3QBr/eYfZou6JgLmGpKpQKLHhZaJBsaP2V8KwnryNEhKfvqE1eQrI9iCvFaISTFnCHW6AqtgncbMtrAK8tgQiULv4AzTHQAds00phD0TrXpukn32i+fX/tQowoNc56Jwnw4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937645; c=relaxed/simple;
	bh=yRUjHk/bWRa3yzbi/uy35powhSCptlYsurtPe87JWYM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uyUZJa6OSj/cCU31xgiZo2HMDEk6ZL0ErgJ6L4zdu7MOoHFURpAucBdZsPIOLDdi2KkxD35cGGsUcDQcBmCzjJ3ppaEZlwuyjZxlby1Ij4w7gZPtiPmukMVwGxk5DG5bsASRPlu+f2xmmdjPPTiKHQheNKk/8jo4Fywr3m8o6yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NIZxlofX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E3E924C0;
	Mon,  4 May 2026 16:33:56 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC9AD3F7B4;
	Mon,  4 May 2026 16:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777937641; bh=yRUjHk/bWRa3yzbi/uy35powhSCptlYsurtPe87JWYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NIZxlofX6t0+2104etadZndVgufTMw9ZvqEMHOclqmJC6gHGx/FJ2GAAgTD4+zcGZ
	 c7N5fov8VNvAdoRfsxzoCJ2vcYepEka6aEq8NeWpLckyyjrz0usTToXaoF3iGpc5Pj
	 w611q2DlRNqSgvTjqeFmoWDEwQ2F9XQ9ghdPNtCg=
Date: Tue, 5 May 2026 01:33:25 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: fix regulator leak in
 sunxi_pmx_request() error path
Message-ID: <20260505013325.74de6c21@ryzen.lan>
In-Reply-To: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
References: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 062D54C4DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36098-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, 04 May 2026 22:53:26 +0800
Felix Gu <ustc.gu@gmail.com> wrote:

> In the error path of sunxi_pmx_request(), the code calls
> regulator_put(s_reg->regulator) to release the regulator. However,
> s_reg->regulator is only assigned after a successful regulator_enable().
> This causes a memory leak: the regulator obtained via regulator_get()
> is never properly released when regulator_enable() fails.

Yes, that's a correct observation. The fix looks alright, though I
wonder if we should drop the "goto" here altogether, since there is only
one caller, and the code would look better like this:

	ret = regulator_enable(reg);
	if (ret) {
		dev_err(pctl->dev, ...
		regulator_put(reg);
		return ret;
        }
...

> Fixes: dc1445584177 ("pinctrl: sunxi: Fix and simplify pin bank regulator handling")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Regardless, the fix is correct, so:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index d3042e0c9712..25489beeb312 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -925,7 +925,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
>  	return 0;
>  
>  out:
> -	regulator_put(s_reg->regulator);
> +	regulator_put(reg);
>  
>  	return ret;
>  }
> 
> ---
> base-commit: b9303e6bff706758c167af686b5315ad00233bf8
> change-id: 20260504-sunxi-cda91661c181
> 
> Best regards,


