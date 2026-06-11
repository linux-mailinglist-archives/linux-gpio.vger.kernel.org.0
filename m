Return-Path: <linux-gpio+bounces-38348-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pTP1Ni2zKmq1vQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38348-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 15:07:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326C67233E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 15:07:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Blk/EA7K";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38348-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38348-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D49BD344DCF0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05E63FC5A3;
	Thu, 11 Jun 2026 13:01:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C1D3FC5B5
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 13:01:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182913; cv=none; b=e1nJ3J2kJ+IR039mxhPrtwvGtzRWizBSDl2VbehHi/OgxI29Dl0+NgRpEARvR1ofYZN2JljuOfBNttZ8Oa+WKJ4jo8RgTh5E/PAZ2Sc5eMDTO2bwcC5Ps9lL2pCDh2R9atVi+SUIdpvmlc5D5JDQqit6S4YArhf8x1Cu9O8OXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182913; c=relaxed/simple;
	bh=dxtzzd8ZdpD5pq1vA/GOSoUSAYH9K65OMoFmKECPM+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcUsk+YFdZ+RbftBX46PplHMTXkALasUGTuXNqrM5r8DuADm3dhKQYb1xps9F2SRF19fTmW3mT+UjHDthwuXyhUUmVUhhnCFgfBmsAAKNXKiQNv4t01ypb1DvU48I2OCXtHWCuoKXj+CvPyNMzYGq5AgwDHflEHXBU3r8TZXDL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Blk/EA7K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B84F1F00893
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781182912;
	bh=S/PaI/bw+VuuG55BNgAn27yXdiH77TYjTv4aXLlbWog=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Blk/EA7Ki8FhZPKTVwAbrly0vGRvkggV7PJk6BBQb3Q/3eVpfUNWRK75IjQSg5mg+
	 7uHt657Ji294n3R06rLbAdxoea6f4jWQYjwajkIXwZqLZJjjExN42xRW6SC2gdrZsZ
	 C9VnY5LyPbYQi8FvA8rODXYw3FUk3vQGurkb3cdYMFL0Pc8QH5oiNZXxtmG2FBN9Xg
	 JT9jIpO+oSYJzOw36mYDd6YRo3Wia4Z3CQmustlvjWg0JZ7WoFJC0akTyjjVD7H7/6
	 Hs4FE13hXn99EOGod6oLnDnYPjCCpClfOSFtyyRTHAYfS0Uz666PxYzeCreBgmQDTL
	 1RXl/OM0QNK+Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa69131836so7279296e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 06:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9OXe/KkxsPjGlsyWqUDw2mXKjfP/YOg0dyasLgVsOlxNDpbEn1t+PtlEq8tbzI6tcMH9unXrAWwwTE@vger.kernel.org
X-Gm-Message-State: AOJu0YwoylSibLbSLe6Yzwbt+0h7lnqB2UWneACTfTNGQHbjrjGHmLLH
	GENIi5iPBQmPDZXdLfucqQTzPDqc23Z3YzhCAUr/ptcluDj7GjSMLAGg61AjyybRFw7dXfcmyhZ
	LT7BzRQOTkETj/fIShu8fI1gaGRbsdRY=
X-Received: by 2002:a05:6512:1152:b0:5aa:63a8:c78e with SMTP id
 2adb3069b0e04-5ad27ac4ebbmr1039822e87.15.1781182911091; Thu, 11 Jun 2026
 06:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr> <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 15:01:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLk91JoT=EdsUErcdXsQiY6vbaacNM0k1kRFZSnMrb5=BA@mail.gmail.com>
X-Gm-Features: AVVi8CedkAYnUTjUGO8FTTgdtbuc-hXcCSM9t-36jlw6P4qpvJQbaTo5hy8aBXM
Message-ID: <CAD++jLk91JoT=EdsUErcdXsQiY6vbaacNM0k1kRFZSnMrb5=BA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling pinctrl
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38348-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:iommu@lists.linux.dev,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,alex-min.fr:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3326C67233E

On Tue, May 19, 2026 at 9:16=E2=80=AFAM Alexandre MINETTE via B4 Relay
<devnull+contact.alex-min.fr@kernel.org> wrote:

> From: Alexandre MINETTE <contact@alex-min.fr>
>
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
>
> On APQ8064 this can fail while claiming pinctrl hogs:
>
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
>
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
>
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>

This v3 patch applied, I saw there is a v4 and Sashiko is whining
about it so check if there is anything to it, but the AI is a bit noisy
so I just don't care now that I have a review tag from Konrad.

Yours,
Linus Walleij

