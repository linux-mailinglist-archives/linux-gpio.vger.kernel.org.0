Return-Path: <linux-gpio+bounces-28445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7136C57B8A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 14:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5876B355917
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 13:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4541DE8AF;
	Thu, 13 Nov 2025 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8GpjPHj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033D29CE1
	for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041021; cv=none; b=WeAbnR0GwUyiSzuEfaC1pBypRSbgtfQqdQQ2hw3KTBHjN03BSU+c4AZZQRT6R00CFlZGpi7yWfZnu7HChcDuPfU5AgpzWbCWwmlde7gFz2rfTT8zyoFvKNg0emU57BrMBslrWDM9/aVJ4u8fULhqq0t4IHu75B447oMiQ7XgTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041021; c=relaxed/simple;
	bh=bQ+P52mNlITuRTiW9s5XEFgomZzd9bFBs7jFB6ckx4s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LvP0vqyHksAAchOYD6+fS75uCIc7zVilL+0lM+MYc543sveDgVkryi3JDKIxn/yYtstyIV58Xz4sjJdpf+HyME/01/BjmChWTF6rKjhlLg7hnD/FZX6JwnaUrhi/tVXuj8ycJkhd5nwp7XM8fV/xTaqTU3paFyd3WZn64AFUBA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8GpjPHj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso6183845e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763041018; x=1763645818; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQ+P52mNlITuRTiW9s5XEFgomZzd9bFBs7jFB6ckx4s=;
        b=N8GpjPHjPV+MezPF3iWHG7PwPq0xv/G87Yk4awggJ9C7SsfsNmEADgJMPGwYoAAcq3
         YO/t6JxN4Yt9Z/CzOV4abzojq6rSlj4gOYspoLGbj8nHGAsfs5zG/Cjw9UyJFf6NEC69
         EDU6RQYhOs9dh4TjmX7dtKGqnV6srSGEWVBykpn592BTDym68BwgT5pWf0wA9mNgKOg1
         IF1ALuG1Oj0xdNNv+y3ICIBCK/CxzJ48sWuX0pIyXCD4BXrPoC8VswfO70H4ox5u9d6i
         DR9lGdQ4Aj7jW0f/hOFsxiKPokDQbYpDDZxpzPk/xYknvXdvXe5fUrPH2d7HqI+ebpgp
         pgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041018; x=1763645818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ+P52mNlITuRTiW9s5XEFgomZzd9bFBs7jFB6ckx4s=;
        b=wQZcgOPpRHfvo/Nrqal6p2p58g9A+slNrGZ5HUcnQfkdFo/rkYwrOlEGB88FKpXNOA
         1ddgIzTWhxEQIVe02Bw2vd0FQwC4wi0wGfgsI94IBGPRqR1cdgCNAOULXT28DP45mZsI
         1mC6wDpnOMQEa8g9jYghDse1tJo4WA5NgLlA2Ojn9NxjA9e1AtItB6bXpKu+/pXPt/YM
         MV1MklCiojtNgk/sVvfD2/JZeCcySvqYASfgole0J4DcJRHchfPO+VLAykMJ77Ueb6NL
         BScRt7k5NNY29NKBCBTpaKlIQ6CwgwSQUJWGgYsOuD0pShAd7mAlkuhxzP6Vee6VI8zZ
         GG/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUywwPjTMlfVuGdJ0Z0DCBYVPDPIvnfKqu0+H1wbrPXrQVJQiIW6wYn3oOYyf2xA48ap9eZ42sJkDS/@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyywQpARUl/82Qu82yUsQNrQLKTvCQIYzxjj0BEI3ORYrvZKR
	0zmwgM9NAeIENAnrsXJRr4ccFNnpPqMYs9EnFjoo74VCGsLmUQsTADDveMX6UUKAe3o=
X-Gm-Gg: ASbGncusnNMI+VxuqaviOxu3dsDcCOUCFuh9+kBHAsCHpnAPRqJUR49aQHWwOBfAvjb
	hRaVACyCoc3YwTFYiGbgA5vNU96dWS1mrdcgpg6FZvzD3REjzBBzrKAO+ysiWObkzU7WA9W6QhJ
	CHoGcS4SQvR8/co0LbsjxInDfDIKUyIW8ol2gzPnxgG01q+i2TSEnHvVPkrY05cXovvTKbLwv/N
	yMEtC+PvW2z3XR9gp879rGE47jgM6OWlF65d/i32aBMMIzWMKseifFo6X9uLXlWO1BDZ2NX0WNM
	3pRAmGZEF4e+NC9ea7TADhmORW+Mzp+WCUEWTvGuBRGdsrBXGEYrmXLcL/8L4lzWCrGt4/sQxW0
	0WomqZaLvgsWBuxFO+JnD0YdPfNPFJm9ExT2ETQAxbNbM1A8nnhwTswDSVhmTd0RRuEn+cH2Ott
	/m0RRp6AD/CDwEJVM=
X-Google-Smtp-Source: AGHT+IEkKKvXAgOUI2Gp8aNFTSnGeJkVMys49MhyLUt2uRO+8qeq7VUrFz/uoy33AXxXBmgM6zvg9Q==
X-Received: by 2002:a05:600c:6305:b0:477:79cf:89d4 with SMTP id 5b1f17b1804b1-477870a6581mr59325775e9.31.1763041017943;
        Thu, 13 Nov 2025 05:36:57 -0800 (PST)
Received: from draszik.lan ([212.129.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e45677sm96382115e9.8.2025.11.13.05.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:36:57 -0800 (PST)
Message-ID: <5e58b99bc6d1ef9169a0600f6694c0ee34758389.camel@linaro.org>
Subject: Re: [PATCH v4 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Thu, 13 Nov 2025 13:36:53 +0000
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-11-10 at 19:28 +0000, Andr=C3=A9 Draszik wrote:
> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
>=20
> [...]
>=20
> A DT update for Oriole / Raven to enable these is required which I will
> send out separately.

https://lore.kernel.org/all/20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42b=
e1@linaro.org/

Cheers,
Andre'

