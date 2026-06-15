Return-Path: <linux-gpio+bounces-38488-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +oCEMOPvL2pXJQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38488-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:28:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7A68632B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:28:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WithE66X;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38488-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38488-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2F6F3002D13
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFAD3E9C19;
	Mon, 15 Jun 2026 12:28:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D12E25A2B5
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:28:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526494; cv=none; b=OnfKQ3sfhsz9//n9JnSS5DhiAxpeJZHY6z28MFuyCiYa/CCFr5nBjrFcn1y5bEeZAuOG9Jy//VCL4VztxJF5pwfwMi2dsYro3JE+WzY1RWqrchmCJsV4lJTos6ogNt/8Wx0NKfSCYpAUloU08Ksyy/Dt2K/ViIpPF1SWTUVY5q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526494; c=relaxed/simple;
	bh=B9rTf3/BlFOUK1QJIvQpEXPOLdZpvp4LEaXqgjWvAwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpmW/3RjVljXnl2ja23dxnTWoMmziOAkXk0QVRO0xQ3xeYOtvgaNVeas2+vPEq1B3SeeBarCyA4ce6T2jQtjoAgRSP0VHU77pRB/yVOrq0eoU7pmCII2h+x61AxCgXFqObRxrUCj4rlFTxV7kCq9ZGX3oNneLSGgO5NNM3Wtva8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WithE66X; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9E21F00A3E
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526493;
	bh=+Zi1kQd7pvph0FBDfOvULN27dZfP4EN5iU0jWaN6/jM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WithE66XO27LKGbhHABjjqjzHdDRheldLDMByeI7si6kM9PG6By8dR7wft7PXpatU
	 bQqOgVxlkS7p3GpvCndVyB8vztYx91J9rQq97NfKAApLlFweBiIap86BPnZQ9HajmL
	 k0ORNx3Ea7njzVFIE+XTgwjFwMHQcq31Y08my/Ln+mmd2kHrp66TLivjqx4n6sVVTb
	 FeHSpbOVf8/oNiSWWhHiGPmpdW+MUuP3kKszM1kNQH1vchgBAMrGsgsYCMfZgwZR6K
	 SLxQle5Xj/rhp6vrsXGvGeVgZHxJ2cFEH9kctDbVgBobAgppJExbh6pvyvUOZQTooN
	 yXGdb9Y1f7Ueg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso2888488e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:28:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/LwtiXlWV+fBAgqxA/SVLwIFUJKhXGPUalA/hjV9WJpdqmf2fi4RwG73d7xnHPG9gOL8kDR1xnAQJM@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/V3/8JdU+COJ+B6+Pvy1A9X3IPROQlkwER6YnRs1W28G0KZa
	FtJbwtCaRXZaWfMnQOYp5MmA3gD6IoWeJrppgb3I3PcF1xi2MbZEE0DIU32T65k9zkAaVngKOAY
	eIAFHRCA2pbe0okiIf7O97f6fbUmLV8E=
X-Received: by 2002:a05:6512:33d2:b0:5aa:64cb:9589 with SMTP id
 2adb3069b0e04-5ad30da2a94mr2482474e87.4.1781526491916; Mon, 15 Jun 2026
 05:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-export-get-group-selector-v1-1-fc4451a9ff0e@kernel.org> <ai_QMNydoXXoOFmB@monoceros>
In-Reply-To: <ai_QMNydoXXoOFmB@monoceros>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:27:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+rv+Tm-WxvD51ynKeDUrPMAG=nfTNxRbf8FvSNy+dGQ@mail.gmail.com>
X-Gm-Features: AVVi8CdoT766luO7StBGs-cVI9SljLXF6JYh3L6fFUXLmgtOKT5d98c0M3OMMvc
Message-ID: <CAD++jLm+rv+Tm-WxvD51ynKeDUrPMAG=nfTNxRbf8FvSNy+dGQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38488-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:wangjia@ultrarisc.com,m:linux-gpio@vger.kernel.org,m:nathan@kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,mail.gmail.com:mid,baylibre.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9E7A68632B

On Mon, Jun 15, 2026 at 12:16=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> On Sat, Jun 13, 2026 at 10:02:30PM +0200, Linus Walleij wrote:
> > The recently added UltraRISC DP1000 is using this symbol, and in
> > a reasonable way as well, so export it.
> >
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm-lkp=
@intel.com/
> > Fixes: cb7037924836 ("pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl =
driver")
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> I stumbled over this one, too, and see that
>
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git =
for-next
>
> already has that patch. Checkpatch criticises:
>
>         WARNING: Reported-by: should be immediately followed by Closes: o=
r Link: with a URL to the report
>         #9:
>         Reported-by: Nathan Chancellor <nathan@kernel.org>
>         Reported-by: kernel test robot <lkp@intel.com>

Now that is just checkpatch being silly, because what in in next looks
like this:

    Reported-by: Nathan Chancellor <nathan@kernel.org>
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm-lkp=
@intel.com/
    Fixes: cb7037924836 ("pinctrl: ultrarisc: Add UltraRISC DP1000
pinctrl driver")
    Signed-off-by: Linus Walleij <linusw@kernel.org>

Certainly it doesn't matter which order the tags are in.
(And if it does, I don't feel it's important...)

> . Not sure if you consider this relevant to fix (i.e. add:
>
>         Link: https://lore.kernel.org/linux-gpio/20260613164847.GA3152104=
@ax162/
>
> ), but if you do, feel free to also add:
>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

I added it, the more the merrier!

Yours,
Linus Walleij

