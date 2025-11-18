Return-Path: <linux-gpio+bounces-28711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37DC6BEDB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 00:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1D1002B2AB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D722FC02D;
	Tue, 18 Nov 2025 23:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhHKSvsj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B135127E1D5
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506994; cv=none; b=H2mlNPzTAzAyvlNqoU07ZxITOsKtYsdGNNNnOATC6PWxneX5NPrv8kBWKNlNU+mHhC5bBuoq2MECxVy66zUYInYfL7aun0jGJcwcURNEKDgKMmM6SI+mB3UoEKwbHXpiIWwwC46foQfdnQyvML12ciuZx9E7Vgs7OzWSujAb2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506994; c=relaxed/simple;
	bh=vU6avN5XDare5pteFmcqg7EhwweyrU+3u4FYVB9JBP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTFf8Doww+GSh2sIhMdZ9DFRhJBK3JQQcxp+rzgWMiWtdY8o3NjgfAq9Ms87TGQnCwa41pkrPw2AysWOoH/lcUnhpllAKUvPfWCTXoj/T/sXpEyyWAwc3pBD04ZJG2C2LMg9oQurclLdq7plupH3tp8HScZZc1vp//EecblN044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhHKSvsj; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-640d0895d7cso500978d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 15:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506992; x=1764111792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CkKy4I7Nd+j6TrDrYR1KHm4hZaUOzQggilxM6L2z5U=;
        b=JhHKSvsjh2lvxFrrXcU2NpTt80OFr9bi/ExRKBT0/D186JO7ysKvaPHhf/CrVeYK7K
         eCrNTcibVwGI+x5mJGNwpAqVeZUARe/O7NxtBwj3pwIpaDJvcbp/kSQUnlFMZn25eKLY
         JJFV/j/5fPlNEouPuZj2mBO4mLd9dO0rOnJ5y66DQXfcBLG18KS9oegIHBxIe3NaM3sG
         zuywYU/8dlRi/pgiMkOn6jVG3oNVfsPcdlAqCi3gluSnnxh9/uV278WSenu7DSeoxx3o
         fPD0KSRFxzuXY0wOMQS887QRpySlDgO4ZK8laj8xcU4hKbfIQttgCjpaCGdziicZWSPk
         o/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506992; x=1764111792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CkKy4I7Nd+j6TrDrYR1KHm4hZaUOzQggilxM6L2z5U=;
        b=tF4F/h65N1asZz0Z2JSxuMMM1IFCRisAN8zB/4JXKMs2AVf2TATIOImo5R9TIdOAGT
         T9T4IAqnsF6xmFQtAngid1ZJi8cVIF0wJqqSLNKRLaNvvt0L89ld+3MyyWAqakhnJMTj
         4KcL5o/qsWxZD5/kLLagn2ehwvwMDK3NYU/4G75OtZrpwXoQoYoZhU9Irbmcly0F7eev
         9plsNbp1QGCPW8CMZeTYEC+CEX3gpKVygTpAnAMuZAXjAGtJ75KIS6QPY0af/j/seAH4
         TjCLYRLmwcWRtJj+569VUQKEdX47PaB7NmxOtRLDAuN6vX52fge1f6iuuuzNoj8Pe52d
         PJww==
X-Forwarded-Encrypted: i=1; AJvYcCWPnlF+/Tn237gWNVCGvL1ctHUGgF0E4Gqx51LDgCNc8HR50BvUkJX43YUNWu4snZrNpQN87iU0t0eC@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtpWvbBGlGWFzJ8ZOJ2Qmj+V75RVvXOZC8z/Gwt9l4pUZCaSX
	u6dSwqB6lwi0FFnxE/t8Wz8yniTPBnjL90/bIWqvlfzcvFghHBFauMlTMQ5IwM9HxxbsVQ33V59
	0RXX3qy3mK96kfzKW0esiwdBYubxguSl4gDrt32ajkg==
X-Gm-Gg: ASbGnctRtcFL+9ari42z/niU9JuVP2/YUIJxuh6tPGlISnx0JLg07jnDaEWJFo51MUi
	hCieYl2kdoEPGaJEW9tkMrRtYS+ujsBU5LHpn9f3JRY7al/jWatmZNf8IYJVtpId6qaa68eLhQ+
	76qx8KzjlDJtDBS0k9tETymNgCvLNCWzWjaP0U2fHr1SSBweO7vX3WCXkc3oVzcy1QyQhOh8Q8F
	ZJ25cT1+fFqJX92iHrXE8wZl8xXRGafyWYvT1zSv5UYr1s47LadqV1geOXXXyzT6s8qJXo=
X-Google-Smtp-Source: AGHT+IEWG/T70U51QkboX+BFArhMW1GqtsSC5NyxbuNNMatQpKCwXgLG1q4spEcInbcCfufWgaMLYLHwYyBGvQc+TgU=
X-Received: by 2002:a05:690e:4106:b0:63f:b985:66b5 with SMTP id
 956f58d0204a3-642ed60ce63mr266853d50.6.1763506991657; Tue, 18 Nov 2025
 15:03:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115100000.177791-1-amadeus@jmu.edu.cn>
In-Reply-To: <20251115100000.177791-1-amadeus@jmu.edu.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:02:56 +0100
X-Gm-Features: AWmQ_bnUW-BUpl8V9jWIRwhTERbiqNe1byNfSmfq0uZuXktxGoeLDqptYWTthh4
Message-ID: <CACRpkdbMPGL=s7gmQsRTNpzdBanWHRX857bcg0Jiu0Zfp=hSyg@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: airoha: fix pinctrl function mismatch issue
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, 
	Christian Marangi <ansuelsmth@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:

> The blamed commit made the following changes:
>
> -#define PINCTRL_FUNC_DESC(id)...
> -               .desc =3D PINCTRL_PINFUNCTION(#id, ...
> +#define PINCTRL_FUNC_DESC(id, table)...
> +               .desc =3D PINCTRL_PINFUNCTION(#id, ...
>
> -       PINCTRL_FUNC_DESC(pon)...
> +       PINCTRL_FUNC_DESC("pon", pon)...
>
> It's clear that the id of funcs doesn't match the definition.
> Remove redundant #string from the definition to fix this issue:
> pinctrl-airoha ...: invalid function mdio in map table
>
> Fixes: 4043b0c45f85 ("pinctrl: airoha: generalize pins/group/function/con=
fs handling")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Patch applied!

Yours,
Linus Walleij

