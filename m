Return-Path: <linux-gpio+bounces-33223-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO/OOflzsmlbMwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33223-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:06:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090826E972
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EB5A3046A81
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B87E30B51A;
	Thu, 12 Mar 2026 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeOb9bJl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1AF2F6911
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302586; cv=pass; b=H4Tb8dynoQg7r94v/i729drgZ3fRYE4XdYA0YfvC+Cu8wGmpC5oOo4w1PXOFLbAFURphpkeOZovuyINDcF+K1mcEKIYFaFlTQ3wOKEyXgxQ3dODz3XxVfraNdTP5hu5I6+BUEBzEtPW1Ieri/zkcvdSIJNQ0EezwF/ThCx1ublA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302586; c=relaxed/simple;
	bh=cTzeAB37F6kJZZPNQk3PO+7uyQzPvuQGhnO4B+D7ZFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vk2L4F3wds0ZpXEMn+upoS64ibH6GBzx5Zc3XaLdyE4qIMqHFQ+L+D7er4auaMam9yxx0ZDYyhO0CwHdOEhcf56SWb5xFB4fkRIs60r4xAWjcaCJ/zUiQCnnVxIX+l5ARClzOfBvmBSw+UiSM7CW3IhhmESSxZtKtVZXIBGKcvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeOb9bJl; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so5648045e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 01:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773302583; cv=none;
        d=google.com; s=arc-20240605;
        b=IwFaBlhxUXfk0Kt+FFjNfpqn6xv/jPFvoEwG6QdrSacS5dxlkKjGLaoAsuRwY4qqqp
         U4T0g/xU/VP7oswH/V0zVniZ+oIYCVmguCdT09EGs6AF1/k8PqbRZ0iJqhrvL2ZctWKQ
         tQF5i97VFsib61bQHXaadhSfDnNRYh6ZCD5rQ52xWzYVzfNhK2DbwIaC9AhSoJa9wHDk
         EY6Xgfk+UeJOz0f4ffDGF4EAyTNdLm9l4I5YqyTUBc0DsEv2QHXyozfoyc55/KjLdAi6
         MjvH90ywYNI69mBbyhcBdPJ8aRUZXq0b4j4yCNmiHrVxYF9npz8QzjCNFhn4t9f3CLsb
         +c1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbjJ+SQCghaY61mjkEDxh0STs+H8xDE7U50HeqsZzCU=;
        fh=+4d2F6aGQMknft6mA6an7erOQyTPFzq2ezliMcKNQjc=;
        b=JET+TDc+xpbDsBgVhp0kTHDP8fvUpxE0mG6eEW4/UtBPRwQm9vPOYhuNlxT8Lx9i7s
         +bn9JmJ96hWqmD+Cww1PUFcMjgvLLAO73DBxpli3Ml19h71MKO8498jCiMupnnodGAo1
         sRtKgwYEY00Ci9dRn6hIp5o3nLFgVVtA9ceJqV3xaQxdB77FYkVuK1io6Wt9vjLgKoHV
         Y9NR8GB3Ydnhi3eEkppHnUxAN9f6pSM2Ar75a16ugRaPrfg0FQuABAjuSm02MAXXKgFc
         1M1suwyjoSPGM6yegT4Ps3oRL5QUrYbfnJYWOe7ihknfutdaY1zMvgGH3yJqbqVA93Pv
         st3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773302583; x=1773907383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbjJ+SQCghaY61mjkEDxh0STs+H8xDE7U50HeqsZzCU=;
        b=JeOb9bJl7R4Nw7fBOtqp42jO8+A23nm4z+KCV7CrJA1w8dvfd0sbGTtTtzUFCWxZ/j
         79zlX21vEln7wZpd4ukmmfdlYZ7Ql2m/M2PLyVo7cQammvkkP+WN3D/mJEsewzNZHaZm
         9ayg9+tBlT/6Wvvma/ey81v3MU0c0dlczjkxBCP4MNIMXKy5epu0wqj8NKkZf3B4FmEo
         xsvW8zgL+dP8JIkWaldZQpSKfC+1xKuq3f29lJymfwQmLJNsR6SIyTDLUArkHqLVSH+U
         T0TbW1OZ0Yl2mGYTISq/I6hN0aDxYUJxHUFUzqtqnlhDLoy7LBlxn3osgynLiIZgrh50
         wCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773302583; x=1773907383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BbjJ+SQCghaY61mjkEDxh0STs+H8xDE7U50HeqsZzCU=;
        b=u6x5BmIWkL3y1X3K/bMDOupIXVeOXiA9/fCD7vZR0/sz35BbkrOjKn9DP0IMtqwpKy
         o2FFGFjuWfp4xS1tJCxks1sgdejltwI5JWi/ruU5RKZ/L8ADvcYrG/taciZ9/YL+JUDc
         HVTBg6Kg5y1AQ+LZ4a8p7w0yTRkuA4+t4Q5tNeeXcnqevB5fiK9MrlAFvRPnCT3ISbFz
         fLyZGcPqiJdYj9Inkn6t7fVCjmU8fpl5rmGev94pWjCO8R/MOtNL6GNXgdmNymYFdRfm
         UpDuDNJj5NWoOZdHCXWXtKvj+U2Cy0OKk7GcvYrKQnKt398nnZUB8sfljKx/hqW9Gzds
         a1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatSQZcIrgwCNhrW9bgHJn6tSAp6JlbBoeZmMxpcBf6d8d1hGo3XfD91ReE9RndDkrHI5RQA9ma6fw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu4CsKmj8GzXX2FDEmP0B+MTRdeXeidP9GElkqJao5NLm6+o6j
	IjrUpMEbCqgmLbAI0lMSQ9IEI2GxfvabcQy88+7tb8si+LHfBW3EYAp+XpsCFWP23metrvuVCdR
	HXX5hz/RQzeWv9eDsNUjZa3QYHVNZylE=
