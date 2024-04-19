Return-Path: <linux-gpio+bounces-5690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED82E8AAF61
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 15:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9A93281B33
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 13:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BC212BEA0;
	Fri, 19 Apr 2024 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0zhs5QQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866484A5E
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713533526; cv=none; b=V0XrqCSrGl1ZWXjkmZfOCvLI2F/QL49Tvsum2XB7Zi9CE94vApdDTGS3VBVcUmfxAAhhBl+/J19B+ELbzG8cjplFiN+AvsLsmuwk9Bj/hv5JHsfJRdMPtFkKnfdk0rPMt4zWfmbHlexd2Lq53P0rVrr1Xil2ZAjILiAMI3wkI1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713533526; c=relaxed/simple;
	bh=fhRZLpFsQ7ybY9l+xJ4w5t3vGVBb7qMjYrDhTzkEaLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKXNRT1Ufi8Pc7vAfG2ZjQ+H7FX6QB1A9SI+WDimoM2a//IzXtIsDobyidmm70yDkRBEvFoBbkakkQkrcejFo6Z3PVVtHa3Ok4r+3sStnUqLCz1Wht0MVSIABO+lEfWo7jcrPDTxlKtX/f9BBcTaO4T8IEwNegrtTEVVaQR3dms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l0zhs5QQ; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de466c64163so1884482276.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713533523; x=1714138323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhRZLpFsQ7ybY9l+xJ4w5t3vGVBb7qMjYrDhTzkEaLs=;
        b=l0zhs5QQ46Yrg9eznLOBmJB40eeR3b3xojDdVlcHzBBBsv4Ici7Zb+aVEp54UG0V3u
         v9pci332u9976NuzrU1Ca6NTqlG0Fz+kYn7ITeCBKY5xEw6SQ53sbH16/oWMKqmIn7Ua
         ErD+7nI59w6NDrqvEOMv5xCh6vqMEpHAYBraxctXaUZXpwSEW44p9c2I+JHKFj9US5NW
         Hiq/L5GtSU3X9fEb7rstVRSOO8S3dQ5QToJdh5+z2g3MkKXARY0I79Iq7PdAbbGNjL56
         lQSTjEyHhTVK9YlgguQxFL71kNlmxcD5Cg+F3CPRmBvpXk5Tbc9SfjmaNEE68+lyFGIS
         fxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713533523; x=1714138323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhRZLpFsQ7ybY9l+xJ4w5t3vGVBb7qMjYrDhTzkEaLs=;
        b=qydw6eVj/EagVho/uuvviu+RfEiIsSQDFgvhUH+88WUnxc5QgSrsG/mezvjlYmwrsG
         Ix8CkBl6cSAPHH4bpeKesmK0ZF2wMAgO7aMyal42QiaY/5GnpR3482ig+Ncc1Hh8h5t2
         NjWlZOay0d4VTsIs9OXvKIW31ZtZopMiCetHpKDflYUjiK6D/fOvXwMU1PG9ep51lv2n
         b3yKa+gDOWUMd7pTSPv/AkCM5rgXLu+tZFE6u2ojJ3hmV1V++SkOCej/RcgKKQHpQJYb
         vMSxVbCZx4VCzexOCIlyIfWjPbusxqYFYSNCO6TpGLK9ya4/GMOPufmRvyAn5ej/Zjg5
         EeEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUiBM+4JXh/ifQD1lPM2evH6MaF2MZ9IQzoYR4HNwN5BoH0lwh7/vbt/Jdt/FBt6cTOMpX3BI3VT3t90XW8KCChGu98W0AFKbYUQ==
X-Gm-Message-State: AOJu0YxAQJlwJEHVyya8vLsHXLtefhhXSED4CRSXudWgE7C4H6cSjL/h
	h94N23eqMO7e72N+jvX60Nq8O8ABjQHbcOv4da2BSZWUnzuXesJZmcd/RzFSWQeb9kMzHtGmmOH
	wimaEDWKUUXC82QRKGzxIrOH0KnXuQGPkybux9Q==
X-Google-Smtp-Source: AGHT+IEou1g+hlEnF+UZTysGeCw64FZcHI0UHv68Ib6xcR70RGN0JzF6vOEoAr0MN7ZeCOnx92d1upOtm7sToLZnVFo=
X-Received: by 2002:a25:dc53:0:b0:dcf:f78f:a570 with SMTP id
 y80-20020a25dc53000000b00dcff78fa570mr2107378ybe.7.1713533522845; Fri, 19 Apr
 2024 06:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416161237.2500037-1-knaerzche@gmail.com> <20240416161237.2500037-4-knaerzche@gmail.com>
In-Reply-To: <20240416161237.2500037-4-knaerzche@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Apr 2024 15:31:52 +0200
Message-ID: <CACRpkdbRTOV=t4Y+xKR0P+q=N9XmTWkAWHWptF=-uSrA-9Cq_A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] pinctrl: rk805: Add rk816 pinctrl support
To: Alex Bee <knaerzche@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Chris Zhong <zyw@rock-chips.com>, 
	Zhang Qing <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 6:12=E2=80=AFPM Alex Bee <knaerzche@gmail.com> wrot=
e:

> This adds support for RK816 to the exising rk805 pinctrl driver
>
> It has a single pin which can be configured as input from a thermistor (f=
or
> instance in an attached battery) or as a gpio.
>
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Lee: pls apply with the rest to the MFD subsystem when you
are happy with the patches.

Yours,
Linus Walleij

