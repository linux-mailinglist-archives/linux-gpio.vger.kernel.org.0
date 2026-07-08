Return-Path: <linux-gpio+bounces-39683-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wYw+ASOlTmpYRQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39683-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 21:29:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B50729DE7
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 21:29:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rhKFxJD2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39683-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39683-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FE8B3054837
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 19:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BD83D0938;
	Wed,  8 Jul 2026 19:27:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481803C456D
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 19:27:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538847; cv=pass; b=urJtJoQTSigoiOa0qAg3jJ5nc9wRUzsGngIEAJpNFnY9cRfyeVdFvAo8VbXoTNkDbDPSBmS5OhXWSduJhVS548/oQEYPZUe3jIdqKPGfCQFNXMoz2enELgH3tIFz7qGOsbpncDX5Bsz4BNGOJxetsyAyYih8wTYR6EZ7KjWCiaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538847; c=relaxed/simple;
	bh=q+EHH6mTt8DlQfOX/+AMwbuSuVaj4VQOfgBDwKE8suM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGNcFuqL1TM5iGZiuZsckx4XFWTGp7j1bEjTD7JDucdccfYQpZtRKbQu+UX0mjz0RDMdL3KfS1eL5z9jAf4Gw3uPR9jO6Qo7xFHdkg3CVv8h50PQCICZrhvmT6BZrUUoKLVJ13KvIrbL20AsXMKBVJUahJruPXTHFB/HCRpKNlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rhKFxJD2; arc=pass smtp.client-ip=209.85.167.49
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso983989e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 12:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783538842; cv=none;
        d=google.com; s=arc-20260327;
        b=sJIz0rFLr0IxjMxOaVb3p/Pa+w8fgquJU82He23q+/KZBm1HtllhkW4rFVV1evA5mQ
         XnQZCpJRXVLQGBqHb3+AsFMxSCsVEE0gYthMxUl9dKc+JYhk9WC3XHl0TEzBMeWqZuu4
         7PvWxsbbXedxpR/A64ha9NTQCHpdDc5e0jv390gs3twD77DYzUJhmWMx2XMTI+mApax/
         TSk8x8uP6CCWQP2Tpx/Sa7f7LqoOzo+oBGxPM/CR/FfIgUcQKGd4G4KXrj+iip7QYnIY
         fyCbUIqsIcIvDPy5rvUpx9whMmdJ0ZPJnHPJ8tK3k9E6v52fwSACR9KLN+3tcVmYKNCe
         2HLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qv1qQ/5k1Vxu8jQwNMgms0di0ceoaMwgTBc54Kvm/A8=;
        fh=YxNAuD1GNc+IsJ0X+XAOGjOqtCSnYof5kJ9exY9PqwU=;
        b=UI6ZcCz5F/CroRfZp4Ks20dBws4J2GKW4qErssRN8vXHYaDlPrWpALg4IE2CBGFnAL
         V0Q/+GDPQT7EGCPSshr/4SzlgsIsyb4gVF+h2alSQ1Usavx2Ve6aRzXWWipVFDGQ6hC5
         IuQoXnJNkoi9vGpVm9BpNuItTXUpUNdAl/EXl9qOHdFgPyrLvT042c7gskgJ2lrZCCVK
         Altf42QEj6yPJKqAMqohzC9e6DhbNKxx1wT8BaR60emIjC9ZN5Hsmk8lOekEKSy4yqmT
         RZl1SUYr9OsrWKruN47VAfzlFo71djMAAYSVAQUvczHVk4y7qZwHwib49AWiQM2Iwm7z
         eUrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783538842; x=1784143642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qv1qQ/5k1Vxu8jQwNMgms0di0ceoaMwgTBc54Kvm/A8=;
        b=rhKFxJD21G1KKGREN96S61Jj4MOMsM5/Pjm5lXEBvcEq0brsVPFoGcWVYp0wkUSqwZ
         Jeasfcmngh39jE56hK54/yAF9r1jEGtteyct1+meq1Fggs0qhILOrRIExI3TEMck3Eai
         1r7xhVXPg2yxe3fCFaW5L+hieC76DRAajbyfWiQLAPPvuQDquHKnu35nbTqtQHdgjl0W
         xsB0pdEo26ts4G37a3L2vW5h8GPCM/Q90OUpqrVFhCY8jmn64j5c52DTOUsYQVCFGVhS
         kxg4V/+bxsoxfUUd8Xk53WR2dmxoz07TLpUtnas0Kw4qNCTSJy2w2RMilaL3UqTbGq+y
         P3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783538842; x=1784143642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qv1qQ/5k1Vxu8jQwNMgms0di0ceoaMwgTBc54Kvm/A8=;
        b=az6mV5g9Fvr2zw3v6tspKIMgbNCb/1qCmWT4BIPIbuY8hR/+MANt1lUuWT5m2tFiV7
         pFIVK1u+AFmasgODipRuKP0/g0fb+vSuF55w8W4wt+AzYFtgrd3khMpS0MGPiLFHdGrL
         Q+pLbeaEsFm/FO8qTfhBY0Iz0zHO5mdkYJyjPE8f1CNiKf9Yy1zQYFUimPq01OcDRAaW
         J0Ztck5RbU7hLqAOy/5rvA0OIwp/mlh8DpgqfVnJInb0dCbI80y37peKOfd/Bp0jGHlk
         +sn8/5U//J95WKKrBWOwzsyjr6+gRrx7wXTIA4sJJePqQ37cT3zoqLwycZhKkk9SXJml
         frdg==
