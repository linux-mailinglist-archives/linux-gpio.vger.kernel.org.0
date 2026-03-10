Return-Path: <linux-gpio+bounces-32881-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEaBLrTUr2kfcgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32881-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:22:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5562473AE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15A273014618
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 08:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C573EBF0C;
	Tue, 10 Mar 2026 08:22:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C8C3EB7E6
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130925; cv=none; b=j8RG+WTy40/weoEkkSPNlh+0/wisgdAzRrIVqVZdQPSj07Ob2wVIhPW3nMwxloYRX3ad/f6Kwus9ffioINJav0I+HBd1kIgz6uYmEpUYJwhr91Rx/FZSg91htNvomtaExyvjnYRWQGXODmVRV7fX89q+ersRLNkQjY6MmMy7s8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130925; c=relaxed/simple;
	bh=8eG9h4oNIHd3WkVYJ0CiryGcrS2dUFm0LrdqFBGuGHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDia95PeIvaxdUAT/QXEgOLqg0YgrcL8JK7rsN37Od65X3GWGjUI/nJEuZC1NF/XxXk5dAGxRItP0psSc26LlAHtTHEorrncMTqjLVk0wIqUSMEDVBmssB62GMcAdrvQkm+WQM7en+91i18K45eguepGpytFOIBmxuDvR63SaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94dda16ff9aso3564995241.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130923; x=1773735723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ME7mYFO5cSxoraTNGXEpjmzWMS/MMckOG3Vu7nhm3yw=;
        b=Wstwdbem32YVjfAd3sb+VFQsSv2U1aWHglBlkJMe7XPYJypRsPzU6bmfDezg1IWcK4
         5y0Ae1LCfyDritUqbcADqGaFfWZOWZBeEak/U0vWN3jfdTCjywypvrZ9Y8B1RwfDkjp1
         eDQvhtM7R7KNW/yGaGfNaJFCsFvCixueS1NbpXD6h8vbWP1Gapg1Vh+3FyI9szaHYHs2
         bKC+HlsjRfXXQdYpQfo8KODAdpGUtNSy+mQB7RV0lEJC3nID8Z+kyE02OsHEq4NQqK9J
         DokUDvI4R2wWSK5D6RVoqyF3TFDD86GPwzgtggBGdKN1h4CxnotBtUv7Zqar+HmSsjtE
         6z+g==
X-Forwarded-Encrypted: i=1; AJvYcCVP8TTJlkAZKHHsI89LA+MDAUTAFzD3H2x9c8xabvf7AD2AV71bcCDC1LcsGTbdBWOW/HoyxrI5O8fj@vger.kernel.org
X-Gm-Message-State: AOJu0YxsiYBYcM9pId7fDmdE/TULp97S9nld6Lny3uI8CrHY+6ubI+Xv
	7usBL/Es23D6qcpKNsK0UqMWSoQJ3O48u+cmZx9iGwdeq4tiSFXLfkKmEnZ9LYIl
X-Gm-Gg: ATEYQzzq5K84HhpWc0H/pNARUR9tAX+0HtQPXQ5C/We5cQ4i5AmUeBs2MhoB3dSY+1D
	aq863mR3EP1CnjKD7F4gZyDh58ypiilFnmsojdaNhu0453crUnPE3ruxZ0jzp6a1TEP9kaFF4uv
	Eyf5gm+jQ9mjGgZI2qJsOtZnaefSgOyLdpjH8CpCjdaedK2Ni7V7LVh4NvZA47kevTGcG8hXG0h
	GPE7PeRDrGuCcT4MZgvl4ncvDasYkhFmWjYXGDLCjGK3+vfrMdMLo4/RQLN5eVyZRDZtAaVhrYu
	OJ4hDnVvHkCHtUOLKgGMdENrneTEOIHfe4IEb8HGUAEdPmqYcrwJ0qSDbPMNka9bgYGTLd8KjrE
	oYI/yI+G06qywvWa7C5xUIi3HGXs/4OA72WpDMhFDZgdj+cwp/NLV3tNJ2zyWQ0KPKVgSIOe1Cg
	Q+o/1xzphrYrQoFOOdaC21Q04N8JKdV9Dbs2Bi69+wyl4KM8JwM0jjihTWDQ1o
X-Received: by 2002:a05:6102:38cc:b0:5ff:d71e:c607 with SMTP id ada2fe7eead31-5ffe5f5693cmr4834058137.13.1773130922689;
        Tue, 10 Mar 2026 01:22:02 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b57ec19sm9274908241.14.2026.03.10.01.22.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 01:22:02 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94e82e5b262so837378241.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:22:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLHF8iUbfx/0IXXz8QnwZemRRYVStLsUbfatwupEOT+esnY6voSXOYzl4N+b2iW4VutB8ZR7qe7TXZ@vger.kernel.org
X-Received: by 2002:a05:6102:3a11:b0:5ff:2391:45c0 with SMTP id
 ada2fe7eead31-5ffe619f7a7mr5819578137.31.1773130922022; Tue, 10 Mar 2026
 01:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYnyl-Nf4S1U2yj@google.com> <CAD++jLmvck+_UG5cNKLCVs2PJb2zynvhr8EbVbB6cYU9925+Vg@mail.gmail.com>
 <aa-3BYKrONKrHvTq@google.com>
In-Reply-To: <aa-3BYKrONKrHvTq@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Mar 2026 09:21:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtWf8vp4mDu5RaWQs_YQ4w5Judk-GsQ4ih45DMEKQ7SA@mail.gmail.com>
X-Gm-Features: AaiRm50gcawarxu3kmNtLb8Q9J-FKWy-3ateeFJv7I6B_cUkGbMzYEJyPcISy-c
Message-ID: <CAMuHMdUtWf8vp4mDu5RaWQs_YQ4w5Judk-GsQ4ih45DMEKQ7SA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5F5562473AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32881-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.932];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Dmitry,

On Tue, 10 Mar 2026 at 07:16, Dmitry Torokhov <dmitry.torokhov@gmail.com> w=
rote:
> On Tue, Feb 24, 2026 at 10:04:15AM +0100, Linus Walleij wrote:
> > On Wed, Feb 18, 2026 at 9:58=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >
> > > The GPIO get callback is expected to return 0 or 1 (or a negative err=
or
> > > code). Ensure that the value returned by rza1_gpio_get() is normalize=
d
> > > to the [0, 1] range.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > I expect Geert will pick this up, else tell me & I'll queue it.
>
> Geert, will you pick it up please?

Sorry, I am seriously running behind with patch review.  I hadn't
realized this is a serious issue, but apparently the 0/1 behavior is
enforced since commit 86ef402d805d606a ("gpiolib: sanitize the return
value of gpio_chip::get()"), thus rendering the RZ/A1 GPIO driver
broken since v6.15-rc1.  Unfortunately this doesn't show up in my
limited boot testing of RSK+RZA1 :-(

So:
Fixes: 86ef402d805d606a ("gpiolib: sanitize the return value of
gpio_chip::get()")

Oh, that got relaxed again in commit ec2cceadfae72304 ("gpiolib:
normalize the return value of gc->get() on behalf of buggy drivers")
in v7.0-rc3, so apparently we're not the only ones...

BTW, that's all info I would have liked to see before ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v7.0.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

