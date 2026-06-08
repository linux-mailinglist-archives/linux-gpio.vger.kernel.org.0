Return-Path: <linux-gpio+bounces-38108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3y8SJBbuJmrbnQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 18:30:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E65658B8C
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 18:30:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Cho9weIg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38108-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38108-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AD0A3341392
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773613DEFFC;
	Mon,  8 Jun 2026 14:49:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6045F3DFC7B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930140; cv=none; b=Rp9GtR8X4G4vn1CXwdvj8PNJDcRzCs1wOdI+IaWxZRCHhhuKJry0DT4WdSJ6EIaub4SAZyJZOapj/wgnpmbJH6X9nbjIV6X6KAJBBU2Ffc6pU/V5+g93pcqBmwvLnoxMDDxGGs1f5R6XNa1dI6i9wdcpoifs2/w0noBP2I+wz6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930140; c=relaxed/simple;
	bh=MOa88SxjOKsDcxBM1x1qf03zZlmO3uexj6iAoLQ40Ak=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRyfCn6yKNh5U8ZwXKRjTAwXQcpN0O7p4KUG2AP7OVubLnJPWrfYxXoKcbHXUwP2bctKdXZ767k4k5BCONV1zx/38si5pEBCVljk1k3tVAMLbil+Sf2UYAmzDyyGgpsm7wGTOOYvuzDQpLEQpVYAZauhIPPG0gWKfylzYscOsiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cho9weIg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF501F008A4
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930139;
	bh=MOa88SxjOKsDcxBM1x1qf03zZlmO3uexj6iAoLQ40Ak=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cho9weIglofwCTFPqholTctD0YJ5WjWSAIjPHolLggvT8hW8NCwrShNfE8xntZd5X
	 xzhAY2Cv5KAJZSCpTetious5RYbaNa1zVzQYzLULsauY6PwDTNLvic3ngCYMe+UZHk
	 IJvOQ3uqzOzRFbb3hMQ0dFXBABq77VqYnW3GYsRibopj0O8iE+650WQCN8y0QxHMfG
	 sesAYViO3O3+j61OW0lbYvAUABpOuKpARGpMh6lUqhrCN+cG68A9WWlFUXxjMuwhHQ
	 1ZCGDfrRvrY/XJScpL9XTHthV9jomkLcldJAX5zKKvSMbZsKVs6QwspXvAV7eLqq69
	 bPqIrqVGzsdKQ==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13721dfd471so5667745c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:48:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Htl9USwtfFlL+MqdR0QBqAVgAvB25jxgK11F9A6RfT6z7Tki3qGZM6KTdiqnF/uUWRTVbvRI9Vg4e@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnEJQBeHR42D4yKJwtWUT3c89N+0O/Vob00TMSe/R3twOEEP6
	7KE+3IMN5sAUJLBskKrvIBF8TqAmJ/KlGs/lPUVZELW3Fcmfv5IPmrGqQJzBgDTvj/wI3T1oZeR
	z007yJ9KAnbRIa/wMbcxjUH/8D24ONgXeOzVuyXmNjg==
X-Received: by 2002:a05:7022:60a0:b0:137:90d5:9530 with SMTP id
 a92af1059eb24-138067241e4mr7386691c88.36.1780930138605; Mon, 08 Jun 2026
 07:48:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-3-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-3-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 07:48:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfZp=X9SgEQ7zVtFVBy+akzmX7G-8d+HbjP6uiJjo2VTw@mail.gmail.com>
X-Gm-Features: AVVi8CcgfBZvM7zQoT-kfXLyQwfvhcRHrvvZ5dE9sWyMbehP1eCvnbJHHVQktnI
Message-ID: <CAMRc=MfZp=X9SgEQ7zVtFVBy+akzmX7G-8d+HbjP6uiJjo2VTw@mail.gmail.com>
Subject: Re: [PATCH 02/18] pinctrl: airoha: an7583: add missed gpio32 pin group
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38108-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0E65658B8C

On Sun, 7 Jun 2026 02:16:38 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> gpio32 pin group is missed for an7583 SoC. This patch add it.
>
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

