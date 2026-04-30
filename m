Return-Path: <linux-gpio+bounces-35832-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIFdIQIC82lswgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35832-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:17:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3649E84F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9366300A3BE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 07:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C36D39BFF5;
	Thu, 30 Apr 2026 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEIo/BHr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62039B95D
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533277; cv=none; b=MJlDlAQgPsqN4G7HEcp80WWlQ4K9iY5UtDDpkpVhbv/TEkNR1Rs0U/wPMoXxIxDebuWWooF40Wghn8GfEaQqEs9g5vUlCh05LkZpsBAwEAOPPx6BpO2CHbtynlYgqF1pwp4pFyed016n3HVWMSnVHLAqwWrRM3M6CykAAU/5WH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533277; c=relaxed/simple;
	bh=46aRrsk4VduolpeCWiXh/05qrmB1zXwaQdpRCjO047U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJg9T+D36FGvyMzBEldYuiXAtdm5cJnLd4nwAfLYQCuxDgawuJYKI1wF0+K5eW2uUXIuC/ATNDtq2FUbrzyrn7WYoGlWQ0aq86ZoKQBp3NDUpR+YwVUPFACq88YJVIPYfZcvqHr0sCOb9z0vm2ySXwwy9ozJDEpnq/TnG3AlV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEIo/BHr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF3FC2BCFB
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777533276;
	bh=46aRrsk4VduolpeCWiXh/05qrmB1zXwaQdpRCjO047U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tEIo/BHrXapOle3sS8SkioMxXFcPjsI2jQUnkUaRFuV841rylOLF+7v7Rlgbe3hXw
	 7wb5CKJ3P0M4t2kym8ziYAs3VugHPoOdno6fhIRL8XvboMwKWzwHlmzzBt/NfFMT+6
	 5vygZ/4IDbIhfhgSDLrMOI/LAizvxBhhzP0Bwa4Mr9/kayg1snjpvLLMibHtWxI8bs
	 T9BrDvoKjvAHvFUpD4tV094K/6QFQ/gYBBmWnJiFxMYCbbsM2WQ7CLprcSDWQQvqB4
	 vkf/QNpwec6Vzz7i6sLVgxySseS4p5uQn0RfkFY6bvFGBxVXL2VxiF/hn3Dr31nyHH
	 FZnDdpfispWcA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso528687e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 00:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pyMg8VYRxbNf43KaN3k+XasrBj+VqUrqw4gtENvi/SpJ9PV7yhv0ByN+G3XtmEujPnZoXU0hOvJQi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25xO1irRK0u5Hev05fIJt4eQEdkItkOj30UsPZY4w6NDm23t9
	HY+c/qKeYgZVcxHf/cvHcnvW6iPyfrlFs4HGlTfJilnJ7wtQW2JuqOGA3mMKSJmEtziF+kchZyv
	DnJkoAZ/6/RDVxaMFk2OI1mmCG17ophirv5kAtwCGtQ==
X-Received: by 2002:a05:6512:10cb:b0:5a4:157:5354 with SMTP id
 2adb3069b0e04-5a8522bc5ffmr518494e87.12.1777533275377; Thu, 30 Apr 2026
 00:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
 <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com> <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 30 Apr 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com>
X-Gm-Features: AVHnY4IoDCsL1ZG3kMceO9b_l8khTfjG1SHVMNe95GwlVs-8ZP-WhxK6b8MdIgA
Message-ID: <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BCD3649E84F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35832-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]

On Mon, Apr 27, 2026 at 1:01=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, Apr 27, 2026 at 12:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
> >
> > On Mon, Apr 27, 2026, at 12:14, Bartosz Golaszewski wrote:
> > > Convert GPIO controllers and their consumers on the PXA platform to u=
sing
> > > "attached" software nodes. Since everything happens in a bord-file, i=
t's
> > > quite straightforward. We technically now have a way of passing an
> > > unregistered software node to platform_device_register_full() but tha=
t
> > > requires using struct platform_device_info and since the existing
> > > platform devices are either referenced from other places or defined i=
n a
> > > different compilation unit, I wanted to reduce the impact of the chan=
ges
> > > I can't test and went with the older method.
> > >
> > > Signed-off-by: Bartosz Golaszewski
> > > <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> >
> > Hi Bartosz,
> >
> > These patches are individually all fine, but I was hoping to
> > finally get around to removing the pxa board files completely,
> > sorry it's been taking me so long to rebase my series for
> > that.
> >
>
> If that'll be queued for v7.2, then I'm fine with dropping this
> series. Otherwise, I'd like to see it applied as I want to get all the
> changes required to remove the software node name matching from
> GPIOLIB into v7.2 and then finally remove it in v7.3.
>

Hi Arnd!

Before I address Russell's comment in v2, can you please let me know
if pxa will be removed in v7.2?

Bart

