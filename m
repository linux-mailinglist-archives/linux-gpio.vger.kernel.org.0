Return-Path: <linux-gpio+bounces-38114-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AVgkF5b8JmrxpAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38114-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 19:32:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A875565943E
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 19:32:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MuVHfKC2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38114-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38114-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF34E30F5373
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 16:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F272A33F5AE;
	Mon,  8 Jun 2026 16:15:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA197326928
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 16:15:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935349; cv=none; b=nFqoqM9Q3R9V5OvcDjROIQbXj6yZPNZOrNiDhhCsn16/WBAx+Ef0mJ6Kyp7QtlCjMIiGekoLlih71vQf6s++M/HcX7DPJGCTLCZAMVQzifC1CEAiyqS87bft1Hj+fQSztL/Ubd3CNz0M58d31DA2Z2ffLgsIeDqy2XaHakUUrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935349; c=relaxed/simple;
	bh=U87KOvIaXEfWkmCPdpDSCM+l7v+E+UTZwehM8drO+VA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eulMQJnsPl+csEYetuh5pDgYpHiVfHU1ojbfFbwdaF2zsMpgYonelN/4uYdCNFfinsbX1+CmOZPC4/+yogRDvNz25iRGKX4qY3aF7E46GjXW14wQZqprS/OueT4xxWUkMFspEPjQ9gY3gZpKsxM8Y5Yy7Mz0oT12ejnVfkXo2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MuVHfKC2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8861F0089D
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935348;
	bh=U87KOvIaXEfWkmCPdpDSCM+l7v+E+UTZwehM8drO+VA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MuVHfKC22FODBS6u/A71jx9ELs6buKcJ3Yjtdf53DXsqi5nvblC765j6NVUFKm2qu
	 0Ri+S0hFnisr8L2DMFBoaTrJXfa8gFNN/ULKNeUFELPEUgxaArlJQBfWbBuyRlqVVn
	 gpn08G+2CRZibqN+/1vJlrx0hss5BQdUnvY4YET82UyNPHYjvDBiYNvX9+AZocWb7q
	 pk/Vn4Regm5HQilzqb6cXdMD7QOeenRhlc795utbsfn/Nnj4/1Uo3CGfqGPc/uwA8H
	 4BIl2i1LlY+kE6DswScuPZEsjoLe9rS9L0/Gk9BUO71w1UnrDf24DvK7rAde9/qd86
	 8a6gP9jA4+8Kg==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13810b63a1aso786361c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 09:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8L8yCeRuien3ljqXc3uIE/QnfVUZBMldMpirNGtDomgDfXYUc/W/hUE5Ctb4oX1SBL3B75gO4gkjAQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmbgdgUUExiLKt0KK247PNGPzjmh273lFebnpmU/LHpH2YsEek
	JS+G0fyO+rDdjWRkVZouf9gY4WSZHH4L9gJg0+l/+WNpVNGz0vXPqmQH/Z37ObWUs+P/+ezJ5MQ
	kaDEwyWsh7hTi7SV8lkeogGwr2YHivTivqWCm/MYa3Q==
X-Received: by 2002:a05:7022:3d04:b0:137:eda3:e5a9 with SMTP id
 a92af1059eb24-13806720e38mr8578839c88.28.1780935348033; Mon, 08 Jun 2026
 09:15:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:15:45 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:15:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-18-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-18-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 11:15:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdG+Q+7p7r9t1qTAVBPEP4UWx98g6igSnrR9MBGx4+WbA@mail.gmail.com>
X-Gm-Features: AVVi8CeehSwizvVfI-4XqLm19u4Xy3rLoafM6ZSuZ51yo6ba5Mu-K9LrhjWFHnY
Message-ID: <CAMRc=MdG+Q+7p7r9t1qTAVBPEP4UWx98g6igSnrR9MBGx4+WbA@mail.gmail.com>
Subject: Re: [PATCH 17/18] pinctrl: airoha: prepare for en7523 adding
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38114-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,iopsys.eu:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A875565943E

On Sun, 7 Jun 2026 02:16:53 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> en7523 a bit differs from an7581/an7583. It has different register
> offsets and slightly different bitfield masks.
>
> Let's adapt common header and existing drivers for the future addition
> of en7523.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Looks good to me.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

