Return-Path: <linux-gpio+bounces-38134-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QTZZLLBGJ2oNuQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38134-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:48:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3E65B122
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:48:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ehSPy9b0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38134-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38134-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBC0C3018F75
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 22:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD663B47CD;
	Mon,  8 Jun 2026 22:47:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCB034EEF7
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:47:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958847; cv=none; b=PG8LDJ01L2DHcK6+RWPQUdojeT2ZV3oggvRZ9TSDU7r9/VAZnZYIvDtQ/LDrx4W0+qgJT4l3BL+fh552s+ocRHIaIdytT3xBqAjQWkACTj3VeeIvkIqcmTYC7ioHWJK+t4EO/DNaWKV+ynSFxeGPHvm4BVg73tlICBRZmqeHxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958847; c=relaxed/simple;
	bh=VJHC/l83Ve3ic9tVCgwQBU+v5li5knyEWOXlZsxbCb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YiXbdu7Bhc8pzvYbUO9cv5Fc+gCT70U0FU87dynYwN9iGyRBf6dBudvaN5CbqNZMgfWk/kKUydPYcwvifj16RtGs0krtdF+6uNN3cUUzFvOx+/BCbvtb2UFtKp/F7H8UMQ60m4qHy+wnmlq9iHqQ1kMzUe3xrYDAw09reKlhCc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehSPy9b0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25291F00899
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958844;
	bh=VJHC/l83Ve3ic9tVCgwQBU+v5li5knyEWOXlZsxbCb8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ehSPy9b0TNoCxWbbPh6OW/34S5IxlWjPJPhWlpt5yboF3PXL1Ht4JkjhGk+negykW
	 25ey1Zr32OKV44JLE8fV/Utwj5C8nZpmmO+j5SfUshJNB35rTZG4oXhDvg8mCWiSLl
	 ycc5PpmNYmbZaCwfz2m8Gr34zWpg/kx0agsT+xmCKtgMCc/Wyx52zhezS2nVcQKHck
	 8tpmACj9MnkrMve80D8j7eVsYjI73ssMJs4OAln3dyVB13S8G4tzZHR1kL7eN002B1
	 af1fG8XSCQhe66aiMCdu3uvr9T4Qbyfb0ctiTaK0UZVk4bYLhJ1jQuGbvH/+S1vg+P
	 hkD5RwQTdR6vA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39677c80386so52497221fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:47:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8U3j2mVUuBKdcMkAyVHRtBZ7ayQM1darUez78hh5LH3tui17j3OlrSB1zY1bJSIKwXk+y+YwqMsJQM@vger.kernel.org
X-Gm-Message-State: AOJu0YzZOk+CLdLGfBl5FiBdXbwvTKC5xa3tyeVWfNtZsqOeoRokpyj8
	QeC3Jip6mekVmU9HBAB0O1yHmvG2Johtc7EGVnzW8PN3NMF670LdPawfC7BLlWDUu1sFGD4b8lo
	2H/BN3o3poJxmk5S2xWNdYuTrTp/r/kY=
X-Received: by 2002:a05:6512:3052:b0:5aa:6586:ce3e with SMTP id
 2adb3069b0e04-5aa87bd92d8mr4421143e87.42.1780958843305; Mon, 08 Jun 2026
 15:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601075229.2936513-1-eleanor.lin@realtek.com>
In-Reply-To: <20260601075229.2936513-1-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:47:11 +0200
X-Gmail-Original-Message-ID: <CAD++jL=7AP4UmdXuijyDrQ+gEfmfXiqY0RQtg6FVBhsMTWUtVA@mail.gmail.com>
X-Gm-Features: AVVi8CeZZIsL_9kFXDRLGKM4kIQww_DTCozDTBdfP9SZVcEiJLmLIUMn1cp53dI
Message-ID: <CAD++jL=7AP4UmdXuijyDrQ+gEfmfXiqY0RQtg6FVBhsMTWUtVA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: realtek,rtd1625: Fix input voltage
 property name
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cy.huang@realtek.com, stanley_chang@realtek.com, 
	james.tai@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38134-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:eleanor.lin@realtek.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,realtek.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3A3E65B122

On Mon, Jun 1, 2026 at 9:52=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.com=
> wrote:

> The property 'input-voltage-microvolt' is a typo. Rename it to
> 'input-threshold-voltage-microvolt' to align with the standard pin
> configuration defined in pincfg-node.yaml and parsed by pinconf-generic.c=
.
>
> Fixes: f6ea7004e926 ("dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl =
binding")
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Patch applied!

Yours,
Linus Walleij

