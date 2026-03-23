Return-Path: <linux-gpio+bounces-34041-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEfSIe55wWkQTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34041-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:35:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0302FA0E3
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6CD9305018D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AC13C196D;
	Mon, 23 Mar 2026 17:05:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7B3BF687
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285516; cv=none; b=L7TTYZUSORJE1bHhU+X+5JsF1MHw91T3Jxu207n8meobd/Q34hXzUhLgN9TLgkKx5rzi4gB+hbGoHZ8V/sNuAQOK840fNxJerrW0wNleKmXsFIlon5z7G+Aco8Zkc516U5RJ6bN2eZOTQKt8pKwcxo1MpBaVSE93Fulc3odvA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285516; c=relaxed/simple;
	bh=Nm5v7JcVlDEukV8P80SZM5X9wYhOXPQwO9PL60/LKYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8Njq8QFYqdT9ldLw+4aVKVtDYRSzouKl4A7ZyCYqSNW03IBVLBWPGYi8uT582Cgn8vwlMN2j0yGUJn5FyeIe/ZFOqh+Ng08t7CzRt2HLSq3xUFG6WHB9bOBK1Kp86rVyQXNFDNkdxv8xrCba4WA0gjjtboMONEC/oCCpeBIlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38ad4677830so28552351fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285512; x=1774890312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm5v7JcVlDEukV8P80SZM5X9wYhOXPQwO9PL60/LKYs=;
        b=EXKCuHpUOX1EZmRtBtaawTsYaV6DnQ8JW4Nsfi3e3n3a7kj3mIk5J9qtVYtGQZGtJd
         EAnX7I+Fh3/sn91HpDl6g07lcVIvHtI5Gy7WNpoGTukL0t8nLFPd3ze6L1s8wOx3SkYE
         MyjY8NtbzA+p0CpvJjw+yff7KpkPQyvQEfF0kniMRS51Ev+PKuEezRFOvhqPJgmCbFGF
         M8dGPV0Q6RBOiQf42O2GlhInnkmD9YLQB8ruqCf+mum0/6iWzy6dKCDTwXJ2j1JT9P9L
         ryPE96rAQU8WqjcVcmtU70TEYEWN6X3EsgMxFUJlmAQt8jiuXTqpBQDqlt/sMNOaszjA
         ctYw==
X-Forwarded-Encrypted: i=1; AJvYcCXiVg7B/SSjPQwU5KiagPpkbh6UisoV9Ks15gM3VdzWkeqaNjdcn1ZC+LbeGwJgBRNwvRvTrpexsJ+G@vger.kernel.org
X-Gm-Message-State: AOJu0YxLvSqPNgD0i/+AdYusg0lxM2ex8Q7sUh0lpI/b91oe1EI77ph6
	1F9ZHxarKlwea44Wd+WDRcPAwjh8s6fyLFYRw+ilNCM8WKpIBhat9VFJZJNS6Mo+
X-Gm-Gg: ATEYQzxWMUMl5bW5TBw4PhKyaFrBYppfyHk9bUZv1pDvNysbjFfHUZ9a0gpezu2Oe6q
	1zqraRZCZQEBJp+tH4SbRNCMYesiD3vNrRUAJtVf8tvGinnr34QWqs80BH2JFOlodAVt3qN0BgH
	0itCKR+cNXmOkh+ExvxlFIAUW3QhyjcwbJjH7NUfbBKHG1a2ikAhK1RCi0fVpKHNBg177lYnZ45
	Xt8qjhSQoWrCatUprWMJryTp8X416YcXfWx/Q38RpTJWq7Al1iPYohEy3JPZPV4zuapsi+Xyoqb
	5spkMW6TpN+qXgM4ZEVluhk1c6uaG3K9xvVsvqe4FMxTWmtk9p0Vz7aMeWK+X/4P7TPYaGrLmcV
	NPhmFCq2/VkyW3sxp2FrT9TZFtrf24NWSOG/lpVIAu+e3D1gOscQ9bNDEJv6Qz7sbTppeFNkrW2
	zQiIeWV8Zwl6JgllSQ5GqwkRreewicETgJsp9zwRdl96UTAs9RjHEbjpk=
X-Received: by 2002:a2e:88c6:0:b0:387:e49:cd1d with SMTP id 38308e7fff4ca-38bf962a9abmr27584481fa.15.1774285511333;
        Mon, 23 Mar 2026 10:05:11 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm28455111fa.19.2026.03.23.10.05.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:05:10 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so20822981fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:05:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgOeCMbj7kPsE1mcA4Syrkt6RDMTvUf8Z3X7o21A4AfDcQOTJMaj/gHLzIIOvxijqVtSLjE1GE376g@vger.kernel.org
X-Received: by 2002:a05:651c:25c1:20b0:38a:6acb:eab3 with SMTP id
 38308e7fff4ca-38bf96f3a52mr28930191fa.35.1774285510390; Mon, 23 Mar 2026
 10:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-2-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-2-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:04:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v6564QBo1CHDo4jkdz1PXKHLXAiS_Q5-1QGrh6fEt909ig@mail.gmail.com>
X-Gm-Features: AQROBzDR4iqzNYZJkcCgL6IuYb3DzuKFkSg6JxARTu410NRvFve59a3elCP1SSw
Message-ID: <CAGb2v6564QBo1CHDo4jkdz1PXKHLXAiS_Q5-1QGrh6fEt909ig@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Rework IRQ remuxing to avoid fixed
 mux value
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[csie.org : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,mmpsystems.pl,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34041-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,csie.org:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: EE0302FA0E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Some Allwinner SoCs cannot read the state of a GPIO line when the pin is
> muxed to the IRQ function. To access that state anyway, we temporarily
> mux that pin back to GPIO input, then return it to the IRQ mux
> afterwards. This code assumes that the IRQ mux value is 0x6, even though
> newer SoCs (D1/T113/A523/...) encode the IRQ mux with 0xe.
>
> Avoid hardcoding the different IRQ mux values by saving the programmed
> value before switching to GPIO input, then restoring the saved value
> afterwards. This makes the code robust against future changes of the IRQ
> mux value. This also avoids calling the sunxi_pmx_set() function twice,
> each of which does a read/modify/write operation, fenced in by the pctl
> lock. The new code takes the lock around the whole operation, which is
> also safer since it avoids (probably theoretical) races against other
> code touching the mux register meanwhile.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

