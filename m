Return-Path: <linux-gpio+bounces-39235-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Cj9CXbUQ2oPjwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39235-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:36:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE646E57D7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:36:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cCs84pHq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39235-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39235-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4E673026AA4
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CBE43C061;
	Tue, 30 Jun 2026 14:34:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36930DEBA;
	Tue, 30 Jun 2026 14:34:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830092; cv=none; b=FXkOAeN556BpF5+2hMAKg/6hs5MOwnq74TU82mA72l0rTPyG5axEGPqQEQuKXrCCL8bi77tlQpfFbAQKsXftDo0IUEnnJv7xMtvbHQjv3qn95iEBgfG/B3DYV93/siLxES3Bup0p+nQeMJWkG0mO5tDZFR6JaLDTSAiAlM1tlnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830092; c=relaxed/simple;
	bh=5uy7k2ORk3FAueEJi9GDfDVYkY113Dpg8oKZ/mo9CfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ndSQgfBnxTAlDyhDmUYtYBivgcaPxTBp6xUZ7uwx6IBnqNmmcrbl5L5fQmyqaITEFeq0NAm5t0a86VTzK+Sc53SFEY7WixVaohdDraP0VGnCgjYsDJRXibSZFhv1ZnPJYa8Hpdfi59qSA39g8MLv72PhkH1Y5wsQM2Me/gc08XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCs84pHq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E401F000E9;
	Tue, 30 Jun 2026 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782830091;
	bh=5uy7k2ORk3FAueEJi9GDfDVYkY113Dpg8oKZ/mo9CfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cCs84pHqPZDFzIxRoiUNjJ1vurObDOUEEv7SBzn6rY2orlZIQb/4x+MrqgZc1zNRI
	 jEV+Ca6SRAySIhYCrLSUm4Qs4nC7hwFonKfPiyuW1mc399sMCgBRrzG5VrlhtQPP9E
	 CZaC5lunZiHIfQFO5AuON/dctj+FBYOkZYS3MK73TsNEp95qzDIi4ssHlmK2dqZVeU
	 DXdX3CRyylR5EwQGpR/mGb4siNEizcuLV5zfrkW6bGXfoDTmL1Pf4MYZ2eFBkwjeP5
	 A45NUoSKtrTzsfCpeAKoh3nhYfEVrBc8i+kpNyzVp7YdgAzQtp5+9TE8uWfr/rfnqi
	 mw9h6+KkMv7GA==
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Maulik Shah
 <maulik.shah@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Stephan Gerhold
 <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
In-Reply-To: <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com>
Date: Tue, 30 Jun 2026 16:34:47 +0200
Message-ID: <87pl18qepk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:maulik.shah@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39235-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BE646E57D7

On Tue, Jun 30 2026 at 12:42, Linus Walleij wrote:
> I don't know what to do with this hurdle of pin control and irqchip patches,
> luckily it will be Bartosz' problem since he's managing Qualcomm pin
> controllers now :D
>
> I'll be fine with brining the irqchip patches through pin control if an
> irqchip maintainer ACKs them.

The irq chip patches are self contained. So once we have a functional
version I can apply them on top of rc1, tag the lot and merge it into
the irqchip branch. Bartosz can then pull the tag into his branch to
apply the rest.