X-Gm-Gg: ATEYQzy0uGf2gf2z0mnqIzJJWQMzL/4bKKyTArRFv7shOr+C8+/QTdgM6nPO+EorAAG
	AyBogqCj1ufWWco8DXjLk0NGTt3WaUjyxWWn+WlelWyH2DWMmr3i+PjdUFRYf1JSkX5sRzNyyrD
	l6odQfzXPcmtRwSKNA2VXo50Don7rBcgnWRprEazhxQHsHvPWs6Hwn8fiTtx9wh6T9nSuQ9RNbL
	Z9d7LXHqcSgaF34SYyHc9Ws0ENvbT6xB+WeOgH9QgsmscNDrhgn0/IcNIprjzWK05x8a1lpvmjd
	BtlYy3DH
X-Received: by 2002:a05:600c:3551:b0:485:3f1c:d8a4 with SMTP id
 5b1f17b1804b1-4854b0d6c1amr95772455e9.9.1773302582414; Thu, 12 Mar 2026
 01:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306133351.31589-1-clamor95@gmail.com> <20260306133351.31589-3-clamor95@gmail.com>
 <20260307-smiling-coyote-of-economy-317afe@quoll> <CAPVz0n2QXSFnrkLPFVDbUjNAkp2_dTumeXh4EsB11ca0jHEC-g@mail.gmail.com>
 <20260311221115.GA775894-robh@kernel.org>
In-Reply-To: <20260311221115.GA775894-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 12 Mar 2026 10:02:51 +0200
X-Gm-Features: AaiRm50s9En6lGf1tMoouVyxB599AhlUh5nfjiGhsXtzzsxYNq4Fz7mN4wRsVQQ
Message-ID: <CAPVz0n3pFzWUV7g_AcigRDSQJP4Hr6Ya=M_Zi+538XczR4ahtQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-binding: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33223-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6090826E972
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=87=D1=82, 12 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 00:11 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Mar 07, 2026 at 03:30:21PM +0200, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 7 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:48 K=
rzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Fri, Mar 06, 2026 at 03:33:47PM +0200, Svyatoslav Ryhel wrote:
> > > > Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC =
from
> > > > TXT to YAML format. This patch does not change any functionality; t=
he
> > > > bindings remain the same.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
> > > >  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 --------------=
----
> > > >  2 files changed, 97 insertions(+), 127 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim=
,max77620-pinctrl.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinct=
rl-max77620.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max776=
20-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-=
pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..7364a8bdd7d3
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinc=
trl.yaml
> > > > @@ -0,0 +1,97 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.=
yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Pinmux controller function for Maxim MAX77620 Power managem=
ent IC
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description:
> > > > +  Device has 8 GPIO pins which can be configured as GPIO as well a=
s the
> > > > +  special IO functions.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/pinctrl/pincfg-node.yaml
> > > > +  - $ref: /schemas/pinctrl/pinmux-node.yaml
> > > > +
> > > > +patternProperties:
> > > > +  "^(pin_gpio|gpio)[0-7_]+$":
> > >
> > > Underscores are not allowed in general, so pattern needs fixes. Does
> > > anything actually rely on this name? Is this ABI? I don't see old
> > > binding and driver using the name, thus this should be just ^pin-[0-7=
]$
> > > (+ is also not correct if you have max 8 gpios)
> > >
> >
> > Old txt schema uses pin_gpio[0-7] hence it is here, but greping trees
> > did not reveal use of pin_gpio so it may be dropped.
> >
> > No this is not ABI, name may be any. Including gpio0-1-2-3, gpio2-4
> > etc which is why + is there. or maybe you know better way to cover
> > those names?
> >
> > There are device trees which use gpio5_6 with the underscore
> > (tegra210-smaug.dts; tegra210-p2894.dtsi for example). Should the
> > schema account for those?
>
> Defining a specific pattern looks like an endorsement of the name. I
> would just do the minimum you need. Something like '^(pin|gpio).' unless
> you have a pinctrl-* property.
>

It does fit nicely. Thank you!

> Rob

