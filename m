Return-Path: <linux-gpio+bounces-17129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54FA50871
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 19:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CD09188A635
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 18:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F7E2512D9;
	Wed,  5 Mar 2025 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqfls+NU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265B19C542;
	Wed,  5 Mar 2025 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741198001; cv=none; b=TBYamhxwzOH/xq/CRd9rUfdSpWVn1yQa/hMEOlEJpIXHYEWhQ5kN4y8mX3XI1xV26nhRiNx/a3/rvBvWkDf9k7z4iEozF/gRMfdf8rhHZkzUfnEYgdorBca2LyXQaQQvmcrZfQCpJaCJaSXdUz9V97nUGQIOsA+AoglRZ5A/j3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741198001; c=relaxed/simple;
	bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iVMoTS46A6IGnNBI1mqFT35B8YI3yTLARcX3+Mm/beaRDCFcJ5bCf5mey8xb74ZD/H32fD4ZGL4ofjzr74U+aqNZpMefBOHa2JGIP+cvDwfXBRnG4LQQOnL7AyKMXfzPj/Oq+hJGbTc3Uw0W9I3l4O76C80EFS7GQO1LsvMlkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqfls+NU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so4282422f8f.2;
        Wed, 05 Mar 2025 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741197998; x=1741802798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=;
        b=nqfls+NUN7KxxqRMkZlJ74vcPrLhMZr5E13csuCLewHxTX7Ys0q72r1N65xYaQaJW3
         r+c6QkX1HHxurdgmi6SAp5GryFStJe1uBeuz1RvXuKOarfVGM+heMHjXV3ClLGRnzcwx
         J+bLroX0xV2MvpiZNM+xcHy4hxpLDhnW/m1J/rWd2Kql9Ie+cJCe5MxOT4Mm5BSSsWGE
         cbhVd0Zu3a6EbmmU75Yo/5Zz2exFiOS9VSOso56VhJ5i5f1q7QHNK4myhYZb4OWd6IkS
         kQqnDxyQWh7MQUgKN1uiDvnhDOM2hmUusTQ9mUHd75BMHWROgDZ1WWzjiQH6wlPyHSgM
         EK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741197998; x=1741802798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=;
        b=pRP02Rc1k+2xFgzAtH3+srTHvwCPZwL1UmlI2u9z2rMMWrcNb2tMK+SAWObKGh8CBA
         gx1yhukr1KqPcRod2gkaSSK+8N+FXFeXHMLJA3zWv/8RKdn+kiz6ko9sqngLi3ZntwQ+
         FSwg0Vmj1olyVL7tN2togj0SzlRe1oli2O43gOM2lWyhN2FBNMdUb55+hEtTHK9Iw7PH
         UvX6ZjnkoYxTVp9sFrgnoU17mmkVoV1A1csC8l8uUdQLd60kWcNCww5TpiDtk4m3lZFQ
         mYD1XTbtXymSi5IOCzgLp0/ordliAPdtcMJxfoT7o3WKk+9yKNosSmowu8cUdBXLB0yR
         Ip/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5mtzSU+ZmizoBjTI6EpkzTffT6ba+fVhi8R2gNlUpkyz1+L4Jpi3WwSgtV+B8kUCkLBXCG3IWa0+n@vger.kernel.org, AJvYcCUFWiQzuO0iQrzqMJ7/vl1pLDrP2/M826hmQPOjaOhHhxeYkhRaX2k+1UvrKMHp7Wxw22tl3y+0d1f4JOfN@vger.kernel.org
X-Gm-Message-State: AOJu0YyaC8JD1Ua9f6u4GQNeEstUl5dhw/1yZLYORzkU56gqPhqPLYwc
	D3bopoR6Rw9fyIVpch3+pWkJdoGvmiJ8ZSA5CQO1WiE4JNV7TB33238soSzl
X-Gm-Gg: ASbGncu6O5QzsNva7bMOnD5NYalRDXUqHwIOtBAPrUUC2iHI+3hrUGVXLMrIzYrzfX/
	wlePH5XUmpeDaHqEQI6ahBN1cITBj89cUVhzgX/0qbFqFtIU8x02Ee8FxOPuZLvD87o5zxHqXrg
	T8qEo7iVPBN3PnoQHA5XAhzZXk1CnSRgS1lNIfHJTQdq64Uh7ZcemHgn7XTY+27sUVJt07ISVL8
	qAEQbvyhaWj6qO6zMui7oLgxSv2Y4O4y735SMOhtNVwv4zABvQwcArmDOsU6UAe25agnUbTSTPH
	Y+G/UOwq+cKRKvEbQOHLyz35Iqz/gtlyJTE9tfri04P2BghiNbh247FaGwUZHLAujKOyIWhsy+W
	DbE4YcwFvL8t4it02u4JX
X-Google-Smtp-Source: AGHT+IG1tFvNWMKO6G6LFqagnscLlmftFC9LNAnPFI5pXvS1dut8feyFYZwx6Hi7jOMoJqthxyeJeQ==
X-Received: by 2002:a5d:64a4:0:b0:390:f641:d8bb with SMTP id ffacd0b85a97d-3911f7a9573mr3273237f8f.36.1741197997875;
        Wed, 05 Mar 2025 10:06:37 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4292f0bsm24542165e9.15.2025.03.05.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:06:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/8] pinctrl: sunxi: Add support for the Allwinner A523
Date: Wed, 05 Mar 2025 19:06:36 +0100
Message-ID: <1819482.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20250227231447.20161-8-andre.przywara@arm.com>
References:
 <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 28. februar 2025 ob 00:14:46 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner A523 contains pins in 10 out of the 11 possible pin banks;
> it just skips port A.
> Use the newly introduced DT based pinctrl driver to describe just the
> generic pinctrl properties, so advertise the number of pins per bank
> and the interrupt capabilities. The actual function/mux assignment is
> taken from the devicetree.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



