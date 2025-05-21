Return-Path: <linux-gpio+bounces-20398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE1ABED9D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58E21BA50BB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 08:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F953233D85;
	Wed, 21 May 2025 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwl9jdI4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C57EBA27
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815181; cv=none; b=aVg6FnGNKoncs9hxPb9VXe3ukoMZwRFLDgQy8dUI0B0oi23OIeRybso8fJ1G1ofTAcgIhSO6Ut4aqn1KlvsLaZ+WxGQBoDxPw1XJyo1b71u+2CqJ1Y+IddrwURJXfC4+bwm2cH3gcsz2Q+ydwS5h6nMqxzf7UYTv4AztqKWmbj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815181; c=relaxed/simple;
	bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8Xe+YFrpBikQv0iTy1wUB+oKvuUriZQ0/raSytcOfA+GWPrpug89HbdaJFc5qIPdNKj6FiVR4erzVfOBtgMMhMY7L/bxQKP/2binUOo9VmwxXjjJ4NiRfYa8U2z0xRlcptP2zPPEp4CEGr1r8o1I/JBfYlNZDxrmOagS8EK8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwl9jdI4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7503153e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747815177; x=1748419977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
        b=kwl9jdI4gepQiNSB1P4yfQ2Tw2FZBKrS1N6pu6ERnUuZisi1vQtgc4xCAdka00OUKu
         GEr2Oz5ejOiCMrmmzTin27fQplCOCv9rGTAH/jhf9F0r5uArShzuJmeWWxfW8qxLRgaZ
         yH3SxL1XQWHbeLBDSIV2fRvIqPUDuZBPgJFIzWzJ6WoNpMuMcJZUDYgSTsUMqZj9E0Qq
         hyBckkk6OJ37sCUm38EMxXQEIpyAsaDPAVgTVVSbMKlbp2dqyMTLINHVm/pCB0Goi+mB
         O7YKEo/erjZhn4gV8Duztm+l+s2lj+w8IRNUfE0xFkZR+lyfdKiSHPD3NXr5m7tyYK+d
         v4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815177; x=1748419977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
        b=EFQo9fazGl+Adz6lLy9k7Z+g7NI8M9IXD8A+5hjUIM83vUx8wWRRjC3IRKvoSKTR+s
         OsdKOgRy0k/kzCwk8nH5V1Rgb2ottHn0gDgLDWHok7nNsOa04MOpDVeuPwMMxy2pEId3
         aJ2b09J9bwAyAdDE2QGBax1HXtilUk9W6FIj0/wUjJdc9xZ/4X3iHGUWX/eW3SufEkWa
         Qln4H+kSBiQqAdV7itZ2JN5ieDyK8rNXf/cc2sg350GE7KUJ4peP+sjnsJpreKRcymsA
         BRdJ6y64cEHf8FL9nIHYe/IgfYmkFnW1c3jJ8J1Z1p/0D0g7bx+Y634K+l6Dthq53x4b
         t6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVEQUlmeAAOcmEgSeDxzFr3MwIctRztUT+IBRX2n8qx0QyDpBnXLWtebNSRV/QKWJyo5Hy2YnEwnHsj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4z27/oT4YoTfkF8mqzVYtzFmg9MviI1NCr8swApUYfvcAQp9u
	IFEpMEGxe+pnHcjoxQxPw/ZUzgKBzoKu8xgs29SMe05Cq3sjHKJEISQF4yZ45M9DqFq0IxiVR60
	oLw4Jju+m+b9NXK0nnr5MkElamZtnMpzUvwOgL/q+Iw==
X-Gm-Gg: ASbGncuBkNamFonjXLP34XcNu3VGTuqUmmnkUTqJqoJr7PnrAfcF6pu35cru9RuND5H
	OTExmJmWf+vxCZBTzczSDgQoiwy5XB+k990DStZAoeSflY+e5KLK6NWWANu3UEnttaQ9HiG0mP1
	ye6rp+lN2M6u8zELMP0m8DB1y+Wn0xYBQ0x4e885tjp9M=
X-Google-Smtp-Source: AGHT+IHypaEtLgbAx0hI1pwfX+02JjmtIZJY41Yl+79R8Nfu0dbAldHSIKhHCLmxFeUhAu+kg3UiZtw/f5zBM85OvXE=
X-Received: by 2002:a05:6512:6805:b0:54d:663b:bda9 with SMTP id
 2adb3069b0e04-550e726811emr5586519e87.51.1747815177553; Wed, 21 May 2025
 01:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516100423.1685732-1-ping.bai@nxp.com>
In-Reply-To: <20250516100423.1685732-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 10:12:46 +0200
X-Gm-Features: AX0GCFtWAB87B9iw-eCTV-w3vbrXw3ATM0xxduBEOTn9gKp9rC41cR3ebYjTvJQ
Message-ID: <CACRpkdZ7iymSvvst8Gi3EaeG--2icRgkoKEiJxxjLgC2LCDW_A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 12:02=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:

> The i.MX943 System Manager (SM) firmware supports the System Control
> Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
> The base offset for the i.MX943 IOMUXC Daisy input register differs from
> that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
> i.MX943.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Patch applied, expecting the compatible string to come in from
another tree!

Yours,
Linus Walleij

