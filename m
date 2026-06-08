Return-Path: <linux-gpio+bounces-38109-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yd7pLebgJmoPmQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38109-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:33:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7C658231
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:33:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TrIIizPt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38109-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38109-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95F4D30850F6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C43B3D3D11;
	Mon,  8 Jun 2026 14:50:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838243CB2C7
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:50:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930210; cv=none; b=ajSahDTc6/YeVdsXRegXjEbqcVdE4orNDQa6F0Gq1ZpA68sarrgM8AkI6kNHPV/eKt9SD56glMnJqXyyFhjK/O+8T3VDBXc92OwzwLSkaOgLahXjq9X8jOayEYm+4icxacfV/UU/dvNVP82e2JappUrBssBVnwyZ0LzqcQtc4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930210; c=relaxed/simple;
	bh=mVNzA+YimPCo/s+zQoYkCPo7qeLSIJKww/AqXzNRCrY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1DboR0kRzQpwUvPG8CJNDnC70CyRtePj7amDT5pE877dK15LEt+dGHDdxSAeenXSyuiXqHRlhlyWE5560cEekyzavK8pMVfCw83UKTAW1NV45v4V3mfXDQCCG/XibmRXIc1jaFNUrdDJd3kzyq0bEV0lqA5NZld26DshS1pCeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrIIizPt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469CE1F008A6
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930209;
	bh=mVNzA+YimPCo/s+zQoYkCPo7qeLSIJKww/AqXzNRCrY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TrIIizPtQOgkzaa+GxeDtKPfW60MyqU1ONtrYnymBFbmmpCZtxUqUup3bzaQQPPKd
	 tAj/+o7ldAPervKxCXljVrSNnnVq7o0KTup4xhChoOaINKNyD+eKPTM/73A66/a8gr
	 p76HRluvfS4WZKRcD6BcKNG/LDsXY7yAY+O7YHqa2Q5Jf/t5tBZUteik/pdG+I79+5
	 TE+eOQUzAS5FG5c6GzIkcSrNLaTUVA2ev8ohezUqB/vrIj1AxPPmPJBtJ9IAnXkhOk
	 6b0KOI24YGpsR965rKKvWQ9ja6OAaeyRFZj3GCncGEv1va69MPELTNerCcSxvgLzcG
	 68umfE9R3kV9A==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1363fe80fe8so6238076c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/F11OX5pp6sEMTUlJ+OOAI7CVetIwEVtxbYOI+ys+lS3w/rgoeGFSkx2y4rbK2Q/PJR7PPHhJh5/te@vger.kernel.org
X-Gm-Message-State: AOJu0Yzor77N2cN5eMM92JaoZnGVqKZoBmANU0IyZ5q86SEJAzyimmC8
	n2OWPaUYttUhkp4YiyUI9ty2d7oZ69TRgz1WRaxAU7GaF4b0Pc9DTpF5XW/VHPMtdAf5aK/HUJe
	AIaOdk7DfTt+l94+uYhzivNBLFfsBQfUT4EVeItou1A==
X-Received: by 2002:a05:7022:219:b0:138:144d:35a9 with SMTP id
 a92af1059eb24-138144d3684mr5766531c88.13.1780930208569; Mon, 08 Jun 2026
 07:50:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:05 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:04 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:50:04 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfdwrgHU-uQ=23SOth0W69pEnWOBZNADW5V1TZehDrggw@mail.gmail.com>
X-Gm-Features: AVVi8CfLdQbnTOwyGCfZAp__4hziGPZ_SRIyQWjmiKLBoe_O8lP48fbaszTAsbQ
Message-ID: <CAMRc=MfdwrgHU-uQ=23SOth0W69pEnWOBZNADW5V1TZehDrggw@mail.gmail.com>
Subject: Re: [PATCH 03/18] pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38109-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0A7C658231

On Sun, 7 Jun 2026 02:16:39 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> Pin 32 (gpio19) duplicate pinconf settings of pin 31. Fix it using
> a proper bit number in the configuration register.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

I think the term we typically use is "typo" but I won't die on that hill.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

