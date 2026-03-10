Return-Path: <linux-gpio+bounces-32887-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC3INGfdr2kzdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32887-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:59:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4CA247C69
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AE07301829A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 08:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC99A43C050;
	Tue, 10 Mar 2026 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K09gTLDo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03594301C2
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133155; cv=none; b=JEKmlNxUUpfeRd3miFSV5L/m1w24YloNMaPSuLSWdYRZBaX6GuQ9+Q1KGq1AIoMoYTKuSkyuWT5Kz/qffR2f3OSuRfyneQXFD1kX+Rbh72IkaoAGaBt5R+2Uzx+dRkiWuRcome+GgRrbzla+OptFPy3HIlJY6K0WFw8G5oJmYMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133155; c=relaxed/simple;
	bh=aNoRrpmsMc+cYEvSe6invRTy+zqTopZWXaN7o7akQrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ieawFjB52HAnotZD32+c5860XyuyHCXAti36Q/jmNdMQcLPyyX3avNvZSDlIOgfSX4UWqAT4+j/b3PXtF6xLPkX3dzEmMUQdsJS+8BzcpYycjCXZPYMrihf8CzakFgzxIUUneMVsprNXFubgXdwEdBGnO7oiKQ9J2rBD2s/2+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K09gTLDo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D250C19423
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133155;
	bh=aNoRrpmsMc+cYEvSe6invRTy+zqTopZWXaN7o7akQrU=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=K09gTLDoKjSyE99nhOkMcw7DA+Qr0qRBXUiYz2l3EQB3P3s51zoCHWvI6LKbQOIkd
	 J16LNZMyyYTJ4CnV+fu+9cvW91621tuyKadK28ti7qi5xGXVo7LhxG5qESjMJI2Acv
	 Mvv2ntgEUmSy3fTRqYEprmg0MX3y/hQfv8YMVT6ihEleUzEClJ/oCWH4l5TrvehQMI
	 U5zJdV7vq7XOaAQlLtL/nhRMCIzdWHG0rR3teMK9Ne6zdvW8+9SQUmiFc1JSVVqu5m
	 BwHt86RY0AsaJTXoMDrNfDbUtLE98aWI2+/mEhbWw9kVNi0ju5H69ftaRDEmQQ3JVh
	 Pxrrq20HBbwuw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ad46a44easo11285515d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVV+x5ddwjEKaAdNGrxI18vSCYTysoaSdGCiqR2hXOB58eS9S74aNHglmh2ZaKAqnY0w5pmvkB+Nypu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzje9XEzlg3/Tmzx/4E5irKqrCcYUEE3rNbccD6t9kVMPtBwHoU
	oe+DRLxrLDRZlXxEZV95x/vNxrnqGsMe7TmNfet1JcYyt8YUK3T6B8NApk+rdbhaLYlt/UzHrr5
	48lHwm+X/eLvKf4m+URo0bmF4kgBSg5A=
X-Received: by 2002:a05:690e:4486:b0:649:c7dd:d2ea with SMTP id
 956f58d0204a3-64d141a0203mr9886891d50.39.1773133154629; Tue, 10 Mar 2026
 01:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302202121.197288-1-matthijs@stdin.nl> <20260302202121.197288-3-matthijs@stdin.nl>
 <e439f2f7-0b25-41a5-951a-d8d3bc9f2bf2@kwiboo.se> <aa_cCCc7FqdSv8eX@login.tika.stderr.nl>
In-Reply-To: <aa_cCCc7FqdSv8eX@login.tika.stderr.nl>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 09:59:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLmFt6N=v4RsxWqWKcsOonxbyoe7F__j+xNr4c8LWdgR7g@mail.gmail.com>
X-Gm-Features: AaiRm502_1rkdLm1iaYa81yroOSRyRAo1lhawNhKOWuv7m5FNhD4eOYbJtZ1CkU
Message-ID: <CAD++jLmFt6N=v4RsxWqWKcsOonxbyoe7F__j+xNr4c8LWdgR7g@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] arm64: dts: rockchip: rk3308: Add gpio-ranges properties
To: Matthijs Kooijman <matthijs@stdin.nl>, Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4E4CA247C69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32887-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,stdin.nl:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 9:53=E2=80=AFAM Matthijs Kooijman <matthijs@stdin.n=
l> wrote:

> Ah, I had not realized these aliases existed. However, it seems they are
> not actually relevant in this case. My assumption was that gpio
> numbering was based on initalizating order,

It usually is.

We do not like it when people depend on the global GPIO numbering.

> but I see in the code that
> GPIO drivers decide themselves (by setting gc->base statically or maybe
> based on DT).

They *can* but they really shouldn't. This mechanism exists for
legacy reasons.

Neither kernel drivers nor userspace should depend on the
global GPIO number.

We even replaced the sysfs with a mechanism that avoids using
the global GPIO number in favour of chip-local offsets to drive
home the point.

The reasoning behind this is clear: it is impossible to maintain
the global numberspace in any system with enough hot-pluggable
GPIO expanders such as on USB and to some extent other
slow buses. Do we know how many will be plugged in? No.
So we can't have any reliable numberspace.

It's only embedded developers who has never seen a USB
GPIO expander who thinks the global numberspace can work.

Yours,
Linus Walleij

