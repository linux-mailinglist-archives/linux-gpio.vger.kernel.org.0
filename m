Return-Path: <linux-gpio+bounces-32787-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDE2FA0Lrmlj/AEAu9opvQ
	(envelope-from <linux-gpio+bounces-32787-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 00:49:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9CC232CA3
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 00:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CC603010B84
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 23:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC30B31195A;
	Sun,  8 Mar 2026 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSaYAqWz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701891A9B46
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013767; cv=none; b=bes1xXLfHCP5uoIV532RT+Fmja7L8ijdFpYS9tXJlRBAhqpMZIxUlDtq0D/MseL3RpwG2j3rDTTwGm6BnnN2jWjUq3A6AXo8u13hj6Cpsz9rMFuIVDs6PKRWiWdvOVo7uqZdITKfRziMntNJJ4TE39sPX1SDPGEkMI5gXEkcY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013767; c=relaxed/simple;
	bh=s/L3to3kG0f/uxJHIuUQNKS0TutAor3MzlG+ldsVbWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzWAHdKnlgjodSQXC7AoV0+KGKJEEHfjCFyj/eao/kkKx+9GWgm/plQHNrhXTMretlSh4yfkz8QP4Jfkwu5A5PCA/WgpN8uTxZ25EqEWnC8P40Fy+sxm+ha833RE/eq5u3blDvBgm2PWk8gJFcwh68LVpWoGqan+fEKsyPE8/qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSaYAqWz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537A3C2BCB8
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 23:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773013767;
	bh=s/L3to3kG0f/uxJHIuUQNKS0TutAor3MzlG+ldsVbWY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XSaYAqWzQp3fZE8+EsfBXHsSdukgD1O91AJ9WQW9g6p1vb1lciyfkvidyl1g64Kno
	 o6WXMJbjEtLPXMeAk++lTl7N66JIBLIgyCRxkfvhS2gvCj/bckOO45Pu/sNPC8wbSw
	 WTXrSx1BI7ygY/8DiU8/hTfMz+pcsBCKmdUGulIkX3lFE5jZw7bGW236QjqBf0j9YG
	 tuFc9uPwisGV1l+/R+9JPbRVsq1J2jVkgnQr7vLkqMu/S0XvzESO1OcxQXJqZPkM7T
	 gSTvrXLFkVEDs/prZr4+GUFeuspclhP6Q/mGozGv/+8146AfVZk1GtSBoqMPh8HyJf
	 RnHC3w035H2Gg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-793fdbb8d3aso133006817b3.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 16:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGI1/n+eEntqoAMCSRVACD1zBbEPlDRIaY1Ag/YbWpSMsJtSYonO149DTn9DUPgvb9gLbPsAZA7UKa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HM+w9YEs1mmBE+OmRfKXLNhk9psgU90pvSKTh6Erxpmkmh6R
	0IabyJ+EQ31lvw2+hhz6AfDrPruxG6ckEP/Rt+xm7zzvZsnNWy5eBCt9QnnPdtsFFnJz9n8ht16
	X56l32ubecwEntTttJMsVXXfOpuziYDc=
X-Received: by 2002:a05:690c:6891:b0:798:3051:2f25 with SMTP id
 00721157ae682-798dd7bee25mr101650097b3.59.1773013766532; Sun, 08 Mar 2026
 16:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com> <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
 <aaG2xQDnMVGGAOJE@lizhi-Precision-Tower-5810> <CAD++jLm=6pTh7N5UAXFaaYWCs5DhfQdb+8TnM5XLcYC886=kLw@mail.gmail.com>
 <aam_cZhlCSxu5WHS@lizhi-Precision-Tower-5810>
In-Reply-To: <aam_cZhlCSxu5WHS@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:49:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLkKsTfFUUD42TKorHLWUAt8=w-kW7Q9bxbU1bgaaig77Q@mail.gmail.com>
X-Gm-Features: AaiRm53eOVEff0Ia4ZtRk5C2doZUsMB119btrlySbICQI0ZMg3eVD5n5sc91D_k
Message-ID: <CAD++jLkKsTfFUUD42TKorHLWUAt8=w-kW7Q9bxbU1bgaaig77Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
To: Frank Li <Frank.li@nxp.com>, Fan Wu <fwu@marvell.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AA9CC232CA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32787-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 6:38=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> init state is before probe if exist, which not fit this case because:
> - on board mux need be enabled before probe, some device need communicate
> with periphal at probe, such as SD card. SD data/cmd line must be ready
> to scan SD, similar case for all mtd devices.
>
> if add new state "release",  when the pinctrl may switch between default,
> sleep, ... , "release" have to switch between switch state, such as defau=
lt
>  -> sleep have to change to default->release->sleep.
>
> mux device also have idle state, which map to pinctrl's "init" or "sleep"
> state.
>
> The key difference should be
> - pinctrl can uncondtional switch state.
> - mux frame have to use pair mux_control_(de)select() to switch state.
>
> So, I think just need a hook in pinctrl system to call mux_control_desele=
ct()
> when switch state and release resource.

The problem is that this becomes essentially a revert of:
commit 2243a87d90b42eb38bc281957df3e57c712b5e56
"pinctrl: avoid duplicated calling enable_pinmux_setting for a pin"
from 2014.

.set_mux() used to be called .enable() and when .disable() was
deleted in this commit, only .enable() remained and that was later
renamed to .set_mux().

By essentially adding back the .disable() callback under a new
name, you risk to re-introduce the problem solved by this
committ.

So you need to analyse that committ log a bit, reference it
and explain why you are *not* re-introducing this problem by
adding back the callback.

Yours,
Linus Walleij

