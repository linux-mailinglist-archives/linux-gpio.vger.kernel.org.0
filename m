Return-Path: <linux-gpio+bounces-23688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F142B0F15D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C03F41C85F0D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 11:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA53A2E49A4;
	Wed, 23 Jul 2025 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNuPu2ee"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF72E498D
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270635; cv=none; b=usfloSIG3HtGJJihiQRinK2/zngclUjIU9njDq7BCedZDsso8CAHK3QMQrn4bXpBVZlFAH70rcMvC2l+5iBlkC4dJ9OEOxCvLbvfL3eY45HJeujAw7MwzuPPZtzERpKM2CHAFmkN1mFF0uWDpD8xQ8RW96sI1sU/PMGf9lfNtW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270635; c=relaxed/simple;
	bh=iQQAccIuD6nz95tiBxK22UWVg/575olRSffTRrh020I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgHjF9qC851/6c6Qzvjfw61Kvyr+zrTV/nRCO3ROFh05M7WdfDsn+UKxy98085y4Fl2t5Xb/srXXozLVjvN8+N2Veeo4FHY4MFCOHrE/QXgUkvW1j0XUC/uWubwumQ83+fLdyHk4GuhHJVb7UO+LGL5uOhHgQ0BEvoq7C6HYvhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNuPu2ee; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e8bd171826cso5962233276.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753270633; x=1753875433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymp8NEpVvyDseXZYWN8c8ewcIRYFU5ldp7DE0o5dQsU=;
        b=yNuPu2eeXjnWcSaCaIk1p2uY6OmJJoQJyAjT9lYtmhnwOOQz3SLoL568P1sHm2HefO
         j9iI3oJ4v6UCzr/anUzdqP5FG7r7U7S7UuOSCgTnHVRA1GIahyVhnUofmGs3CIh+RVC5
         s3YK5TVsM/XjHp6pr+gYx2MFbJbaX0qlodtJ2RK0hPRuP7YCO3egPIm16xkYeUaEU3pa
         jFyiX3SaP8l4yQ85BuhuLj+jDa9LNoaIRYOjFpt1WdqZt/FMeKqbUhRZReaOmBrtE1MO
         7+gcno5nlqhnH0cc+eAU0sv27zZPjIOkENRoFX1/kgkxJKB990mNhorItJKb3497tmAm
         TSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270633; x=1753875433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymp8NEpVvyDseXZYWN8c8ewcIRYFU5ldp7DE0o5dQsU=;
        b=PJdHnZFystwHE2pvkjoHAPqIP+Iez971vsKMA10XjCeB07XAJtRzEH1orBjpITF5JY
         hgEgC5OUJO2YElY7c0iVls2OkKlOk3ASfHZibu38m5nZvSYR08yQcLd3iK7j33QGQ6Jo
         Mu6s4Bii7dg0hFsGcv90Rh1CJLjKfHglrVSemRAxUZAl54p9JfvyjWZoDEFCHAnjLnX2
         +7zVZkRQefrJEEa600Wch9iE22Y98SIY8hl3VsEYeeAoQNPnFe6IBBlhxxnIudamYcVt
         N73dkUZrob9FBl89p7fqcEp8PrTW2yTaCL7gss4lkal6dpkGo0cP0CwtVBEZswwmIkxE
         hnbg==
X-Forwarded-Encrypted: i=1; AJvYcCVg7aOteEYoj9OjODYfIj/WgxSOuT3UCRQTdT4UW5ni1O03XQddOmfzoHKS4MM0j/QQbHn2sRcZcKdO@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYFeG/Si1rkfUoEaYfrch4wfryDQT4MIQAxWYo1qyuVWnx8op
	A4aQGOovC+axZsPO0iTJwx+9EMXsr1GUfYONNR1OJI6/2Ht+ib2F85G8si2/INYpsiDIMyJdzyb
	thE551nzRD7sOVpSmP9KNAJZ3+csWE20T/PnYzTzw+Q==
X-Gm-Gg: ASbGncvP8itl2oxQk8NShM3fY8zSx9PmIgmrsuOEySDW9hNimpOH/V9kbEiO7oTm4L/
	mCB8wzlbDHP2YGqrXiwTWyjLVmgHUtiyg4oNDzXabaFQ2swbleFdJD1uRfLSzGMI5NXCe08viEc
	ADyw2zIqUlcIcC9kXL8oYZPoKOfkd1j8rzX55M/8X0MVTHaEu8S3GV5GhQAZcq0dBscOoJZoPIY
	c/Lmow=
X-Google-Smtp-Source: AGHT+IG1u0oo2KG/eqAPkei9S9jpNUr6q6/qerBp5U6HD3spcuvFuQv+r1pMepeUgbYOloTl+BtEStxyrYSqeymqSxI=
X-Received: by 2002:a05:690c:600d:b0:70c:a57c:94a3 with SMTP id
 00721157ae682-719b422713bmr31267587b3.19.1753270632818; Wed, 23 Jul 2025
 04:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:36:57 +0200
X-Gm-Features: Ac12FXyQQsvM0KPvnjy5H8NAQhVs4FHmng7Wc1VHONXxXWNwFzyha3AMuITkSaw
Message-ID: <CACRpkdbe-0fQY7rF7u14bn4j_f3Qn7+thRzJQZRZBTadG9pjGQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 11:45=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

> This patch series introduces support for the MT8189 pinctrl driver,
> include the driver implementation, new binding document and pinctrl heade=
r file.

> Cathy Xu (3):

>   dt-bindings: pinctrl: mediatek: Add support for mt8189
(...)
>   pinctrl: mediatek: Add pinctrl driver on mt8189

Applied these patches, thanks for all your hard work and
patience!

>   arm64: dts: mediatek: mt8189: Add pinmux macro header file

Please funnel this through the mediatek SoC tree.

Yours,
Linus Walleij

