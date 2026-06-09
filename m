Return-Path: <linux-gpio+bounces-38150-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hqBRIVywJ2p10gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38150-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:19:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D105165CAD8
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:19:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Qsoqzpe3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38150-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38150-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1D303030282
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 06:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002003D1CC5;
	Tue,  9 Jun 2026 06:14:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F5F3CFF79;
	Tue,  9 Jun 2026 06:14:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985680; cv=none; b=WPlf8TOdYWZyff7jNr1eFogrmSZqNnfsbn3QGfGvsE6WDpLjROasDfcVrk2tcZZDiUIAHBwZgXW4FiY+CFy5qROD5Hrbts2qlkETJvjPixdBqL/IXuqtEs6/CdYrfgZzmzZPK/JHrsVcQvFASr5Oj9CjNz2VaC3paEZOt7caUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985680; c=relaxed/simple;
	bh=R8i0xMZtwuBC16/9xFHQgNRiMzXhl4V9tYi/JiQR3gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BU7ebjCYPq1NGpQpnObg0TP+z2HVPFLvQ+kPWfOw3ArtRcaOkzjDWunVTqjTanYYvzkpHuxmIk+sxI79eyVLEQUYUyhbu6q74onDpty9HAlwx7K1FuzR+g/StF+w0aRYRDDlEEoj3uyJK1nS6Dy+JgsWoPs6ZunHOtOY87AcifY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qsoqzpe3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A4B1F00893;
	Tue,  9 Jun 2026 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780985679;
	bh=BKUNXUXBCi8bnRLind/MhqgA2mObgw9K4PguVb33Mmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qsoqzpe3Yk+cO7Df3L6n87Tsa501qYTF85v7NibFO81JuTOpF/9VVBbBEIshF4FQ9
	 S4vwi0nKt8ogH1X7kI9H/Rhq0EPB0EyOHw7tuQMNzktwHuIw2luQ6BTn6TUeZEL8eO
	 vgPLAZ57mxcWnQwBpAs9iv1dJlTICNf3kSyXtvU4HwZAw5zTh5cDPKWuJzj1ceArPY
	 GytvvBxI3gQv0131i4COZdD/7gqNeu65JbcPR/SEIUgTqKHbu6lCio7XaAdZY/cpLy
	 fb3+MruIQUjkr7CMm46WJZk/89hvk6Hek0AFRF+SF55Lhg92P9ljW2FZjDq+YdrhlY
	 Es0iOU1l36zAg==
Date: Mon, 8 Jun 2026 23:14:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 00/12] Add TH1520 USB support
Message-ID: <aievTZ5hqHGL-pTh@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <aieT4WmWK9416M9E@thelio>
 <a8dc863b1692b4d327b4b9700dd56a4754120561.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8dc863b1692b4d327b4b9700dd56a4754120561.camel@icenowy.me>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38150-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,gmail.com,disroot.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thelio:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D105165CAD8

On Tue, Jun 09, 2026 at 01:10:41PM +0800, Icenowy Zheng wrote:
> 在 2026-06-08一的 21:17 -0700，Drew Fustini写道：
> > On Thu, May 07, 2026 at 04:16:58PM +0800, Icenowy Zheng wrote:
> > > This patchset adds support for T-Head TH1520's USB functionality,
> > > and
> > > enabled it on the Lichee Pi 4A board.
> > > 
> > > The first 3 patches add support for the MISC subsystem clock
> > > contrtoller, which contains some USB clocks.
> > > 
> > > The next 2 patches add support for the USB PHY of T-Head TH1520,
> > > which
> > > is a wrapped Synopsys USB3.0 FemtoPHY with a little integration
> > > quirk;
> > > the controller itself is a properly configured DWC3 controller with
> > > sane
> > > default register values set.
> > > 
> > > Then one patch adds the USB PHY and controller nodes to the TH1520
> > > DTSI
> > > file.
> > > 
> > > The remaining half of this patchset dedicates to enablement of USB
> > > on
> > > TH1520, because of the onboard hub of that board -- its USB2
> > > signals are
> > > behind a switch that needs to be toggled on, and Vbus supplies for
> > > both
> > > the hub itself and downstream ports are managed via I2C-expanded
> > > GPIOs
> > > (because the SoC does not have enough GPIO pins).
> > 
> > Hi, thanks for working on USB. I tried to apply it to next-20260601
> > and
> > several of the dts patches no longer apply cleanly. Could you rebase?
> 
> I think the reason is that one of the GPIO expansion chip is added to
> the DT for enabling Wi-Fi.

Yeah, I tried to resolve the conflicts but I'm not sure what the correct
resolution is.

a20241c08385 ("riscv: dts: thead: Enable WiFi on Lichee Pi 4A") adds
'clock-frquency = <400000>' to &i2c1 while this series instead sets
'clock-frequency = <100000>'. That commit also sets i2c1_pins
'bias-pull-up = <2100>' while this series sets bias-disable.

> I am not sure whether the next revision of this patchset will contain
> all things, maybe I will split out at least the USB PHY part.

I think splitting out would work, too.

Thanks,
Drew

