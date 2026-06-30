Return-Path: <linux-gpio+bounces-39220-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OeX8L5bDQ2pYhAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39220-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:24:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D386E4D02
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:24:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Rj/Nd2yo";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39220-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39220-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D62230A1E5D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F08F41C2EA;
	Tue, 30 Jun 2026 13:17:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8500E41C2EB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:17:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825473; cv=none; b=oY/D6jQDBOyMUS8lRdCLsC6sI7s3tp9wwfZipJ6si44ZxjwrgKQ+1Qt4wqR2fX4KtvrlulLNGIT2sZGyvpSFI1x63HXm89LCG2m7+xcCNjpLUUNvSgevwe67b8WjbensjxhbgXtzxunxiojsqo+IqF9m+pNC1kcFCrFMbfl3Oig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825473; c=relaxed/simple;
	bh=9WlTDrD0GTrmoZtm2PIs+eRLKan5fPEL2hlM4Dkov30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmXgOgDkM75agldeNyaf8/SWyMNc/wmXFKfasof4SQdXApZwGPPZACE8IOSSSFPi9s+yqb5BgHRpG7OWDqt4lG1rRO3GsYNtv1DO+fgfCcvr4lwxkWMtb/G0fN6OkIFOs7zKXlpFg9JhGH3s0QC27hICDFULASWZ+QUXGuIl+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rj/Nd2yo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E2B1F00AC4
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825468;
	bh=x56Pt80l7vEIHB3QHUtNi8HkIWEoiB9UTmfQ7Zpg0a4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Rj/Nd2yopSHp1AWthQyP/jxait1LDwpbUMEhGkV7/R80OYtnEaHjyAvrEnBwklQxS
	 7KV1hDDScx0ohOjsh5NxZz6bx4LH+4+/TmVRqQiTHD2KODKlUPnMqE54nlvx7DB8Q1
	 fJVTDUA3m0XeV/xkHlPmYAFd04AbNx+29sJxv4eE/HSz19EKrezEvBsqZN2wK8YcVX
	 q13b1zHZUTys/ZB+DOxsmHoxUp8ctuAF0XNDjmYNGjw+GblWc5vYKnnfZn7KvU6R7H
	 kekQ2mPHES0uWAJxaDCBZxrFg2uXJ+drprdeCtEG6gi1dpk+aqC2PtEKvpSWXxpRZ7
	 TGioNB637TCbw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aea0fff535so4659174e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 06:17:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrloIGy/fCMFu6/lTDkxpZ3J5vnWARc0PrC3MyRQQ4C/2ykfeynBnZ4+o7GXrTe09XY3PVTo2BwFsSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwiELnPdJs5V2m36oYhPnVy6TsbXL6/vQa30SKe/ohNLKkhoW5x
	JZmnoH1bYhZHnI75k5V0Q9EyNrRWlDwyfE/orTEkS80I5pNGLL8+2/NkTcGFwUA79z5RCAF3iX+
	R+cG+osgbb0C9Z4WgsvHE/xcjJrsht/4=
X-Received: by 2002:a05:6512:1189:b0:5ae:ba0d:7097 with SMTP id
 2adb3069b0e04-5aebdb9aca0mr1136620e87.21.1782825467698; Tue, 30 Jun 2026
 06:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com> <20260622092335.1166876-2-eleanor.lin@realtek.com>
In-Reply-To: <20260622092335.1166876-2-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:17:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
X-Gm-Features: AVVi8CdwgtcknNrciI5bYwSnH2bFysjttC1zWzWDoBamu5PfRAkvToiEh8EArtE
Message-ID: <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, mwalle@kernel.org, andriy.shevchenko@intel.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39220-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:eleanor.lin@realtek.com,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:andriy.shevchenko@intel.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,realtek.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34D386E4D02

Hi Yu-Chun,

thanks for your patch!

On Mon, Jun 22, 2026 at 10:33=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add the device tree bindings for the Realtek DHC (Digital Home Center)
> RTD1625 GPIO controllers.
>
> The RTD1625 GPIO controller features a per-pin register architecture
> that differs significantly from previous generations. It utilizes
> separate register blocks for GPIO configuration and interrupt control.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
(...)

> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2

After looking at the driver I must challenge this binding.

Your driver is full of (offset % 32) and even (offset % 32) *4 to just
work around the fact that the hardware inherently has 32-pin banks.

Instead of using twocell GPIO and irqs, just use threecell, interrupt-cells
and gpio-cells 3.

First cell is bank, second cell is offset inside each bank.

For Linux specifically there are helpers for dealing with this in gpiolib,
and further you will be able to use the GPIO_GENERIC library,
while this is beside the point for the binding itself.

Yours,
Linus Walleij

