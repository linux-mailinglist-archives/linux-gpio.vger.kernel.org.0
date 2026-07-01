Return-Path: <linux-gpio+bounces-39265-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CkJDFhq8RGpKzwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39265-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:04:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B2D6EA769
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:04:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YuO2ARNh;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39265-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39265-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 805093037D47
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DB33B42C5;
	Wed,  1 Jul 2026 07:00:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B58B3B0AE3
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:00:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889248; cv=none; b=nt1pnaugDg/HeyDpov81SY27B5ppVSl9EOzFatQOK0R2p1loZKxcfJ7vwOrwyLp4J1eT5PlOBSsztJDfeh49vRZcI9oMOvCaBP6YV7ehRy9oOwP+h0DSFy15H8WpGpsQwGJxUbyj0WiLnOsCYs4sahO7o0/1KJH5r+CQ0OEq2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889248; c=relaxed/simple;
	bh=FNaghAsFbQcBu1hL0A0nxJoR5EC3advss/SPSVEWuxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ao2t/OFdcXtne0nPuRRwFQlKBO8sqVRJdc/Gwk9tpJwW6HI+0NsJWA0qCtAYUWbFKuPg7RG87wq2amiksD6lncjXyJZLjNA1FOikb18bWXi3qNw77yOqL7WNPfhVE8hEt7zg3GSN5QUW2htwvc799Tdvm1VWzTHqqgmOXxGscIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuO2ARNh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72691F000E9
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889246;
	bh=FNaghAsFbQcBu1hL0A0nxJoR5EC3advss/SPSVEWuxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YuO2ARNhkifLEqRBI7j7NdZnXq40CaeOqFNMpGQiwI0SP/bQnrXf52DXc5Nq817z8
	 loMIPu62bmCDSUITiZuz7ZX5DPLydilJ9nP7w5KB7x/W/KR+j9xbsAJbdiYKQf/c/6
	 b/XuB8c2saxfUkywb+JEdhfYWg/rKBNtRX7PTE0RtvBsvsInauBaRnlQ8P8ZXQ0FmB
	 bQwBYtlv9qdmCKr/LjEwp7Bnx3G+3rfvhMQNcd6ZzPeOS4SQ/e2VwOxGI/2AUis+y0
	 s7osJG01LdBfzmVxPBQXQNyE6evNdYx9yfvmtPRQgDfeC7gj2w8R3Cu4RTWZ7jImVU
	 BWFM3H8gCvIJQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39ad9c80fa8so2672261fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:00:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpr5DmQSMuzSIKYDRUPaeTvbltXIYL3EuT4CVn0Tl2346dm3hO6KiXE0DiS/zV4xHl3+Z+g2XknXxJx@vger.kernel.org
X-Gm-Message-State: AOJu0YyKDG6/NwokDp+8e974RpDMoiqLksoATEbcfJC0kBlUp5Xxyk14
	zf0jQcsVJ4LS3pfWBgJxazmSpzmepRSrhKicnDvR8Zbe/3ILANzxGjJJbwSVAMRBHKzsR9bx1QG
	cZFZOOUVLGI3rPxlS0iPVnQTBYzyhCkw=
X-Received: by 2002:a05:6512:6391:b0:5a8:88f8:9ed4 with SMTP id
 2adb3069b0e04-5aec67b670cmr65217e87.30.1782889245754; Wed, 01 Jul 2026
 00:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
In-Reply-To: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 09:00:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLneg_hxaBbcH915K8h1aec3L2gHKMhCmmj_eZ3iOs=VJA@mail.gmail.com>
X-Gm-Features: AVVi8CdI-_vItMKJXwnRjSM6nQ88A-oDIf8o0u40FgC6OwPwBKcTIUz_nMMJrOY
Message-ID: <CAD++jLneg_hxaBbcH915K8h1aec3L2gHKMhCmmj_eZ3iOs=VJA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39265-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4B2D6EA769

On Fri, Jun 26, 2026 at 3:08=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> Pins 143 and 151 were not included in the PDC wakeup map. They are
> normally used for PCIe2A and PCIe3a PERST# respectively, so they're
> unlikely to be excercised in practice, but still add them for the sake
> of completeness.
>
> Fixes: c0e4c71a9e7c ("pinctrl: qcom: Introduce sc8280xp TLMM driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

LGTM Bartosz will queue Qualcomm patches, but I see he's
already on CC albeit in the qcom address.

Is this an urgent or a nonurgent fix?

Yours,
Linus Walleij

