Return-Path: <linux-gpio+bounces-31925-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCb7CACZl2mt2AIAu9opvQ
	(envelope-from <linux-gpio+bounces-31925-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:13:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3391637A2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEB213007B31
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A089A330330;
	Thu, 19 Feb 2026 23:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H08y+koZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631213254A9
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771542776; cv=none; b=Y4bDTVQUcr++6zL6+UN+Iqgc7Jnc6XpyIJZq5EXDfGxl5NZolq8v47MPVzE9Ay8Viy0Xk3jpn25OtzrQ4IabEipo5sE0+Bjg1IDVZcbMNHPKO1w9oG7VBVclYw40wBEuQoRiFp+wUERwzrSDFvz6Kg+18zoe2EbCK7NPwnXRAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771542776; c=relaxed/simple;
	bh=kiyOKsBdhHxvNscPoSY8T/cgZkx29rLsRcdXI0MH4xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZ8A3T1cPBkaphO4DDA70cjC7i0aEqVwOkZpALcTnokOtufbygqyccPGpx5KKCF5+C/2EH24Ju1X3d1hqWBrwxUIEIXGWY5wdHBzGIrwyYGow2AZ5hV9TXTpLHXs0F9iEzixV1/zW+QXQoqtYULPLrB0Wyi3qShSmDFjtb2+P4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H08y+koZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BB1C2BCB0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771542776;
	bh=kiyOKsBdhHxvNscPoSY8T/cgZkx29rLsRcdXI0MH4xw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H08y+koZqPE/oWRqldF3U+hMSVc+9/5d5FzSNpWG6e4dkQeEAZrfGUaZppUhwUXtc
	 OgGY5pufDQ5WEvqb7tmEPJoVjIuDGv6J1YjIqw7BRkE0zUX4gNkkjGrz5FAvC98e5I
	 FRuJHviLWqjXq3fW7MjzbMutJUsJgP6R2X61NdHsBObRCPXqnYrrw7cPmV51Ifr0km
	 UMTJZJOgBRBQ5lXwiJtLAVGF5nbPSYCzj2iLKwzIic4+27xDuNGvRoncM7BffqLGKj
	 7XejOJXs7Xd06dWZmPor7mo3afhbOiYHnk/ZY14aY2BQ8IZaSRjpcrMDiOVRjluz/k
	 chI5/w2mFYU8Q==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8876d1a39bso202322066b.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 15:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWrTlvsGotu6W2i+O54ICMCuLIlPr6LlClchFkK1TjjlhbTc2iAZLtoB32mXMCR8lBtqd7Pj4YXOMH@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpdRFpA7667mgAO3x5DYi2jw9yATBVWYa8ATJWAwBNmSEXEU2
	B543rnzsxwBNJRQaPz3cA5gIIKOT4DN4Hz2qwc/MCzXthsvN60bnlAo2waNokpr7yiizijFTRWC
	CiKY1ZMdS3/zhb2sr602+df/2fjF85w==
X-Received: by 2002:a17:906:6a22:b0:b8f:9237:4933 with SMTP id
 a640c23a62f3a-b8fc3d3f906mr1050119966b.64.1771542774595; Thu, 19 Feb 2026
 15:12:54 -0800 (PST)
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
 <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com> <CADvTj4rd3jS5VAPK1wyC8wKqohZ4kAX4tAJ9CfnBk64+cqrMUw@mail.gmail.com>
In-Reply-To: <CADvTj4rd3jS5VAPK1wyC8wKqohZ4kAX4tAJ9CfnBk64+cqrMUw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 19 Feb 2026 17:12:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLyF71Jq2QuY9SL2RZ4OS5GAeZhVRbRfXngMjjHGob36Q@mail.gmail.com>
X-Gm-Features: AaiRm504_5I4UEQmqol5McuJrmASfEnl7ATfFfsWZ4cdgY921TZAhPh2W_LJIxc
Message-ID: <CAL_JsqLyF71Jq2QuY9SL2RZ4OS5GAeZhVRbRfXngMjjHGob36Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31925-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E3391637A2
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:29=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Thu, Feb 19, 2026 at 3:14=E2=80=AFPM Linus Walleij <linusw@kernel.org>=
 wrote:
> >
> > On Thu, Feb 19, 2026 at 7:29=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > > On Thu, Feb 19, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kernel=
.org> wrote:
> >
> > > > And as such it would be pretty half-baked wouldn't it...
> > > >
> > > > Probably Geert's suggestion to use the aggregator is a better
> > > > idea.
> > >
> > > I don't know what that is to comment. (Please don't reply with "you
> > > reviewed it" unless it was more recent than last week. :) )
> >
> > I only think it's half-baked if IRQs don't work and you say they
> > do with the right interrupt-map so that's all fine.
> >
> > I'd say James have a go at gpio-map + interrupt-map for external
> > connectors and see how that works.
>
> From my testing, gpio-map does not allow renaming lines.

I'm pretty sure I said that already. There's no reason we can't
support gpio-line-names alongside a gpio-map property. Whether the
kernel supports that or not is not my problem (as DT maintainer).

Rob

