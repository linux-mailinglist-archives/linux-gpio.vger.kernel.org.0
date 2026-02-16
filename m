Return-Path: <linux-gpio+bounces-31724-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EByBkVEk2kP3AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31724-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 17:22:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F41460F9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 17:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 327B9301B149
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 16:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E59F332900;
	Mon, 16 Feb 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kli6XGBo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26333066B
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258924; cv=none; b=ZjSWRb5ekVOii4yjk+gcr/86+FiSMvsnMrG/ZHaF/wshMxz6X+XhD46UOMKIBv4rIHspuV/Ev7QQWc+9vAS1jhypA1iZUtnozBnoYWFuH5NiwyW3cfgUBQE0/cFd4LKhbJrgg9dXuatT/bTZqrgT9RSnvfTK1JvXc2/6RqbVavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258924; c=relaxed/simple;
	bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7M2FjATVygJD1m6G43OmvsKuTD7MExFtKz6rmvZGCPNdBLJ0FSZvg16CyMvqFmo+9tvrGX1Ds4L2l2doQxJg+O9KB9kIFxd/qXAy9xDcAbJL2DX2Ea2y96wJuWJgyzYKAHuVvgFcwB2yGg3ixfdlUfucPZqhosBjdOMTAUZcgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kli6XGBo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48371119eacso31029345e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771258921; x=1771863721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=;
        b=kli6XGBo3E/LrX0lBXe4p6ZcwFmKod+xvchNBdMBFPNGV4xjMHC9U5elCeXUPlS3ze
         VS1osA0xU7fyOOsySj+YnE7zV4LLu9X9mtpDTI4GQYVgBoXyGSx1RbkUorDySYlM5jRe
         uTheR8WbPBm92RKItoTNWVZxGDzqfaa8KAOnpfDPNXvIjTUeKbOaeI5EZyxtJxWDL5OX
         lVtOA6e/SHYMjxO7tF9iFSaq4YMEkgmMcALUOmTHjwSablnVPvT8toNuF+D3KbK2khLb
         iSfehmeatDp2EMcL4Hzo+5Xb/pZgmY/4qBhZ+qUUESFlMqGox0oJhcSiauwHakqlJiJ4
         jslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258921; x=1771863721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=;
        b=XAsIvBe71Aa+4FOOzfEFXLFSdWU9XWBWNtGD28QpoPvhGCT55MbLckemDfuZCcWMnM
         nxzbGW4gTX3HOstJMuV1guDnsAQo1SovaOSCluhto7SKoI5cbkzyJoRmAT1DsIEQTSHe
         Pl/YgM3X3uTczTWKcIekgDsvTjgXmu/0XZHmHb1d9RxIvkmItfz7yzMxZVyEST5bb3GP
         ZIjN61IX0hum73GYGKh9mguK6Q2ur3odbmY1c2a2kP21EJZRw48ojtnDTBdARLt54b7M
         kfjK3S/LeDfWWuLMVErb/baOPupdyTHxU2hBVi2Snj7sgyH3N3XghhkBa9LAu60FkyhQ
         yNfw==
X-Forwarded-Encrypted: i=1; AJvYcCUnp/ky9ww30N/lJgCOPtOWAuArMZCA8aSmguFo3QUoRiz9MvTdpWhopMGcLQTmgEns76SEtj6sCfVq@vger.kernel.org
X-Gm-Message-State: AOJu0YxvikVFYn2yOt10JnBoo+rsf0fePCw7XE/7rNp2NWmCXoChlUfd
	mvO3YyC/LdrFrCBJB/bIxBZc45ECOlTSXpD0uxvhKnRaV0ncIM/8VxAt
X-Gm-Gg: AZuq6aJKhRhH6msghRhuDPU8thUW8wNN9KUXrc+8rcoOR9XxSdsgsEk0l5emFhHfsIr
	S3/DYMth7m7FjqBxZp0kMEAA6avtBe9BX+bGTQB7BDznSXDAgNcu+m/wLpZM+HoWCh+PkJgTfGD
	ClGzCftTOlpnw5luuoOALdAwBFVKLYvXjNgBSEYG8e22I4FyhopoR8NanAxW6iK9tv3X1kAtdnG
	hDTfq18+ak0Mjw8QWcW0wkLCKO6q5cumcR0jj+CM0iuEb37/0CdJz3+XjoEsAgAziXfak2s8EZZ
	24JlyuFmUD3GZanbstwovOBKjgdJd/V1T6RGFUOz+yV9WiN/xTYuvaEKWNC+k8zNHuYHuN6HmXK
	Vkm1/FL49N/t/YG6E8+Q9XLLhdzzWsRgLhI6YG02om7gOdAikwuYF9PeWEpQMVB9Po1viOKs61e
	yrQ+hpAMFLSk0hHoyxSOZ6hCGD4vo8vEz/8r+0KAOcbjM1CDOtvt0nYNZkg/Vdq6lWzconA8mOI
	V7oPy4/9hVo0m5WZA==
X-Received: by 2002:a05:600c:8b61:b0:480:6b76:dfb4 with SMTP id 5b1f17b1804b1-48373a083d7mr183030205e9.8.1771258921040;
        Mon, 16 Feb 2026 08:22:01 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-79-213.dynamic.telemach.net. [178.79.79.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74918sm27901928f8f.17.2026.02.16.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:22:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
Date: Mon, 16 Feb 2026 17:21:58 +0100
Message-ID: <12836817.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
References: <20260216160946.2977985-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31724-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 861F41460F9
X-Rspamd-Action: no action

Dne ponedeljek, 16. februar 2026 ob 17:09:45 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.
>=20
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



