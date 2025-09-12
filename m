Return-Path: <linux-gpio+bounces-26003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A249CB543F5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E64F1788C9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 07:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B1B2C2369;
	Fri, 12 Sep 2025 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOSmeOJN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02A281530
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662407; cv=none; b=e9i+lvHn7oxpoSy4QOxMwsZ0C8xgpxJqiy5RjZ0D365IXn5FwDgCNLKUMWZQD3knke3Qw6/QDNelXiMAqmmftP9EbCJFtvjCSaHDzTiVphjaU0LtTbvfHx+rt1oHI4BRD9PWPtTyIsGRwk9/PlWWVdWJeK5T0vemFnwQ73f60Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662407; c=relaxed/simple;
	bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJMpqs4Z2WwRZiIaVEJFwrYAXMCkZYu6M0oYuWjm/ElwIgkdCM+EWlBqwBjw5VOwyfc0sdwDUMVQe1b34GUAXhW2S5xH0o+hOAM9Gsyqg01X3Q2s+WugGVT3FgXJDByuKQ3htDswT1zqZCA5ZTpCKf0ofO3h17EhaUlEa5MZHwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOSmeOJN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5607c2f1598so1785421e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 00:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757662404; x=1758267204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
        b=jOSmeOJNWfHtwhzrkNS0GObqM2XsqHJkKYGnYslAY6l4JI4bM8MZFHpnnaSOnarJLi
         NnQs90Woxs3TgMAK0Z0qphguEnv9RShwp6KwyRGm12I9jFaZ37TdBn40tkXJ8g/gqXki
         v8sOxcxOO917WY2o91JKyuL0+4hCei9gQUdpeOX6veRrXuatWuUfrcOCrVQ3AE0+M67c
         r+YPEeZJawmlewzzAXTKg6vudxTDzKX0K8fMrq5atbybilQGaeomJC6dN3eb9EzahdKq
         m/VU21Szydg0NRBHntq5u5BDuaLckX+1/R8Bx3NtH0niV6t952RkIj3CK/3wlOFTImIY
         LnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662404; x=1758267204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
        b=knW1toK7HEIHDrqksDKY9ehQUzcA5kkBOF7Zu3XHY4CEKf9QYJrUwi+uClJBeKTLbK
         ajcoU5syTiGsV5AxFLhy16kioUSbCCqotWpx8IrepGqeiquk/0HgKw1cf6njmrunL2HK
         9BsRYB7kQY39kssc6qmR0yrISv4E6dEF7ovE0Ah9rL1IK0+au9RXcKvB3jcD46puh5Re
         EATuxgsZE/PAFJHI7Qa6VVkuH/vlRIE+ewzH7owxUXBAee6sj3DJqnZJvmrRjTKQSZrr
         jrXYQKiDgOy6Y1ZlM3fJ28i3vJ3m0uvbaCDb74Fd58WQnvYLcnJIr4FUkFq3AuOh7uPY
         gOFA==
X-Forwarded-Encrypted: i=1; AJvYcCXXHndEgyKAlZ330+3Ljo+DzCbTqviFMOW8gNblRS3VwFUCZk5umvncETlZwTUVSp2TFDHLo26PxO+L@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKSFZosEdsPJEuYRWhZQ6nRgHn+CPZB5H6zipvtnauKCFxmO1
	2F0F2ImoIDfJMPWsugFunJtVaIk8MsP+cK82H7FtiNuRZhQw230QgOD/wCiJG13CRwRRrjXnn8A
	4iroFSnod1xWxSCqy8SsPwAFnTUfymJU2JRDHgqm8dQ==
X-Gm-Gg: ASbGncuws/DCBK90pGXGTvKoFu4WLhMZBfcSBHbOdodc7rP2VCOn7MhF0KbjmN5IfWQ
	UBr6GI9SY4bS4plw7EoExMx6HBmNJFmBoiuK88FTE0Xf93HZWf7I3yOw/AMLWaOVXSxliyM1kAj
	ei/Tisj9I/5ripcdn6R+WnZccpeBiN5eqLPSENXpV1FUbcn/fVgyiv+AQ51xbj5ztSCN5NOzBIm
	YPaJhR5ilTKR0JQPg==
X-Google-Smtp-Source: AGHT+IFqJ3rG4VGz2N4HeDjhdE1zZXrIjMGRIFcSDQMQTPILLpM42VNVO1ib5uwXHA7KeYqbyezpYRqeKhIIV796t/0=
X-Received: by 2002:a05:6512:3693:b0:569:a257:c6d6 with SMTP id
 2adb3069b0e04-57050fe351amr473063e87.49.1757662403635; Fri, 12 Sep 2025
 00:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com> <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
In-Reply-To: <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 09:33:12 +0200
X-Gm-Features: Ac12FXxWiwLmhQls14nNfaQvMLfIJjlBZAsZhTSA6_U4hnix-0Aq3t1bNNwFxXE
Message-ID: <CACRpkdbSp6ScZrzUtdP0ojP10yOTsbnd33HqgEVdiSwPRomuAg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 9:38=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Sep 10, 2025 at 11:32=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:

> > I would merge the first 14 and keep the last for the later part
> > of the merge window when all other trees with conversions
> > are merged.
> >
> > (You probably already thought of this.)
> >
> > Yours,
> > Linus Walleij
>
> I already have both pinctrl and mfd changes in my tree from Lee's and
> your immutable branches. I pushed this into gpio/devel and it built
> just fine.

Ah, excellent planning. Smarter than anything I'd be able to
logisticize in my head!

Yours,
Linus Walleij

