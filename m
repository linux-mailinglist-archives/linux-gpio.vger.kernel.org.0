Return-Path: <linux-gpio+bounces-31638-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNftG/YvjmnsAgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31638-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 20:54:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CD130CC8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 20:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 220EA3012237
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 19:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2195C2F0699;
	Thu, 12 Feb 2026 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbB5aqFt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4223D281;
	Thu, 12 Feb 2026 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770926064; cv=none; b=b81kgG2+S/7PHUFp9TwcwyqJJ+J0IT9XbYelHWP9KicwzsCsBPnqveY3xf/YVcKxxfLPpDMWDB9r9nFC1c4d4KJ7d3U+sip1TMJXIY4qJHc7wKzaa0Nya0GcBnL+/8iPRKRzNbuExVJup+ELu9jbq1/WeijYEGtYWjJ5Uj5SmR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770926064; c=relaxed/simple;
	bh=Eacdj7ONmzxod7N3yo32xAW1ze/a9eGetTtpn5Xbr70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8HhEe9bV6dh4uN0hWSJ4w22yFpLQC0M3FDp9Oh9wrIAULLIQ99SiXeX767kTCQdbcy+2k78d5lPxZqerDg+wZIjAOoSjBmaujUl0TGjASyGYCOVYcXt/iPb3NIh6uC44EXB0dlwdUPLRqMTBVlM7NhHITtfP3SSVlVRJyS02gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbB5aqFt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61063C4CEF7;
	Thu, 12 Feb 2026 19:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770926064;
	bh=Eacdj7ONmzxod7N3yo32xAW1ze/a9eGetTtpn5Xbr70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbB5aqFthHoxt5/1+/qYhS18o+U4nAzsp0rQCzDOGDU+l0riY+SOQLGu/n3ydWdLJ
	 eZUanYErBvifNkn6xos333d2MwNRzbCJOBe8U47n5KPS9jCak72q9BUOKDbD/ZF4qz
	 TeFhRdVST+ALY6el9qY2DeYSSuaDJQ/yJiXS/FHIysHsRo8lzm7T6zNIK9dtvyrA0s
	 wW1jEo5OMSJJWfBi1ahjnp2DkpiQfMMw+SxMqxlUr+jxTjqGNB0QZvfT1+Nx+ZJdYX
	 rVH/8ghlSEuwfZ8JMFqtPrf39AbLDPDZxmSyu7EfJPobkGOiRPt2pTGDWs5SzHrxHp
	 AqmxtwBCF5RdA==
Date: Thu, 12 Feb 2026 13:54:23 -0600
From: Rob Herring <robh@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
Message-ID: <20260212195423.GA787785-robh@kernel.org>
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org>
 <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
 <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org>
 <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31638-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A9CD130CC8
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:01:05AM -0700, James Hilliard wrote:
> On Wed, Feb 11, 2026 at 1:44 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 11/02/2026 09:28, James Hilliard wrote:
> > > On Wed, Feb 11, 2026 at 1:19 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>
> > >> On 11/02/2026 09:17, Krzysztof Kozlowski wrote:
> > >>> On 11/02/2026 09:13, James Hilliard wrote:
> > >>>> Document the gpio-aggregator virtual GPIO controller with a dedicated
> > >>>> schema and compatible string.
> > >>>>
> > >>>> Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the new
> > >>>> binding file.
> > >>>
> > >>> <form letter>
> > >>> This is a friendly reminder during the review process.
> > >>>
> > >>> It seems my or other reviewer's previous comments were not fully
> > >>> addressed. Maybe the feedback got lost between the quotes, maybe you
> > >>> just forgot to apply it. Please go back to the previous discussion and
> > >>> either implement all requested changes or keep discussing them.
> > >>>
> > >>> Thank you.
> > >>> </form letter>
> > >>>
> > >>
> > >> First thing which was missing (I did not even check the rest in such
> > >> case): missing rationale for this patch, missing hardware description.
> > >
> > > I added some more details to the commit message, this is a
> >
> > No... Commit msg is exactly the same.
> 
> I added the details to this commit message specifically:
> https://lore.kernel.org/all/20260211081355.3028947-2-james.hilliard1@gmail.com/
> 
> >
> > > virtual gpio driver though so AFAIU it's not hardware specific.
> >
> > You can give example of any hardware where this is useful. You need to
> > make your case with actual arguments.
> 
> The sunxi h616 board I have has hundreds of GPIOs, only
> a few of which are needed, I want to map them in device
> tree overlays since there's some minor variants with different
> hardware gpio configurations.
> 
> Setting the gpio names on the parent controller is not practical
> since doing so would require setting hundreds of values for
> gpio-line-names, you also can't really combine sets of pin
> names across device tree overlays AFAIU.

You can do: gpio-line-names = "GPIO0", "", "", "GPIO3", ...;

The clock binding has "clock-indices" which is used with 
"clock-output-names". We could do something similar if 
all the '""' entries are really a problem.

> > > Use case is I have a device with something like 300 gpio
> > > lines...and I want to name/group a small subset of those
> > > lines for delegation to a userspace app rather than trying
> > > to set 300 or something gpio-line-names values, also I'm
> >
> > So if I change the approach in user-space or use different user-space
> > app then I change the DTS?
> 
> The idea is to make it practical to set gpio-line-names for a
> subset of the GPIOs that are wired to peripheral boards.

Humm, peripheral boards! So there's a connector. You need a connector 
binding. And the one solved binding for such a thing is GPIO! The 
gpio-map property lets you remap GPIOs from one provider (the connector) 
to a parent provider (soc_gpio). It would look something like this:

conn_gpio: connector {
        #gpio-cells = <1>;
	gpio-map = <0 &soc_gpio 3>,
		   <1 &soc_gpio 123>;
        gpio-line-names = "GPIO0", "GPIO1";

	/* in an overlay */
	device {
		foo-gpios = <&conn_gpio 1>; /* soc_gpio 123 */
};

> 
> Say for example I have a control board connected to a few
> different peripheral boards, there may be different mixtures
> of peripheral boards, some of which can be used at the same
> time as they use different GPIOs.
> 
> The idea is we load device tree overlays for the detected
> peripheral boards with detection done in uboot based on a
> GPIO pin strapping based detection.
> 
> In userspace we want to match the peripheral board GPIOs
> based on the GPIO line names, but using gpio-line-names
> on the entire GPIO controller isn't practical as that doesn't
> allow composing gpio-line-names configurations from
> multiple device tree overlays and would require a ridiculous
> number of placeholder entries due to there being no way
> to configure individual gpio-line-names for non-hog lines.

GPIO lines typically connect to something. Relying on gpio-line-names 
seems like a failure in defining (in DT) that something.

We would never rely on GPIO pin names in the kernel. Userspace doing 
so is pretty suspect too. More importantly wanting to do something in 
userspace is irrelevant to bindings. What's in userspace today may be in 
the kernel tomorrow. Look at serial attached BT or other h/w.

Rob

