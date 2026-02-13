Return-Path: <linux-gpio+bounces-31653-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDjGMObfjmluFgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31653-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:25:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C537133FD0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA31E301D4C5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74A532548D;
	Fri, 13 Feb 2026 08:25:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101363246F3
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971105; cv=none; b=qSoJFHbRoXpUtWfSmcJG0CBCRtHkFSeKs/kfaf1TiYdE4pr/oLSAzIR/nYNcflw4Zp5x/+1MpQt2BsmzuW/9k7+yn1Se1DT7REV3zbRu4hC4qJHn6VXynDGzcaw0jLBjT5Q701VtLuHyE1nM9WZPgVNvO4SN8ke+zIfMeFGHFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971105; c=relaxed/simple;
	bh=mVhhZ2s7kYJsSiv0eIBW+57cX6b0j781fbzS5qZx6XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThKbTmf38fxCna0VrgCLjqZnVNa4nmBvTxuhNL/q/nN+SOzQQcrjkCWGHcukS7soiqdLgBtcct9JMIH2KHg4DS579g2+ztMYvUXebN5ZLGoFZvBmIQxPgAUxuRljau5QgGreB+ytpQYj8rphHsSKq7hfP+Lib8AS9EaztSbdqaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso408300241.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 00:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770971103; x=1771575903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kTjtkfSYQOjDBBpn/jYinopU/8qU/hKdS39gFwz0kg=;
        b=lgJRMFuUNKFZrmb1LmTMtMVKR05UNOAc3aa0I8rj5inIWqdORTGi2YMDERr1AkBWYZ
         0LuHm6bcCMoKyqLqBOQgn1mjq812j8ZezQBTYbK/cFP9Nga0r7jRSqQx/g/54IzOP2Pg
         p6aQarENzZY/8WTFMmNW3OUvb5cu/XNMrOIcW8MM8qinXL7YOWGg8lCVTxRsRmmfY64U
         KqrC9VMgw4NTPewtug/bFBuN/Dbc1xoU9AVQFw42xF8BRD271JX8NyTTDYr/80iZGHrQ
         eFyzNWInCFicNW8lAEiJo9hmRe2Vr6WZKl/44u+WzKFYJHJRzDuPKTDmJYs2CFR96FWZ
         xw5w==
X-Forwarded-Encrypted: i=1; AJvYcCVGzVmav+0NzfWxSDBFI9XrAg5b7zrqt3hV+5RrPDjKD5LT4ZOyB++pYtq8EyesVe4KXF1nOu3wpI0W@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJnTXFx75xYheHtIlQTVN92wJbocQQLnIBq+viftG9VD2a+Sh
	AqJSESlyid2j+KmpwFfsMQVwikq8LHAjusGpUiV8KeTRlrm7BuC5pya2eH5iNXsK
X-Gm-Gg: AZuq6aJfKKIj7AyrjdWAVfMei5ASvj7kSNgrREfiF7szSN6mrM+4DP6ue2M+9ATixfs
	W5n4w9pfnAVteMUD1QQY48BS4CD1P8iwNWaofBPQ6WYOc2ODOeJmaIMc3hM8f+YhZ5yVV0jMfg3
	jZkhZCv5hYELB2gxKEmYJqSiBILd38GAMxUtoMar29X8mtStaZDvoJz9HSV2z3rBoYbyqwknTq8
	XqtfKVZzUwQ9DAib57XZzIbheGevvi0ANjyC1cXI4H1bfmlGYU96D5Bj0LpjSO0wUqNFs/oIRfp
	yKznZS6E3mm9D+i7MACHDOMuxeV0XdxIFYM1J68d6s4e1tTlJHVzuxmNIYj5lcPGdeu92YalW/u
	97Hlvj5Jm1YV3lAQ8WKWpzAUQrOBm1/lKkTmnaMMCK7J2jEyAbrpgWiWArXofiRv+Gy+iPiVZYt
	WMLU53FziWZAS78jXoLgPdY2NaEancr8ZNOUYq8yJpvoTO3DcwK+EzRpnCX0VM
X-Received: by 2002:a05:6102:32c5:b0:5f5:48df:b85a with SMTP id ada2fe7eead31-5fe1afb5a6dmr315229137.40.1770971103014;
        Fri, 13 Feb 2026 00:25:03 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde8a845ddsm3057684137.10.2026.02.13.00.25.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 00:25:02 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso408287241.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 00:25:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUq52zDPBIeB8DH53I14mdspuaQ0n0KTLtscNNHXfreXRBBIRL4tnygj6M4Um1nfOL8Q444y2kuhFPr@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:5fd:a537:a777 with SMTP id
 ada2fe7eead31-5fe1acd55a1mr304471137.10.1770971101799; Fri, 13 Feb 2026
 00:25:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
 <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org> <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
 <20260212195423.GA787785-robh@kernel.org> <CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
In-Reply-To: <CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Feb 2026 09:24:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmMVgPJv=HhkfttiRnSwFC6c2PnFjYwmL2hu3ikv+t3g@mail.gmail.com>
X-Gm-Features: AZwV_Qjoxr9Az1zq4BpOrNfOl9VLUp7v3Npa9ywvF4dfcw-40OWhLtOEdmQ9eKI
Message-ID: <CAMuHMdXmMVgPJv=HhkfttiRnSwFC6c2PnFjYwmL2hu3ikv+t3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31653-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6C537133FD0
X-Rspamd-Action: no action

Hi James,

On Thu, 12 Feb 2026 at 22:22, James Hilliard <james.hilliard1@gmail.com> wr=
ote:
> On Thu, Feb 12, 2026 at 12:54=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> > Humm, peripheral boards! So there's a connector. You need a connector
> > binding. And the one solved binding for such a thing is GPIO! The
> > gpio-map property lets you remap GPIOs from one provider (the connector=
)
> > to a parent provider (soc_gpio). It would look something like this:
>
> Well...some GPIOs are wired to peripheral board connectors...but
> some are wired to things like built in LEDs and a few different
> on-controller components as well which vary by controller hardware
> revisions.

Different controller hardware revisions with different wiring mean
different DTS/DTB files anyway, right?

> This gpio-map feature doesn't exist in the mainline kernel does it?

Yes it is.

> In my device everything I'm wanting to name is off the same gpiochip.

That would depend on the SoC: some SoCs have a single bank,
others have multiple banks. The more generic is supported, the better.

> > conn_gpio: connector {
> >         #gpio-cells =3D <1>;
> >         gpio-map =3D <0 &soc_gpio 3>,
> >                    <1 &soc_gpio 123>;
> >         gpio-line-names =3D "GPIO0", "GPIO1";
> >
> >         /* in an overlay */
> >         device {
> >                 foo-gpios =3D <&conn_gpio 1>; /* soc_gpio 123 */
> > };
>
> I think in my case the entire connector would be in the overlay, as
> the connector GPIO lines vary by control board hardware revisions.
> Would that still work?

Why in the overlay? If the controller hardware differs in wiring,
it needs a different DTS/DTB.

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

