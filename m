Return-Path: <linux-gpio+bounces-31488-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJHpG37LhWmQGgQAu9opvQ
	(envelope-from <linux-gpio+bounces-31488-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 12:07:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FEFD04B
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 12:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9DA4303AB42
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 11:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65C1399003;
	Fri,  6 Feb 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0ZR2OZ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9981B32ED57
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375868; cv=none; b=LiVqMehfwvxE7vLqtJrzhxqoBkkrLt8P2EUQh8fbfLlhJlNXZjAK8mczkRMn/Hi2njZOaJDfpL/PCiE/5/mz/Ud3THJ8pNG68TLfs937JI4PrM80d/QiUyshOyyuycVF5KFZMvMC6VasXL7hqv9hN5fHm+ey5ItasMcYy3M1PL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375868; c=relaxed/simple;
	bh=hffRbNLZFl9uDUo0y6gSrfmxCTFy3pQga3bjflSdj4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjFhRZV6KoLhxg0u0nBTS3mWCp/Vxl52wLbtzOKHHf6wHRhhfLOhVyV1ms88l+RsSY6csKJsiwZ37fm7lVFlaPo6UmBC8lfqhTOKfzjO/4ENoBfUgnAqIfYh7R/VonxUSm1O37GkhxafZYg0coa2RqRCqszDp0t+iuO6MhNIvHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0ZR2OZ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C866C19422
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 11:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770375868;
	bh=hffRbNLZFl9uDUo0y6gSrfmxCTFy3pQga3bjflSdj4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o0ZR2OZ8ET+okN4dF12G54Fgx+7fWpcGE7D1bsf3+A0RUl9owzQXS5zpp3kKfDY/A
	 D+2N5HirxoonxTHayAVJ2tlbvIikf40jJam3Z0318URN7KDOx3U/IcFMUKIHL7ok8S
	 dWj7iO+PLNVEaxPxsE6+4a3rsUgInQDmXnxqaf1NnsNWg7or5MRcp2+BYI6v3bMYX1
	 +OvWuvfNBr3VBWC+xo1ZtlKpQ3s0m69RvOSTVZikqlMC+DdnD3Fit7TLyLKGoOGFdv
	 7c0YeTbv2ItXrzfavxUX7dXVAujAgfF5IOshhroNX6b6fjDpq3hE+8D2Smb3wPJh84
	 wQQV8OIa0s1mg==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649bd1f08acso2031469d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 03:04:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVh/yfrMCBJuaWD2/u5s3teRuNViPnGtpRQg/mlUySys5uMcmcoztLirgi38IsdRe35ro8xD1VX0C/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1fiSQ2m5SRQ/3e9eNONl85NriZnJmsCDnh5ucCfiKYqM5+3co
	aUlWbx2HW4npswS6i8eDOtUsq2143K73sVVu4cd+magWRy9stbcr+I8JpH3vJq5C19sghdcaDCS
	bn1IqsNfo0fMQYgy2zDebVSBOla4d6wE=
X-Received: by 2002:a05:690e:191e:b0:649:df3b:318b with SMTP id
 956f58d0204a3-64a0b8e072fmr1616388d50.7.1770375867660; Fri, 06 Feb 2026
 03:04:27 -0800 (PST)
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
In-Reply-To: <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 12:04:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
X-Gm-Features: AZwV_QjiR7EqiS7wfW4pJq3UdcwSHA9nPaSiBx_Jimt1qmxk2Cn1f0Eh_W2TsUs
Message-ID: <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31488-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aspeedtech.com:email]
X-Rspamd-Queue-Id: BA3FEFD04B
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 8:24=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:

> I understand the preference is to keep pinctrl-single minimal and move
> the bit-per-mux handling into a separate, more targeted driver built on
> top of the GENERIC_PINMUX/GENERIC_PINCONF helpers, rather than extending
> pinctrl-single itself.
>
> Based on that, I=E2=80=99ll look into refactoring this into a
> pinctrl-single-bit style driver that covers bit-per-mux / bit-per-pin
> layouts generically (including AST2700), while keeping pinctrl-single
> focused on the simpler register models.
>
> One additional point I=E2=80=99d like to raise is the handling of pre-res=
erved
> MMIO regions.
>
> On AST2700 systems, the SCU register range containing the pinctrl
> registers is commonly reserved by a top-level syscon node or by firmware.
> In this setup, devm_request_mem_region() can return -EBUSY even though th=
e
> registers are valid and intended to be shared, which currently causes the
> driver to fail probing and leaves pinmux unconfigured.
>
> When moving to a separate targeted driver, would the preferred approach
> be to treat this condition as a warning and continue probing, or is there
> an alternative pattern you=E2=80=99d recommend for handling shared SCU-st=
yle
> register blocks in pinctrl drivers?

Can't you just base this entire driver on syscon which uses regmap-mmio
to abstract and solve this problem?

The syscon is entirely designed as a singleton owning all registers
and handing them out to subdrivers.

Yours,
Linus Walleij

