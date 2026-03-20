Return-Path: <linux-gpio+bounces-33943-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP2bL2KQvWnY+wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33943-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 19:22:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF452DF53D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 19:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E29C30E537E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 18:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A9A3E3C47;
	Fri, 20 Mar 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPNoQnH1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE813E025E;
	Fri, 20 Mar 2026 18:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774030228; cv=none; b=achwPfO7Gr5VRRmb7GgyZN2ZWWK6qixfYIMXozY2pAcvzcgSUO9URI0/WCfVNQc4waIB/HabQwgc8IXH2hrc1MJWkp2bX2bG5CMTlM/PGeJPi9/ju0VPqVzKBnQKM/5SJHDqFrYTZOg2uShaz9vk/g0qYb/EDShJeY0O68Z5mBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774030228; c=relaxed/simple;
	bh=HN2gQ76vWA+8OUenZIyxhbvtYrHC960mitHXCMLfomY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdZYqXTA9nycLqFX2B+sjdI9jI3wRi6BPk5gmRspkaMUFpxygguc4qYx6nGpHryz7IsGbsXGeSrkYQbPDq/kGA2WvuHpXIx4NX9weoB0g+hfsS9ioZP+m23Vff1GkoR5JDMzH3AZFReXN6vs833O5ptkkej8USmN+VrI/SK03I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPNoQnH1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E812C4CEF7;
	Fri, 20 Mar 2026 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774030228;
	bh=HN2gQ76vWA+8OUenZIyxhbvtYrHC960mitHXCMLfomY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPNoQnH14L8TgU6gye7bDyZialqKlvmDHGeAn0nITLS4Jd30vw8e9OUAXJaFosmdN
	 LnTgqVQJ7mPwpbHHhlMBaU/cZCkUeNGFnaMB2JxtLkTsap7evvIGc9rI9Te62WgcyD
	 HY4hWBPVIIom6ph1hXnFUckx3WxrcXyPvTmUpXrlz3FoDXKFPxf+KD/HxrwdpswqS+
	 jGfFfEoSRDKtvGvmsutH5E6Z896BG+cwgX9KObglSHzf2eSQ6wTfS49xf49B2ebaM0
	 QRynUr7epqgyH0+XFeLegThBBCeLsLLL+C3qStqqWO0LQ0AdpJLGk/RZFnZjhJOFaz
	 d6Ia6sk8sCrpw==
Date: Fri, 20 Mar 2026 11:10:27 -0700
From: Kees Cook <kees@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] gpio: mockup: allocate lines with main struct
Message-ID: <202603201104.8D7B8A1@keescook>
References: <20260319000558.22108-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319000558.22108-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33943-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1AF452DF53D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 05:05:58PM -0700, Rosen Penev wrote:
> Remove no longer needed kcalloc to simplify allocation.
> 
> Added __counted_by along with a counting variable to get extra runtime
> analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-mockup.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index a7d69f3835c1..a907ce28cbbb 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -52,10 +52,11 @@ struct gpio_mockup_line_status {
>  
>  struct gpio_mockup_chip {
>  	struct gpio_chip gc;
> -	struct gpio_mockup_line_status *lines;
>  	struct irq_domain *irq_sim_domain;
>  	struct dentry *dbg_dir;
>  	struct mutex lock;
> +	int nr_lines;
> +	struct gpio_mockup_line_status lines[] __counted_by(nr_lines);
>  };

In the cases where a new counter variable is being added to the struct,
I think it might be better to have those be unsigned.

>  
>  struct gpio_mockup_dbgfs_private {
> @@ -436,15 +437,18 @@ static int gpio_mockup_probe(struct platform_device *pdev)
>  	if (rv)
>  		name = dev_name(dev);
>  
> -	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	chip = devm_kzalloc(dev, struct_size(chip, lines, ngpio), GFP_KERNEL);
>  	if (!chip)
>  		return -ENOMEM;
>  
> -	mutex_init(&chip->lock);
> +	chip->nr_lines = ngpio;

Besides the new variable being meaningless for negative values, there's
a strong hint about its type even from the counter used to perform the
calculation (u16):

static int gpio_mockup_probe(struct platform_device *pdev)
{
	...
        u16 ngpio;
	...
        rv = device_property_read_u16(dev, "nr-gpios", &ngpio);
	...
        gc->ngpio = ngpio;
	...
        chip->lines = devm_kcalloc(dev, gc->ngpio,
                                   sizeof(*chip->lines), GFP_KERNEL);

But this begs the question: why add nr_lines when ngpio is already part
of the struct:

struct gpio_chip {
	...
        u16                     ngpio;


?

-Kees

-- 
Kees Cook

