Return-Path: <linux-gpio+bounces-5882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E018B3617
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 12:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 447031F22F6D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 10:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BC71448EA;
	Fri, 26 Apr 2024 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuSafFZI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6786F143C4D
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 10:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714128903; cv=none; b=Z9BQTdMWO2udJ8fcgyl2r8c6sAj/BgOeE9x185UQEjOPg78QBGMhnQGXRsA8/cu4HUrmc/BU6HM4xZ47UEEutQsgx/dt8bNFA55yD8rmfnTWuBBinvpzfQsNa8k2mMYA+pdVL+xbmA6gRlTOYzhYhCLGpHrs6QL1+9WbQqPlr1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714128903; c=relaxed/simple;
	bh=DIyBYigJJ/qTpLE5EewD87Aphyv6LkbS9QtWMPjRHd0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Shr90tMYg9ItIGv8vHK0SOlzW31rnIqJPuDvygsUH7vvHiR1xvaKFMKqGvDXrVcUfbdE79VFLPmSS42bemCWusC7kL70RZqXsoL6d5B1twtlejiUIuKn+5jvNJ4XPqx5W5J/kCQ7xtxT+aCe8dA6j7ZD9WVVUJfXwOn+g3KfNH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DuSafFZI; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2de232989aaso22166861fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714128899; x=1714733699; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DIyBYigJJ/qTpLE5EewD87Aphyv6LkbS9QtWMPjRHd0=;
        b=DuSafFZIzN52bdTGiaUJXRuSPumFMeA/xpFEKs6SMZaZL/v22SGx2Cu6pVaXyatGYo
         zWiZzHcO6PusXJcQvQ2BADO7i8rkGcjlbUjPUp5zp3T3etUGonr0XcACuz5wDTvZ3SDN
         UlHf44D5XXlrp0JlwDrNUFWM7WkpurF/ajL7Mt+Yt/RlSiQO9Z7yox7n7soiiVyv/REG
         r9pwAKf1tybC35POhsjiKMsgxuKOlO5xpsW+hTi43sc6mbkwMTWErj1zk+7A0YgcDn6K
         zsggJhgDsf4TRi25aFwPhFRTuqfHUtK6lyl2DjTG1xUaiPz/Gw9FySv+IZ0ZSNLA2iZh
         BhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714128899; x=1714733699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIyBYigJJ/qTpLE5EewD87Aphyv6LkbS9QtWMPjRHd0=;
        b=N0mvpbtB9kXPfUfB8T8ymJXwarcB2pleL1tBiUyKaTKDZGiVjzi2wezqCTF07huthj
         wNW03xOEmrp9/csbONsZ6U+6tWKy2tCEVHvDKfczgxWuDHnmLq5EM/npVB8SbnmacB5K
         d3F2qH15/wp4KnXzd+Eh08CGG9Vgn+gOannC/hEELgcySl7bkUT0WBRqPNIoNk4x4O64
         PMAqDJKAdJT0s+wotVA43t0KhR2LcZUunN6r3qz/RCH1MCaYc1gLjyLcSbrfpWuOqQOP
         qQ9qIoIIfnCrOAX+pwlphFzUiGKgCNRdDEp539DsGaMUmOytJtM32ohaNmthtsais/ol
         7N8w==
X-Forwarded-Encrypted: i=1; AJvYcCU4KPgAAq0ql+2sLSkneQELqqslFUEt1IuLH53P9ZUcii+TZ0WVD3YsyokyGRDi0SWHjwFKEB2ca77Oeo7d8j2XuToTOEEda+g8dg==
X-Gm-Message-State: AOJu0YxEQb1XyfY+9pkUcxCCyeWUc6AgxIPdoGqb9ozp1HjT1YQ+b0fP
	OuB4vfz2L1ykFSujX+PyUeX8EDaG3h8+R/B5WCNGEtrOupSHPpv16w7+q6lKx+M=
X-Google-Smtp-Source: AGHT+IFyC/4QrUfmFma/svm6P7ncU0LS1OeE3p4iwwLxVeaF0tQ3vYyuoA8eoICoNDNcv4AhdWdRLw==
X-Received: by 2002:a2e:be0f:0:b0:2df:48a:b8d9 with SMTP id z15-20020a2ebe0f000000b002df048ab8d9mr1837667ljq.35.1714128899379;
        Fri, 26 Apr 2024 03:54:59 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c3b8600b0041892e839bcsm30822115wms.33.2024.04.26.03.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:54:59 -0700 (PDT)
Message-ID: <8023ea8c1eab725baf0389fe34b918bb5dd924c8.camel@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: samsung: google,gs101-pinctrl
 needs a clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Peter
 Griffin <peter.griffin@linaro.org>, semen.protsenko@linaro.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 26 Apr 2024 11:54:57 +0100
In-Reply-To: <013f2da9-1d91-4b62-b5b7-d603d0c09aef@kernel.org>
References: <20240425-samsung-pinctrl-busclock-v1-0-898a200abe68@linaro.org>
	 <20240425-samsung-pinctrl-busclock-v1-1-898a200abe68@linaro.org>
	 <56a32a2d-2f6f-4f7b-8359-6f3062c010e2@kernel.org>
	 <013f2da9-1d91-4b62-b5b7-d603d0c09aef@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-04-25 at 20:18 +0200, Krzysztof Kozlowski wrote:
> On 25/04/2024 20:15, Krzysztof Kozlowski wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
onst: google,gs101-pinctrl
> > > +=C2=A0=C2=A0=C2=A0 then:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - clocks
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - clock-names
> >=20
> > else:
> > =C2=A0 properties:
> > =C2=A0=C2=A0=C2=A0 clocks: false
> > =C2=A0=C2=A0=C2=A0 clock-names: false
> >=20
> > but anyway this is all a bit fragile, because pinctrl is not a driver
> > and you rely on initcall ordering.
>=20
> It is a driver, although initcall ordering is still there. Anyway, it's
> the first soc requiring clock for pinctrl

If I see it right, E850 has similar gates, and like on gs101 they're curren=
tly
also all marked as CLK_IGNORE_UNUSED in the e850 clock driver with a commen=
t that
a driver update is needed. I've added Sam.

Cheers,
Andre'


