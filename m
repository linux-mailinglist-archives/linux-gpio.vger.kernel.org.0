Return-Path: <linux-gpio+bounces-38076-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 32jhG2V+Jmq3XQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38076-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:33:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D179F654176
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:33:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jdyPmYcZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38076-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38076-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F1803055809
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDEC3A9D90;
	Mon,  8 Jun 2026 08:19:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E301E3A59B1
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:19:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906783; cv=none; b=iA4Tq0invglxu+fcoo/qDR0HQg+JGJfTyreim515ENFcLjWoSXGo9DpX+anNlfR7LjO2q3ltK/gC22a+eUqitJueW7ii+g1svFcUEF4vTf34dyAO4y5BSbdLLkn1QURGqB+WEAwk0Mz1LYAoyx8jJe1aa95VZZG8wWGqAmvaHbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906783; c=relaxed/simple;
	bh=P9V8bpEqH6X4qmiHHTngsXUmKEwdN1ijUIAKzpeA0e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jS+4pW6rqqZPYel8JhVMeuTgmWXGbw+oTiiIMFQKfbx0Y/TRftPWu/CtRD1Cs/ZWz7WdMv7mPE1n4D+oAK8LDIhk1zi8W56sfbtdnQQtvjQ1UhkxykmBRpOX2Gsn2UJNFzQBdjBN7As7zwjM5c4wigfKk7eZXM86+KJRsj1a3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdyPmYcZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C63D1F0089A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906777;
	bh=P9V8bpEqH6X4qmiHHTngsXUmKEwdN1ijUIAKzpeA0e0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jdyPmYcZAAj5zajRoCfCfEUTkYIVOgfPo3QAIyGqN11uGTToJ96WZpRYI0Lx1V1I3
	 2eDiVxAVrjMD+r/rHA0O6EN+Xl/szMs37czo6pzDR2xjCsJaqy4C2T8XQUhardqcC4
	 wOVSKLeTDhpcRDpmIuCcZCuGpajZ+Z6yMKp+XxQYO40vtow7leMRui1N0onxuNgo6d
	 Y6kupuQzlyi3bLPrd1WFHetFqT79kvx1hKimlQO9ryGMPBJdXGGAG1N3GEuEkvV+F8
	 /KKqDFEeFmZlnACZo8EBEMPgG7o8c/hTqIRVA1Rj3USn5jfsJV3biifp/Q5X5nPDHu
	 IP9tg38RSj/aQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so4358815e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 01:19:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8GfPEJKO/KeBYmXytNPhSqSo6R/m7TxKFu3PlrCPpo7Fiuno1KNFCP6jZmXtzU/341le68ERGrF0hH@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTTO/YZaKiDxuj9WV+ck5UF+5RTX26+ZilaXz6XOBOusmbbgl
	HuchJ7F3OBwDRzST7AmH3HdTe1cMpEqI3zaLX0f4axoDKqtE+4GliK3K3EjexxpFdYxi/3ShHY0
	DFuEEz9HPGZL1H6b2vAHr53/4rVrxgL4=
X-Received: by 2002:a05:6512:611:10b0:5aa:703e:ce64 with SMTP id
 2adb3069b0e04-5aa87b6fe39mr2685769e87.14.1780906776095; Mon, 08 Jun 2026
 01:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
In-Reply-To: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:19:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL==MdwmEM_9aHqfCnTfd4=g174Ytk3dZti0pwqcfU_UOw@mail.gmail.com>
X-Gm-Features: AVVi8Cd0BwjOsWouqsrdYZ6Spm4i_Ll_H2pHRD9M65EFtdOV_cK55fSj8mFOoj4
Message-ID: <CAD++jL==MdwmEM_9aHqfCnTfd4=g174Ytk3dZti0pwqcfU_UOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPIO mux value for ADC-capable balls
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:billy_tsai@aspeedtech.com,m:andrew@codeconstruct.com.au,m:joel@jms.id.au,m:brgl@kernel.org,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38076-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D179F654176

On Fri, Jun 5, 2026 at 8:38=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:

> aspeed_g7_soc1_gpio_request_enable() unconditionally writes mux
> function 0 to route the requested pin to GPIO. This is wrong for the
> ADC-capable balls W17 through AB19 (ADC0-ADC15), where function 0
> selects the ADC input and function 1 selects GPIO. Requesting one of
> those GPIOs therefore muxed the ball to ADC instead.
>
> Write mux value 1 for balls W17 through AB19 so the GPIO function is
> actually selected.
>
> Fixes: 4af4eb66aac3 ("pinctrl: aspeed: Add AST2700 SoC1 support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied! Will be for v7.2 at this point.

Yours,
Linus Walleij

