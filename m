Return-Path: <linux-gpio+bounces-33528-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLAhGEoNuGkWYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33528-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:01:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52029AEC2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8D3A3049520
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7078F39B96B;
	Mon, 16 Mar 2026 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofHsNMsC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A039B958
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669523; cv=none; b=q1mYKzHPVBbRGbcjmLTBkk0Ck4C/kxpdbG7CbfIWl1HguNyk4nt++0eZFFxqsevpXKNXFlFhlHki1yzm+fp5P8X6fI3ZJQ4Qj3c3FKtL9/alDINJ1Djtpf9nq/HF1CLjJIup/FcPdagGGfV99I6+N9WNSCOJPdTgamp6726cB9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669523; c=relaxed/simple;
	bh=hSMXVkUEekzrw8bwZ8sifPlqvROgTnPiDGsKFKxbDpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvMeAB9iaKvYeavGWhEnoJE2sgePFreySVYOMmU3KQQC11ynepU5GYsHjSyMSlfhsX70ElslECEx1I/a6NNXMUw8vwoo6HhqL7NACJP3EWRIOEvN6mP8zAItECSts+1tfOdaTSVu5VyBahdUMsrdfG8pzftiW7Tkd7ggiIasY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofHsNMsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CA2C2BCB2
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773669522;
	bh=hSMXVkUEekzrw8bwZ8sifPlqvROgTnPiDGsKFKxbDpg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ofHsNMsCMkh32Ijm2DMEzp0uKPKCmoWxPNcBwTtegZ0m8W9cSQhYl8SU72LKR07jc
	 QTbs54Bmk8KdiO2BFIby00ejQU0PaC6SVorydY6l7tjGp23WcaAXapcaAV/fatI/tg
	 tWyuNOo5QYEJCov96kSEQpIs5B7J39JO7nCK2xQX1UhAOSziQaCYH9GT123H2pSxDC
	 JOaVKLt0a8MCFZXeVGF5urYOlDQ9D8r8aalbrbtHTKgEJhiabXYyJJ1yoFW9UHELVo
	 acXu8gmh0V8xjRuVKGhg5vcsdkTyuAkcHG+8EcsiDWsv9ev3LJu7uKsPDp2LrLt2LV
	 DNA2yihX4CDuQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a5a37113aso5114677b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 06:58:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5xyw+4aMx1x5LK0FucO4Bo4Wz8DupZxpX4ALOUBnwtzofEfB6l++s85pDvwKdNH+QFkRCxzjx7HY8@vger.kernel.org
X-Gm-Message-State: AOJu0YxubvqYWxNGW3xWeaamOh0o7Pg9F0KhaMyEnCe+v1LFEwwg5yMB
	BD0R436xwhzkw9ek9cjcPykoVhYINPmX5LCRv1tlTa2DDVOmbosz4pocUOUHHFsWTIrLc+juvP1
	ARR8WwQne0zZXk8iWe01dgNPjD38GcR0=
X-Received: by 2002:a05:690c:d91:b0:79a:3a33:933 with SMTP id
 00721157ae682-79a3a33606emr69844567b3.31.1773669521704; Mon, 16 Mar 2026
 06:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
 <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
In-Reply-To: <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:58:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=dvA6ewmao9c_tjytUF4P3Uqmo-YhXHFZDX7NPTVyEGQ@mail.gmail.com>
X-Gm-Features: AaiRm50yWrLM_KLi_T_7LxWZnSdxFEiWnqrBl359MmXbMmSFbkutwI57NawX5O8
Message-ID: <CAD++jL=dvA6ewmao9c_tjytUF4P3Uqmo-YhXHFZDX7NPTVyEGQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: timberdale: use device properties
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33528-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F52029AEC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On Fri, Mar 13, 2026 at 11:05=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> +       err =3D device_property_read_u32(dev, "intel,gpio-base", &gc->bas=
e);

I guess there is some background to why we do this crazy thing,
like legacy.

I guess if I want to change the world away from this I need to
send a separate patch to set gc->base to -1 and see what happens...

Otherwise the patch looks good to me!

Yours,
Linus Walleij

