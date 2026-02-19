Return-Path: <linux-gpio+bounces-31922-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJHOORaWl2nO1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31922-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:00:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE6163719
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E268D3003D2D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5414A331203;
	Thu, 19 Feb 2026 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tfr3Z2An"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1775532572C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771542035; cv=none; b=CadoCWJqmjEjPbgVr8L9V9Esc08jjQFgkbSMxbmEbHXnIFOhZcekf/tR97CvyqapdUeSVD1xqVidAF0KqL9gY5AA3kefFh7NkObI8sOWwZNoBR6uRV7OL4ZvpZuCOjRgQtnpldLbehCSX5EG68wpfaZ5+/IcuQS/VG1ZitKaFxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771542035; c=relaxed/simple;
	bh=wNpwNbTyIWhd9eU2+bxlznRmCZxw9i+NrbbKJbICYwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YM0Ah/RkW36TuTeJnHds6bG9z198tX2bcaFY7TtmzcWox1FOgbKJpSGcBHJKgCNRbdwBUW4Kztx1q3PAiCgGEEhyTaDxE/wnM0aV0RpWYlRUUgaiwm6vHrmdtaCesYPlQJvXKjtoav4zASzSTj805oY7s4ZeEtJONLHGfUqIg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tfr3Z2An; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3742C4CEF7
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771542034;
	bh=wNpwNbTyIWhd9eU2+bxlznRmCZxw9i+NrbbKJbICYwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tfr3Z2Ansd+UIlG6tirbGgDPNQ1mfZvkuqi1nu9ZQtwnbullxalzHmpNmKROLBBJQ
	 KoUEmcsPSLIpYo2DOtv50EA0gQbwm+g4rIWxGepYWwnoebeZCTXL0e2eSBe2nlZRtd
	 YcBioOSUSK7iHAbxRfRuRRi1DVgzX0GsdKL2LOA/La5qPnZ/zvzdY/gDX6rXe66x7j
	 mTftqfwTu7pAfu1a0PWLf+Q99UZ20uZ77xKCeT2ydOOd/UHbj8BNjwUZWDJG/j6cC3
	 bkGDnjeeibeNOUGs1Iplz4m9m3Iur4BZxlAF4+YTGnzp84oXininfcxjwpz/dixjmR
	 pXGD/dYASiCFw==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad9fabd08so1437597d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 15:00:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1TzwVlIWL1X/sjjYR23pyWeWV/R/+R5gJVaGXu3BZA0GK+o2fXonV/qEQdA6BT11a9POQUy86WD9C@vger.kernel.org
X-Gm-Message-State: AOJu0YzesT4lHmNVi4G+AaSnrZimR4G5AxauTZX13J06HDgK3d/WctKL
	sr/yol1sPAYrEbuKAduuLjNxYl+0p/G6VyRnugcvKYz37SLdo+yL4TpiupnCIYruInH2SPi36iH
	lhkbobyczZMtF2Pkt2J6/gd+N5oY6RWY=
X-Received: by 2002:a05:690e:24c2:b0:644:45a9:c0d7 with SMTP id
 956f58d0204a3-64c14d3a0bbmr15574892d50.55.1771542034219; Thu, 19 Feb 2026
 15:00:34 -0800 (PST)
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
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 00:00:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLkZ++UoA-+1fUSgF1os0e-ND0dEADYM6OsFxCLQb65ygQ@mail.gmail.com>
X-Gm-Features: AaiRm50M8dba4yDKF6coceZSNb-z_w_JPzOOwUDg7Uh3dgxbmiSnV8ogKXsnD8Y
Message-ID: <CAD++jLkZ++UoA-+1fUSgF1os0e-ND0dEADYM6OsFxCLQb65ygQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31922-lists,linux-gpio=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87BE6163719
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 11:29=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:

> From my testing, gpio-map does not allow renaming lines.

Right, so that is something the aggregator will actually do since it
creates a whole new GPIO chip.

That feels iffy though because aggregator is really heavyweight and was nev=
er
used for this purpose (it's more of a GPIO counterpart to a hierarchical
interrupt chip) and the gpio/interrupt-map nexus is really lightweight.

Yours,
Linus Walleij

