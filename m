Return-Path: <linux-gpio+bounces-31510-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NFWCuayh2mRcAQAu9opvQ
	(envelope-from <linux-gpio+bounces-31510-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 22:47:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B929107356
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 22:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52E173011C71
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 21:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4902FFF82;
	Sat,  7 Feb 2026 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdnQLgh4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110732DF136
	for <linux-gpio@vger.kernel.org>; Sat,  7 Feb 2026 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770500834; cv=none; b=Sn0XodJHjPvJQucDI9NbLQ7oxD24IKX732EL01aYRESCRGxn7kulg+clC6ybzIOr+70Vy8iHV/sHlYp5aLr7LPTdQ9REb8dsJ8Q8TX4UwWS0HG6ASDRccze5Ks1Fb8GT0H9d15jE4lWRqXuGS088s8KPzEzn2OTVh+QJWNeaNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770500834; c=relaxed/simple;
	bh=PUCVCh7hWYSlur1+31lOhVvCPBN6lg4S3qf5xRQ12yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLM7xthtCYRqldNJxJq5k5UEx0JfOFYjdROk5/Pt3a9CFAwmw/n7C/GgtANyn8b73z7TfdI0lh0S2Nm0GRDbwsfHi9tKyNNm1ltJYEWEKHCwmDOMRMLvDfh2Q+frComXyc9Dfx4gt2JpcPq35f34Ahl7p9ue2gqNBoojrWZNWEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdnQLgh4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70F5C19421
	for <linux-gpio@vger.kernel.org>; Sat,  7 Feb 2026 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770500833;
	bh=PUCVCh7hWYSlur1+31lOhVvCPBN6lg4S3qf5xRQ12yE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mdnQLgh4GCFMxz7tLeRnk9yRoHI1reT4SNT3/UUsse/pmRNVbz9CXmqiRPQDIVdRf
	 8HIaMsWuG5ndWqeY2qtJ3A0vCuSykNiKR5pnc7d0a5sDBVO1vMF6n1lpCl0e/gLzAj
	 1BX+uuSkdY9pGcCR5960ZRw34jYJwiR0Hq1kTxpOKH+/wcI/RpT9iTafA2tANCiHkP
	 86ydXUHeGLJysplDXO+185uX4rpPoHlI61QP1r7t4RCSev25BDtqB/bhXxytM4zH8J
	 wlQkAEXruYcb3ZvxxAoeEze3mVH/AiNsmTFRpMCxgS63Z7SGd9kN2EffWCsvic7CKC
	 wFhi3n+Q61Iyw==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ada2c30a1so342523d50.0
        for <linux-gpio@vger.kernel.org>; Sat, 07 Feb 2026 13:47:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmH/PiktqTQiQIdZCvZTqeMZWHq4pTsRf6uH41ami0szPX2WPnOMeIMCt7aQyPu/LwdtDfSQ9BrswL@vger.kernel.org
X-Gm-Message-State: AOJu0YxDZn1KsJ7Z807OPRaRJeh/doxGdLaLSNoAHT8PfvShTK+8ijBY
	T8+dxLPLLrTxNvtzXMoabekjfxoImo5Q2SLzwZ/YQ9GAzupeW49rtpmuTIB+eVCYqrENG3wwqsn
	JTSYg6xqALR/Igl6SM7wqXamDvcu1p0M=
X-Received: by 2002:a05:690e:4091:b0:64a:da86:ed9a with SMTP id
 956f58d0204a3-64ada86ef90mr1743698d50.44.1770500833290; Sat, 07 Feb 2026
 13:47:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204164333.1146039-1-florian.fainelli@broadcom.com> <20260204164333.1146039-4-florian.fainelli@broadcom.com>
In-Reply-To: <20260204164333.1146039-4-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 7 Feb 2026 22:47:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLmkV3wNe2Wxj2VNOXNBN9UgAY2cXQOQkUynQHY8diGrfw@mail.gmail.com>
X-Gm-Features: AZwV_Qi0q0LihRxjzmHgTZVowDxTeIZmBVTGNFwh3fVOe75DigbeCU8qwhhNVhc
Message-ID: <CAD++jLmkV3wNe2Wxj2VNOXNBN9UgAY2cXQOQkUynQHY8diGrfw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31510-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,broadcom.com:email]
X-Rspamd-Queue-Id: 7B929107356
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 5:43=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> From: Doug Berger <opendmb@gmail.com>
>
> The classic parent_wake_irq can only occur after the system has
> been placed into a hardware managed power management state. This
> prevents its use for waking from software managed suspend states
> like s2idle.
>
> By allowing the parent_irq to be enabled for wake enabled GPIO
> during suspend, these GPIO can now be used to wake from these
> states. The 'suspended' boolean is introduced to support wake
> event accounting.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> [florian: port changes after generic gpio chip conversion]
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

This looks correct as far as I can understand.
I wish all GPIO drivers has as elaborate wakeup handling...
I will look at this driver to see how it should be done properly.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

