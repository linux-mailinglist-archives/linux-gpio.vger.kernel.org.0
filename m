Return-Path: <linux-gpio+bounces-36243-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D4cEmxS+mkJMgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36243-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 22:26:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6434D3A46
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 22:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF1F33013697
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 20:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19603C2763;
	Tue,  5 May 2026 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGYwQtNV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28BD3009D4;
	Tue,  5 May 2026 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012664; cv=none; b=Y6yD6vj+yDrvGA22Qjt4rOPUmWi96iw+bprpPZzPp1OAE0eyBTkV129xrEMp6th/SOmUYQB8alb76mm6fkOueFs5xP6B+pDPps7TMa2P5lnpZZG4bi4PA+0qn58WmrCAup8A+TBcvCs2p81IZhV8XbFRq1HqbCzUXMeUaZ1mXD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012664; c=relaxed/simple;
	bh=Atw0XbZz01MgAFEDmCrwf/3vMl3NHqVOxealnCyjAIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFjEVvHFmqOuib+v3TfvVnONasjSNy3wsEI7SZVYtpckg7DgZhBUj8bNjsoNXF/VDTyv5/RQrLnlxj44ca088QCGgObVVTajcTyoki5pPxQEHS3wH0OTtlfZD1WS+6K6UK2rNvivp0dBptBI9x6/hb/ePLwKzxBsCssBBPvAfqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGYwQtNV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9342C2BCB4;
	Tue,  5 May 2026 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778012664;
	bh=Atw0XbZz01MgAFEDmCrwf/3vMl3NHqVOxealnCyjAIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGYwQtNVpkgqxM4q/2udt+DC1Kgj5ehUnzF/9WIyoMc5j8SghxkyEsoxHRNXkrpc6
	 kda2lG0qQKRG4mUoSTqgTmXOUyzZ/vOI6DJnX+NXQcPKhcVc/Q+J/GgNlXhs+vt7Sv
	 pvgwZhGTXCra9pdCVtEMC4NPloSjGcfd2wuu3NgNftNbLGu0IPxSQ527vJFcqx3ZAo
	 EtixHrCHGgETurgpejCVRIZaXSy8m9ixyL4351eQ3s5gmCHEZBlH12r3yFTmuD9uzh
	 X7ZdTJgSJU2Yu7W1SeVvMKld5utJiAXRplbaGLWohLB87jWjGb0gDrcvOvC8NJ57lf
	 jqEMh/ro/hH3w==
Date: Tue, 5 May 2026 15:24:20 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Chanhong Jung <happycpu@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add
 registers-default property
Message-ID: <20260505202420.GA3809037-robh@kernel.org>
References: <cover.1776872453.git.happycpu@gmail.com>
 <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
 <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>
 <CAMRc=MfQY2Z+q=YGO0jEBip0dGjyq+uCH8EZwi9RaUOJxf74UA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfQY2Z+q=YGO0jEBip0dGjyq+uCH8EZwi9RaUOJxf74UA@mail.gmail.com>
X-Rspamd-Queue-Id: 9D6434D3A46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36243-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	BLOCKLISTDE_FAIL(0.00)[10.30.226.201:server fail,100.90.174.1:server fail,172.234.253.10:server fail];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 11:03:46AM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 28, 2026 at 11:07 AM Linus Walleij <linusw@kernel.org> wrote:
> >
> > On Wed, Apr 22, 2026 at 6:05 PM Chanhong Jung <happycpu@gmail.com> wrote:
> >
> > > The 74HC595 and 74LVC594 shift registers latch their outputs until the
> > > first serial write, so boards that depend on a specific power-on pattern
> > > (for example active-low indicators, reset lines, or other signals that
> > > must come up non-zero) have no way to express that today: the Linux
> > > driver always writes zeros from its zero-initialised buffer during
> > > probe.
> > >
> > > Describe a new optional 'registers-default' property that carries a u8
> > > array - one byte per cascaded register, in the same order used by the
> > > driver's internal buffer (first byte targets the last register in the
> > > chain). The Linux driver change that consumes this property follows.
> > >
> > > This property is already recognised by the corresponding U-Boot driver
> > > (drivers/gpio/74x164_gpio.c), so documenting it here brings the two
> > > bindings back in sync and allows boards to initialise the chain once
> > > from the bootloader DT and keep the same value after the kernel takes
> > > over.
> > >
> > > Signed-off-by: Chanhong Jung <happycpu@gmail.com>
> >
> > See
> > Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> >
> >   lines-initial-states:
> >     $ref: /schemas/types.yaml#/definitions/uint32
> >     description:
> >       Bitmask that specifies the initial state of each line.
> >       When a bit is set to zero, the corresponding line will be initialized to
> >       the input (pulled-up) state.
> >       When the  bit is set to one, the line will be initialized to the
> >       low-level output state.
> >       If the property is not specified all lines will be initialized to the
> >       input state.
> >
> > If you want to set up initial states, use this property.
> >
> > This also makes it possible for us to centralize the handling later on.
> >
> 
> Ah, the old initial/default GPIO values problem strikes again. :(
> 
> IMO this is software configuration, not HW description. I think the
> driver should do it based on the compatible and/or machine. It should
> not be a property but if Krzysztof is fine with it, I'll queue it.

Sounds like h/w configuration to me. It's the board design dicating the 
config rather than the user.

Rob

