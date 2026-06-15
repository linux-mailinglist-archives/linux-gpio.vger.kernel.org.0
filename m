Return-Path: <linux-gpio+bounces-38497-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YZkILdP3L2oOKgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38497-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 15:02:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 663306867DD
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 15:02:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UBbUt1Kb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38497-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38497-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A637301CC52
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 13:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6BA3F39CF;
	Mon, 15 Jun 2026 13:01:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA73EFD1F
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 13:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528489; cv=none; b=jwF60aYvFvZw8r5+O1HeIzHafjmljrT6nF/5/op/viQAKGQ0B418huUA72awIXB8y31TFU/FstUAxUMgg1n3QLJPzdbx0XYUN/L4JjFW85BgPYjVDd5e3QCGe7JW6ouEHgC49HBe/zH5dr+6wJLRnjp/F9iZ4ESVC3NJQoduWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528489; c=relaxed/simple;
	bh=UqC405AaF8TrWWhU1dB+lz46uWf0Hq2qOLQieMUrpms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcjyrwERoWpnkN2GY65YO6HJ7cjqu66otgLeUenvbtr5sy7vkFJkokZmWkW4HQR/+URbxX2lqeMI4mfXpTb36XXM6Qr0zjLv89a+FtGTUBrM1K1s3Geaj1A4CqVklSLcnAY11FwiF/7d5DUClAeh0aCOw5it7jK9ZTphIij1RV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBbUt1Kb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381511F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528488;
	bh=zRo3ktcK7QAV26zbxPcn2AtzYmq1+W8RKTgwMwSUSDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UBbUt1KbrTQgLnhmPZIsHRJmSFKmec9NmKFFZDkT0uFYohDiAEksT0pkPWze6YN8S
	 AMshzWhAD7+a6Bjuk8SOPzi1qvosOxfWuJnC34gCV8kUZcRyOtDuN0+wI8rMftpTRE
	 jS96kRIgcIUaZPgpMG6AjxVpdwouHs580iylJuTDEzGto+6Y09MsggEh5kaDDJ4Mjp
	 8dxcK2Ae09KvhyjnNW4m+cM/WFRCuvIaCYRbs/2cxPzvDxC1Y0A4cCVJoVCXhN9ez9
	 Pz9U1hYMqlGOBrmxTVdvoWWqMG0h2TZ0GlKCF8itlGO7DVlOdCuF1Wyb2/PbNqnRV1
	 tvgGHMltIu9qw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so2977306e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 06:01:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Gcc+C6+L5uQOf5wucwJPHM50bsmGcoH+sQ+ukCoI/MnZjvvfMx73I2IE32GXJGt+iGZek19GUm8qw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91Y9LIKCYOujrUU77f3uUUl/djXRByjL4Mbo7zlwavVc+2YM6
	5AIk/WcfnO5L5dpy2Uzf3mxWASMw+YlvwdnbQlqA+iANmYUUoDTCmgOnG7iEYBZbaP2eDO34zHK
	ls32pMYuiYOJJiFjq8LD4VNfYwD+nxic=
X-Received: by 2002:a05:6512:b9a:b0:5ad:2a7a:868d with SMTP id
 2adb3069b0e04-5ad2db65b01mr4044758e87.36.1781528481218; Mon, 15 Jun 2026
 06:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-export-get-group-selector-v1-1-fc4451a9ff0e@kernel.org>
 <ai_QMNydoXXoOFmB@monoceros> <CAD++jLm+rv+Tm-WxvD51ynKeDUrPMAG=nfTNxRbf8FvSNy+dGQ@mail.gmail.com>
 <ai_0i2cicHHzwIXj@monoceros>
In-Reply-To: <ai_0i2cicHHzwIXj@monoceros>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 15:01:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLkWajjJsWyPmE16Jymrpzm-vBJymTrpSA6eN-mm6H=cNw@mail.gmail.com>
X-Gm-Features: AVVi8Cd5ZKpulqE0biEIR2A9-XgH3VcXPIFPSLm21T3S9XbmuCga5cAmZ7noEaI
Message-ID: <CAD++jLkWajjJsWyPmE16Jymrpzm-vBJymTrpSA6eN-mm6H=cNw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Export pinctrl_get_group_selector()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jia Wang <wangjia@ultrarisc.com>, 
	linux-gpio@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38497-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:wangjia@ultrarisc.com,m:linux-gpio@vger.kernel.org,m:nathan@kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[mail.gmail.com:query timed out,baylibre.com:query timed out,intel.com:query timed out];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[baylibre.com:query timed out];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,baylibre.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 663306867DD

On Mon, Jun 15, 2026 at 2:49=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Mon, Jun 15, 2026 at 02:27:59PM +0200, Linus Walleij wrote:
> > On Mon, Jun 15, 2026 at 12:16=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > > Checkpatch criticises:
> > >
> > >         WARNING: Reported-by: should be immediately followed by Close=
s: or Link: with a URL to the report
> > >         #9:
> > >         Reported-by: Nathan Chancellor <nathan@kernel.org>
> > >         Reported-by: kernel test robot <lkp@intel.com>
> >
> > Now that is just checkpatch being silly, because what in in next looks
> > like this:
> >
> >     Reported-by: Nathan Chancellor <nathan@kernel.org>
> >     Reported-by: kernel test robot <lkp@intel.com>
> >     Closes: https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm=
-lkp@intel.com/
> >     Fixes: cb7037924836 ("pinctrl: ultrarisc: Add UltraRISC DP1000
> > pinctrl driver")
> >     Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> Yeah, so the kernel test robot report has a Closes, but Nathan's
> doesn't.

Ah OK I'll put the Link: to Nathans report as a Closes: instead.

Thanks!
Linus Walleij

