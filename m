Return-Path: <linux-gpio+bounces-36580-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFeDAqrdAWptlgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36580-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:46:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DAD50F3FC
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 239CD304D2DD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46B73EC2C4;
	Mon, 11 May 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FypKc4F0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF63EB7F0
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506532; cv=none; b=HsXgObzXc0E4ZPNMDJkk45/ZWBx3Wuh0j647LJpBpNIJPxh4FDzHUZ82cFFscOGgB3qrfv+ySGJ+YiIuNAvOLfrIOvM4V1ZS28Rc6wJd/KiFpuRHRVCDQQHy4Mnrb1GpzrNNsdWChsK9jZPo/pOBuh7yFd5LQVae3+P4k5uqcsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506532; c=relaxed/simple;
	bh=/lBwJjKIl2g6UF0VMhS59pfFS4rpMrtKUF/lmDHhe/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQK8vck+4+WLSTY7rYH8FTgAeu67bj5EHBZkjYJHVWeM6Vc9o4P/pnUVIpxSHwqSKcMjjo/330F6r1HO40SO75TJzlo+C1VRZGSMw4OzFF8Myes9bBsUlrmQlbdg2ZD2goO/D2igKkWau60Fngz41rUjNYqrS7P/a4ldWZKN4dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FypKc4F0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E5AC2BCFD
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506532;
	bh=/lBwJjKIl2g6UF0VMhS59pfFS4rpMrtKUF/lmDHhe/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FypKc4F0AdJbhKfUPhAN/OTZKDVXKaSRqUkZs9Fn7aVx3nxTYJi3iyZ+c6xXI5Dro
	 VTIRso8DloSd4az8g2MdlqJPLmWl9lCMxiMvDDft60htW8agWjVKQEbE6mlFSktyLw
	 l6hGVY/ikLYz3ZpMySXVg9ObVrcOaJTqyGqpfvSQyeOOBwX2Bn7sbEPe4KDDMJSNDM
	 2wORACkObXO5uySV4iD0IqTIl+oFnUlBVFJ6cTtj8w3vaDN37OiCt0fL007EJnvCoZ
	 Tbu3mvz6s6arN1RVSN8P1A2jqyJCum5loWyapag1Q8SzrGvEvL/zJm6JMHOcwECXMp
	 saBICzU13xJFw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-392445f11c5so42756151fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 06:35:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8pe/+CS7yrRwAA/kK94E0onCDUfoLAAYtpq986xlAA8eYVg5ukQdXVFph8AhGKHKJn1Obw4ae2JqlV@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6hvLPlU+BnDCtPYatUOCR9NFQ/c/3hL44h9vNZlqSSdzxSH9
	oEoTKEtjtP/7gVgNBFeDFe9oW+PzvxFEC7RRWyjEnXjgDBg2t+h3pNKmkGSivalCuLCtXqit+Zn
	vqJr9/jpPCRVbHBZRMmBPWyfsGW6k2kwCgwYUaGUr5Q==
X-Received: by 2002:a05:651c:25c9:10b0:393:aa48:8243 with SMTP id
 38308e7fff4ca-393db0aa0a0mr39373091fa.18.1778506531112; Mon, 11 May 2026
 06:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
In-Reply-To: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 15:35:18 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md7EdfvNV+6NRZK0UkNXcYp3uR4N4buKH6NeKKg_rnt-w@mail.gmail.com>
X-Gm-Features: AVHnY4KVYQLNTX-bwgopKPbxO_uksCzXvDF2gr-UH6aomroXQBQsEy6ffPhZrLU
Message-ID: <CAMRc=Md7EdfvNV+6NRZK0UkNXcYp3uR4N4buKH6NeKKg_rnt-w@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F3DAD50F3FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-36580-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, Apr 30, 2026 at 2:57=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Convert GPIO controllers and their consumers on the PXA platform to using
> "attached" software nodes. Since everything happens in a bord-file, it's
> quite straightforward. We technically now have a way of passing an
> unregistered software node to platform_device_register_full() but that
> requires using struct platform_device_info and since the existing
> platform devices are either referenced from other places or defined in a
> different compilation unit, I wanted to reduce the impact of the changes
> I can't test and went with the older method.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

If there are no other comments, can this be queued for v7.2?

Thanks,
Bartosz

