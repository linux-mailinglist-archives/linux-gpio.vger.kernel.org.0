Return-Path: <linux-gpio+bounces-29894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAAECDE063
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 19:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E07563000FAA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 18:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70392848A4;
	Thu, 25 Dec 2025 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggjZjQEz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D868E27FB3A
	for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687165; cv=none; b=In/yj56A4A5/UjNd6rTfL6WZowgaGYbERowmkWNgXlRkBH7zjxlX8b6XQuR+gvtbJVpBIdxy/gf81SgKbyUsSdWmrHt/zCeilkatorZf9YmmAdjIY7X38HbMmgFg6I7pUZBklOyQ700wlYE+YBb1YgtE0kpfkyuHuW6PbbXaOxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687165; c=relaxed/simple;
	bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z5T8AUcU2RiobbsjeaFE39tYYsboCGvB1XgHjCLcDXC6xS6TOB56H31UVr6m0T0jz3pFwAniPRQFD7cGIV1hFXvAPbfAbYtt6Oew+nJaxwdSdnWqMZm+X5/wtQRcJ1oueNIvE0trz78TMwKUfZoG+kAzTWzBYyduqGD0tdETsFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggjZjQEz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b560e425eso8600151a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687162; x=1767291962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
        b=ggjZjQEzgpSYtMe7FsBkCI7BtmbDxk5b/G0z4XxlIgU2zrCKDzBVLgXnsm07I6k8/q
         f6ilR70to4MvJH3GIVvBXy6e5QOMoIeqPyPlmLqYbEK9XoaYdXPnRi13ohnjVG0MZNa4
         ffknMmwYcpFEpDSUD/tqxofkGr6mmKTjlSBuqBbTZVxN7+0tWia3WX5yvb4eXITPIkGZ
         kSnn88R2jd4sMF+ujzg91c787i2KGZLUbhdZ8XvfKu7UwRmEmo8mJl4Y6/fR6tET5Q33
         P+Y9z0RksDmZDlClkWtTSS0jPx3cWcmAKThpqL5cT0BeorzB9zevoNDVbl6QqkuioSO+
         zEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687162; x=1767291962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
        b=olPMe3c9gEk4UZ/3GvPIpbDPpG7AOigITSNNQWTeaDAyAn5G2CrXQxh5hB1lEtUzzP
         +aooFKzGNYtweyn3BM17n5kzsXQXtPw2SLaDpPJfgOHPaQ4FaGNPpcF95u2Ff6S33EsK
         qrJEBupAOCWktHUbPSi1RWuvdlEAMDsIfWWa0hnIhkQz54Cmj85Hkesh3m//IT+jsLXW
         xZ4T+6aVUOaQrl6sti4y14+v4aT8zFC5zQKke7nE9Fz5jZ/8JtyjdMl6YaHra8oljjsl
         sqLaMlbGSisP8VRgsUDNEwtwUgThLoNVKnhxrSNnOfntLk5bT65ncj4BknkktNBRdTBx
         T6qw==
X-Forwarded-Encrypted: i=1; AJvYcCU8LTfF2mj5raQan3ihakcTsbxyrTSWxG3A+Vx2UvSkE6P2Y1oweOT10nnEehr3eGSR8HBTT4cdCBTH@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAwLiUnH+iIv6rVK43qBEV4TC7tthkJjLf6w6JQWbB5HJ0IhL
	SXJwWlMXV5Rsys97uGKySb0jnF9OS8upEew9FkyEr+LpZ7N7/bDSt62/
X-Gm-Gg: AY/fxX5T1zbiyqPkuk02DePEUru0/1GaSIxtDTHzbFqRzjgOLuaNjO0b4C5BsgADRd1
	IQ7jNwWDl2AIpb0uyrx8Xb2Jax1O0Geu55gWAJrCVkecaalhKZbafyg948C3orwi3UiQFLbKn3Q
	duCxf+GbA3TAymkw1U0iHiQHCiO4eLrFQdlK01XwebVGw4KeWbypq0IElZRCKDkxkm4/aV0TvuU
	0d6Cynz/GmZNKCQCBeoDKc7thYA2gqVB0aGM0So8NEDJx4BJj1fXUy9flfFqKuWTR7yLuzqFa2N
	8FLXROW01PE8vJMcOMo6/YtezthnZvlrIyhVNaWUS2t6wOUSqs6aMM1NtN2Mvei76MrA7S3ud79
	xlmKKMOMoHBUcAupndX2Njkg5vYOQm7fp6ITNJQUqxchGHGtPxvbhUGgyDdfIaS3yDBw0JpwUR+
	h3IB1qsaEG4ZJQRVTtU5XyuKPh4yZO8Xp4
X-Google-Smtp-Source: AGHT+IET7IQnJW9NBpb65OlItl1guG9woVszRJ+kZSW9RdHnKQccOHSFq/Loyd3FgIyi5fOFPYZV2g==
X-Received: by 2002:a05:6402:1ed5:b0:641:966d:82ba with SMTP id 4fb4d7f45d1cf-64b8e944ef3mr17759280a12.1.1766687162003;
        Thu, 25 Dec 2025 10:26:02 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b372esm20774242a12.32.2025.12.25.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:26:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/4] dt-bindings: media: sun4i-a10-video-engine: Add interconnect
 properties
Date: Thu, 25 Dec 2025 19:25:57 +0100
Message-ID: <5967161.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251225103616.3203473-2-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:12 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The Allwinner video engine sits behind the MBUS that is represented as
> an interconnect.
>=20
> Make sure that the interconnect properties are valid in the binding.
>=20
> Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-vide=
o-engine: Add R40 compatible")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



