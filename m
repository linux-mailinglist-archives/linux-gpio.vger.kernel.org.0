Return-Path: <linux-gpio+bounces-20369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B6ABE695
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 23:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DB297B363F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7926125D1F7;
	Tue, 20 May 2025 21:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKTORxvI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B625CC57
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778267; cv=none; b=DyZQp71XKwWhzn/NoBwdPPwyA/SwNGrJepuSQXlH5f/iPz063ZbON9CzUXwYoeucNICHQhFVlp9ThtWGXQQn6jiStuV5nP59hkAedzn54ddJ78j7hBiVbh+z7Y0Z9VEbjihm4eNY5ln/DcMQMtUAtKNT5T/bKnrDxT83z1Qin9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778267; c=relaxed/simple;
	bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIQHvB39Spja3CdxhGK1u66iUBJzl9kPef9WDIUUyq+IgVt07TWNQKRLYyuv6stDaFBuVKIXLQ6nhth00IC1Y6ho13ArUxNSYhMlH2WEsGnDpznlIv7hccUNq4uh/y42o/31t1WRu8j1gu0HPvzUHgh/iajNMNL0dZtJ1JSFKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKTORxvI; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-329119a3a8eso31733131fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 14:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778263; x=1748383063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
        b=XKTORxvIwDcLLfX+7R94X7uuTL8r+zFux/DwH7e2SdzbFWzRiZmRdbfCF7COc0o1jv
         tRISnZLImzoSKiHxBbvW40hryXpw4sjys7uHLHYrWqN/pQHhJZ746mE4c1h4B8GH8oml
         tWQGGbVC3gHKR+nCoBVx2z6on8DIn1KOMfwyMlyMD6+nZCmW41Ek3Vff/+YakYOxDwBD
         v/4B20LaTSY0mp+UBAR1xiObjIHTdwcnxL4rrkFtNrU4ADsPAKk8p7O8ORpNMcNFQmca
         FiCbuLnxTJjjszaI9S9szY392c12uUCI3ROtfaUXg7A3oCabI/Nrpj4x6dr9BUGWtm4t
         Klmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778263; x=1748383063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
        b=wziGiJAHBMxDGsqY/U2KCRBRWyAvA7dahwmnuma65tFtz7yY2+e3U8QSKdddwjcGB2
         r1uSjUAm655eHNtYUPjsEP8+bceSIMyZDUppSTQcd7Qy4Co6UC6uw2GNfsHLQQNPW/ks
         xORAVzdfdJO74WqrqsXT6KWemong7GA5isZGVTZhOCWrF9ZhLD9nNjYj6dfgEJKWNP05
         ZC/iu1OBn4i5twyKSnN/ZhZohp4NWTi6y0/S/T8Bc+bP/QX6aM8C2WSyjv+L5yP0+gp2
         9e0z4uhNc0UlzGJLgWUGbu0pyrJodBksIPZvhE6GDtPxjs+cBEfNcnszCJe4hWu9NrGu
         zxQw==
X-Forwarded-Encrypted: i=1; AJvYcCVLgpwhxB8LbWRqrJWAvu75XErBMQUPDrdr54pgc2I+8DQW31ZgJrFsZIvFtKDfA+GFk1TH6q5HZCcg@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ978/PKacLkQBwJoQgBUdz8N0tGxFBSGDo5eIg6iirNG16mPP
	9c1DZH7L9wFh2lRRgQ3h8YN+VdCb9H8/iKb1HSQzO2lnMpMu0PruuqFegd8HjH5qxUhAvD4ZGeR
	4RDemseeYZDD07QU1snJR1XRg+ISLB9Ljd2bRLC/3hA==
X-Gm-Gg: ASbGncvAYvUzFte72CiZ/YZh0kGJyIPFSbV8VdMI45YArCChZmyEgSshUjMH2M6R6ib
	+X40piEk4TfV5t24QsmRbnpE3QxJ/YyVVNgnHWgx4aWIctFfEnYeF2qlI8HplDlAdXCNQ12xSV5
	T8CkwHK41nv+V2sTajN99G/Ed3CWsNhcxX
X-Google-Smtp-Source: AGHT+IFzz0NXs8cF08Snmi4Ha7S7U5h0KKvjptJb+slPp5Gi4FWC7Nsw049EmovcMdDEvihhptYlSs6FgkwmCbzFvc0=
X-Received: by 2002:a05:651c:54b:b0:329:1550:1446 with SMTP id
 38308e7fff4ca-329155015ccmr33138651fa.0.1747778263381; Tue, 20 May 2025
 14:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
In-Reply-To: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:57:32 +0200
X-Gm-Features: AX0GCFvwSq-oMiFu75DMDv5s_mCNJqSxwG-LnpvLIXP8m8Y6ivyc6Hrx1bC20zQ
Message-ID: <CACRpkdb4OeD_yaUsGJ9Ugz3LZTCMdz1hbH-cX__ixEPr3Snd_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:01=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:

> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
>
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

