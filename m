Return-Path: <linux-gpio+bounces-31856-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIKFGWPolmmNqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31856-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 11:39:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D787715DED6
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 11:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4652F301D335
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B54F334373;
	Thu, 19 Feb 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmcifXCO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F22356D9
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771497568; cv=none; b=Hl35OnI6Nnz1FB3GsT1KmaFdqpMOCae9kQWArx/ToywHyTokrrFgiAp9/nkvvrYtM54swwZ3H/falLal3dw31JEeAGYPPMUKTMqpTPHtbMVOELvOc2xBii5J9Iw45E3NDnIKSiVJ5vYuUVgbWa32tC/b11Ea2xNKmOWFgtYEUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771497568; c=relaxed/simple;
	bh=/Ihm6hbeJOx27246cs5sG7MRJRjxJ8et6PbuVMJnwY8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcEj7hjdib60dO4EQ61Pt1Ie27EwJx2ghF1AjoI5pCkW+c+POu4ai3EoHS4t6Lx71utRFJALgBYSI0okCnILw5VbDfrzUlf+Z5Qz6otYCyuF2a90KLdLfXpXPESS4uKYGmeKDoCLW/Dx9SwQo9Zg/OCSe66ajXwMV32Y5KomEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmcifXCO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F686C116C6
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771497567;
	bh=/Ihm6hbeJOx27246cs5sG7MRJRjxJ8et6PbuVMJnwY8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=pmcifXCOKCM/TkCPxO4bI/4U0xbEz3RdpItrS7LGOk7/dQ63H85ClUFYlR4yR3V8g
	 WAnTec+WX62ZcIicKrDD7wPOYF3ETURJw4/NJL/dbG4fne85+VT/GBKPHhC5Gq1Zn7
	 /g9BwqxFDjgga3YTlItgvu8Sw7z8CWDMSIyx6hQouZxfUUfjQTsbdsW4BnFtaK6GDc
	 7V6jjjOldxiWFb8aEC/hN7cZgYLCn4/gkctr0qm/JcXH0yCsc1NrJgdZ7vUgfe3+tM
	 pjJ25CwAAXgonJiqW9FCvvPgqOEB3bteRtStgHri7C26sVmoe+jfujVBIrGKKKE0VE
	 +ySdxWs3FBjNA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so11250771fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 02:39:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXu+fqtVC0eCzfroWtfLLBxbWcEdw9db4BVmQ4+jD6UHWm/r7j7kBPavDku/u0E92ZxFKVOOzQzzmRe@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPoRD0sCg7VHoiy8uOjDloMXKXpKDxhVnGM5chjf8iUNc7DdR
	tE3yVFh6tAajGGfLvvy9UEeoNb3OG4EUDrCo+lRjcDuM0Q5pEqPvQje37OEVv39v8XvcwDTUcTE
	GzG1k+sLxKJgCZmud6ienMwt17w0LJOIC0FxX5eh/rg==
X-Received: by 2002:a2e:bc02:0:b0:387:14c6:53df with SMTP id
 38308e7fff4ca-3881b997fc2mr46755681fa.42.1771497566200; Thu, 19 Feb 2026
 02:39:26 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 05:39:24 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 05:39:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZYnyl-Nf4S1U2yj@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYnyl-Nf4S1U2yj@google.com>
Date: Thu, 19 Feb 2026 05:39:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mfee4JvJuPJ-HG5vr3gdB5mBr4ADz1NU7+XSh6XGSYQOw@mail.gmail.com>
X-Gm-Features: AaiRm51eG_RW5ulRxj-07CupNou-OCE4wF5u8kC3XEkxiRn5cmlAdBa5X8twVqQ
Message-ID: <CAMRc=Mfee4JvJuPJ-HG5vr3gdB5mBr4ADz1NU7+XSh6XGSYQOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31856-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D787715DED6
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 21:58:09 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by rza1_gpio_get() is normalized
> to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rza1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
> index 3cfa4c8be80e..d83c7d8ee82c 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> @@ -589,7 +589,7 @@ static inline unsigned int rza1_get_bit(struct rza1_port *port,
>  {
>  	void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
>
> -	return ioread16(mem) & BIT(bit);
> +	return !!(ioread16(mem) & BIT(bit));
>  }
>
>  /**
> --
> 2.53.0.335.g19a08e0c02-goog
>
>
> --
> Dmitry
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

