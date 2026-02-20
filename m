Return-Path: <linux-gpio+bounces-31954-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMIGKoRGmGngEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31954-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:33:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 508201674E0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C03E8302DF6E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 11:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E40C331204;
	Fri, 20 Feb 2026 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDZkhtWH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C41330B04
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771587198; cv=none; b=svCQHCtcpFIzbiZs8oMkGtiHqTig5i7tmHlqqIrrRJ2dHizDXMMABOZmqYMHh8E7LxJ1eKV2s+1UpYHpaoq3RdoG/y9t1ntYa7wN9hwfWoA8Ehrx98yDwWc1yxjuIXA+I7nHeLsQb4DZ48M7T9itGjIDCrtePUfNsYGYU4pr/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771587198; c=relaxed/simple;
	bh=RMvAITejFrQByNG8OGkLYpPhIAJHs3b3Y0GVPaAKYeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWprIanb7cLxWZX96/3YC61JyKUJGX4ym60XQ+lMt3HshlDzGgMWGXjWwf37qt6PRAvjHBP/PpoIoLSOkMlyroaggWSCwgNjvYEgEYm3Dbk3E4kRJcdhQzNLxhCDOkrivybdNVStA3V06DlmMkSx5Riw1YvQbsM41ZHPGRoyA68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDZkhtWH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845E5C116D0
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771587198;
	bh=RMvAITejFrQByNG8OGkLYpPhIAJHs3b3Y0GVPaAKYeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WDZkhtWHTM3X2I5sjLziZALaSxVvdAubUUDiGye0qRHu9xhKMVKAhflfTg0nSf8Wg
	 bbb68SnClTD96fioPez5BAuDGRYOK+BceRJ6MfxrcFfnapd1nWxK8oht94DRFR26ni
	 PbDKNnNjWw5s/qUsKVLbUkZApqt1tNrc+TMaS6ufMV6VzBqUpTy5Gfems/6PtiJ4hL
	 Zj0kEw42+7Uo8BLfxnSt+tzJjb2WodcZN52XN6YlkSi6bYEdi7arM/dL5cfsf7gQIn
	 M66CrGVMvAF1voVDaz1Z9iUBqbMq8nkIeGjbSAPvfulxvkEegXCohzOUNL6vvUY9kL
	 3a/8g9Y0o0KOg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3870dec27f4so23507331fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 03:33:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQPIAM2yfu0k2h5mcr0dAiq0nrp35597t4rVK5YgGdv8595MtZ7StvUT1+4At/72kDSB3wpBQYf2u/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4+6A8olAlUYyrFjazYFYwXR+amN+hvdtLAUGfXonMiFqSyCSy
	bxyph5jh5D4AnQQnAYGmEGItuctQ6vZrj55ZHQZ8FjKYDrsDl2EdTQEeR6r7gRbbhpCFhgSLhwU
	szc/DkJe1XIC3iY70WrHOEhhorMNiZuP/kok2spwJjQ==
X-Received: by 2002:a05:651c:1991:b0:388:23e4:4705 with SMTP id
 38308e7fff4ca-388c8821fe9mr5998621fa.14.1771587197057; Fri, 20 Feb 2026
 03:33:17 -0800 (PST)
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
 <CAMuHMdXmMVgPJv=HhkfttiRnSwFC6c2PnFjYwmL2hu3ikv+t3g@mail.gmail.com>
 <CADvTj4r95E2rLA0ZhOYPeFYpFbj0EXfb=omCN2Mab-Dj4T-cYA@mail.gmail.com>
 <CAMuHMdXTg8w3R1BVq3JO2z=gvTdB=qXY=aXvC7Lb8FtkEqz9ow@mail.gmail.com>
 <CAD++jLmp+47f-Ah4YdFJ+9dU0OFrnQdOcVyrQ61p0-_P61eBrA@mail.gmail.com>
 <CAL_JsqJK7PwyB=NoM+uXOgQk-RT49h4emogvYAfUAbZUpnd6Vg@mail.gmail.com>
 <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com>
 <CADvTj4rd3jS5VAPK1wyC8wKqohZ4kAX4tAJ9CfnBk64+cqrMUw@mail.gmail.com>
 <CAL_JsqLyF71Jq2QuY9SL2RZ4OS5GAeZhVRbRfXngMjjHGob36Q@mail.gmail.com>
 <CADvTj4qt6ubU+9f-b8ZP5+=RPfTD9wZqOui-c08via6mHPy5yw@mail.gmail.com> <CAD++jL=b3RwgB9taGe1+o-u6kM3QMzmtcx8oenxDpfPmkbC3+w@mail.gmail.com>
In-Reply-To: <CAD++jL=b3RwgB9taGe1+o-u6kM3QMzmtcx8oenxDpfPmkbC3+w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 20 Feb 2026 12:33:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=MerdgjNjdVVDrbqug-3124zLUJEUi=baw-zA0HNb5mjdQ@mail.gmail.com>
X-Gm-Features: AaiRm50g0b04gVKPG5INa-NH4ssDGCOBiTJNzH6Hh_YijSAC-Wz2MSVqYvCmcik
Message-ID: <CAMRc=MerdgjNjdVVDrbqug-3124zLUJEUi=baw-zA0HNb5mjdQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Linus Walleij <linusw@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31954-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux-m68k.org,vger.kernel.org,ew.tq-group.com,bootlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 508201674E0
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 9:24=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Fri, Feb 20, 2026 at 5:57=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
>
> > Yeah, I did investigate adding gpio-line-names support to gpio-map,
> > but there was no clear way that I saw to actually implement it in the
> > kernel. Maybe there's some way I missed however.
>
> Check commit bd6f2fd5a1d52198468c5cdc3c2472362dff5aaa
> "of: Support parsing phandle argument lists through a nexus node"
>
> of_parse_phandle_with_args_map() in drivers/of/base.c is where
> the magic happens.
>
> This is called from drivers/gpio/gpiolib-of.c, in of_get_named_gpiod_flag=
s(),
> so as you see mapping doesn't really happen until you use it.
> There is no way we can assign the line name on the mapping
> path itself.
>
> What we would have to do is to add code to gpiolib-of.c to scan the
> whole device tree whenever a new gpiochip from a gpio-controller
> node is added and look for any "gpio-map" with phandles to the provider,
> and if that exist, index and parse gpio-line-names from the nexus
> node to override the default (if any) that is set for the gpio controller=
.
>
> Not impossible just a bit quirky.
>

Due to the fact that we are not allowed to investigate fw_devlinks
from driver code (as confirmed by Greg KH to me) I implemented this
kind of device-tree scanning in gpiolib-shared. It too checks phandles
in order to detect shared pins. Maybe it makes sense to factor it out
into a piece of common code and cover both use-cases.

Bart

