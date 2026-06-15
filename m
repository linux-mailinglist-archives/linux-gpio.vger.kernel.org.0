Return-Path: <linux-gpio+bounces-38459-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U1tvMSuoL2rREAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38459-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:22:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A96684296
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:22:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HO1wvBOC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38459-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38459-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37E4B3002F5C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504F93BD224;
	Mon, 15 Jun 2026 07:21:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221AF3BCD16
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:21:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508100; cv=none; b=arElvmF79gogYNolitWaxRUWsqbXjbxF+/K04esbQTl9tgv812vnn/Q7y4wXEdNrvIiWcPUwTKGuW8e1arpKi9ilqGEsyVKlE1k2goEqBTPWA2CYwUubH3j9A+Fyb10iAUOqu6IR/c1TJGTIqQ3uVajagvCLtCJUt8Dh7Eo6Ezo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508100; c=relaxed/simple;
	bh=wFk3WSarX0Njnh7YRTSK1ZdWCnt/6yjij1YP/Df67/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQDSOVR9UjhVQ3JpeEcgJwhBHiwJUrmMXsDVHVxrbuJDJpBn1PipKSy8vMuZpmjLuAr6EeWEVKj727aEVaWhIwsiQlDsQT+p9FsWEZ4iBYIXmaMryjqMf7emAP5llsouF6XB9j+RE/aTWnWkkfKh8jB9oFHMoa7ETRHmM8OAEuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO1wvBOC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77A21F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781508098;
	bh=08JCdW+/vtLD0uTGxd5LViEw6cH0BUoM8kUufyIZZMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HO1wvBOCocjwYu0PIRWFQI5h3b7dd1A+xB+FxAzHQDOnaPtOPvUoL8zepNE5261x0
	 FFheIScAVyNDLyLLmhW+kXodhjR6VL6PvgDtTeKh58mRsU7jYrkqG0e2+Li6hr3lH9
	 xXBMiX4QD6K3+jwCN5m37SdJUcp7FvzHQsqQi8WiHtYsObH7ZGg/j3b7pXqgHGU/5b
	 JGmsxTTs7ayByexDPcTu/W9mljAXJcYCPRl6y0Gb2i3pyU6h43mmAChlEihEpwh+3V
	 jibRpN63Pg3AelPC4opvITs/OOLdgHJmB50QorIffZu9Cpsxn6OAy7BBJK986hejKc
	 DW+vS8mwP0+Xg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso2847092e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:21:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HsuUigBl6qq9TqFMgQtj0HQXr1MDV17rYnVTooMfQKOq+bqesOtxY+fOqtRhVU2wNghWJkcbj6agD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywppwdb4hOcpOM+mhiSzjp+MmPgiIa2OPlIiXXPekt9J7AtpAtx
	8v73tFTiHoGp3ZMsywI9cTL+EB1FiRkN6Tl/eDfnM2LqqPW+hwFUIpkvLqyPLUoBldUZgYo63Tl
	3m1Grnpb4g/nF/gf66D437BBtcdxYA/I=
X-Received: by 2002:a05:6512:203:b0:5aa:7374:1365 with SMTP id
 2adb3069b0e04-5ad2db6ed6dmr2405039e87.32.1781508097589; Mon, 15 Jun 2026
 00:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8@epcas5p3.samsung.com>
 <20260612163020.411761-1-alim.akhtar@samsung.com> <20260612163020.411761-6-alim.akhtar@samsung.com>
In-Reply-To: <20260612163020.411761-6-alim.akhtar@samsung.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 09:21:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>
X-Gm-Features: AVVi8Ce39W7wwxGNC9dJL1kDKsgpGECByaIRuL2i0ERLKK_9NmouzTKtM6dIZLk
Message-ID: <CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>
Subject: Re: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org, 
	conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, hajun.sung@samsung.com
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
	TAGGED_FROM(0.00)[bounces-38459-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,infradead.org:email,mail.gmail.com:mid,samsung.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7A96684296

Hi Alim,

On Fri, Jun 12, 2026 at 6:11=E2=80=AFPM Alim Akhtar <alim.akhtar@samsung.co=
m> wrote:

> Add maintainers entry for the Samsung Exynos8855 SoC based platforms
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
(...)
> +SAMSUNG EXYNOS8855 SoC SUPPORT
> +M:     Alim Akhtar <alim.akhtar@samsung.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     arch/arm64/boot/dts/exynos/exynos8855*

If you really want to single out a single platform like this (and I don't e=
ven
know if that is a good idea... how do you keep the big picture in mind?)
you should probably want to also add a wildcard for all the
8855 device tree files.

Yours,
Linus Walleij

