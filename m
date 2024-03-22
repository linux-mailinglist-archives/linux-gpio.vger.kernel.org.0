Return-Path: <linux-gpio+bounces-4531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD774886FC2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 16:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BDC41C2251E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 15:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C3F51037;
	Fri, 22 Mar 2024 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eON5kHLq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E884644E
	for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711121053; cv=none; b=T9ToggMMiyhG1KnbW6EBofpZ6dK8kKHvZUczsS8q9laAeBCR0oL3ymJ0LK1dAUEw9ATwyBR3l5bdklMhNpbQsRfuoK7W/yhy4pN2ti1asTowPjVJ7mIdS91guX2QRIZj+hQWK1d1BrF4wy2rDWk+i8FXhKZysdFf3sxbC2YToJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711121053; c=relaxed/simple;
	bh=hS562j2wjaOt0N57BvSvCyDJPuAAyxqtyZpFkCvVJqw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=CajtjkmJckiWUyG8pzeDEoe9aHP5C1fuaObm2SPIkCRT98wrMbQDAmzLC4esg+2dQMh36HaAb+iIU269BDArSGh4BzkE8rgVOrcDtmDGP1oHFt27l4keMwTokHZrKnmGd8s/dwVQJlQJUVByJjNr8E/xK11S/Ru6ebI5LXTUVu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eON5kHLq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4147b5d8a0dso5310255e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711121049; x=1711725849; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS562j2wjaOt0N57BvSvCyDJPuAAyxqtyZpFkCvVJqw=;
        b=eON5kHLqMrgX/5Aaq275aXbh0DIRg//5Fraa5/yVTvScAJqv9jRD92UJwuvdzIKo4h
         YT4W4xugJxqUvEXuKZWndaJCtmxA//hmSnY7QVlfDMb+OFyfEfFVz4LqepW36WSW1bhj
         rvK8WeMg9k/JKncNv+v2Rdc32gxqk8nO87mZH3eEySKyEv6RYWiJyzb1g3DGCkE+5mJf
         sSFCK3qxPFtQKdoAIhfFPy2tNNrh5MwhpjxiQkUN/QFKTruRw/9CXtU/XZM9IqR34QBd
         lk8bUNfE1hrzoqI0EtA5yJLmn6cJ53hN1CjDyYdM07R+vM9+fUJuWxY+0n9JjTzHZSDd
         KjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711121049; x=1711725849;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hS562j2wjaOt0N57BvSvCyDJPuAAyxqtyZpFkCvVJqw=;
        b=oxz4A8C2oWmRaudRbx9DHrp7rD16jIGSRt80BsIxyKBnRV0xdSTkVqjgqpq9sdVfvn
         Kk1UDQZ8iUmLBBddatfpFeoqRhR/lwqvG77IL30ejcib/lYLxN5amwnsDOrFFteOjcj7
         bsIHdqkCCKruCYMJDau/ZguaOGIjJoWcwEtVzBUw1kQkw148hD+HnQ7qFMapZAtI7hds
         42Ked+sNxUdZmGHV2Rfo3UPZnmfzLW+30ULE+qiE86LJCuI5tz98lZkM+ohfVwzN5ZfP
         LIcCHxh2Kq1ZhHcsp3U5c+btwkG8OdCfRtIipWu04ZI3Mo8Fhc83OSG1A6gfnPXMuGx3
         1heQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjYOrZzhMlmiCDancBMqW9ZmZ7corD31i/L/UYRyh0meIq9vED9YLOhiIT3xnwmL7zK0gGNxDNmZHi+1MQhQN7b3Sx5n0HpCSSEg==
X-Gm-Message-State: AOJu0YxPskaKcZLzXehddcAOD5iGvA1lb4qlDRIAXrFmWbA2CWet8UPe
	tzKNx6sABD1YKJEpfRnvePv53sWsPL6DhN5i6oYpqoBhconv1Xl/O02VN2RLYk4=
X-Google-Smtp-Source: AGHT+IGyGffBMGrx3OMdpMFt5SyYdj14zEn+S9LVCqQbBaCQ3yQIh9JNuaDa2nXiTbGBEsxD9bO7RA==
X-Received: by 2002:a05:600c:1382:b0:414:7db2:8c04 with SMTP id u2-20020a05600c138200b004147db28c04mr1193633wmf.10.1711121049201;
        Fri, 22 Mar 2024 08:24:09 -0700 (PDT)
Received: from localhost (alyon-651-1-22-137.w82-122.abo.wanadoo.fr. [82.122.123.137])
        by smtp.gmail.com with ESMTPSA id v5-20020a05600c214500b004140a6d52e9sm1310844wml.1.2024.03.22.08.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 08:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Mar 2024 16:24:07 +0100
Message-Id: <D00DSDGHFPLU.1MTQNFWP5DF0J@baylibre.com>
To: "Bhargav Raviprakash" <bhargav.r@ltts.com>, <jpanis@baylibre.com>
Cc: <arnd@arndb.de>, <broonie@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <gregkh@linuxfoundation.org>,
 <kristo@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, <lee@kernel.org>,
 <lgirdwood@gmail.com>, <linus.walleij@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <m.nirmaladevi@ltts.com>, <nm@ti.com>,
 <robh+dt@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH v4 10/11] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC
 pinctrl and GPIO
From: "Esteban Blanc" <eblanc@baylibre.com>
X-Mailer: aerc 0.15.2
References: <b473d940-0301-472d-90f0-297da6815377@baylibre.com>
 <20240322141043.498005-1-bhargav.r@ltts.com>
In-Reply-To: <20240322141043.498005-1-bhargav.r@ltts.com>

Hi Bhargav,

LP8764 is not supported but the driver was wrongly instanciated on the
MFD. For V5 could you:
- Disable this driver for LD8764.
- Make sure this driver correctly supports TPS6593

Best Regards,

--=20
Esteban "Skallwar" Blanc
BayLibre

