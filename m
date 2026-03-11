Return-Path: <linux-gpio+bounces-33082-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOkWHvQrsWkBrgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33082-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:46:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D197225F9F1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34B633402CFD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F332C3B52FE;
	Wed, 11 Mar 2026 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AapW1OL7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293C33B4EA9
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218070; cv=none; b=Z3Y6y36uKxs7M44errdemtnXyfpgj62Ub8+napCiwZY+Mtw2S6m5+eTsmjAaFFK4X6jX5ha51TdsEjQ2AaWvJiBl+hG4LPN5/VgAU1lhB7EsDeXRID2LViVlSf5skzmtOVaKCEeLBlHjmj0jENBMCvQLytHgJbo7TGNJKKoTTp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218070; c=relaxed/simple;
	bh=EnMyS8+szDAa/RpTVWOfIkKuA1sX9RBaQVKPN5+DF6o=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBciqPOBc/B/dNHNH75/OUf+ZKdAVheioUHlJJ/R5t84ZPMh5BEZ4TMP9m/Ja4G2jSCy8IEaOrA8XnObYtjge09wnZz5kp4Em9Rr458O8EmVlSpeb2lLtLc2lVY04n1U2crDNrSxs4F7b8UBgg8zg6SAo8dcWeOBpqygrY1p8bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AapW1OL7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999FAC4CEF7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773218069;
	bh=EnMyS8+szDAa/RpTVWOfIkKuA1sX9RBaQVKPN5+DF6o=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=AapW1OL76do1jS5S6GXEGLJhpGmV5MhKTmqMvVWSQMmX5TlTn0e9s29M8XldBxK+X
	 mEon+CPd5ds94yWu7/Kftb22CujaZ1jrzEIDQERQXo7cmR32UAETTYPGvP0Lw3ziRE
	 cQ/2AkVcb/72/NkCDDEFH2ASHpqs/kixSjoT95q6vXQAQKg8NMSvckj0H+I1+4p7KI
	 rxHeo4DhiVyLSXMfnoBNZIqtF97GZsz9tIrmVFU//qRGR9X1GbcEuPa5dnq2yE4gbS
	 lNujK49YHoECgIu6Mbc7+20p9WPYT5kC6BQo7dIkYo7WUni9iMG5JzuDUMsuU6y5ft
	 H2/4syuXWBngA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a2544b52bso82950671fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 01:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ78jtpqxPCufisTAXTITEkCQsQ1nOJyFJKXsGQm4pUZiwFm3sDLSnIRHUdFgIeb1n/ytZP8JSCrMM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr+hcfiO43A4cObAg8gMnFEcnc0+/sP5noBowIzuTlmld5FlNT
	kmG21ifs45qIo8o8a2aJ3f/DhKTH36PhvwOKPI2ra56Wc5jvdo+yBixUS/Acl1Ay8UH+Xgq0boI
	AJ9f9l4FKZDxpRb8qafLJSKAzrC4q17v8BHYfyfM0iw==
X-Received: by 2002:a05:651c:4214:b0:38a:3dcb:910 with SMTP id
 38308e7fff4ca-38a67dc916emr5170611fa.7.1773218068301; Wed, 11 Mar 2026
 01:34:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:34:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:34:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260311031134.14218-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311031134.14218-1-richard.lyu@suse.com>
Date: Wed, 11 Mar 2026 01:34:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfioFeJD=s_w0PQ2jD4npHr9y7nMhu3bXUwrr0D8roPgQ@mail.gmail.com>
X-Gm-Features: AaiRm514Db_crc0d05_lPJLEhb6WWLUMLVMwdIhIph2Pz_zObryo9vAXiAIcwnw
Message-ID: <CAMRc=MfioFeJD=s_w0PQ2jD4npHr9y7nMhu3bXUwrr0D8roPgQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: max732x: use guard(mutex) to simplify locking
To: Richard Lyu <richard.lyu@suse.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D197225F9F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33082-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, 11 Mar 2026 04:12:12 +0100, Richard Lyu <richard.lyu@suse.com> said:
> Convert the max732x driver to use the RAII-based guard(mutex) macro from
> <linux/cleanup.h>. This change replaces manual mutex_lock() and
> mutex_unlock() calls, allowing the chip lock to be managed automatically
> based on function scope.
>
> Refactor max732x_gpio_set_mask() and max732x_irq_update_mask() to
> improve code readability. This allows for direct returns and removes
> the redundant 'out' label in the set_mask function, resulting in
> cleaner and more maintainable code.
>
> Signed-off-by: Richard Lyu <richard.lyu@suse.com>
> ---
>  drivers/gpio/gpio-max732x.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index a61d670ceeda..8930f49576ed 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -18,6 +18,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/i2c.h>
>  #include <linux/platform_data/max732x.h>
> +#include <linux/cleanup.h>
>

While touching this, could you please also order includes alphabetically and
add linux/mutex.h which seems to be missing?

Bart

