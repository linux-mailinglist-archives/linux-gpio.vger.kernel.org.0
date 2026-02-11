Return-Path: <linux-gpio+bounces-31597-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Jj8DQdRjGmukgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31597-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:51:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C302F122F99
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53804303C4E3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3236736655A;
	Wed, 11 Feb 2026 09:50:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B6635EDB7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803436; cv=none; b=EtWWEIUWpglwwL1jbs9FKiZ0pnffC4gVeFE43S+Q0uKSsBXYUwYqNLF8Vqxpe3zgGqrJpbkdh55oBmZKgWNLBNgw1Ix/YWpuzj85f6F9fsReSRWokbvyJ9xwTu9lx5fs3nv39kQhcjKdHtSp/qZC02sKt+MK1NLjlBf21jcvRVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803436; c=relaxed/simple;
	bh=VtrpV+5E2MYP2bSs7xhjfdUpfePxvZw2l3jpzf7ER7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQypNUrtQHKfoblEOcUEgA80RgISDt9sbKi38gVP0b2eeE69e4dlIwl9eGR2Q5gQdLEPoeHhGpwByZ6nvD22sryoqfa2Ta8Cd5O1S5CDHx0HglVHLadSimTLgETDO7chAEK1tOJl0+amtTo03YDCO8/UNI1dKOHQ76wLhyQAjSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56706fd623fso1459692e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 01:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803434; x=1771408234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BMZYeGG7ZG/yKFwxj0StAxiw1b41IOFw6Lfjb8iE8V8=;
        b=lMxOMLkzsNGZh4LqjQ+nESocRX2vqrbytPsaQxdOgtdHIPxPOohq6ncS5u96P+e+KU
         sV6Oti7sjOYMN+OBmEXQn0ttP3oPZz3l1NV2aHyn/pweUq9fTX/+F1QJtTGkjBMKzDLD
         dCBa8cO9QHhbisHy04C7vJK7evBze7O8rA0C6P7LODhwuIw3lCiBI91oIoZOoCCEq5xt
         TV+wIU2XVVnX9/dNoHtjIBnVt3bEJLUSSkgPNeeihf6iC06kLspvS2+K6J2NQAKUuJQ7
         GdZJf6mafZ3+Tryc1uiEDMm8hvYTLJ378hgo4UKM9z9X2eJ++R55G18rDMZt0SrWs0TB
         RG2w==
X-Forwarded-Encrypted: i=1; AJvYcCXA9rlQEQseSzKTn2AOHaWOc78RMUaTIPhqEht8+/Xqu09Kt06V3D+S5qMgoyJh61rH7ZkiAr1VM8yZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxcKuyS5xT1d+KuBYIpimvsJ9louKoVqD1GufztFG4wIrZ7/4z5
	tVMks88b7OFGXcrrLuyzMZ7ASsUXa4NqwEFCSzhChPykkZtyt23+l8LaE1WeeByz584=
X-Gm-Gg: AZuq6aIDFrLB8y0ylqPp7mSdW5PZg4QRRWl2y9jgiUW5E6SNMqWXfloz7fC+C6b+Tse
	i7idtGqtHuobimyza/kIkWRRe6iq/VpUZe+q3kiTZzUC00WbK7lgwyqlftk5ZYxkxULKQpM7XzO
	c8Coug/fk1zHvSDCDvzk83QUZIFirO3/2fsfCWTZKmIDDpkRz2bL6H60Jmwv1DVF4mJ1R7hOnh4
	vUbYRAL+af3FfVLW4TV77iER4O8em3izxRPAmk0m292SYI4rLf4CxuA4/OhmJbF2+2wSVSRyJ07
	SfK3uilwtgRxK0JvKuUijEuPch4kyco4kEUJScWEZyUxShPpP9cY3QuZ2HkF+KV70VQ2Z6gZ+vP
	Sgz5EZdY5bFMeoQ7OBCrSjpqCOepPCZtYNv1j+xwPeVgjz6YiT9wfLeSTQzLwRmANc8t+y6eHO5
	yMAazOSSMQJdyrH5b6NVZJo63i8lmqhH86ABzCj6TqqHSPlxOxXi0zcXskpf1i
X-Received: by 2002:a05:6123:a7:b0:566:3c6d:b5a3 with SMTP id 71dfb90a1353d-56749ef7d90mr522656e0c.21.1770803433871;
        Wed, 11 Feb 2026 01:50:33 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674c24aed4sm435979e0c.19.2026.02.11.01.50.32
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 01:50:33 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-948a378b9deso1224538241.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 01:50:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNtpEgoazZm8MCTPfE6dRNbwbSPtGdAzk+BK8FdWANLHq12zxAfgrb9NNN721FHnqGd8pJRMSliaI5@vger.kernel.org
X-Received: by 2002:a05:6102:2ad3:b0:5f8:e3a9:4135 with SMTP id
 ada2fe7eead31-5fde41e3eafmr606108137.11.1770803432517; Wed, 11 Feb 2026
 01:50:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com> <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
In-Reply-To: <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Feb 2026 10:50:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS-ZaL1nLS=C=hjBVJeVtgNYX-XgWf-8Oy4cGt6OMGDg@mail.gmail.com>
X-Gm-Features: AZwV_Qh4Ali32MTB40vjxThNcq8cyjeQWEBbHXHrLxcpziNvcXJ0ME6copCcDgU
Message-ID: <CAMuHMdWS-ZaL1nLS=C=hjBVJeVtgNYX-XgWf-8Oy4cGt6OMGDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,ew.tq-group.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31597-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C302F122F99
X-Rspamd-Action: no action

Hi Bartosz,

On Wed, 11 Feb 2026 at 10:47, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Wed, Feb 11, 2026 at 9:14=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > Add an OF match entry for "gpio-aggregator" to support plain GPIO
> > forwarding from devicetree without delay semantics.
> >
> > This allows exposing selected lines as a logical GPIO controller with
> > stable aggregated offsets, so consumers can reference forwarded lines
> > instead of physical controller offsets. It also allows creating bundled
> > groups of named lines that can be exposed to userspace as a convenient
> > virtual gpiochip interface. Using "gpio-delay" for this case is not
> > suitable because it enables delay features and requires 3-cell GPIO
> > specifiers.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -1635,6 +1635,9 @@ static int gpio_aggregator_probe(struct platform_=
device *pdev)
> >  }
> >
> >  static const struct of_device_id gpio_aggregator_dt_ids[] =3D {
> > +       {
> > +               .compatible =3D "gpio-aggregator",
> > +       },
> >         {
> >                 .compatible =3D "gpio-delay",
> >                 .data =3D (void *)FWD_FEATURE_DELAY,
> > --
> > 2.43.0
> >
>
> Regardless of the DT bindings - this change is perfectly fine. We do
> that for other "virtual" devices like gpio-sim, gpio-virtuser, etc. I
> would just ask you to document it under
> Documentation/admin-guide/gpio/gpio-aggregator.rst.

This is not a pure virtual device, but for use with actual hardware.

Nacked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

