Return-Path: <linux-gpio+bounces-38111-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id baG1GF7uJmoXngIAu9opvQ
	(envelope-from <linux-gpio+bounces-38111-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 18:31:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D22658BB4
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 18:31:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=U+RfxYOr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38111-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38111-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C0CF307508E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859AE3E274E;
	Mon,  8 Jun 2026 14:52:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3EC3E170E
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:52:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930338; cv=none; b=FGMwaKySJIVr9vzq8bc9MunkMelY4C/dBdU0fJLfbhleOeQeryMXlXuztfs6oW8gb4xVSvG3H6kDoVaQuPB3lS62Iu6DNcxg23HIgxrV/22LIXNhONtkI7uswsvpoqoobO39stG5Xeqg+IJfVPELL6Y4l2VetcrL0m+LyNObB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930338; c=relaxed/simple;
	bh=TqXCaEo59uIn5ijX1yUW5xl1dOQgp5ea3+Zv51OCmTw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VI9Gc/V7bxbe24W1AWU21iXK5s2/9Jb3fZFT/10U/uTFbkwJHjjTH+qnNx/YEroaV6cqCqCIIDzN/0oYwALtZFctfbT75+rkMr2Bk6NimA3SYZeG/4340cDP1UHnZzDwoa98jlwFWb3KlBbQPGwfm/7LkmIYlhVJi/rlZaJyyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+RfxYOr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0492D1F0089A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930337;
	bh=TqXCaEo59uIn5ijX1yUW5xl1dOQgp5ea3+Zv51OCmTw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=U+RfxYOrfdQ/iC1lD+u6TrXrF1KIJKVDDCgufYmSpchg/Xbm/2KI5sIgjQKtkX3/7
	 godY6g3aNzQwvEPMtLdeoGfjPyxjQV8IWHShbMfI6OlHuMf4itY7mUYvY0OMCTn8qr
	 czHSvhCh5Lv1LSZEXPTVxJncyv5GLSUx4fOA4hZWMPpkuEyYSy6/SohZ1ep26DI9EI
	 sKoVCALsseAR3URTquTyRgbOQwG1PutrLLjkkHtOuQwTY9rbzGYJRRvEvO4GU3A0Hp
	 WqEgXXBrjS+eCb3wmdWZ/lNTRKhzXqpSQajFqESdrvb4AwU7BTEtgYZSenauieOfvT
	 B9J2bIBxVzjDw==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13807d2f898so3163461c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bJr9ZkUzrER9u+Ohu+rQKs+T9D/dPArxEIDXghj5HLHpKEiWM52wHd5B5CHD5dbGPZvz6YN9ubUxG@vger.kernel.org
X-Gm-Message-State: AOJu0YwF/A63Igg1Jy4KoWU7D9wu7RdcHtOIxDWTwhG3KyNYg0eykOnw
	04LPGsiS/FuqGcN/RB5QKGbUPfdp5tVLgXJo8/C8d2ARlVZoOrbG1gbBrTMa7ucxlxIXvXTN7hW
	RMaXKs7exHsq0BdUkMEi684Z6TYz5KZK1ejFGVq87vA==
X-Received: by 2002:a05:7022:11d:b0:132:ac76:9772 with SMTP id
 a92af1059eb24-1380674e7fbmr7203025c88.34.1780930336508; Mon, 08 Jun 2026
 07:52:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:52:13 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:52:13 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-6-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-6-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:52:13 -0500
X-Gmail-Original-Message-ID: <CAMRc=MehnHnZjZiLteDxasPerTDbGcgvOgU=oSWxa8fSg94Vjg@mail.gmail.com>
X-Gm-Features: AVVi8Cd2PFRHTvwyoKh81QHB3RlN0SPjV5DzgwH177wdtNIlGj2ZE-mZGT2B4kY
Message-ID: <CAMRc=MehnHnZjZiLteDxasPerTDbGcgvOgU=oSWxa8fSg94Vjg@mail.gmail.com>
Subject: Re: [PATCH 05/18] pinctrl: airoha: an7581: fix incorrect led mapping
 in phy4_led1 pin function
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38111-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5D22658BB4

On Sun, 7 Jun 2026 02:16:41 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> phy4_led1 pin function maps led incorrectly. It uses the same map as
> phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).
>
> Fixes: 579839c9548c ("pinctrl: airoha: convert PHY LED GPIO to macro")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