X-Gm-Message-State: AOJu0YyN21UpTEeRxikyGvvQrWncEif2sZx4oHX7KcvJgbcj9GIuBw66
	mYf7pOltXvdSYzHXzx/H2+1WsjUk6VKaMl2wq5nbQ641YFf8yQhPyLV9+JAUFXyq2WtjZeyJZky
	1GGI59sirmSXyn0XmK5KfPQCd3shjePI=
X-Gm-Gg: AfdE7cnl5yF5dIhOSJSgfs1+Mr3rgjT/yZxH3lwBQk77kbDOrgH1MRF3nUF4pb229aY
	xZwt0n5610Ie9WN7QC8brjDQCh7YTrPPE2zyLREVwAdjbcIgkSZE3wJsvztYWuheijQC8XB+4Bm
	W+vT1NKygY4Y8t2ofTquAIhUjY0T0fKAlgtNO/NDzfY9CiGMbFibA5S8q5ofoyCRNgRsjKO7Vtr
	7KYavVaTyzEPFuhrad+TA/hAqYulaYy5kB5AX69qYm2XP8E5gdLAhdxX3YrSXNwQy+FGMRrANAn
	OQfB/Q1sGXNL70r3hRgTi243oYXOior6ZGMvuiVs1U6Z7gbGyY2vD04YJTeqgHNLK3H/zeZa95d
	yTSz8P9nxl/a7U8Cz2bi1yL3JjAamVqBI549vOQ4X/wxE/adytQk5N3otPr654QE3VmvLdp/f3P
	MHtNvPkqo=
X-Received: by 2002:a05:6512:134c:b0:5b0:149a:987b with SMTP id
 2adb3069b0e04-5b0149a9bf5mr308680e87.16.1783538841803; Wed, 08 Jul 2026
 12:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707230651.1138887-1-rosenp@gmail.com> <d5a86921-db3d-458e-b826-b0bac370832e@lunn.ch>
In-Reply-To: <d5a86921-db3d-458e-b826-b0bac370832e@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 8 Jul 2026 12:27:09 -0700
X-Gm-Features: AVVi8Cfumm-nRWTY1AONgoLWKQEGA8D0avyUeOQNTyLpV4gNTYw5UyQSH_0I0i4
Message-ID: <CAKxU2N_aMvgOwEnmGbCB33k=KOKnk8=-RPK_aJCwV7tn3GcHKw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: use devm_clk_get_optional_enabled()
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Ralph Sennhauser <ralph.sennhauser@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:ralph.sennhauser@gmail.com,m:thierry.reding@gmail.com,m:linux-kernel@vger.kernel.org,m:ralphsennhauser@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39683-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70B50729DE7

On Wed, Jul 8, 2026 at 7:27=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Jul 07, 2026 at 04:06:51PM -0700, Rosen Penev wrote:
> > The clock is obtained without doing any sort of cleanup on remove or
> > anywhere else.
>
> Given this is a SoC gpio controller, it is very unlikely it every gets
> unloaded. There is no remove method, so is it even possible to remove
> it?
Not that I know of. My devices don't.
>
> How did you test this?
I have two mvebu devices currently (sold the third).
>
> > -     if (IS_ERR(mvchip->clk))
> > -             return PTR_ERR(mvchip->clk);
> > +     if (!mvchip->clk)
> > +             return -ENODEV;
>
> You should not replace one error code with another.
This section of the code is a result of the older API returning a
PTR_ERR when clock is missing. New one does not. Reading the code it
looks like it returns -ENOENT.
>
> This driver has been in use for over 14 years, without anybody having
> problems with it. The SoCs themselves are EOL. They were used in NAS
> boxes, which do tend to have a long life, but i doubt there are many
> left still running a modern kernel.
Still have one. It's unfortunate that ARM32 userspace is getting
deprecated by a bunch of tools.
>
> Changes like this seems pointless, and just waste everybody's time.
This was a sashiko tagged issue.
>
>         Andrew
>

