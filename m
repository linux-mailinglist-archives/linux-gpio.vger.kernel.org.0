Return-Path: <linux-gpio+bounces-38009-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +8NCJzOeImovbAEAu9opvQ
	(envelope-from <linux-gpio+bounces-38009-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 12:00:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2AF647210
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 12:00:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38009-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38009-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23AC03022A91
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 09:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343753DA7F6;
	Fri,  5 Jun 2026 09:54:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8273B71AB
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 09:54:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653269; cv=none; b=Jl+7TJ4gti3MNKE/YySRI0be/pAarn8YkFBx+RRSL9MhbNs2oIUi7+iicKimU+pchPSwMqTlD1oVXvQ7xwhs5/XGrgG9yqiTAlcjvQUmAIgv+uXNyTyjWP1fADqYXF84WN+r3rjnNTabUBba9gfB7PEN3aubrxQS19+lxGl+lPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653269; c=relaxed/simple;
	bh=XegPlP0QUg8N4ZbYcx0a/twqRUS5iUtjIM8XQ1lg9EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8V5c3M7pbY4bShs/MAzbl8f+NTOv296sGA+1mKu3qbaFt5g1IgD6+PKvc/tNJVwsAqWadWDXYC0ZvcQsACzExFxbG1oOdYLYNw1jkaKoGK1qMIbpp+tvHhUfk4gwZ/l7fMRZZzZ0ECMb8HdMIy/CQTkgFGfpF0KZctU8DZy4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8cceaa6f75bso26121276d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2026 02:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780653267; x=1781258067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frpOI/birEQQyfTPmqA3egHq/XurZUvg89/zJvb+Gi8=;
        b=LmUK6csJzAhSclFVbQBIZxEuAOjyXjHQlwsc8LkAPp6tIjs6KEM91n+n68w+0ESV6C
         AGNV7QuYsFePuhsZ5/JCBf5R8YayePJH+ZujR2cqGBPVQ12bdG5Sr8WPfxPnUOu9bZ3Z
         emK94AaQ2xSQMVVMP/QF/VS5fqGhx5qLCKfTwEKhbv8kZlL9OnqR1YHyln9SlbZX4sjC
         FXf3ukBPWx499tWFZSxvB+ObCIZuUh++FdbCZG64xxGTeGRhstU7o1kMQsFT4QJKcbhl
         0i1EyyC95wmIdbOI/bjfgbJpmwxPV5ESiZGrS18QEXqvxDgsyCGCF54aC6q0HrrzJBKq
         dXug==
X-Forwarded-Encrypted: i=1; AFNElJ9aFkp1Ml1kFQFtglVRPgptBIYe0C1p6nfuAognbl7sffrBqkVAOtSQ6Z48x8GIanUJ7VSiJdw4SQ4e@vger.kernel.org
X-Gm-Message-State: AOJu0YyvO6Jc4Ic/BaLZh26+ZHAlBa32hqnKwDoVwEqvt9K+14DqX+3H
	oiE/enARHLTCI4cy0yvEt3MZKRBDKr6b4vs7I8p+KW/377y9GtJJPEO3ROR2wTyi
X-Gm-Gg: Acq92OHGYnwDrEjBSAqSxVTKfQlayYIh+M6eLcGT9/oDUnA5/2T8R4/eaz6s+UC0rNR
	+QSylfoQhakFNAnMrAx5KCndnaeEWcAWopUwHLncXsqaDVDx7ooXyeFsVAFfzP4O4Om7u1szg3o
	piLRtyEkiySDjg1wcru7xpxuru/TFVJdqPUj8OSqF7+yQqsiiKAVW4JDYPYJMmph7OZmvi5c41e
	iTvQn1V30U7XIV3KBdaUc+DHyQaJyz5hV0hWt52UTPCKa7puoQP591qz15tLNVgaob980sMPOR+
	hpoGyEfYqb6u7wmWq9TuFOejtkYyWw9nRm5gmgFcw8JesWrF0j5SHfbmGwklL0kwbNvM6OWZIL7
	ycvQHf3i6Uxo2sHv6j2DldRUVHfdXyDt3NC5lG6VOHsxNlUxjw6LWE8A5Ycr+V4TXviAvssjCnF
	XyoiAVCKpvhdGdAubXHL6FeR3+Z8NlG+ksPNNczqpI/BeVzbVaXsb4YyVLizp+Y0/VzuKFEjghN
	pc=
X-Received: by 2002:ad4:54c1:0:b0:8ce:a67a:6d13 with SMTP id 6a1803df08f44-8cee5fca345mr36326126d6.16.1780653266755;
        Fri, 05 Jun 2026 02:54:26 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb93d8sm79170316d6.16.2026.06.05.02.54.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 02:54:26 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-91591f19c30so276322585a.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2026 02:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/CTF9CBg/YJ+Z3+YL7pabjjwwhFlFK/e07CQmF6mVnff3vqQoLTevUyrfA3bzjil7R52FGU8hqqJp1@vger.kernel.org
X-Received: by 2002:a05:6102:5094:b0:631:26f6:701a with SMTP id
 ada2fe7eead31-6ff156acf6fmr1089364137.29.1780652873088; Fri, 05 Jun 2026
 02:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
 <20260603151642.4075678-2-claudiu.beznea@kernel.org> <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
 <TY3PR01MB11346903E1B762B66EDB8CB8486102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346903E1B762B66EDB8CB8486102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 11:47:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5SE7KsiWsp+6eFpO2R_pA6k4+sjAQcOQFC+pgOY9chA@mail.gmail.com>
X-Gm-Features: AVVi8Cd8crXCTmvuTR9VXD3Qx0xyM45BlA1nZ2BpfmDiwjntvYP3B16PpfLU8T8
Message-ID: <CAMuHMdV5SE7KsiWsp+6eFpO2R_pA6k4+sjAQcOQFC+pgOY9chA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave()
 on power source update
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea@kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "linusw@kernel.org" <linusw@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38009-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA2AF647210

Hi Biju,

On Thu, 4 Jun 2026 at 12:58, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 04 June 2026 10:49
> > Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update
> >
> > On Wed, 3 Jun 2026 at 17:17, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > > The rest of the driver uses
> > > raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() for locking. To
> > > avoid concurrency issues or deadlocks, use raw_spinlock_irqsave() via
> > > the scoped_guard() helper for power source updates as well.
>
> Just a question, will rzg2l_set_power_source() called from IRQ context?
>
> This driver does not have IRQ. If any consumer calls rzg2l_set_power_source()
> in IRQ contest?
>
> Have we seen any such dead locks/concurrency issue during any testing?

All pin control drivers use the irqsave variants.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

