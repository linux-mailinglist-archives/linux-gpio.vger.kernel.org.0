Return-Path: <linux-gpio+bounces-31705-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDYzNjHfkmlvzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31705-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:11:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD93141DEB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBD6F30125FF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 09:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E99829A322;
	Mon, 16 Feb 2026 09:11:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5332989B7
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233061; cv=none; b=DGj+dLei4+56JFHjECoXHQOYqQVTLty6+x7gdUDrnGMpIzmh5eIrxX4znqhaQAR1SZj87tkHsTyKfYxsBonjn+ZtevTL8g4/jgSSVYJpmnejdUG1YxywP831DNxpJ3cW2tL3ofYwHwK5+PLXHJhQDC18RSg5chlRsNGLPycKagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233061; c=relaxed/simple;
	bh=Ahk89U9EfYRDVMHRBAIJvuJ2i5XHUYct3iLUAzphgLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQ4aIxEv/MbNPP0dyIzaw71u0l4HPA94lT+jFCMRUiZSKIDhDuVMYSW7TcbfzeA2wutBnMQuuk0bzRhmv1IlitTf08L4AvjbSzI5pts8RrHMO5mD+WvWc5rCL930VucoEejMQsK/ijC/YiUvu8KsmXHtf2ofgIitJnypjoBo8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56637565faaso2722835e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 01:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233060; x=1771837860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=60QQHHZFbfd+e38v4pt2DHtcmrviZg0lmyBGAykloWw=;
        b=lPXyTyuHGK0EDdGs8Avu79ARgwY0rgda98oBSOSK73byADxnMfliughMt2AP6d0VvD
         9EnSBWv0IIiQZs2R5B8CuCNdUaRx1NX6MixpxcJTFYadwX5y1m6Sz3SVpZmCTHtcIm8V
         MTHSdJFShkktUQGrDtJ7VmH/dJBq6wMbktVLVn0RcWj3bovKzxaT7H8J/hUEQvvNAOua
         cC39cLzlHRZkI5hYEsWsFJr4u+8R9l6aEc8xsGzez8Dy15tNDkk3wo8c5ddmgLiTm/bJ
         20ZM7BVpD29pVXzFzBX7Te+OMHtAHZIRscAwNuFLRWNabXUVv39kRcFhdpU2yKFG/Gp/
         XpeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuocHMLVmXpwQdM4cWPilXjB+iS674IWSdBFrsVMhkQggvAbGrdVFdw3tz3h76tLY7TTiZSh9hApUC@vger.kernel.org
X-Gm-Message-State: AOJu0YwFSODfuq4HMfRclxQDZvK/ZvGCSie2VjIsJSiWLnM+HK4S7Dmj
	pa8eGpchQ7fjMN7F++dx2Ugx7K89ttJGlnHNsCl4lQknSmhMcDp6juY+bzUlNvj9
X-Gm-Gg: AZuq6aKl88sOr6cMNAj6yr/avipvNafbFrExEHEXReGT+dCgZnUFJCbCJEIOpewlD+f
	h7VsXWbgbKLhRwyOKuCE+gt+nP0HSdrWCb9i4P13U5tf0xwyQKGugsnbT0ta28ea8rPIZ/exDE6
	lVzMyOdKSZDtgM1nf7Yvn9ieUOhGjqnJXDAsSl6MkHbgyRgmUroaEoPZAQNApW21y8tHHs8Kk5O
	Sv43P6b+CWR95ABD0KDhD2FaXwSzN8f4XYf7E5t9cecVPz8RvW02zHV10jQ0NdQ6O2fqzz4PuVy
	Fix56RhfN06qZYZ6+sGUpg257B+2ZYeO4YxkH5IHiJT1ia0Rb7QDiuIDU7WEVlmfwaHxHaiz4R+
	AkQUmZwoxLBGw35p+DzEq4X2LzOaimSBkuJnhzbIYPRRU6MV8wWALK4RiVJP8urV1l+dejtQ9Vu
	P9ryPEyzir+UIkv+leNlPCLwQph8I+xOI8pfEVxSq3QT19CKBUMS4M34W8p8JK
X-Received: by 2002:a05:6122:2a10:b0:55f:e6f5:4794 with SMTP id 71dfb90a1353d-5676a902e00mr3484095e0c.6.1771233059685;
        Mon, 16 Feb 2026 01:10:59 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56769ab0762sm5026212e0c.4.2026.02.16.01.10.59
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 01:10:59 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94a231b285dso1179320241.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 01:10:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8S9wkuA9BNLi8AqSL8H+GLmetfs+bMg/y0wZZAQz2GZv1sD3eS/RpMtIq6Ta2/cAQIZavl/YsIdGm@vger.kernel.org
X-Received: by 2002:a05:6102:3f15:b0:5fe:f14:e701 with SMTP id
 ada2fe7eead31-5fe1ae114c0mr3782052137.24.1771233058784; Mon, 16 Feb 2026
 01:10:58 -0800 (PST)
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
 <CAL_Jsq+Fb0vOggHWkNGusCBcwTQubD1Lc+0=U4+MpZacXqc_ag@mail.gmail.com> <CADvTj4rfgEjMNkjg-A0Jn=brO1SUBzQtL_+wra8RWdgBDVdU5w@mail.gmail.com>
In-Reply-To: <CADvTj4rfgEjMNkjg-A0Jn=brO1SUBzQtL_+wra8RWdgBDVdU5w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 10:10:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWb341BvvbT145bG5izBRezmvWP0hY5jHZsnJiEgLkc6w@mail.gmail.com>
X-Gm-Features: AaiRm53uKC3K7zyL1juGzj8ev3y3KxgFabjCrX4ds5DVREDYC94YS-Q9FOgQDlw
Message-ID: <CAMuHMdWb341BvvbT145bG5izBRezmvWP0hY5jHZsnJiEgLkc6w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31705-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DD93141DEB
X-Rspamd-Action: no action

Hi James,

On Fri, 13 Feb 2026 at 23:56, James Hilliard <james.hilliard1@gmail.com> wr=
ote:
> On Fri, Feb 13, 2026 at 7:34=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> > On Thu, Feb 12, 2026 at 3:22=E2=80=AFPM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > > In terms of userspace vs kernel drivers...the current situation
> > > for my hardware at the moment is that it's effectively a hybrid
> > > situation, some peripheral board components like eeproms and
> > > temperature sensors have proper kernel drivers, these would be
> > > on the i2c lines for the connectors. There's also uart lines as well
> > > for high speed communications and plug detection GPIOs, reset
> > > GPIOs and reset detect GPIOs on the connectors.
> >
> > All that should be in a connector driver IMO. For purposes of the
> > binding, I don't really care where you handle things. I do care if
> > where is influencing the binding design.
>
> Would a connector driver require moving all driver logic to
> the kernel? Or would it allow for hybrid architectures like mine
> where userspace retains significant control?

That is up to the driver.

BTW, if you connector uses only GPIOs, you can already use the GPIO aggrega=
tor:
1. Write DT bindings for your connector, with a real compatible value,
2. Add the real compatible value to gpio_aggregator_dt_ids[].

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

