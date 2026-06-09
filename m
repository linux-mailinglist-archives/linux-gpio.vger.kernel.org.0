Return-Path: <linux-gpio+bounces-38144-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9jadOimUJ2p1zAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38144-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 06:18:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0F65C32A
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 06:18:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PjG9L5kI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38144-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38144-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4783037981
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 04:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B5638CFFA;
	Tue,  9 Jun 2026 04:17:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7F01A9F90;
	Tue,  9 Jun 2026 04:17:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780978660; cv=none; b=ks4QfKRjN5YjEwb2OHpsAfpF79kz3FU8PdeLzPt5Gy98sebLWTVyd4tTaVNlPrzJrCzf0lADefUk//COxfxfH5heIvko+uCtCNYPIz+npwNRzc4hwlOQ7gg8GMWOoFg4o+2b5xXvH/7NOcA2eBsK3US7DNbWDU3ErIoFxcrhLrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780978660; c=relaxed/simple;
	bh=6t46VKG7KFnxFCNrUZLTQ1Fo6crd2P6NO2NQsVE2PgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJv6SekJ+PF5PTgvNWWOUI2Qk3yzIl1eiObwz4S8feZ01k4ed1hTPCwP2g9dHj/mIvGsj8fb0iUTraKCQvZdS1LE4BMsDvtVvlyxg9k/3h9AkqbGnvMBKffsQVIiUBz8gAIaF1B2QCep+u7/jIKVHT1+BeGJgtcPc1nrQetXfDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjG9L5kI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251481F00893;
	Tue,  9 Jun 2026 04:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780978659;
	bh=4/Ifnzy+i2GJg0cvs6T4Vau8bHcoPyc7f0xcmVw8DhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjG9L5kIoMIxAs+d4+r0Rr3uPbfTciXU4Ls0+SI6JF3tAJudlSpLAopxQHkjE0ebe
	 YAxBDaUPs492cLN3lFx9sL+8+LWKPoe2VbO8zq8v+RthKELA0CFUqBBwy0usR7mFfg
	 OstadHjKQQ6VIDpeoqXg5Ps4i3Y4lXVrHra7sO7QdKKXo1NfPt/OzPADXQFJEpthsK
	 gtaWg9Gf78U4XLRFCztpDPnP1ZwEAuA1sTWotC0aMcNmB5BSXxkg9bSUvGHm+OMwaq
	 BhKoFqf/rlyb/BSoF/NlKVQjwAEBdBML68q25jard/X4ZfOBia5CCzbz1Oh/OU6tvs
	 s7QaPVz/NOL0A==
Date: Mon, 8 Jun 2026 21:17:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
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
	linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 00/12] Add TH1520 USB support
Message-ID: <aieT4WmWK9416M9E@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
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
	TAGGED_FROM(0.00)[bounces-38144-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:uwu@icenowy.me,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,thelio:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FE0F65C32A

On Thu, May 07, 2026 at 04:16:58PM +0800, Icenowy Zheng wrote:
> This patchset adds support for T-Head TH1520's USB functionality, and
> enabled it on the Lichee Pi 4A board.
> 
> The first 3 patches add support for the MISC subsystem clock
> contrtoller, which contains some USB clocks.
> 
> The next 2 patches add support for the USB PHY of T-Head TH1520, which
> is a wrapped Synopsys USB3.0 FemtoPHY with a little integration quirk;
> the controller itself is a properly configured DWC3 controller with sane
> default register values set.
> 
> Then one patch adds the USB PHY and controller nodes to the TH1520 DTSI
> file.
> 
> The remaining half of this patchset dedicates to enablement of USB on
> TH1520, because of the onboard hub of that board -- its USB2 signals are
> behind a switch that needs to be toggled on, and Vbus supplies for both
> the hub itself and downstream ports are managed via I2C-expanded GPIOs
> (because the SoC does not have enough GPIO pins).

Hi, thanks for working on USB. I tried to apply it to next-20260601 and
several of the dts patches no longer apply cleanly. Could you rebase?

In the meantime, I'll apply to 7.1-rc7 for testing.

Thanks,
Drew

