Return-Path: <linux-gpio+bounces-33309-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDobDL6qs2lWZgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33309-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:12:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F23B27DA61
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8B6C304BB4A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 06:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D5D33D4E5;
	Fri, 13 Mar 2026 06:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHArzXVZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8774315A
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382180; cv=none; b=eJtFW7wwTXbzCraC9frtzgfBpF/RdD1Lpw39xHuf8ZyKgL44868GlqILMnXbrNxQw/Hsfm8PK70jzghVndwfm/k3tjpVG7HABKgGBF3Ko9KRgLIc03Bs6jsZgcB6/BOvm8pEsZBkaw1S2XQ/15S7f1+UbUNsLg7Pf7PcYm8ljuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382180; c=relaxed/simple;
	bh=tMO9psBLLMvClqTpa7aKiQnuy7/vbHhQyKWYXYxKS2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh98EbDDT5DUpN9CZIEJaWOyTFwVQh5syt4LO0rL3hpcBOiM5w4jt1mUudKD78tsrdr7m99ERbpUe1Np3RYSjpAjhmT6p9tZ8/1iIwyUlBDxNN/5m92a04TDkQsODYSr5a/2ZqcrZC0MR/iF3SHJucrcFtCmDbaWZrq6ptfZpkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHArzXVZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a1f3f07ebso505911a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 23:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773382178; x=1773986978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NedMiBsFyZMnPxqjdpPK7kjyHNNvVmLJBW01aJOpOfk=;
        b=DHArzXVZUY4noqQmaDcgC2aHSdLdFh0tEgtAdJBO8ho3OPfMYdIC45/nvGsAObjV77
         0cozbjDNikgTIZG5dx4ctu4qd+UNIulooHj7B8ilOxtCVM0LmsnNFkrwrNnFE+lEDH/W
         pVVg7X/vsCJCZCK314O/OsNgF71Sj37/YtBggUYiWAAy0WkNq2uM4tZdTMiIUqZ0/Edn
         BlbzC0LOn7aCCBu3OKGvnVGWcXHaC5Dt4pExwTKY/EyqX73YcH/RCKZL05NA/2FcwzMB
         +0Xd2GK3pYWgKO+1HWMY+SvC/aAYZW7h9/3MIdtlP3mfSZCpQZY/F56bmzyZp2BKfhoJ
         tNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382178; x=1773986978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NedMiBsFyZMnPxqjdpPK7kjyHNNvVmLJBW01aJOpOfk=;
        b=Zqh2aptcseIJO5jo0xk6HjrzQ15RW9Kn6rUXIq0zWzyQ8J3cIuJqlZUNMGeHWrM53f
         YPsHaBlpDcg1qsY4Q779y5mhhE+5CPZO0Fo+aTCx7tcDYvwp6WarAGYXkZyCnnxJutOg
         PGiMv4yTWe5mD2JVzFNwxW2gViLVNiPhXtYC0qr4fsVEQjJ7J7jflRy+fyXs+Os5LgH6
         IzWMF6X/lDd1KIgev6BQW5dSRdj8srUtWxgSJRCXKF9Ew52PotbqOnNQFbfnvMMkWCZk
         ZyLny3jf63+4sAkcCiKOQIyMOAsJamNgRR0FxIlrDTwfMbW36vNwoRmEuCNYiaai1cF6
         WT2g==
X-Gm-Message-State: AOJu0Yy7aHiXbhoZPIH3YYdINOU8cWfJj/LCnDyvHYt5TOwK+sCxpFVl
	Cr+fZmbroX3pZyHTX6VVjtnK1Q6sGOb5ugS9OghA+olWHGIUdf3Q9nY7G03nk77PM1M=
X-Gm-Gg: ATEYQzwLxSNmKVe1TQR4A7q6/FxoCFqkfcOAAGvrL+shudmX+MRv1um3DW1ZUCZEa63
	roCBgAy2DYXjGxlMD074MCG7vvtsxKbAan41TRgZMKMHBkqR6vexlkUBOLyJTcW0k+LTH8B7zBX
	vMsmY4QvSlwMT3PBfDWXsaD+2EeV9+0cTzC3pJsKpTyQ2/gEO86g7ogsOHTm0vDfdwpHvriVa9g
	MD0lzr63MlldWznxyB9QajFFni9D5u971j0QNYYPejTbOY2bEOZ4Sfd5AasfwoyOigvu//qjKc/
	3R1oqygwhEPVDrGK6o2848R4dx8fzEFoOvBAXdT1D8J7hfmy1MbGauEumN1TgS16Zkp0V8DYtxs
	aFYpPCpcDCcRvwx5huEw2I60PsrwPIST0nKVTJJOajP/arveA2ezQWoFtbBHkNL8w9bIgyOOk2F
	jMqY0GK4zoCJw0RMMWOhdchiw8
X-Received: by 2002:a17:90b:3b87:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-35a220811a4mr1802735a91.29.1773382178162;
        Thu, 12 Mar 2026 23:09:38 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a1c34fa3esm3329099a91.4.2026.03.12.23.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:09:37 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:39:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:VIRTIO GPIO DRIVER" <virtualization@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv3] gpio: virtio: remove one kcalloc
Message-ID: <7jwgbrijeldghk44tdg2be5q7o7vuj5np3nlbl2pxuln6c7ll7@ntuquxxdnfmm>
References: <20260312193717.12221-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312193717.12221-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33309-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 1F23B27DA61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12-03-26, 12:37, Rosen Penev wrote:
> A flexible array member can be used to combine allocations.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  v3: add counting field for __counted_by.
>  v2: add space in struct
>  drivers/gpio/gpio-virtio.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index ed6e0e90fa8a..57d0eb532c3c 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -52,7 +52,6 @@ struct virtio_gpio {
>  	struct virtio_device *vdev;
>  	struct mutex lock; /* Protects virtqueue operation */
>  	struct gpio_chip gc;
> -	struct virtio_gpio_line *lines;
>  	struct virtqueue *request_vq;
> 
>  	/* irq support */
> @@ -60,6 +59,9 @@ struct virtio_gpio {
>  	struct mutex irq_lock; /* Protects irq operation */
>  	raw_spinlock_t eventq_lock; /* Protects queuing of the buffer */
>  	struct vgpio_irq_line *irq_lines;
> +
> +	u16 ngpio;
> +	struct virtio_gpio_line lines[] __counted_by(ngpio);
>  };

I wonder if it is worth it anymore. Why combining allocations is better when we
are ending up using more memory ?

-- 
viresh

