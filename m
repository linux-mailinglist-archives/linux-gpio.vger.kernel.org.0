Return-Path: <linux-gpio+bounces-35623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGbFOFPE72lsFwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:17:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B99479DD5
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B264D300D1DD
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 20:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C9E364021;
	Mon, 27 Apr 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFceGBoo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476EC2C3252
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321040; cv=none; b=LAKMxmz+/vvMJq3evFaQHxOICvmOT42IRidqvWXkRCuUPsSPZdowvmYoQDpgGBVTQK2SJbVl5Hbi1fXUSYAWTP5zWOVLGtm2L7IPWd/6sVgSeFGDDNXdXm6weu3UdHtIATMQCK9KhWV2AP0Zp9fo54OkUv3iO7tHZZTKmtSk/pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321040; c=relaxed/simple;
	bh=MML6xm081n5Pak13fUwHMOoZLCSpJ1pdm1tH+RKwCKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cixo+VFWTkUc5D0TGe5q6J0rLVHOdHI3q+yAa/SfKMTurGvm0mhQjy3JjIdzlrp2IKjeb5232Rp25n3HZolgCn3jufpHbn189Y3BFRbB39t+0xarjXxg4X855Xn2h5muPVOTr8rPaCdyKU/EIROxbxAkXQV1WMkRYUIbsM/DpdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFceGBoo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080DEC2BCC9
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321040;
	bh=MML6xm081n5Pak13fUwHMOoZLCSpJ1pdm1tH+RKwCKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AFceGBooApUQ5vEYu3SKP0vMDyNtOrH6ADFSO8f23GVGxXa9VeS6udVvyeP/MmMJf
	 ToKjINBm8z+rA2W6yp/kvFSZ2J4aHwTVQNU841+uxVU88OqxiKGjkibsaVd8D+f90M
	 lITKeKWvceubXXHOSZ1iQ5B9KEl3DNYAqGm+Et8lIvj3h/7KFRScRTtuivZnz9mCnx
	 ADjOmojxZ4mUllM6WXf7/YaWytPQRwYDty7x2gieV1v51Gl8PMfnoKsyZQ5XUHRgtX
	 Zyi101epWXi3645DgAkU1MvmT91NSj0/eIQCOHVt1g0JiaYnp/K1ZDgwPx7i05sWcO
	 Eo7/fp1Cx/FcQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a40502e63bso9446205e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 13:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HAbgUfeXqPjH7lM/Xeo5G570/M0i0S2IA1dL2LhYLoruiHlxd2hZqj114TPF2C9OWshj/3QEyMzFN@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/QyFaC08UgQhRD0x87KOGY3WRpBmGr/o4TypCfXfxMWF7ajc
	9uQGj/hUpu3grk7v4X004CtxSgbwYig9sxB6CoNf6CeCdp4Z5JHDLizZKXacW6tY3y2cnbWFd7+
	dtmoLI2jZ76++zs+qI7gx4TxKQ3OoE9E=
X-Received: by 2002:a05:6512:401e:b0:5a2:9d02:9498 with SMTP id
 2adb3069b0e04-5a746407e15mr100233e87.7.1777321038631; Mon, 27 Apr 2026
 13:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com> <20260427-pxa-gpio-swnodes-v2-1-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-1-86fc24b9e714@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:17:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLkSrxqkwcNy+xfLQJZtVt-H3Oc9Nwijso+-Rh_PzeBL=Q@mail.gmail.com>
X-Gm-Features: AVHnY4JdYGMAvUN92AUjthb9aLHpzD4JkMhQlxldYhbXXjPiDFufTwMvhXYdFrk
Message-ID: <CAD++jLkSrxqkwcNy+xfLQJZtVt-H3Oc9Nwijso+-Rh_PzeBL=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ARM: pxa: statify platform device definitions in
 spitz board file
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@kernel.org>, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A9B99479DD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35623-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 12:14=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The scoop devices are not used outside of this board file so make them
> static.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

