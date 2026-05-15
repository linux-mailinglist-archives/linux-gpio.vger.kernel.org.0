Return-Path: <linux-gpio+bounces-36899-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOPNKT7uBmrOowIAu9opvQ
	(envelope-from <linux-gpio+bounces-36899-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:58:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BB54CE28
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C85C8310BE73
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E3642DFFC;
	Fri, 15 May 2026 09:18:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D212E42E01E
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836716; cv=none; b=ofjDE9h0e1KsDLZyQbEaolP5FzABVlEzOmD3ZLyOoZjRxmsVs70b2RQyteCSdRVYVI5dbCQQG3TZQqHDeEnimc9DmkXYl0My3tpMiNBroG3cv3hdh7IthgiUQJnJkORTA+fwJiv3dIyxmKBA6XuAuUnOD0TTa8ECF0EhNztw4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836716; c=relaxed/simple;
	bh=iB1Viy49dwgZQTX+y7w3SFcgAMKGccuqAQu46bJf4/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/bOp6PMYLW67Mj1H3ZCimj6djl4En9FkF/REzlJv35Jescpx8QftyQpCf4L4pBQ4QOTDwj6HO+a4r22XTl/EjN/yssqF6KL6WyENVi1iq9VWqJoA66DgK2HvMSyWJHo7f75YMPXk1Shw0ZDkEri/WjFNq+LlbSumekgSCzWkAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-575124e716fso3211399e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 02:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836714; x=1779441514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/d2gVxHTTcyblRYszMKGX/9Z1RGNRy695iCm0kFujsw=;
        b=FOWE/sG7lw8u+I0emBXvJQbQxsPuoX2TZKFH01WDId8voDHC4aXoAD3jd5t9Ecgpsn
         Nimn4knHb5OCCfCBx7Tw9icjGUa+zGTj+l7uamViddufG0tp++vQIIv0IGjFrGbcZySE
         rWnKxoZE1pYwLN31PsM8esHhlbdA0T7jtfTLhxATO7M+QbodoHFtxmnFWvxFF6OhKPSO
         AkJkHyUY2cQYPcYVYBQUsqiTAUxRhL8lTkvbMgJW2arRHwclmfXUWriIKg3SfIaSlejb
         AuWXOM07oBaQYQEecIAqgVVQnvuah4V9iwZiHhE2rmnJSiTgxUZo9BdfoxkDgWIm9Qah
         pLiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+/1RPWZqpCeYaPx1h+7mzxJbTJf9gh0AzNT2W9Z2GB2ejgZtlv4DrwfKjuW/Yh2bB4U9hoITO6OsA@vger.kernel.org
X-Gm-Message-State: AOJu0YxGk9e76nGqNR50FwoCjlbM3EfKRHTfJowi6ZVfkLcbAa/sVLyP
	yUnk31laB6EpXaF+N9pwDLYC/jFoxV12q7JAQzbq4H+rOlV4mUfvNNTBWwQNVN8I
X-Gm-Gg: Acq92OFqsix4V5D5f55HHPOwmrOQTEDM3JMdcsyNUKbsGKQw9h0nFAwf3BsUoAL3XHl
	eqtJaohrr2A/E81GjNb8lQSlO1dKDaq/5OoFLsCJ8wqWjJCeWf5dsQFlNmKrCqu2eTum94BI3EP
	wsZQyHesC4/NQHsl/73iDNsbb8LXhjWFBK6pqmayZ63Leml70h7aUnwL4tUpfYbUmnsi6oQbxhn
	I+Fl5BjDazKlpo/dCCYjP8quJe+nfSnF1TYow16A7S0i2Tnrx6M6mEzvgWPqvxWSq0x2q9wFV2N
	8uttj/5eRxIwJ51pca9AyHgFkdDjkXgBgYq5NUmyg0XbdFeEWZTi4XMcDfTYQf8d9C0/cV+UA6u
	FIU3uhbyHDuCNQ4qkvrsrgWCbbpnFTmBQVujiSsZAva8XqNu2rwL8RM6f8CV1j9hkbQVWuFNpVn
	7bMFFFniqJbIfO6SXWainglOvXkl1agAMuz8cFABoklpPbAk0MI5XVcjBEQPxY2JwK
X-Received: by 2002:a67:e115:0:b0:632:e359:6c02 with SMTP id ada2fe7eead31-63a3ef847bcmr1182421137.22.1778836713692;
        Fri, 15 May 2026 02:18:33 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2f8aed0sm741042241.8.2026.05.15.02.18.33
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:18:33 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5753a289955so3008403e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 02:18:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8PRr2hGTnT52D/Y2cGPHk0/KH76mg7D6XY86dZFhFEJtzpYuNh+y+wkCUyQybz+PPn3iQPB4HKF0df@vger.kernel.org
X-Received: by 2002:a05:6122:3a0a:b0:56d:3b69:87d2 with SMTP id
 71dfb90a1353d-5760c044d95mr1713766e0c.11.1778836713075; Fri, 15 May 2026
 02:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <130ce567f23fd6eef8f5fa7273480a0e3ff2d1d9.1777562482.git.geert+renesas@glider.be>
In-Reply-To: <130ce567f23fd6eef8f5fa7273480a0e3ff2d1d9.1777562482.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 11:18:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULm-CA_K=McNgpTuBQKN9LkKLUV2-omKqJDQrk-+P_0g@mail.gmail.com>
X-Gm-Features: AVHnY4KNLVg39QXS53njqiDNGaLHc5UV5aAk_Ncug2T1CtkhZF2d1ae9MLWbsYA
Message-ID: <CAMuHMdULm-CA_K=McNgpTuBQKN9LkKLUV2-omKqJDQrk-+P_0g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: sh-pfc: Implement .pin_config_group_get()
 callback
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 057BB54CE28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.995];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-36899-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Thu, 30 Apr 2026 at 17:24, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> When reading /sys/kernel/debug/pinctrl/*.pinctrl-sh-pfc/pinconf-groups
> while CONFIG_DEBUG_PINCTRL is enabled, the user is confronted with a
> seemlingly endless stream of identical messages on the console:
>
>     sh-pfc e6060000.pinctrl: cannot get configuration for pin group, missing group config get function in driver
>
> Fix this by implementing the sh_pfc_pinconf_ops.pin_config_group_get()
> callback.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on R-Car M2-W, R-Car H3 ES2.0, and R-Car V4M (more to follow).
> To be queued in renesas-pinctrl for v7.2.

Looks good on SH-Mobile AG5, R-Mobile A1, R-Car H1, R-Car M3-W, R-Car
M3-N, R-Car E3, and R-Car V4H, too, so will queue in renesas-pinctrl
for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

