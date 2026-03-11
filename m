Return-Path: <linux-gpio+bounces-33207-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD4wJtDosWmcGwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33207-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 23:12:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC526AD06
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 23:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 198963058E2C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71AD282F29;
	Wed, 11 Mar 2026 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t88SZAwC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB6E378D74;
	Wed, 11 Mar 2026 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773267077; cv=none; b=V3+IBEeHq79t6BaE6eMtaq1e8Ov51cSEf/7Q8mbPbvtN3Bt26p8qnpGnHKnD1zNTww6ypwFEaaS1oU5UnsVO/sJjaXQ4mEr9CpN4blPCGOSa1zgFZirBHZsvidKvYFQaI5DeL/XWBJn6/+eZSDVwWknt/zbQiu7m2WcB+lrVWGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773267077; c=relaxed/simple;
	bh=khlI1DVyLEdkGQTJL55L84uDojA4mCd8tZUSWPV72Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrcTjMKIc1mBdDbEb1U1kvV5lvpP6JUQMPFJNtyHTOVZHH3bNPE/UajgvovuivJd0elM3P+UiOcViWVMLlFogRTJWga2y9Kz+HHJr+XxSiXBeVO3BWolMujgfRGJqa0QL3Y23etDbu25uWeLL/J1CFhXAZ3iHhsxEWLh9//06GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t88SZAwC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0C0C4CEF7;
	Wed, 11 Mar 2026 22:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773267076;
	bh=khlI1DVyLEdkGQTJL55L84uDojA4mCd8tZUSWPV72Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t88SZAwCQTdLx7TVG9wnCq2c0qzcjkLnjKP6bQiTn8teXv7+/3ZX34lqOVPp3AGn9
	 sA8Nj7NwCitdaiO7m+i2UWk3AOtldBQt6kyDkBK8AhrFsMAV9jtBmRRuNJtFJImsgd
	 UJZ3HuWpjKZpnx3mD9MoJ6oQyYOjwu9mpZQ7AnhmJYBdsypLwDH4MfS6n4LKmzquLp
	 Wfb2lFY3cfEcFAR90wHwTI+fBjB0Byyp4bWmAhdm6gDopKFnn5mTocApEhxrfH0fbL
	 nUZRYtr4LSLNR6fJdFWoAWe0n6uoQ/mSsTTdoqDA+6iqJDuHvB8JiLYYQrLjwQ/05B
	 GGtgZS54UoneA==
Date: Wed, 11 Mar 2026 17:11:15 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-binding: pinctrl: pinctrl-max77620: convert to
 DT schema
Message-ID: <20260311221115.GA775894-robh@kernel.org>
References: <20260306133351.31589-1-clamor95@gmail.com>
 <20260306133351.31589-3-clamor95@gmail.com>
 <20260307-smiling-coyote-of-economy-317afe@quoll>
 <CAPVz0n2QXSFnrkLPFVDbUjNAkp2_dTumeXh4EsB11ca0jHEC-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2QXSFnrkLPFVDbUjNAkp2_dTumeXh4EsB11ca0jHEC-g@mail.gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33207-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41AC526AD06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 07, 2026 at 03:30:21PM +0200, Svyatoslav Ryhel wrote:
> сб, 7 бер. 2026 р. о 14:48 Krzysztof Kozlowski <krzk@kernel.org> пише:
> >
> > On Fri, Mar 06, 2026 at 03:33:47PM +0200, Svyatoslav Ryhel wrote:
> > > Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> > > TXT to YAML format. This patch does not change any functionality; the
> > > bindings remain the same.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
> > >  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ------------------
> > >  2 files changed, 97 insertions(+), 127 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
> > > new file mode 100644
> > > index 000000000000..7364a8bdd7d3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
> > > @@ -0,0 +1,97 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Pinmux controller function for Maxim MAX77620 Power management IC
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +description:
> > > +  Device has 8 GPIO pins which can be configured as GPIO as well as the
> > > +  special IO functions.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/pinctrl/pincfg-node.yaml
> > > +  - $ref: /schemas/pinctrl/pinmux-node.yaml
> > > +
> > > +patternProperties:
> > > +  "^(pin_gpio|gpio)[0-7_]+$":
> >
> > Underscores are not allowed in general, so pattern needs fixes. Does
> > anything actually rely on this name? Is this ABI? I don't see old
> > binding and driver using the name, thus this should be just ^pin-[0-7]$
> > (+ is also not correct if you have max 8 gpios)
> >
> 
> Old txt schema uses pin_gpio[0-7] hence it is here, but greping trees
> did not reveal use of pin_gpio so it may be dropped.
> 
> No this is not ABI, name may be any. Including gpio0-1-2-3, gpio2-4
> etc which is why + is there. or maybe you know better way to cover
> those names?
> 
> There are device trees which use gpio5_6 with the underscore
> (tegra210-smaug.dts; tegra210-p2894.dtsi for example). Should the
> schema account for those?

Defining a specific pattern looks like an endorsement of the name. I 
would just do the minimum you need. Something like '^(pin|gpio).' unless 
you have a pinctrl-* property. 

Rob

