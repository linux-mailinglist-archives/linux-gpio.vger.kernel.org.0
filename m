Return-Path: <linux-gpio+bounces-39017-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xA3QB3wWPmrI/ggAu9opvQ
	(envelope-from <linux-gpio+bounces-39017-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:04:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E76CA8D1
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:04:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hd9utmKr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39017-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39017-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B760830864F2
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 06:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9F83CC9E4;
	Fri, 26 Jun 2026 06:02:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B6A2580CF
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:02:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453754; cv=pass; b=UhpI0w5bGUTagCEwG5JvX68JsKgmyI7Gh8egxBNKDpzgVJ8TkNGOSXMv5tPxwGLsFXPsO8oIR/6NUvwqlI/MZ9AxqdlbCrvkHekGntR7Q5qqHUt/0zbzadH/0V599R0LDJq/q21Du9JWhq+pNMq8MvGqelVcaw7YeSBwTLghsII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453754; c=relaxed/simple;
	bh=CYkSJcp6cj9wge616TCYABxdeLIGM3K7nAQuxYct+cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OO5epsdaPm6zyNqxVPm4Bexgdyn8oFME6htnbcENnSvfevPsz7+jWwrGoZilPslO1whLtS6G1uLJ0NzTFU7OmqfoJDKgJIpkHwh/r57Uyvk0APwdbjmcqSckeQ1jtXSs2wv7uRcc28J4GqmipgcLf+VuyQji/AXoTqWuI2y2v2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd9utmKr; arc=pass smtp.client-ip=74.125.82.48
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13809223fd4so748510c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 23:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782453752; cv=none;
        d=google.com; s=arc-20260327;
        b=pJIRWEvg0KQ2wtV5FvOyyyk4cRE4UfroXGzBR9prDNT1qojSTsh9O3iPF+iDqfBxmN
         IbU36c8dmx7kr7zihPeOQVx5zFCNhnUH2sRqNLHZ0YpEl/MdsyRj0H79Ifj8KmTpwUfO
         yPtC8zqGAybc7fiAidcgAmXjPmvqwmg1rDOYsHP2EEpuvSjHW/42JKuK9VRFB0hpTQuL
         8YsU6h4BvNwKYjNLTx+0glpzn6n3B3CuQfvwj1OkJZF0DGj2hIk0vlvX/IZbdazJ515E
         oCtlWxYLIsFNadqNoj3ZapnCO9cWfP8tf8JIgRi7CrhjqOlUERNMuFzrc0tDjDF9yp27
         mSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWUkeU4A4KKIVZzcqHWnQVGH+WDkQXJIvBskJMSu0dM=;
        fh=c8Zw13wn6leKT4wq1CX7BIcJdjphYwo1qXSwQ+9RK1c=;
        b=X9tWlImVMmg/DhNHSyyD/na5BK+Lf3sHbfMarQTWdlPFZ9hfy2xo/YrEn8F94SOaDo
         2gIM92iY+xAS/KWuQxmvryFfKQaT6x8QU41iwUUWFzotv+fPGUK/tTuXn5DhoQGQMqhq
         XF4U7FZ8+GjdR09JQKH5OzU8KJrOsDh0QpGCVBLIbHRMisZkClJCwoHsXjGRY8ZsuIFs
         pFcrTeJr31P9RrVjqhRj4LiYKKMc9SruYE8Ia/e7CIwA2thsRlQ1POZ9P7XCZR+G2Eqs
         rcgGZdZiNx52QnJC7owZWXI8JAG8D1yjcu1/c3HNbiZepJS3UeokgR4DVlaoeG7N4jWH
         dszg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782453752; x=1783058552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWUkeU4A4KKIVZzcqHWnQVGH+WDkQXJIvBskJMSu0dM=;
        b=hd9utmKrXmeczNYuQ+uG03Chw9QezE6+KWYrcmP2zT+nRsI/+nLnjUEa7A3Byxgn/G
         5ckh+V/UKbhFv21HqqzM2geNwmNht9S/Mp/+7ShkNrWPHwfX7CHF5S+afLzyo9c/rF/+
         WQqqWfhppY7WGc8NQjCwoM/EAigwaWDjXEQatR6LvcaGdDbffyRxUlu/okHF49d1R+zi
         9ebPH+grJuXqjOf8X2I8BqfropY7hInVfRSFMLaQ8ak+427ZccJR30SxcenoAXF5CQ4X
         pQQ4JsMM+zVu8g7yR4C3bUsLP0EnED6HZOd56LvlT7u/sz8n7UjX0ykkjuYcYg2/8zlg
         7/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782453752; x=1783058552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWUkeU4A4KKIVZzcqHWnQVGH+WDkQXJIvBskJMSu0dM=;
        b=S7QwLuUZQQfBObRtwzx9Qz/qP8Ap4bmG/xFrtU6njo3+FNBOmWMCBqXehXBEkwHVJL
         kC1jPylI9/Tb6lsNuJuJsR1fsQ1Udh/u2e23wVYctMwY6PAluHpjcOZIurW7Wu5N7/C7
         XfFvLJ5LK2wywySS4ciJFmbqIjUYoFlamTQJEWQ8l4YTM9W2V+b+nNZsBsB2IFDAZ4Rx
         jDlBPVKHDBJP3d57MT0+IZBJl5DJeOl2T1e8x1yXJ0leR153vcl9sk/U4kGJDwFUHkdK
         VWQPyHqH5b6vOswGp0cnpcQ0zV1T3CkxJYAcnhvWa9Zs2yyVm7z2BqNpa4MsuRn8VnES
         zuPg==
X-Forwarded-Encrypted: i=1; AFNElJ+zT60OO0orOxtW7t2jcuTvsVC+S0inY5LgvrknjF+gaCuEQi0HkUUItvJdjn1P+ntX4PZWQVMh0Ojx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4qrzARTXPXULXdty51A0iUyK95XXACS3TgsXU0wl/mA8rF3qu
	+OceVjXcy6Wcpr7YR7eP64b0LcLkP3JFJO+nMbQh/eoQl6IYToz4c4jnoYew1MqfnQPfV5rn6v7
	SYjFR9I8Qg99Q3iMrjPiuZYrqTaf/mtI=
X-Gm-Gg: AfdE7clHCH3zzpSSDmUHLOG7ILGstiSmq9Aw+1Xg80Kz3rbmLFhWAxZDyAjXhRWvBtL
	sWM2gbYu6vj3nSvSi0EpY8ypxncoNxb9SHtujzwebflwnkGlDn65bq6K7RROSqDbDgdZN7a+czv
	BCnHxoxQ2X/TOZ8Mib+6QsNpvxF50tuk1fmEHonvZRl8feKV3lemnkiWSYlJuefCEbXtoZ0fKSw
	jtDbv4s3xsLuwwXTIxKmzqi5B/5CFIz6r7s792Xs3b4c3vBz5wf3gFe2KrM12d6/MHM2w==
X-Received: by 2002:a05:7022:51f:b0:138:407c:1d24 with SMTP id
 a92af1059eb24-139dbac8baamr4259978c88.36.1782453751513; Thu, 25 Jun 2026
 23:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620120136.2482872-1-sergio.paracuellos@gmail.com>
 <20260620120136.2482872-3-sergio.paracuellos@gmail.com> <CAMRc=MdW9qtq3h8kjEFkufaZPmCEidTzvOYAKEx4e59xggsfWA@mail.gmail.com>
In-Reply-To: <CAMRc=MdW9qtq3h8kjEFkufaZPmCEidTzvOYAKEx4e59xggsfWA@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 26 Jun 2026 08:02:18 +0200
X-Gm-Features: AVVi8CdtBGedBJFoRE0LxJZV9-TqN5wPMc_8CAIHevtYdmso37-Q-OwQAuaSsi4
Message-ID: <CAMhs-H9UZShkWpa9mMVr67G9MGuZqqOxrtj6f2QdgMxHBHSf+Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: mt7621: more robust management of IRQ domain teardown
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linusw@kernel.org, vicencb@gmail.com, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39017-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:sashiko-bot@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 867E76CA8D1

Hi Bart,

On Mon, Jun 22, 2026 at 10:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Sat, 20 Jun 2026 14:01:34 +0200, Sergio Paracuellos
> <sergio.paracuellos@gmail.com> said:
> > The driver uses devm_gpiochip_add_data() to register the GPIO chips whi=
ch
> > means the devres subsystem will unregister them only after the function
> > 'mt7621_gpio_remove()' returns. During the window between domain destru=
ction
> > and devres unregistering the GPIO chips, the chips are still fully acti=
ve.
> > If a consumer or userspace invokes gpiod_to_irq() during this window,
> > 'mt7621_gpio_to_irq()' can dereference the already-freed irq domain poi=
nter.
> > Thus, manage the IRQ domain teardown using 'devm_add_action_or_reset()'=
 to
> > guarantee it is destroyed strictly after the GPIO chips are removed.
> >
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
>
> Same comment as patch 1/4. And the following patches if applicable.

Already sent adding Fixes and CC for patches 1-3 since patch 4 is just
a naming cleanup.

Thanks,
    Sergio Paracuellos
>
> Bart

