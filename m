Return-Path: <linux-gpio+bounces-39516-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H8SlD0CeS2pqXAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39516-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 14:23:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A15EE71079E
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 14:23:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=FVUT0scS;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39516-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39516-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A52D3010EEF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 12:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E8C424674;
	Mon,  6 Jul 2026 12:16:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6490D2C0F6C
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 12:15:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340160; cv=none; b=Ln7y0aMijBm6EJ7rdA7meSiKkTesJX8kqlejRdVwinrVYu6g0NzKOIyhlZz0imeifRTW47vx+ssBRDB74kh/nNZLjghluF1pk/QyAtv9c4Nt1c7ZuE1zRl2/Y5J35GVV4p23BkDSu9diB3wMXp2uD/LMX96USPmXqiTSxb4XrGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340160; c=relaxed/simple;
	bh=UQMA3O1KgP0d7XQxweBiJpijztQkgRLvbrdY3b1INQM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXzisaBYSQuJOSTTrR9no6hvw7x3LBwuhSLH655Lhg1VTAjhy5P+z3brlwx3ta7gzWbQ7idscdhnQDhvde322rMsfQq17aa3iHbxF7s5bKxGDDTqbRgN+BdBb2EMpoHTP0N4zIshUMkV3f3SZZP0mjyIWPcAzVS2MfUeY3Ez37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FVUT0scS; arc=none smtp.client-ip=209.85.218.47
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c124c3c876aso400356966b.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783340157; x=1783944957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bzjuVY716f5PrMn/z/kq+yIAQezspIShPITZBm544Sc=;
        b=FVUT0scSAcndB45z+sOXmd7M8Zs6oda+hkiKHcfhouPZuF6Vk2XAWlFBZRW0yqCF3j
         TC0W7+PTDC4h30v8QCfGomzp+xMoOSu686r0D4LSobrtMXZWNvqO5RBdRGjodsao8IVE
         5TJ8Tn/u012WsJ7BB/GciwBWUYMZTHK/rwJ6QfJbOETWpJ2a5o0rjh6KW6swCnDpmd5a
         MfxjHCxjgIj7c0EfGKGkKZlNwnznnqMdPHtuP/jU/VdNrrGZlxxkN8Zcy0sB8FITJQVg
         zfz8vYa/HcgH7454+JivWDWjbiGH/U1E4/QgCqSBVi+5X521pJw2LZhOqM+ReY6FXVVw
         q/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340157; x=1783944957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzjuVY716f5PrMn/z/kq+yIAQezspIShPITZBm544Sc=;
        b=TMt7bAFbGKkIyBtoOMfzvALgIIhMQjvSJRw/ON0i6gHKA4w9uTzSo5G8hiZowZLhwQ
         2GmLzSrxgfn3kgXYPxYptlh1dBJStMk8BYgK+i3fNpY7pAqKgi5LfCjqI2YTF3Kz43TA
         QIXU1PTeSgO+atrk11UWbj43HU/8ocND2Jl1eYre5i2GVG/vejKDR/+s6KEeVmGyUC/4
         wUr/FarMOnSToFgdTiHWanroPT8bUGbjK+vfN7ZuqZ2y+EHgJDmoBjEgVTnXEjk+2f/q
         nf9W2zdndYTERx4Iadj9tI0TxIQgS+I9nj1/5HKXKyKcbQEgZHlqZCeIY4Y3qsvFAzMW
         Nh5g==
X-Forwarded-Encrypted: i=1; AHgh+Rpoz94mxGg/OLtK5BRXLnT5w8dy0jXply8fEAiKJqHhdS+ABY32wzVRrmCGKruzs03tO4HC8ns6Bxcv@vger.kernel.org
X-Gm-Message-State: AOJu0YzNAzb99QopoeRH+75CmthJsayZO4rhsKT7uJ0nM6Pi1IiGD8d/
	pkMfj9CpoR6Bbz3i/uNLjNROP+X3293Zykf+zc+rSSgPy0Pyum46O48Zki8LvogfUos=
X-Gm-Gg: AfdE7clQVk+wuC9TbZIkAnVf2bYvPP28Pmgf1ZgqSzAGOEwn96JhTmGSLu36VQmvjTz
	qqvgJ/KA7du+rAWA4vuoHu5t4GbTExxa17pa5ZEvMOKclqVhTScANce8XW1+S70DgSA5qhZ/X8S
	6HArNGmJ+cLa0JDwVP2P75uqMOuLGuNYCN47OD2ysLVWPbCdDJA6/3IDhgU70lkjxdrl08mpkbd
	rbv7uKoruBogqsL9SyYOW0dFGe+lXQ682x0uYbS8OIFYJ95LtgPcoQrBnaK7J8K9kTFroiQSF6g
	wleyiH3Vy6JXqb0014Scwptpv7ZiKGHg/anEWuptyjJRYSxR3MF+8zk4B3GTWfa2iL10x9FayvX
	1nu5DeW1NySZtIvUZOuhV5R66y42Lu95GphAj7IhOR1So4JcBGM6FJebLgHYEMq8R4UCgpAI4rg
	smwPLu+fkFvRs=
X-Received: by 2002:a17:907:bb8d:b0:c12:34f3:9a33 with SMTP id a640c23a62f3a-c15a685045emr11805766b.54.1783340156747;
        Mon, 06 Jul 2026 05:15:56 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60550desm751619566b.7.2026.07.06.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:15:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 6 Jul 2026 14:19:23 +0200
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pinctrl-rp1: Make use of str_hi_lo helper
Message-ID: <akudSxVwFByyeHA7@apocalypse>
References: <20260705-rp1-str-hi-lo-v1-1-1b452a5a8780@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-rp1-str-hi-lo-v1-1-1b452a5a8780@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39516-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrea.porta@suse.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex.t.tran@gmail.com,m:andrea.porta@suse.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:alexttran@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrea.porta@suse.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A15EE71079E

Hi Alex,

On 09:01 Sun 05 Jul     , Alex Tran wrote:
> Use the str_hi_lo helper API to print value
> of a pin for debugging instead of using
> ternary operator.
> 
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-rp1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
> index fc4ed68ea5ac0bd272afe82076a36e93beba0539..dd0e85c2ca33a1ac506bf7ff0ceb424a7bde97d9 100644
> --- a/drivers/pinctrl/pinctrl-rp1.c
> +++ b/drivers/pinctrl/pinctrl-rp1.c
> @@ -1085,7 +1085,7 @@ static void rp1_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
>  
>  	seq_printf(s, "function %s (%s) in %s; irq %d (%s)",
>  		   rp1_func_names[fsel].name, rp1_func_names[func].name,
> -		   value ? "hi" : "lo",
> +		   str_hi_lo(value),
>  		   irq, irq_type_names[pin->irq_type]);
>  }
>  
> 
> ---
> base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
> change-id: 20260704-rp1-str-hi-lo-cc64c3614be2
> 
> Best regards,
> -- 
> Alex Tran <alex.t.tran@gmail.com>
>

Thanks for your submission!

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

