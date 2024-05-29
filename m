Return-Path: <linux-gpio+bounces-6886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F8C8D3F00
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 21:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2285283675
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 19:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CCF1C2330;
	Wed, 29 May 2024 19:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUTNrFkf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1246219FC;
	Wed, 29 May 2024 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717011981; cv=none; b=O3apx1YPhqxuGNFXi7x+I+Hx8g4uifEl8Q7IwgqhME2ZhIxMnmeXAsvaMFTTFmK3x34l/SMzYpLGkN3aRZ336lMIp0PDuWXxcP8wnGXUFSArAPUwRoVTebVQEccLQrdLIuT2hsEf8XU5VuV9x9CuQAqGJYwUC2Csmg9vNd47vaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717011981; c=relaxed/simple;
	bh=JiLCa4M+GV+8Ik9X1BrNHTYYxtfnMvl7ikNZHguaXnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXkiORAQgUUaqjijDL7/+MxhBXLuNFXRfUw0CTbJAQ6Yx0xXp5gWdekBIEesTY1YDNCpwCXpZEJsFk0Zb01BIBMZTXMtV0qhDZJ+LaT423aKzfe5yHVlnwfuHJLDGywr9e1jOeTRKV4aV8bGNAUZajoKiFXFRnyTLaRvvC+zGfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUTNrFkf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6265d48ec3so3992466b.0;
        Wed, 29 May 2024 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717011978; x=1717616778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9K3L66JrsQxxCHcyJ7DUl2BI/mquF1TDYKxyl3bERI=;
        b=MUTNrFkfD90J3EGlPuWLhrM5iJwk5B7ogQAVF/M6ljMQx1Kz8WEe5xr/+Y7ftzfsCQ
         53BHTIiF+10W4G3XP0xwzcXKASKnakC9K8haT3g+G05pBrNl5WTOgQUKanVjIelU2dIf
         mu2+yMcgQ6hNWWl0iIYVhksFQz/acZDfiJnGzYTfVOsINxER78MwXdqj2XLDYl1v49oc
         MOKgZAptfXOSxKkCXt+Qa613NKeMWhiSRpZjix0L1gqOhsrbJvEBdSaVzdceXImUCbhz
         sCRT6fkv0fJ7CVGIWjjIROi2PA/X5NUDZF7kqSp6lIw3HUOIOKywidGksdWaMyeIsHuw
         Dyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717011978; x=1717616778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9K3L66JrsQxxCHcyJ7DUl2BI/mquF1TDYKxyl3bERI=;
        b=EjtIlM34eX8WYWRQUy0XGvuXI46b2LZKXyQToH5nSUH1rvAHIE18P8Q8pYe2i/N4VH
         zJ5ltsF+k9P6uZPDDkBC5tryVEINqAJotKQHBbV4KWDRkTtLuzKadfsO+mGJAnTwSH6X
         dIySfQzsI0ZRs8jlgKLFqY5SIgtqQBE1hLJk5NVqYhnJoFdIPtk0mhcljNSFfo1qrw0O
         YVWxYdpZ5j7tjQOjsorlIzxiSzZ0WXEPcQp0eRi5d2TdIVAbTWFZSWp67SoV2IbxPSrO
         y1+78G31j1feT+tSte2nWsIGkqnD8tVlbsIrfibQJu71k4TW8GXHTBjIcO9OULcngRb8
         Ypgg==
X-Forwarded-Encrypted: i=1; AJvYcCUu4nHGoovA2ngAGKV8AELxohNYvWzQclpXSvEHpbM+RbqAG1EC5V3bY7xnXF+dCn4/oJ6kplT1dfW0q9PN7QIsgQkZzv6Q7YumynQB4XJTs8VFodmpO5YAp3kKxi5vOLsu2gw+U+r/0crNje5odYzxZ5T1AOmmN2lBVwb/3hH0Y1jwURCIJQo6SAwVinOMRoeiXH9diugHZSrqCzif4ZLmQUbM
X-Gm-Message-State: AOJu0Yy8cpBHVC+PaBkxBI/52fl7FXlPtsdCGs7MxHsGL0D5F8FkOkN5
	hpRK7wmzf5huuNZV4Y/dw6HU/AU0sG+NxtYbinM+4C/3m/UZNH0ubMkbHw9yl15hem0503/Xr38
	PSFMwOXtezf7GRbv4mWFoL5kSSyk=
X-Google-Smtp-Source: AGHT+IFy1DdHPnET3S5rcX1wtUxbPXXfhSd7llDP1hK79djSGp3pk2YgfuRmMSb2EbQGo/xN3MRP6wolQFA6ZiC5toY=
X-Received: by 2002:a17:906:8744:b0:a62:196c:b2af with SMTP id
 a640c23a62f3a-a65e90f503emr10431666b.52.1717011977944; Wed, 29 May 2024
 12:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529162958.18081-1-johan+linaro@kernel.org> <20240529162958.18081-4-johan+linaro@kernel.org>
In-Reply-To: <20240529162958.18081-4-johan+linaro@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 22:45:40 +0300
Message-ID: <CAHp75VdnTQJFfqOdxC99gWckxebdUr4hV0wp3ZTs1Pey7q_fsA@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] mfd: pm8008: deassert reset on probe
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 7:30=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Request and deassert any (optional) reset gpio during probe in case it
> has been left asserted by the boot firmware.
>
> Note the reset line is not asserted to avoid reverting to the default
> I2C address in case the firmware has configured an alternate address.

...

> +       /*
> +        * The PMIC does not appear to require a post-reset delay, but wa=
it
> +        * for a millisecond for now anyway.
> +        */

> +       usleep_range(1000, 2000);

fsleep() ?

--=20
With Best Regards,
Andy Shevchenko

