Return-Path: <linux-gpio+bounces-31364-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKUbChRAgWl6FAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31364-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:23:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FAD2EDC
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0DF93022075
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 00:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF981A3160;
	Tue,  3 Feb 2026 00:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzLmJA2Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9D2191F84
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078161; cv=none; b=ag1Ys7OsXEnWZV7HcSJa8bbxLGElnj80dZpx9b1S0esQUqlkR1PR5APg0gbM9TVzxzLHQOV1L7jidK2+bKJ0CLqAblUskydHNMOxF2klPhhCGrWQWYsq852pT6QsYnFLNMYlRN2aRtU4nVl5oCaN+L3Z1Iwhm2TT25yv1BT5Vw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078161; c=relaxed/simple;
	bh=fd/LXC9Lkp/Qm0nZSoqgcUwNOstocRzFQcntsHK+Qf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxN1BTFbc78/h3hHUxKgeVY+tJ5QU4k9D8eZmcTat4PL5olNzaMAa2PQJVT4RrzVMMV5YBNRJaYe566Y5mmW9oMWMZKCTO7nHKQ5lC9lS5anxXovRD5GQdQYAKTwNPfyMkOIWLle3jJTUk3swEjdO5RvnrxMFZSrUG7LvCPM6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzLmJA2Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E00C19421
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078160;
	bh=fd/LXC9Lkp/Qm0nZSoqgcUwNOstocRzFQcntsHK+Qf0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YzLmJA2YJbB7ULeIq5OkdMRIIolngtFk3kQv7IsNzhdGlpFs0MoNfWRsF1DDq3ERq
	 +y5R04lvHS0BrOcIybgBBVTdONoq4ZqdJ4g+KW54lVD6zIzA9fJO6byBRtcI35UIks
	 Zkn6oO0/umPHq9/Zv3VVSYGdgVIBJl8CnG+n1aLmHyTP12Uw+Nx8drWLkpGSYKDttP
	 CpRTQhmDiIE5PZ3NS9DcuaBSZaIXC5Z2UWpkpol7GfzxVB4DZRPVeSoeF+hvOhpwwa
	 1aLkEANjntD6TSLJoC8jOGL4AFEAOb8heHHmsxK0YT9DbFXRYZMddlj7qPcUUJw7h6
	 qBHxDUXoMtsvw==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649b22e5894so3111562d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 16:22:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKIc3Ow/Aj3Yt0D/3MukIalA5Y4p/056eZuZwy6PT1ZZZEt63AOfNKIwaLPRxJ2KHDz/gubDNyJxJI@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJlaqQ6bGXWQBr3yP0mcbs6fJJVBK4uvMTplbqlrCdaAhc6Bu
	BjkIP41rDNG4uAdDFkJlStS4nYtpr8ytvHUtAQkScbuyN9yfz4D+hOwb4y4n6NvoNVdAlVqlQhL
	0WwabMEdHna9xn4mBrR51wwWinrJmBwk=
X-Received: by 2002:a53:d603:0:b0:63e:2269:42eb with SMTP id
 956f58d0204a3-649a849fb8cmr7846684d50.45.1770078160320; Mon, 02 Feb 2026
 16:22:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
In-Reply-To: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:22:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLnG_VGBjWR9UM+zcZ1Cm=ugTeXwhf30Lj0x65eCcaSQ1A@mail.gmail.com>
X-Gm-Features: AZwV_QiGVVIf1jx-YTeg_ItUtMMLJYRipJZik-ctsh1EWvAi5djtmQ2tZbjFQtw
Message-ID: <CAD++jLnG_VGBjWR9UM+zcZ1Cm=ugTeXwhf30Lj0x65eCcaSQ1A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups definition
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31364-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,fairphone.com:email]
X-Rspamd-Queue-Id: C37FAD2EDC
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:

> The i2s2_data function is available on both gpio12 and gpio13. Fix the
> groups definition.
>
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver"=
)
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Patch applied.

Yours,
Linus Walleij

