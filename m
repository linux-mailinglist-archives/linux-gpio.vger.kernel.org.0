Return-Path: <linux-gpio+bounces-37703-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGdzIJX5GWqN0QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37703-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:39:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C03608A22
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E41F30138BD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 20:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D3737C0FB;
	Fri, 29 May 2026 20:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iux2rCpv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962AF343D8A
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086856; cv=none; b=FBxoPFz+H0DNc5qNYMXYILqn/4J7vbuYVpx1PbmJul5yZHFAYQgc4ORAEOsYLjdSEXclkLigIGKsYGqGNhc7//ECJIgVLK/FjPwYy+7lSRrIO3kCFlxMYDl7aeN2qaNNMZPZtnmMU4H7xJgx9exrdvIURR3Dgauwcn+kLHvvMc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086856; c=relaxed/simple;
	bh=4NHSOSyHRDnslI6vpSy5h+xirPhS12RBvplD2Nx+Mt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZVQHkrsQJeTRfhR0cE4B16cpQ9j6iWVkW/ACrCSHtxvXIAQgHWWz100+u4elbgqEz0gmVajHirWbl1+MRAeNb38DRYgC8b9C2TA+TwKX0SXnMRY72ou4O5YzJoy2Xg7lw06DlRiEr6D9nhzNEXNh1L5uNB5v05k7zENDz9mbPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iux2rCpv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580CB1F0089E
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780086855;
	bh=4NHSOSyHRDnslI6vpSy5h+xirPhS12RBvplD2Nx+Mt0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Iux2rCpvLvH/BUYM++ARtiMUoAGfSbY3Slvh+9iFwrSTkIBmIbrYllRoCYDwTnQo5
	 GKDe/BNObStgTrQIMwrmjdoZga1KWDfWbGr7aaJ9sC0QbNchMFokcunaQAclW55onM
	 e3WcMg9U4NkFovg6zJXY1MFi5snTxR1LmpxxwJX2YN4vHv66RKfIV0hUrEGmwzErxU
	 SjeWZi7AAOtPS+FMM5pNkbyhHoEWbCEY7S1WKhsDTIEuHDbwTKNOGrO3fqTKOmuVIz
	 OPaQBZJNgM+5fTMwUt5MrGsIXr3SjiulCeOzHG3a9oiOQqywOZ0pw+/aNh3QW9dI4H
	 HnHUQLS98i2FQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so16599952e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 13:34:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+VPsHu+CY3EXZJrLTmGtgL8vBEAH/6OmfxyIzCCQMQClbfa3GeJQvJOIa619RCWliFYRgZ1Acz4DjV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzku1M+hVNaWaVWd+fm5J1DNsl5rWCxkgYiGblAYM8GDbhBIZAC
	0iTADKjbU/Kp4hyH1B+XQ9wGKYWwCMGlENeRqmtkEWgAAG610+9p4c0F2QDWmyeDSG2un5pOr2l
	hfx9eVKc8j5khchB31Qkx4UuaWECRgAE=
X-Received: by 2002:a05:6512:3b9a:b0:5a8:7029:c5e8 with SMTP id
 2adb3069b0e04-5aa60a26ee3mr463910e87.29.1780086854129; Fri, 29 May 2026
 13:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com> <20260529100838.8896-2-hardikprakash.official@gmail.com>
In-Reply-To: <20260529100838.8896-2-hardikprakash.official@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:34:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjjtY-EgWSdU5h7yE6ZMvgTvyjanRNwgqzgO-h=8ij4Q@mail.gmail.com>
X-Gm-Features: AVHnY4JnSx_2QlARRHct3ZSkimmxjsh_tYrrHBo7Qqw4FFWP089sFb_kjEJZWjo
Message-ID: <CAD++jLkjjtY-EgWSdU5h7yE6ZMvgTvyjanRNwgqzgO-h=8ij4Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] Revert "pinctrl-amd: enable IRQ for WACF2200
 touchscreen on Lenovo Yoga 7 14AGP11"
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37703-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 23C03608A22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 12:09=E2=80=AFPM Hardik Prakash
<hardikprakash.official@gmail.com> wrote:

> This reverts commit 3812a9e84265a5cdd90d29fe8d97a023e91fb945.
>
> The probe ordering fix in the following patch ensures amd_gpio_probe()
> completes before i2c-designware probes AMDI0010:02, allowing the
> existing amd_gpio_irq_enable() flow to work correctly. The manual IRQ
> restoration added by this patch is therefore no longer needed.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221494
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij

