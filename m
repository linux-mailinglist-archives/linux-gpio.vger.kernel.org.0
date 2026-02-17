Return-Path: <linux-gpio+bounces-31759-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLppOBh3lGlmEAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31759-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 15:11:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4314D09E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 15:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9D8F3001FA9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457C336BCC3;
	Tue, 17 Feb 2026 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p618uH+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071AE338581;
	Tue, 17 Feb 2026 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337492; cv=none; b=QlJ29KqYYgI07eCcAj43/kGDheySRAKqM1KtvsbkHxpx39wufheAwR6U7bjhNEBJAkP+POySJD/TEofBrGXQUFysFO2q8kQinz8nOBhU5QVUHOZbVMOINLhqYUw+l0/s8hmkWgEUmuollWudEXxAD7GO+t/xTzhJZ17qSEbRsjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337492; c=relaxed/simple;
	bh=AplVAgVsgW1FQgK8A+IS7848kQ4DrCjDVVGDxLzxzUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mg+HFb1zp0BcPZiICaUKhLRvs7wzPB2MukD84Qk2ST8oTetxxlXqwejTHXdeyXS9TZ3CnhzvG45+gCF8u60Yw7OesWL2Xy+8zOviEpQQXv8bOsjm7soGepvMPMAGlktdngjx9fTm3wYQpr1wcDua0t4WsekyXpcyHxBhsDMI16o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p618uH+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625B0C4CEF7;
	Tue, 17 Feb 2026 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771337491;
	bh=AplVAgVsgW1FQgK8A+IS7848kQ4DrCjDVVGDxLzxzUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p618uH+6mUYB/IhAfz5L6pqlGi85iS5ogIIiEyIfgAb/mabWaq2RVoJ2quAhHIhEN
	 spoOfqWgStq+mKna2MbESWpuw1CE2TZDLTe/QiG5uveOIBkGoDTMXpVa8Qa2STe0Ey
	 RCLSOXnbnzFUIbipxXEmbhOYfASbQiyjiDTGin/8CvvePK7PwhDm4IgLbY5x4kcJmm
	 whly2/j/WRxrp2igsu7qUtCWbUxacw4tx6cc3sURliapT4vzJ03STvnfqXpIFtZDZs
	 a7lR0kM2zdJy/UavTQ1RwVtcTpNHN9/mdR6ExCMYGiGFrrK+a6zU5CIHEyDKni/bzx
	 QJl3O/p0h4kQg==
Date: Tue, 17 Feb 2026 08:11:30 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
Message-ID: <20260217141130.GA2953125-robh@kernel.org>
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
 <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
 <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
 <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31759-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 15F4314D09E
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 05:18:18AM -0800, Bartosz Golaszewski wrote:
> On Mon, 16 Feb 2026 22:20:10 +0100, James Hilliard
> <james.hilliard1@gmail.com> said:
> > On Mon, Feb 16, 2026 at 4:38 AM Bartosz Golaszewski <brgl@kernel.org> wrote:
> >>
> >> On Sat, 14 Feb 2026 22:32:37 +0100, James Hilliard
> >> <james.hilliard1@gmail.com> said:
> >> > Allow GPIO controller child nodes marked with "gpio-line" to
> >> > configure direction/flags at probe time without hogging the line.
> >> >
> >> > Teach OF gpiochip scanning and OF dynamic reconfiguration handlers to
> >> > process gpio-line nodes in addition to gpio-hog nodes.
> >> >
> >> > Also parse "gpio-line-name" and apply it to desc->name. For gpio-hog
> >> > nodes, keep "line-name" semantics as the hog consumer label.
> >> >
> >>
> >> One important thing that's missing from this commit description is: what is
> >> the use-case and why do you need this.
> >
> > Added some more use-case details in v3:
> > https://lore.kernel.org/all/20260216211021.3019827-1-james.hilliard1@gmail.com/
> >
> > In my case I'm setting up the GPIO line initial state and names for
> > userspace consumers mostly. I want to be able to configure the
> > individual line names from a combination of the dts file and multiple
> > dtso files for the same gpiochip along with setting up an initial state
> > before userspace consumers operate on the lines.
> >
> >> The DT binding patch should be sent together with this in a single series. It
> >> should also be documented in the relevant .rst file.
> >
> > Which file would that be?
> >
> 
> Documentation/driver-api/gpio/board.rst would fit best.
> 
> > I had previously added docs to gpio.txt but was told here to just
> > drop the docs:
> > https://lore.kernel.org/all/b851bfd4-3c35-489f-a32d-dcd7a37ca99a@kernel.org/
> >
> 
> There's a difference between device-tree bindings (formal, machine-readable
> definition of the firmware ABI) under Documentation/devicetree/bindings/ and
> documentation for humans residing elsewhere in Documentation/. Make sure to
> not confuse the two. I would expect both to be supplied with such a change.
> 
> >> I suppose it's another shot at defining what we previously called
> >> "initial-line-state", "default-line-state", etc. What happens when someone
> >> requests the line, reconfigures it and then releases it?
> >
> > This should just provide an initial configuration, subsequent consumers
> > would override whatever is set here AFAIU.
> >
> 
> Yeah, that's what I was afraid of. This is not hardware description, this is
> user-convencience and as such I don't think it has place in DT bindings and -
> by extension - in DTS.

I agree.

> I'm afraid I don't have good alternatives to offer, solving this has been
> attempted several times in the past without success. Even gpio-hog would likely
> not get past DT maintainer review these days but it's ABI now so will stay
> supported.

I might still... I don't love the binding and didn't at the time either. 
There was enough justification which this one completely lacks.

Please slow down your pace and give folks time to review. You're on v3 
already and it's the first I see it. People are in different timezones, 
take days off, get busy on other work, etc. 

Rob

