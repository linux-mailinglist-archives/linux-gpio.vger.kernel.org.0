Return-Path: <linux-gpio+bounces-31522-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EdfEQmuiWndAgUAu9opvQ
	(envelope-from <linux-gpio+bounces-31522-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 10:51:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F1F10DC6B
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 10:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AC503002D0B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 09:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097E2365A08;
	Mon,  9 Feb 2026 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AklN6AE5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0275353EC2
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630659; cv=none; b=oPLxkBmnAPD1ZYWEifcJBNTgyuWY/bSoIp49Gf5vUkutxD0eh0qlF3DRhXN2TNb4drUmwDWlV9d31qzW5o7nHA0hYMdaXJf7tlKIKY/vrexn7HO5WEjlw9dT/DVh5eDKQCDrPlpUF7DpbIuIwbmw+k1RKKUYV1z0x8spmfPSzQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630659; c=relaxed/simple;
	bh=xCi6ubXgKmasEcdXHAMMG5PC/CNlxGY7PcTKXlTNTI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxSn3cgB0rRJaAoTLfdjKq+0xOBOxOImFPygDBxU7Q5IWVeNnSImHbfA3eLfQDkm0zCDgVNmwNDC/75oykIEBDIXWiPUq2XKej1NA1x8VzU2Hx0lsopUH+GVwtgKzEs2aUGZK8a9+UekJqnCz3aeUNU3g/+HRtFpII013JXbXCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AklN6AE5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2DBC2BCAF
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770630659;
	bh=xCi6ubXgKmasEcdXHAMMG5PC/CNlxGY7PcTKXlTNTI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AklN6AE5thhQ9moJMbKv4ABgOBvrKniCX6UalMGworhvE40cE7NdHfuiKmLNRIuba
	 m7paA4/qSxD2NRAAhCKiKown6BbsAhhuPvhpoNB+yPmitQq+LeWqeJ9NqWgZbnFAON
	 9UH4Sscm9ZheOH1sgGhSMAIB2Dy+I+Wq/Ji41l1xfcvbh7dVZcFTRgIjHhC8wEY5y5
	 FnzTZW6qkTbxQwPNApe4rDFDnWM88elaL1C3pGbBeYF0A32sk/hn36gkD4o03qS/4G
	 lhJ4Ec477OMdUwjTXfklT1qoI8DPfWuMAuKPCE56gPQxc3G9xNWVmaof3Loo+x9FbH
	 IrBoz6N+LNd3w==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-649df3c22d4so2115837d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 01:50:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJsZZEm+Jos5RLMLpRDNTapHEG3FHvNeu1Pufx68kCvMRmx6pCNTRIYiwpAprDl13Wz8Za62WROZ2w@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSE3wh9axLGmCgJ3aaI3dQfARLp/CQpRsE419rA3lHK2iLzE7
	OWTey8BXOtGmazrpgUzEEEeJuVN6FfXpWUA0WMa2tHW2reEYjYCIL/2YEfLtlToUChs0gqK0psc
	LS3FcMAVOtbeydA/9o03v7pcL8metn0E=
X-Received: by 2002:a05:690e:140d:b0:64a:dafd:2d49 with SMTP id
 956f58d0204a3-64adafd302bmr4654383d50.47.1770630658832; Mon, 09 Feb 2026
 01:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com> <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com> <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Feb 2026 10:50:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
X-Gm-Features: AZwV_QgbghYPe4WNXN5NblKdatayN1hvGLYaSa9NTwtL-Nk8oW-Brvg1nLBjte8
Message-ID: <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31522-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,aspeedtech.com:email]
X-Rspamd-Queue-Id: 75F1F10DC6B
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 3:25=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:

> To make sure I align with your expectations:
> 1) Would you prefer the new driver to be fully standalone (using the
>    GENERIC_PIN* helpers + syscon/regmap-mmio), rather than trying to
>    refactor/export helpers from pinctrl-single?

Yes. Conor improved these helpers so now it should be possible
to use these to do a very simple and slim driver for what you
want to do.

>    Action item: Introduce a new pinctrl-single-bit.c driver and DT
>    binding, which can also cover the existing bit-per-mux logic currently
>    in pinctrl-single.c.

Sounds about right.

> 2) For the syscon/regmap hookup, is it acceptable to add a syscon phandle
>    property in DT (e.g. "syscon =3D <&scu>;") for the new driver to obtai=
n
>    the regmap, or do you prefer a different binding/property name?

This works for me.

Yours,
Linus Walleij

