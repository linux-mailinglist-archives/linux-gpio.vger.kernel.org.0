Return-Path: <linux-gpio+bounces-33310-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFijDhizs2lYZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33310-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:47:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D30227E4E5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3098D304BB6D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 06:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAAF3446D8;
	Fri, 13 Mar 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYu64oVK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A1B322DAF
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773383413; cv=pass; b=Jt6cPfTVBRQ8VgitVP8lH94SQ+gzkA4S8W4DFrWT9V9R0UZvSaIOydEhha5yxT/U3XxuL6V8sDv48dvBWWL0f5ltgciiKz0mz40tKejxPXGiopoWq2reD5d9+zZqv0k3AhPKIM/xjOxVZCo/p82Swgri1ue+hWq+VGBP7gBRhzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773383413; c=relaxed/simple;
	bh=3WtB1EO7ULP2dv1nFjQ5XE7neEDPZu3SzQtV2a9e/Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jqyv86MhkI1vTCKVpIrdC+aL/YYu9fS8eYPh35EQ73kC0yE6LkxlLcqhG7/ddEBAQajsmncVBVa3L516UBjMG0WBRql1yzRf1JmwCvcnC/bF52G8pyq+d4xvsP+IX0tev7FVN1BpWAE96brSd4HejUkkpWD9iK3kPonyr7IPCS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYu64oVK; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b941d924534so218170666b.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 23:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773383410; cv=none;
        d=google.com; s=arc-20240605;
        b=EU4+FOoqQ4soaQsHFedsKXkjCoQWeZ9CwsbOXfxyz2P0xNQ74G8Ybxt1R5uqHLKSxF
         jadvAgpBkr3Ee6rcqZNqzQcUDlipnAr+GkY/hNZg4QBafzKXPbNfm2CRwXo4z4FM3flS
         UE8at/YHNzEad1kR2JGSWLVOdp82rGgHAW2tTSPwOU+wXlYV1MbsvJyb1UN9Bv3JwFne
         bgHAVxNOHLIizow3nDCn5Ihy5wLgBdCdV3W5VqkTzqB+Pm0s9kngWbW0BxHCfFUHhmEj
         MsyHKtDK6V8+SvvI3ncUlEFM2JYX8AeBKK8Et/hMAbvzYEQAu4kWHM9GpJLa1vdmZ6hc
         fGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPJHfICB2kVM1pQvzl6TqPezMCEYItbR1A1kcv/R7E0=;
        fh=0NPERyZABX6YX/JX9BYPbIbBmhJ3VEcBMe/dL0CPpPU=;
        b=K9SeA0TNBhg3+s1t7TPAYA1ZXdgixbFpjMGfVjHHOYP3wD9Hj0gWj1uRme3fLZ+RBk
         QmD53gqmeCDrLNe6yCg9/7pGzqtcUqikWWlib4z1KM1g4LFM+R15LbmU5Hv2ZRy3goiE
         lrOQFgAHHLS7dvtxXBsXqvsHl4+k8xHwSCrLDPT6h/UJQDXtkauiXCJquJ1WmaBz6dw4
         QQ6Ay8Mimpbt7a4d4jcljKbPx5yCAkueAA31/cO88Up4dEcPvrkm7SiQ+WFvO0VJsiyj
         S+nbw2xzKRkdaFYhO5ZCC57cgcg7ERy81GTLiVDsAqA7Knz2rUl2L6rP2EdYbeeVvs/1
         eIjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773383410; x=1773988210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPJHfICB2kVM1pQvzl6TqPezMCEYItbR1A1kcv/R7E0=;
        b=GYu64oVKzwgzn8ZAuawiupzGgdpEC8YMZ5rJ/rLOiuLO1yKiLBKflt6gHMmS7FMA+l
         vKrKE4Rs0LN/B3OpW9U4FpXdZjKQg9iWmIkH2nrWXbXaY6sziUcP1StBToPW9u7DMdwJ
         MEqSR1WpHDqGYeFhCqU4OqfabnGYFZtOcyGy2CJ5uDpGlWMpgSAIMGnQqaRYqdb+Zayj
         mnGvXiv3ly+NmEznAiW7DRh2Am4TIYkxY+Aj1J7L0+It7bQpdr+Rc3U5+ljIoMW9qcvY
         ErNXbWvobiWjBk07OElHISCRq3GxSozVzZlmwlbe6j0BafOSxZITzW4vunqFLsOxk+0N
         S4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383410; x=1773988210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dPJHfICB2kVM1pQvzl6TqPezMCEYItbR1A1kcv/R7E0=;
        b=AYhYKk0Zs9kWh0CNTPHhYB+56m7ngd+iNlJtlRwQhp0u6Jr/KNSA+/uH3WH4YbtsrC
         RhjLMZOgNUKC7ObEgCaIgdPLzuqv/927V7dMqUB3pw+4Orm31CbYSxrGv4lN317yY0u9
         /SzELYfq+waMqP51RmOVNP9uTq/noMSTt0nn9mpVBj/PoppeOLLyqpeojImtoL3VZAO7
         e+/1bIhASQpcmzEOzXB/hxoAvke8PW5OdupCkXgdthVAvFgel/tthI8qMPY12z3ogF/6
         /y/LLoiIzE8S70Q7rsFWF6HHsLbGN8vml5XH4fTIHPgeQxB0wmfcSWL76Qa08VkiUido
         Jf4A==
