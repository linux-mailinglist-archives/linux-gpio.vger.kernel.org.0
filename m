Return-Path: <linux-gpio+bounces-10768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D53A98E88E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 04:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D58F286EBE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 02:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38E1182C3;
	Thu,  3 Oct 2024 02:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="RBpOBv6g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73117BA3
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727924185; cv=none; b=tE20ZFTCCG6wnlyxy38xRohXXm12VkcmAKDuR5GAF7rcRqPv5WpTHQmq+a+oI2E1YwBI8n4Ky2EwGiIGFK0tDmYnVTLxuPU+VRuEJCJT3Qb/ord5askVZhLvLsPazjAWiiwp45+1M48HZdFqm4v68GD4AxK4gA2y/vqoY++5WIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727924185; c=relaxed/simple;
	bh=kl1fOyX8Mg5UwZoUagBtC6w6Gl2iDoAhVse2GFXBEqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfJCZcpx3WXxNdxwCRxbQtBxMQuAtZPwk5EvOggCVnLmlbWgQ0VUftqpYxGjsYKpf4wn+O6SwWgX35ggtr5Hf/oVNJVLBSnUwL7m3x7ptilwa91GCZtmq7RDjI2QfbJcsuHMxuWISrq/venUfFsvJOyUZMazrVvYyD5aqO8dAnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=RBpOBv6g; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e075ceebdaso382967a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 19:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727924183; x=1728528983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BzabvJfQ/mT0r3c3amjc5i3OTEfJmiDAnNtgqnaCdRU=;
        b=RBpOBv6gmajN+QL9EEpWxfO+VGffQXa8g9uWSV5Uoms48YF2nIJryWh3pEZfYxXqwG
         im5QgXntlNIH4OvbfrvpXluoC4IpbqrAntiwqJf4DAhfKMoZlxDj5lyJzMvd167/Vqt9
         6GAK3fgKD6SXqbHwIgBEzg9tLKjsYFnzwve6JbA+r2QKHcrcHgmc9ri9HIUR2P1H6Ci+
         fvRYht4GB4tW6XT4b8caRcefOBcc1d09x3ZMY2s/yoMLWAxuiQlsfv23Zs35+GxLj4UN
         S7/CA5Jd0ZKvceYPtDQdLCm850zh+C2dUn42rrB2BjpoALRHvHKj1PpKStES5KG/GUUY
         EXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727924183; x=1728528983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzabvJfQ/mT0r3c3amjc5i3OTEfJmiDAnNtgqnaCdRU=;
        b=UCBjZCnAXhIaZUI+OiF+DvFSnL+73J0VF5lcfJzCSpy/vBxt6R0QaLDNTZMgxlHxqA
         EKIQ+Tuw7m9gIvhQ4n/Az1mMDNn+wVphoxm8ddPHnWLEx6azdS/hucVdQeVut3ltJFyc
         mj0gFbvjNalCtEV3k8dYnYXg8U6pguMIncOXeCCnHdgZtHkWfKL2FFBd+UMrjhbjM2RL
         8dTQY2LxbC/8zHnmPyZqtLVWzSpEPUGQsxGWZ4+VjA4wtuCGnN02/aiL5MumO2+PcyFm
         5Mzo/g77ipCw3xkArTOU3Hhyo+P0L1wpHxR8rCE2/DqdIR7Njf5faogfv+LPCnwJtQbc
         1yYA==
X-Forwarded-Encrypted: i=1; AJvYcCUgKFoRlIzZsY+o6V5RgsGoDFh7t8J+Gkgent9FEBAxCNE4n8ybTbtsmfRf/qXJRpRT/QBxqZg942+E@vger.kernel.org
X-Gm-Message-State: AOJu0YxLjljkep/fKq2n+u+fHJ3KIiX0Y0uBwrFRyOLjg4zSpWJOg8Dr
	/SJ6PlDvmxRYSTICnDubKbEHMKz3WiTDKDisqkzkukBq1em+Uu3vaAmMzFxxVWE=
X-Google-Smtp-Source: AGHT+IFXE3gM6q0uiiKf0/18+ft5mNZG0Y2jhcNr77uRDbzfVN1+WvKiV64lUWP2C2WN057Sh63uJA==
X-Received: by 2002:a17:90b:368c:b0:2d8:e7db:9996 with SMTP id 98e67ed59e1d1-2e18466e1aemr6024553a91.13.1727924183457;
        Wed, 02 Oct 2024 19:56:23 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1bfd2a07fsm293022a91.41.2024.10.02.19.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:56:23 -0700 (PDT)
Date: Wed, 2 Oct 2024 19:56:21 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: clingfei <clf700383@gmail.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: fix Null pointer dereference
Message-ID: <Zv4H1cl3aH9wnapH@x1>
References: <20241003023307.2138695-1-clf700383@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003023307.2138695-1-clf700383@gmail.com>

On Thu, Oct 03, 2024 at 10:33:07AM +0800, clingfei wrote:
> pinmux_generic_get_function may returns NULL, and its retval is
> dereferenced without check, which will cause a null pointer dereference.
> 
> Signed-off-by: clingfei <clf700383@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 1bb78b212fd5..9331f4462480 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -798,6 +798,8 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
>  
> +	if (!func)
> +		return -EINVAL;
>  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
>  				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
>  				 (uintptr_t)func->data);
> -- 
> 2.34.1

Thanks for fixing the formating in the previous attempt.

As Kees Bakker noted [1], I failed to have this check in my v3 patch
series. This fix makes pinctrl-th1520 behave the same as other drivers
that call pinmux_generic_get_function() like pinctrl-single. I have
applied your patch and the driver still works as expected on my LPi4a.

Hopefully Linus can apply this fix on top of my v3 series.

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

-Drew

[1] https://lore.kernel.org/lkml/87770518-5f63-4adf-b6ea-c7f92b58ce22@ijzerbout.nl/

