Return-Path: <linux-gpio+bounces-14930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A70AA15C4B
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2025 11:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7AA71888D6F
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2025 10:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AB31632D7;
	Sat, 18 Jan 2025 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnv2OWOH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299918660A;
	Sat, 18 Jan 2025 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737194862; cv=none; b=M4wZHQJ6r1Y9BAAcXL/s7JYvdIv+RUMyzrj2pW9rDaFjTkRgqhyzf4Bhw5BcC5xioBR6g+6u4eFLRG1bebDAXXyqVGigT8Uv6UrXLp4cKlxQSa36P+rFr43X3nZ3O4UhYRpNlQz/p23XBgbitqBPeTPGqQN7Z3S3VFsvw3RnGKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737194862; c=relaxed/simple;
	bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEz0rkkjq4XUwnbQ12GrbCmFfKPlYYZy/KpQzdvjDwymoTzlhT1TC8i7U9wGsuVzWusoifivbmxm5lDjtr8LQz4Kvu9ZFoQrs4xcS/GFbUtsC55eGAPEJqR8XtugNhgj9I5Kht7gbGzAONZfGk120T/mMvg/WJVl9KNa+C4q8vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnv2OWOH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so583511966b.3;
        Sat, 18 Jan 2025 02:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737194859; x=1737799659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=;
        b=bnv2OWOHJ2rQCnyjc/7Q84uYT/iN8ScMKguoQ9Ii1HBiHOsqUfArRVmjGIuBdyII6+
         veOxuWtFwVCO68UHZVutUgtX784DN5k1fu9rmiFwy97P9RbHvdcBaQxoGoPAQlKWtLMv
         LAUYkhF90/v3rGV3/hpLcjADaNpW3YG40CbSJ+4CaeeIhLyvJ9NmfZjRHecIjX/Dc4bG
         twR9ei9gJuNdFq3XboWBEINool7/8uRU6U33zHaQ6ASlIYhbbedE5Ib/PIzo0JsU4V8m
         y65QBM9bz037RXNG9QbqIUJVVc/P0fg4uIXFHaYJU1aS/W26DpC5Hc2GqVEKil70UT0S
         XUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737194859; x=1737799659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=;
        b=mnhrG0mNt9pVbYk+f6Y1UZl2rDKKSqR3+ZgwOMC40GOvCqtw8NreQwyEJav/mD0aHW
         3Qb66R4qhz+LyLrhEgadQBbtG79LHE+LrDIjCkdwL8ezs96DfT9/tVCjOzgtZ8zCLybC
         ozrpAfRIPGS04Z6T1UgnkPChi5/2ieERDhHmMFr4KxbCAuBk90VLa02AbDZ4SLxm4nyl
         H0kaJryzN4kH+zFFfN9HmEQkJ/QGYgGkFpD9TRtUEz0xKbXJ9SlWbYAu4kV/w+GBZ5jX
         BiREefGXlWOjSWYrbR7+SgwfAjaEv1donSeC5MqaKPFbUE8S7H83xiqEicdPv7Fl594i
         i5oA==
X-Forwarded-Encrypted: i=1; AJvYcCVvvHLmc/MZTSgrP0+VL05WUtq0e2sx5dRtNCC7v+OglzvUPXVRE1CR5MIThSRC8/3QeZbVRcpLMbuR@vger.kernel.org, AJvYcCXxvceQU6DYE9d9VfXj3M52KJ/DkE24IEm9J9EVD8t0+DXfuYw1Z4IJMEwlUsISYHnjvVDhdgmKegxuTiyu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6N+ycaPdFALh0+ewIDmzLnFmIehmaVSVdsV1OwX2e/tB/LXzn
	C2VrfHYwBDG+hxvMLoAxUVU/peBksKlYztMpPuRysiVSt6KQv1xu
X-Gm-Gg: ASbGncsr4rNSFM7i/xF6XYotdJUkxKfPy4Zd0XpN6H6UDMwOxFzPX/hnV/KXjUVDH76
	9wjVyhdowy5zmnUAM2Eiav/YM1xTR/PhhnzrbUNQ0aa+78wX+0rcyXUuZ+DWdBvJIltooECVoh4
	5VZ3Yd1N0KhjYox2L6mEOZr/ODRYNvQ7GMuM+Z3mkeqiuKO4XlrSQckim29n0UMrbAJsdJVVFua
	C2vPtm2io52a4QSIN9X5pLu3XUBHrDHoF3JogdOF6Yyg1ghfNxWp5mgmOphJWtCF/280OhbVm3X
	1Xx/7DpXjqVqwcw=
X-Google-Smtp-Source: AGHT+IFsvrKMrEz8QcePe/YIiTwNkbTjp5GTltW896PPvrsYo1Lns2fM/cz6NBZTJCkAVR68cgnrdA==
X-Received: by 2002:a17:906:3a87:b0:ab3:a190:6cb2 with SMTP id a640c23a62f3a-ab3a1906e5cmr213892566b.25.1737194858490;
        Sat, 18 Jan 2025 02:07:38 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2d3dcsm308908466b.81.2025.01.18.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:07:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] pinctrl: sunxi: refactor pinctrl variants into flags
Date: Sat, 18 Jan 2025 11:07:36 +0100
Message-ID: <1881692.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20241111005750.13071-2-andre.przywara@arm.com>
References:
 <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. november 2024 ob 01:57:44 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> For some Allwinner SoCs we have one pinctrl driver caring for multiple
> very similar chips, and are tagging certain pins with a variant bitmask.
> The Allwinner D1 introduced a slightly extended register layout, and we
> were abusing this variant mask to convey this bit of information into
> the common code part.
> Now there will be more pinctrl device properties to consider (has PortF
> voltage switch, for instance), so shoehorning this into the variant
> bitmask will not fly anymore.
>=20
> Refactor the "variant" field into a more generic "flags" field. It turns
> out that we don't need the variant bits to be unique across all SoCs,
> but only among those SoCs that share one driver (table), of which there
> are at most three variants at the moment. So the actual variant field can
> be limited to say 8 bits, and the other bits in the flag register can be
> re-purposed to hold other information, like this extended register
> layout.
> As a side effect we can move the variant definition into the per-SoC
> pinctrl driver file, which makes it more obvious that this is just a
> private definition, only relevant for this particular table.
> This also changes the artificial sun20i-d1 "variant" into the actual
> flag bit that we are after.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

That looks pretty neat cleanup.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



