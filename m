Return-Path: <linux-gpio+bounces-38073-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1nWKINJ5Jmo2XAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38073-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:14:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D564653E01
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:14:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="W224uC4/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38073-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38073-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EC883029D3F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EB33A2E33;
	Mon,  8 Jun 2026 08:07:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42D3A16B9
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:07:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906040; cv=none; b=eRO9n4NhRyaThrYocg71EOgO1+39WSsgtB8z6nKtzcc2r/Fq3boXYnyfYD9oGy6hGLIlPgoC3PgIO4VMYTXIsbQbERHjm6sswKkFC6CZNmkMve0O1cNO+4SafZ98dHVN46jEcu5HlLjf8Ugcdnd4Itd/YO6fCwpY8hIm+920mXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906040; c=relaxed/simple;
	bh=7p3nTq7oGJJLZEtBHFjP4g2fj9ud/Z4fq7Xd0f8dF48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxpqkZgNgCWbBBCO9at2tF99bboUzurJFM+XQBptIv5C51mNgBnTw349fDf1whtZ1tzS/5hb5jkYYiGTmNTLprLmdCBnl159bXr5+chJLUQz/KsbS1Mv0Yg1VUJL7bj+F2mptFAOyPde7WwezicClqOLRT1Cd37raltuKurNV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W224uC4/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CB31F0089B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906037;
	bh=7p3nTq7oGJJLZEtBHFjP4g2fj9ud/Z4fq7Xd0f8dF48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W224uC4/IesJ34nuGEK+bZHPRAWeHalBbhvVaG3G77FpiSk+P8FmAM4KSth5/Zw6w
	 L13BquVoXpaByhyynZxt7GPU3AtAhGunIkXPNSFx3YiuS0/1CNLiwwuQj8q0mLPJoH
	 mc5nMCfL/id94JmzJB+LonJwSB2TNbYbx+zME9Z9TRPqfykSaTXwio7ErKUz/VvjvU
	 9wrPsC0Di2YZZQoONx0IKIcxFfo7+ck0eL9OFSazszKoJpmUP7QFdp911LcKlJe99I
	 g4TYxqSMC1Jl0PopCrS7zm8ggyKQ4c4sqCmK3JCgJACt9c1z/xa8OdOFMb9uT0YD1z
	 wV4SQYMmT3UVg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3965bc493caso36932251fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 01:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+QNb5x/7XZqNLgepAirI4wIkpWXfIwerG9D0gPjWfCqj5TZSttNpM5LnCGhQgUsu+WKgpQD/y9EIcd@vger.kernel.org
X-Gm-Message-State: AOJu0YzzwblJ5qfy1+srCdwpd3zfcZhrshzaibzrVWVZIjFgbfa6RVUL
	yflWvuSFGlnEdwRTKrbC87UYAaavK2dPwwsiLkMfmne6q0zPPkni1iBM/+VJI/bGC3uIRK5O8Qr
	CXwJ8A3anJC87jmNg6vmEzWgFPH3TEFo=
X-Received: by 2002:a2e:9a16:0:b0:396:a6d3:f04d with SMTP id
 38308e7fff4ca-396d0895474mr40010161fa.14.1780906035688; Mon, 08 Jun 2026
 01:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605010022.968612-1-elder@riscstar.com> <20260605010022.968612-3-elder@riscstar.com>
In-Reply-To: <20260605010022.968612-3-elder@riscstar.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:07:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLnzaq+SghqjQhmS-wzJn8BqtpO9eFBet-Nvq1s6ftSPBA@mail.gmail.com>
X-Gm-Features: AVVi8CdcVQZ5J_i_Iaqeix6_8YO_cjEHpzPIFDPmZBuvgJ3k-aHEuVOqwusuDcs
Message-ID: <CAD++jLnzaq+SghqjQhmS-wzJn8BqtpO9eFBet-Nvq1s6ftSPBA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 02/14] net: phy: qcom: qca808x: Add regulator management
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, 
	arnd@arndb.de, gregkh@linuxfoundation.org, 
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, 
	chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com, 
	john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com, 
	mcoquelin.stm32@gmail.com, me@ziyao.cc, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com, 
	rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn, 
	weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-38073-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@kernel.org,m:netdev@v
 ger.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D564653E01

Hi Alex/Daniel,

thanks for your patch!

On Fri, Jun 5, 2026 at 3:00=E2=80=AFAM Alex Elder <elder@riscstar.com> wrot=
e:

> From: Daniel Thompson <daniel@riscstar.com>
>
> QCA8081 appears in embedded board designs paired with GPIO controlled
> regulators for its power rails. Add logic to allow these regulators to
> be turned on during a probe.
>
> In order to avoid the complexity of tracking state for suspend with and
> without WoL we take a tremendously simple "always-on" approach to
> regulator management, essentially relying on BMCR_PDOWN to conserve
> power when the phy device exists.
>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>

(...)

> +#ifdef CONFIG_OF

Is this an extremely footprint-sensitive system?

Regulators provide small stubs if unused, I don't know if they
compile to zero bytes but this ifdeffery should normally not be
necessary, just unconditionally get_enable the regulators.

Yours,
Linus Walleij

