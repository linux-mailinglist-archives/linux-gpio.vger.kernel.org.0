Return-Path: <linux-gpio+bounces-36541-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIkJJczKAWqgjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36541-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:25:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920250DACC
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14B5F307CCEA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CAE36C0C3;
	Mon, 11 May 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcW9O+qt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE426AE5
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501730; cv=none; b=lwSP5Mlgw57orGSWYOrd1EGrg3L2CrEhM0TdQaPhQT1YT6HtdKl1h1zK7i6HimOFJexROmVCN/013hWE6oQEAX0XrIIjce1oNbk8tobWyNqsobfc3/ZOmRWBTveV7xOJMkNxWtS6hVjHQMlcsQPG9OITEhLnXtlMKe5Y0P/QqZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501730; c=relaxed/simple;
	bh=swM6FcT/kgTZZpmVWbKd+nNPlKXLaVtAIeGSazI6J8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8g8KFELs6enZmZfP6W/LDmoXYpHjKrY06SWwcjaXnc2KSdYGn7C3gZPYswQ9DK047B8vWZvuGcwhefprNoOXsQFRuV2eaV4AMK/arr3iJU1VvUjaClgrfTMabThQMef2nkiXC1uEKjaqMKLwt9oVvgKmFHXmFJJuVcKhDU1hZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcW9O+qt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E424C2BCFC
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778501730;
	bh=swM6FcT/kgTZZpmVWbKd+nNPlKXLaVtAIeGSazI6J8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JcW9O+qtJNoWOu8CAWOegypv1I7GCbQDIGMdaTgSk2TyqoRvi6wxX6AFQT2DGohJ2
	 o4uQx74ko1MafycwxcVGd/DlBkTl2SRFUIU63fPFP9m8rwrjrTxOT6AtuYV6rq0T6Y
	 v9ywCIGQHhTRUjYUItQD65Z79MtOh+JLAtNetGtboxCLsDd2UhCvF0WizJm6PxhJlo
	 lz4AG4UwzO2et2fs8pccBPyOD1CIADyu9c3H/pw/hPDqb5pXRI4UiZxFdhbGLTpGBX
	 KVwpHx6ynlQirgZUEvUwr7h95XvclpnqMm5bW4JJPnONxRWvy3cazupJGHkb1IiGtP
	 noiNtCK+vHmRA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so1093537e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:15:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+YBu+jYEflszGQrnOmfg5wXSjt1q0tPHh4gpL45UhBK5Q7RdTxWIRInWVef1xkgp/KkR/GPIGJwjsF@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/n87mVk5Yule2CK4R0bkHJzuMBH/kZVuvDRzYnB1Lb2gEMzp
	yIDyql6X2aEBol6KPnzHdXoCA0e1mTprg3z6DGVjy8jzLQmbvKiwQtqy4+wONnQt5lyXvS8ovoZ
	f679PdC1W6HnKqmKcZd9bg8NqWsP2tA0=
X-Received: by 2002:a05:6512:3042:b0:5a7:46f9:be3b with SMTP id
 2adb3069b0e04-5a899bbdacbmr4934433e87.14.1778501729058; Mon, 11 May 2026
 05:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
 <CAMRc=Mfzy=pWuvJ5Y1hqoWuYk8JSwzBxNFeVSwyFQ76CAEZXLg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfzy=pWuvJ5Y1hqoWuYk8JSwzBxNFeVSwyFQ76CAEZXLg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 14:15:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLkG35pTLY2=vyj974PjDax277ebqYd_WUjLOeQHEvntsw@mail.gmail.com>
X-Gm-Features: AVHnY4JONIOmcs-4518jY4skG7wzCk5Cx1MszfjBd6r4mFYzT4RpDbhAhsViWYU
Message-ID: <CAD++jLkG35pTLY2=vyj974PjDax277ebqYd_WUjLOeQHEvntsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Improvement spotted during patch review.
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3920250DACC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36541-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:56=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Fri, May 8, 2026 at 2:51=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
> >
> > Support sparse unidirectional GPIO lines.
> >
> > To be used in a forthcoming submission.
>
> Should I apply it or will Alex just include it in his series?

I think it's easiest if you just apply it then Alex can just base his
patch series off your for-next branch (or cherry-pick those
underneath his patch series).

Yours,
Linus Walleij

