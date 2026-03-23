Return-Path: <linux-gpio+bounces-34044-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOoREluAwWl2TgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34044-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:03:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 883472FAD1A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73FAB3036546
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B913C6A27;
	Mon, 23 Mar 2026 17:08:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF9D3C6611
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285733; cv=none; b=sJr4Q6joBLRUsCsoM/c/s14Zq9NrZxJESKJyFUDEIZUPNJSEkMdZeJruP2RwOta8PEW12QGIXxeHydnWQ5uoCHJp+e+8IQq+ymr3AqXVgVRoCpw5WHnucztmCvaan97AKHMTP1wK8KMSXdkXEHXSkum+QZbQ3NtJkaquID5cU30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285733; c=relaxed/simple;
	bh=ea014rg9Id3LjbCkFFKL5NQgh0vM+cp3ePkl8S2utWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFgdBHXjS3ndyKSSF89hOylDO6af4l44dfH1w0MpJHLKVu5oXUqujiwpq3DmlRT7rJvkTfFhnzjdEGt34enfe7AcNOZazrpkiWRFqXhBmayr3ZxYRVIH4NlF4s+oQD3i1YLhAGDCeBL7jIiRUErhfA5GONkmeVHZ2J0sV3fuluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59de8155501so4367927e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285727; x=1774890527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea014rg9Id3LjbCkFFKL5NQgh0vM+cp3ePkl8S2utWg=;
        b=gT6zrgT4xC7LidNbI9IZY75cj61aRhRkifG6XE4zWBlUtwhSdqbHZMqC0NmcPCnnzE
         VgBVG9GeZx1FRETQZwspEMgctl//qb+OYCfd7O8j0P+W1f3mcEfkUy/s35xIGSj7dpoU
         TZwD6LZLXWAmypsjFSH9S7FhdDOhf8kZVvV49yHf1hcG5qdpMGGYdUiHr8+kfElwFOS0
         eBChcrW1kSbTcMOzThk7t8/3oMa+KaT1Qoy1tUTnLNGqmSGVmo3+iEVkBzqPUEPsewTK
         zhJsABWelonqzLEm1t9l2NabbwfQeR3aaN8xXzfdCUGBmpSHmufKksN6Vi9HBnZnHpt7
         OzZw==
X-Forwarded-Encrypted: i=1; AJvYcCX3RAHI6n/pORDsoXwx6lr9KC9vhKBjdMTxJXQ8UWTr0udsj2LnsBaLmZGGLyPXsrhEvT08khn7cA8r@vger.kernel.org
X-Gm-Message-State: AOJu0YymNYG5uc6g1Uo6ERUvd1v7/CKu2DbEwylb/jNDus9uz+M5cwrj
	gs70pQsxtjMS5E1IGsXBUKNytIO7iZxPQzhn0Qsgtav7LmHI2NMY8uE5DbGvgGWV
X-Gm-Gg: ATEYQzzwOjNtF5+SDKs5NSvrQt5t+ruRpdcZKAIPz1XUdwKUp0HnN19S6Aryv1vIluQ
	XLccrnmBnEaIjkNO7AfHMkqV4pGp6kk6KsoZNUr+OdrzpciYRBU6dQHw/dp93gxY7qw4ro95ScQ
	pRXv+W3v9TOpi1yIhtY3nsxERVF1pFPBwRxP5/a7zZ7BgtRYzkASkYkSIt/hK/0GkrpBXl6VSwF
	JMGQQft+elxUymT2yyR6y9i+cfipNRDscT/eoIoxK0EIbDRgkKkKgmUTCv/KTQoLHRrCZ2/ejBs
	ednbJyqhK/BYex8Vf+ZE+nySo5kABc7yb6nBErlm3/5yvvMDgEOLc0j335rZt5RSK5+Y53VKFru
	NEd7B5vJHEY24rLhOP39IkdD6MOgZSTqU0eA6QDca/pxBMIZyV7M1nDSz+qCwijEcyHBmm79NTd
	RBpbhEKJFqGUdOVLbz08J2J17+1fIzGsXOS2bi/JSpZIvh38ynRq4=
X-Received: by 2002:a05:6512:15a2:b0:5a1:190e:9a15 with SMTP id 2adb3069b0e04-5a285af570bmr4048463e87.6.1774285726803;
        Mon, 23 Mar 2026 10:08:46 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf960dcfasm28995011fa.0.2026.03.23.10.08.45
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:08:45 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59de8155501so4367846e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW15Sxj2kfb3SIIXyyOiaiXuZN1Hs9lXMWgFvuht+qx0/RGsMJRz7GRiKN4mzRfDX0Zpo5OoqGkzh2p@vger.kernel.org
X-Received: by 2002:a05:6512:3b2a:b0:5a1:3400:f937 with SMTP id
 2adb3069b0e04-5a285af5768mr4364578e87.7.1774285725281; Mon, 23 Mar 2026
 10:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-5-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-5-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:08:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v64+bQL7a4C=+ja15wN5=JZM9EN6KL3i3zKiSSOH_VjycQ@mail.gmail.com>
X-Gm-Features: AQROBzCe4pxhD7VX5GMz8Rw4tgWfnVyG9ksfoBVa9-SlxUX0n6uC5n3LkQE4wJU
Message-ID: <CAGb2v64+bQL7a4C=+ja15wN5=JZM9EN6KL3i3zKiSSOH_VjycQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a523: Add missing GPIO interrupt
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[csie.org : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,mmpsystems.pl,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34044-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[csie.org:replyto,arm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 883472FAD1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Even though the Allwinner A523 SoC implements 10 GPIO banks, it has
> actually registers for 11 IRQ banks, and even an interrupt assigned to
> the first, non-implemented IRQ bank.
> Add that first interrupt to the list of GPIO interrupts, to correct the
> association between IRQs and GPIO banks.
>
> This fixes GPIO IRQ operation on boards with A523 SoCs, as seen by
> broken SD card detect functionality, for instance.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi fil=
e")

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

