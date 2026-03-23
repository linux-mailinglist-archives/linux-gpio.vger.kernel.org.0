Return-Path: <linux-gpio+bounces-34045-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIAtIN96wWkQTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34045-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:39:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1E2FA225
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B18383268E6D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60A63C5DC4;
	Mon, 23 Mar 2026 17:10:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5163C5539
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285848; cv=none; b=eCglHbOxKtIZeAUtHA+GjZzE8FzAh9kKy8XgzOzrMk+z2w9PGy8MHGJkQlM/2IO4RWi7V2zmAHnSdhW6r3s2xfpSfLZOYxuy1xX1kW132osyPX96UuQSDFBKGxo09vaLJYbcLuK1plF5fNuH+5dgdLm364qRoyeh2Y2QWZvMG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285848; c=relaxed/simple;
	bh=5wdgibwLF96dQBbZ/WtNrCZzbZ9lrlLtoVcZ8BLt69M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwGmQVEn2ES87SH6RMuVXLHodNBETiMFlXReRaWHF0kAlq6M8T/4wUtY3GUKRfrJdL+N6IPWipyxTaLJMYz/wXIULEXNuIPm5nrfKPisvfPWHl32WNAtzkSbWw6eGLgLqhChp2EqmykhCWIYDe+Jqj/z+1FBbpZkYbTj8Gl4gb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a277379151so2100405e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285842; x=1774890642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wdgibwLF96dQBbZ/WtNrCZzbZ9lrlLtoVcZ8BLt69M=;
        b=BRVXaS+vLSPNK0CB1dU3kzZJEKScYFmgqhB/fZbSrq8UbYeM8lK32zVGgdaJD+jtT3
         3oDpu/hFsTR/G5Qox88WXEVQVf/qESA2+r5B4NZv3OCL7xbUNmrdz/ZAlKqT+8DmYM13
         KsmvqmXbZyP2pKlnHDBJsaj5aOte5p/9yenJDf8KxRXx3tejEC52eD8Q3Pj3jkAn6dbz
         yDkj6HNGPFUdePtEMKGWEx6ftpOmnBYJ7WekezJ4lpJ23JiV0rMIhUEuEh3lglu/QoS6
         di7eq+EzwKmYk9NcMXKVa58TzrUooeZxOcP2Z2ThYNkh9IzD/iHmFtVfD2b78fX5fVzM
         IrXg==
X-Forwarded-Encrypted: i=1; AJvYcCXVF2WLWY20cGijx3QT0ZNMSd779J3WEOCwmHv4zEngTXYLRKCJfM+0OCeXxutGYhT5mv5jO23KySpi@vger.kernel.org
X-Gm-Message-State: AOJu0YwrmcrJLeYKMInOZNJeBJBOGInZMztveKBh1iGZ8+wCvlJM++PX
	u5tWPcULnsm9R/9ZNto98Vsptgt1fG13RBdSZecWEU6qY1jdtYaBvooeWymKEXM+
X-Gm-Gg: ATEYQzwr04bMlZcE15pvmTwP76EgacyrXZnJCogr/kgcKkQ54P9O2CmXJ4F3c1U+14l
	6O0pbeYenR7EoCQdKvaRUDmPyiTqjBHTq/YmD6nTo1iLk1CnN+gUIdjZPBQ1utb+zUenxVBwl4W
	FUr+WwB4vVtpNm3G1vXJbQXnWanYzYjgIY7WyS44dBODN69fHPX/xjqcXFJMtqRHGGpStaf1OCJ
	LPP4qxjBg87Zb3Jl3jXCJozcYhVMhsyCbJeV6Icd6QghxKhR8OjW3P1YSED0c/jGEZAChk3gsco
	aewmhjFtyzuUi90Erx2y7S9/O0heb1Bvt7CJYlDYQjhoyTGq2OhKEyw2faPabvt5bZdpNVmEZx3
	nodI+iT4Tcz55VDMqNyiqYjzhvAUZJxbt6tR6Iq6b4LQLWWgaIJ9FOjjxgml6uTzGc1jLSxDnvl
	+qW9B+yvhDfXqypSXJBsyVt46IFzfcIiqI74f6H+BKz95xWD3ApE+KGg4=
X-Received: by 2002:a05:6512:3049:b0:5a1:3fe7:44c9 with SMTP id 2adb3069b0e04-5a285b54244mr3529502e87.22.1774285842020;
        Mon, 23 Mar 2026 10:10:42 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285303c28sm2637007e87.55.2026.03.23.10.10.40
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38ad4677830so28606421fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEmoILL+akoh6ynyzgWRCsuerTUIPEDyaTs/K+drMUWa8HgxUQYiSwNMiuueILXywS6jLYknPKuSKc@vger.kernel.org
X-Received: by 2002:a2e:ae0a:0:10b0:38b:f110:aff2 with SMTP id
 38308e7fff4ca-38bf962a085mr30981391fa.14.1774285840106; Mon, 23 Mar 2026
 10:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-4-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:10:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66j9vNEZ1_srapB9T2ASiTt5ERPfS24LE=aOKAMPt_-Ow@mail.gmail.com>
X-Gm-Features: AQROBzDk1tGxLjoHwtXmw1tvFQAdkXahJu6ZBHXleJQXSQSs109gwXgcaBwuezI
Message-ID: <CAGb2v66j9vNEZ1_srapB9T2ASiTt5ERPfS24LE=aOKAMPt_-Ow@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: pinctrl: sun55i-a523: increase IRQ bank number
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[csie.org : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,mmpsystems.pl,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34045-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[wens@csie.org];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@csie.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,csie.org:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25A1E2FA225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so w=
e
> need to increase the maximum number of interrupts per pin controller to 1=
1,
> to be able to assign the correct interrupt number for each bank.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

