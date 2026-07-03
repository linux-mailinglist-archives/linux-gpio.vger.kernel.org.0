Return-Path: <linux-gpio+bounces-39430-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5sNfBtskSGpAmwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39430-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:08:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB2705B05
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:08:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K4HC5opp;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39430-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39430-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2858A300E146
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 21:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE4B32C942;
	Fri,  3 Jul 2026 21:08:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD42F7EE0
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:08:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783112918; cv=none; b=sCJzFaHS5w95WQoferx+Je3jhd/DodYZ56eChTU+TG643SnkeB6R+D16VvvFiNiyOgJiWZZB3TXuxKAFuu43MgnWZRcPN6i2iboKIMy+WOk0t2AG8uJC6Jb7WZ6Kj9z+NXE40V7Fc4SkVVSw8M2tL5mQwaKfNIbae4ZiDlWssr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783112918; c=relaxed/simple;
	bh=dbyAPqpVVDj73MIxAp+O7++5oakcBtgyhfQ5MUfv9wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uz0QMkfl2iYcMNsOvKvh2LL0TeDJdre1j18rUH7FLN9aiirKJUtIjk+Dykn+8emEce6JmalIUjz74VFT1zvV4qAvf1EfFPGLz3pauQBcdhWuU5m4amY4Rx31Ng+4tmvR4tbs3Y4GcX14c0ErcKC61z8O6VlAfF/QeM8X9aJjtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4HC5opp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F2B1F00ADE
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112917;
	bh=dbyAPqpVVDj73MIxAp+O7++5oakcBtgyhfQ5MUfv9wA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K4HC5opp5wdR1rIxp9DSLqBoG+cDImrOQCCZJ1D3rqGH6oCd2t5fSLVFfkW01az5R
	 qVeivNVF9CfkmGfVjR8SiKPJAE+QH1SrCQIqJGd/9/bJUb1NBPXqmrIH3VVAk/Co1G
	 LhHsaXDvQzDXvGcVO+9rur3bi0Ggu4leTWmYn+XhFpuo8E+ONB12QqN+Zmj5i68YiU
	 ksX/loeEklYUfUUn8zYdQDb4OcR0qwybaWHnSDNk/iaS2TmaQyKuB2kRE+/ogMfGI+
	 yH1ijJ348kVKhWCgugqwnKGfsecABkg+kmiDHii+cF9wB+gviqfXuPoXT2hc3VBjQa
	 aJExbuxJevVNA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeba09900bso807205e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 14:08:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpoypSnCPjL1ki2M3cUopeJmH7AJVB3zkBOgxFQ8OwGCFr7YYmnKDVoZ4HcYBC/NhHGtmFgjxaHyQe9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqg/bpvCkIA3NUzfs4EFdRYc3Wl+u2LU/U9SaxCNMTbgq18v1t
	owiayETcve+IGSNf5zAMMzhGkjEjX+P3DiBYlwRQ4UtMwThgZ1qlT8BeE9UmeQXXUVuJXlzg6DJ
	NoyOh0aQrMaRTGD5+FNhlxE3WqI7Pzs8=
X-Received: by 2002:a05:6512:8348:b0:5ae:c62b:fc60 with SMTP id
 2adb3069b0e04-5aed50bb897mr70686e87.54.1783112915808; Fri, 03 Jul 2026
 14:08:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
 <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
 <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com> <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
In-Reply-To: <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:08:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLn1SASRCLjSGsf7JMP9Oo=ij43iM6K8g=wWtZf__Xe3kA@mail.gmail.com>
X-Gm-Features: AVVi8CfoqwVpbv66dchFn3mu55vZSee6bMlCDU3AfTg-A0SyKBJyg13dDtshHOM
Message-ID: <CAD++jLn1SASRCLjSGsf7JMP9Oo=ij43iM6K8g=wWtZf__Xe3kA@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe success
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39430-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:theo.lebrun@bootlin.com,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBCB2705B05

On Thu, Jul 2, 2026 at 10:34=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> > I actually don't generally agree, but you are using this driver more th=
an
> > me now so let's go with your minimalist dmesg style for this driver.
>
> I get from where you stand, but the info level is somewhat strong.
> Documentation/process/coding-style.rst agrees ("When drivers are
> working properly they are quiet").
>
> If you like this log line we can turn it into a lower debug level?

My actual preference for the record is not simple.

I prefer noisy talkative dmesg when the platform/system is new,
and new stuff is being added to the kernel in every release in
large chunks.

This is when things could go missing and cause regressions
and it's nice to see a "hello world" in dmesg.

As the platform matures and get full support in the kernel,
these can be dropped gradually, because the driver can be
trusted to probe properly.

So, not a simple yes/no position at all.

Yours,
Linus Walleij