X-Gm-Message-State: AOJu0YzzpcSr1hpkqy5IqRFrYeOO+1p709yepnapg9irwUHlIt0B/8Mu
	qBO0aePdU/WRFGhgD/c7fpH05NksWtGRYb6/H3KyovlMntuUmOsbPL8FLZJ0Qj0YKiAL9sBPJYM
	6FKuzzZCb3sA1nJ8VpSGpycrxQ02U+Xw=
X-Gm-Gg: ATEYQzx0r16SaUEeD7P2A7wKxqtaZSMc0PM8huFTAXnQH/Tw52EEVdR93rFYfqXWXhy
	eGE0eqiBaXGv1CRcXY77MMh9wMR+305agGIjbBEdHuWABWBDdihWjiprMemOH5iQh9LhXfefiHf
	F5qa3XlMBQvlyK3BLHTdmQnbQi8sXN2mrMkRgl+SErMvdW33bAahJrFJLrBPieQ28DxWNrbc+V4
	Ztp1yowFr/PxJ37qXxpKneGvmLXIjzNbIuw8FA9QeCzL1qSmixsj+g6yaceDB607OLMs4ps1mF6
	VFAwGWsXzGGfPtVx1Boswwisjtx3bcc4uzxs5OpSihZ8yt5YbUijAiSHC1aFWlJfou1uDWDkNfP
	6kbkJzQ==
X-Received: by 2002:a17:907:3d87:b0:b93:a3db:a68c with SMTP id
 a640c23a62f3a-b97651e7241mr118021166b.40.1773383409452; Thu, 12 Mar 2026
 23:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312193717.12221-1-rosenp@gmail.com> <7jwgbrijeldghk44tdg2be5q7o7vuj5np3nlbl2pxuln6c7ll7@ntuquxxdnfmm>
In-Reply-To: <7jwgbrijeldghk44tdg2be5q7o7vuj5np3nlbl2pxuln6c7ll7@ntuquxxdnfmm>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 12 Mar 2026 23:29:58 -0700
X-Gm-Features: AaiRm51lyu5fd17YeYxCP6g9ZNV_rgw3odQq_g1fIwHyYebHzAUSuwEuLroDVYs
Message-ID: <CAKxU2N_7sZu+J46sCQH4jgVB0r9HsHREToeCTg0Hz4PaVjY+sQ@mail.gmail.com>
Subject: Re: [PATCHv3] gpio: virtio: remove one kcalloc
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:VIRTIO GPIO DRIVER" <virtualization@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33310-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 3D30227E4E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:09=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 12-03-26, 12:37, Rosen Penev wrote:
> > A flexible array member can be used to combine allocations.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  v3: add counting field for __counted_by.
> >  v2: add space in struct
> >  drivers/gpio/gpio-virtio.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> > index ed6e0e90fa8a..57d0eb532c3c 100644
> > --- a/drivers/gpio/gpio-virtio.c
> > +++ b/drivers/gpio/gpio-virtio.c
> > @@ -52,7 +52,6 @@ struct virtio_gpio {
> >       struct virtio_device *vdev;
> >       struct mutex lock; /* Protects virtqueue operation */
> >       struct gpio_chip gc;
> > -     struct virtio_gpio_line *lines;
> >       struct virtqueue *request_vq;
> >
> >       /* irq support */
> > @@ -60,6 +59,9 @@ struct virtio_gpio {
> >       struct mutex irq_lock; /* Protects irq operation */
> >       raw_spinlock_t eventq_lock; /* Protects queuing of the buffer */
> >       struct vgpio_irq_line *irq_lines;
> > +
> > +     u16 ngpio;
> > +     struct virtio_gpio_line lines[] __counted_by(ngpio);
> >  };
>
> I wonder if it is worth it anymore. Why combining allocations is better w=
hen we
> are ending up using more memory ?
No idea. That's what maintainers suggested for some unknown reason.

Anyway, I don't care if this gets merged anymore.
>
> --
> viresh

