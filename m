Return-Path: <linux-gpio+bounces-38107-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PpqXOT7fJmqKmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38107-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:26:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C23658062
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:26:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EaPjqcqf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38107-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38107-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FAFC302DB37
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD59B3CD8C9;
	Mon,  8 Jun 2026 14:48:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41773CCA12
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930122; cv=none; b=NALEGMXj2p+lfAnN8EIXRF+4wFUtg5m3jQfWX6ryW/T0OXEhVlwKb4I0k3amxoc7geTOshWysegjoWhnKWrYlpkJ6OU7l/TFLE6S9wia0Sxh+/2lsDKk9VtvDuXbOi3oMiMFhqfQtS9o/2DlAANdyJKUKd7siGtyM9xKjjquoyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930122; c=relaxed/simple;
	bh=5lGP3/ostS7IWs7FEHqpfbph9BewklK8a5lfeoNbOyc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFDQm/Rq+2TIX5BtRzS+IuHkcAPv3N5Ec0Zpj1esTzAFbmGbPcaYhKYUnA8JR9bVR6HQlsXDN/WEXO23loMzwTAq8TUvWoJMTz7CIa3sxtEvuCd2TJdjC7P8+xiqwzaN8aAE2ZX8lBk0Dv5rlkUBl5TeMw1JiZuvsb5BgHIS2FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaPjqcqf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CB01F008A0
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930121;
	bh=5lGP3/ostS7IWs7FEHqpfbph9BewklK8a5lfeoNbOyc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=EaPjqcqfHbxSLtCeCTcHnFclG+rMMj+sQjJ+vEUOEnrrWoblCQhYycOj6m14GsywA
	 k4H0zNOKg/uqcg5qMY1P8Cdyjvq/5m+IZy3dtBpqNxCHPEexpdMzWK9y9ION4tHADm
	 BTVlAcGC61NYnskMTP0BXwAfwjc9swF5H3EqwLVTDHrhlj42rNgWAXkAaL+L+6F3tG
	 l4+M7jGpoVY7fdNwwvP24lBNCghFj0znsf5/EAF+E/geh59ElqG83Zk77N4jsIIS3d
	 L7gj3qo2vP7aUBZoukF/Ho/eI+/3+/FoXTSfh7uiQsQHXydQ03fOk8Hc5qhBRtq+Ps
	 kCwBdZI3QKCJg==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-138129a622dso455138c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:48:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qUP3TcIvevsABPkJiSzZnq3u6db8Q+IjKx/MPs+pwHb0wKibbuOOYoqhU6QLhWHXLPgAyT5caAZNz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw81+RPJrguEgjqFS0ctX41+ckYEpJOqIqjS6PzMbQxBqI23Wyn
	zLZ7Ag+iFtrKekpvHuVlZCN/odQzd6/NyqQEyS1VkX6us+nmIiZxmmpLlTK2K96cz4frZkZtn5Q
	8ba28OjXOmwT0A4fBz4dHV0dqdaZlLlNsv8wkecWC9w==
X-Received: by 2002:a05:7022:ef18:b0:135:6914:87e1 with SMTP id
 a92af1059eb24-13806668735mr8054742c88.6.1780930120738; Mon, 08 Jun 2026
 07:48:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-2-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-2-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 07:48:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdci2vfdE80TLraNy0DjNs69S9Th6Q5fhhgv4p-bfhMVA@mail.gmail.com>
X-Gm-Features: AVVi8CcuP8Dr1_dPLmL9CvfG28eBzYqrPwOmm1jHbG3ZnAxVnqAPm-cMGAviML8
Message-ID: <CAMRc=Mdci2vfdE80TLraNy0DjNs69S9Th6Q5fhhgv4p-bfhMVA@mail.gmail.com>
Subject: Re: [PATCH 01/18] pinctrl: airoha: an7581: add missed gpio32 pin group
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38107-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:email,qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18C23658062

On Sun, 7 Jun 2026 02:16:37 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> gpio32 pin group is missed for an7581 SoC. This patch add it.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

