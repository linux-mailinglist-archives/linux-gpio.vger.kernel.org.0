Return-Path: <linux-gpio+bounces-34813-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFctOoMJ1WnMzgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34813-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:41:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F5E3AF53A
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20D3D305B288
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 13:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C601E0DE8;
	Tue,  7 Apr 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5378GIm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C51A2C86D
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568636; cv=none; b=pu/GIwswM5QXrekxSSzKIUSJAGUEuJWwytVYVS03leIlhao6l7OHDMmH4tj+WmyHApXURqRfeVakFmMaB0lA88gg5nUgrUBOPICy/fP6n/48ESiB66Klno4SMXIzGF8KC4S9JSbQ6diOkZQmmnEvJHLoTJVMZQHke3omZF5Y2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568636; c=relaxed/simple;
	bh=xX/hhBDJLd9xal9rlmLTq8tcBQ3ZwIxZZu1w1wj3XHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIXB9STAu/WWywbgx3KL7L5usL1wDEjnWz6IeoA7Om4VLlbDJ4PmuBKRd0XaYTxCeVNsF+bONe8yDWQRzmclXYNk7+laZ1Oc0a6Wc6HeAJO2+hxnXzIE5RMj3iRcom+3L9yQtPL+TwrChz/depx5SbI4BOxhwGpiHddrXYBHFjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5378GIm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A69C2BCB0
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775568636;
	bh=xX/hhBDJLd9xal9rlmLTq8tcBQ3ZwIxZZu1w1wj3XHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f5378GImYAQt5+RjMqq0kVvqiQuebqBQypOQWuoH2kpBIC6MD2qMfIHHlgX8lpmr0
	 ewa/+f88KWwTNdcrfw0Z1zcDhFoI1KLnbPC1IIyTCwkc+8uICDGiaqT54bMml+K6Lq
	 SEZzoz0ZBzOocXyhjB2oZeeySJjeBZmHaoZ8Ovc8M8o/w4FQCdLQKwtJjLa/UacqoR
	 O6bOIdDWOy2cpu7qxksQMSjBSm8uv1TsxvmvEIux9I8CwVQiZsCYU9+r6U5toNMYCK
	 3qddw8SeRuj+WgkwgeyzwO7fG1YAeJAIVxPnC3GwKnC8HdDBLXrGy2faa8A5WzkHKq
	 v+rbhO367HbLQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38cc8708d76so43227001fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 06:30:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMkR2XPrvMUkVacHlTgWGwJ33tZ5pqfPUbV53gtZGP7cgKRyCXdLGZoCMSPio3r/a4KHaeg56MZX3Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjv1IP9hDqDok/eo6sEsfJmDLRigBCj5irv77RHX64wDTv/Fo2
	gw30qavVVuKLmICPkj6B6GkQyWO3oTqS1M3K+tGNpWg8cxr+WkrrkkdQ1glH4i0Os7YeltaqvZZ
	UohG0/ujr1r4Zk/w1gjbkVtmtm5OztSgq+JBE1sFKXA==
X-Received: by 2002:a05:651c:906:b0:389:f0d9:398c with SMTP id
 38308e7fff4ca-38d92dd7601mr56152441fa.31.1775568634530; Tue, 07 Apr 2026
 06:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local> <ac7UqTsPC8yUooAR@google.com>
 <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com>
 <ac_9EV3C0I1WXQz2@google.com> <CAMRc=MeRSKWoEn36hht4JuwrwOMpoA5g_Xju2XT9Urq3mQS2wg@mail.gmail.com>
In-Reply-To: <CAMRc=MeRSKWoEn36hht4JuwrwOMpoA5g_Xju2XT9Urq3mQS2wg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 7 Apr 2026 15:30:17 +0200
X-Gmail-Original-Message-ID: <CAMRc=McMXaxywq4SNKtAWy1og49mgAyj6MtErv2RE_WgGcyZJA@mail.gmail.com>
X-Gm-Features: AQROBzBMrZ5OueRzPU9GuzizwvAVvNCpC1VwkP67KUbTRzmFKPR0cmXYe3F1Qxs
Message-ID: <CAMRc=McMXaxywq4SNKtAWy1og49mgAyj6MtErv2RE_WgGcyZJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34813-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,oss.qualcomm.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 50F5E3AF53A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:57=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> > -EPROBE_DEFER should have been called -ENOTREADY from the beginning and
> > then we would not have this argument. Or, even better, we should have
> > used -EAGAIN. But it is just a name, semantics does not really change.
> > We want to signal that something is not ready and the operation needs b=
e
> > repeated. Currently we contorting ourselves by using yet another error
> > code that everyone will either convert to -EPORBE_DEFER or will handle
> > like -EAGAIN.
> >
>
> Andy et al: what is your take on this?
>
> Bart

Andy acked the v3 patch and Sakari pointed out an example of v4l2
where a similar approach was taken, so I sent a v4 with issues pointed
out in v3 fixed.

Bart

