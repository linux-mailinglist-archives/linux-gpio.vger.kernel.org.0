Return-Path: <linux-gpio+bounces-3965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CE86CAAE
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EE3C284BAF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ADA127B5B;
	Thu, 29 Feb 2024 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDp2MwoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02A25A7AE
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709214690; cv=none; b=QXzw8Hmpe0ed5zgcvigEi2q6ym129ZgR4HVE21fY1v8OV7MMGwjrjePBVQ1+jAAqIIf2SWQ6le2r6TfaE/UfO+muRlgFffjerx8CTikkYiABTlTGanGoI/elwtpujiJsbWUtRzDoJ33v7wUJl9/Tb5ys63WB4Qssu4vQEYlMJn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709214690; c=relaxed/simple;
	bh=VCRBABw8KmpUgXtF2gQ1npSuYjYA4fTRgP0v3OZT+Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYiO9AIq4DDCka4kB+UgzDunpkLtd9n/GGmRmHAueEE9Atm1BtZYpRfKYhdC//nncwAU4SNm+8HuCvaSyYH/BUd0nXWALEUbXWXmr+qApJ/Z1G+UmsQnLvvW2A/36lQWsTDmCJhVKPS7MC+rMuYU3yAlUkxEjD45EaMGNqTB7xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDp2MwoJ; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc745927098so836587276.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709214688; x=1709819488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCRBABw8KmpUgXtF2gQ1npSuYjYA4fTRgP0v3OZT+Ww=;
        b=TDp2MwoJHcrL5r2PXEBLbl1l7kl7hSo9m+xuwP6VjZ4CAQNRTFbLKzp2LgD29iIhi3
         uEbnwJyIQqckWk19KpmJTa9rVRKwWPCHFml9/+vzugU5da4oFgIyQp0/Vn95oxqJdlsQ
         ZX2HH/lMabvAGX3/Tp0trhyGkKUHO/Iwd0hF1iWaDQas0SQEAdf9NBVEVAcdw5TfEbkp
         4I2gkvdUidu46MLYCt4dqNWp3zKmAmEsbS+MyB0UnNRehGMF7UV+k1Tt4mUBuWCNTDDV
         wIv7kZeeewxTM79Kp7ez/2l3iZ7gzHVjsifNVfEo1YCgdcZpqEzJV2jtM3Isa8u0rRC/
         F85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709214688; x=1709819488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCRBABw8KmpUgXtF2gQ1npSuYjYA4fTRgP0v3OZT+Ww=;
        b=VcPV4HoM4sprLhrCGJ45mlXHzy1tjtbVAQP3431ZIL/FAzw7dy8rJPq3vJJHJNoGlC
         MOzZBuVtyCzWNwGpHRy16K6vcD+GNohQghMG2AO5EsdBonWWkzKXrSVyz8hDpIdWGB0Z
         8jCK1adeGP0/6qRaoaZ79T7A0wzAMYxc0IFbmNcfpfI/+sIA5HsuJno6wutMfdTRTv43
         1WkD4qycUfipAIBtX0xztAtDLka5lAL5jJr5sdA/s5KiRRpiiDCRdU/XJXMengr/2Bma
         iSjD2+XpcTfJSvJU4jT7AXsvYwhNt2PWbCSFYVuAyk1QCKl5CH0ujq4RuVj3U65Ia5Lb
         qx2A==
X-Forwarded-Encrypted: i=1; AJvYcCXKUZ/rIA5YsE/1mcEMdEUZZj7nYsM3J/6Fjd1hVP5Qd1iLHzjH0PJKSUtWd9clOVl8mmhL+ixM7ezmVJIByTytxbnllKJ8GdVdGw==
X-Gm-Message-State: AOJu0Yw9Bhi12FuhlFuVhGE0woxr4wfDrjsowHozrGK6yvGO6j2ltLqj
	iDKefPkgnPrrZOCKJ/9myShjMv3I0pEOQ3gVA9EZVHe3Lhv2hhyDVunbqKEqMuvMz9Xo2sTJ5P4
	qlzsYQNqPMojm9FfUAFGH5x5Lge7veOkO3qgUUw==
X-Google-Smtp-Source: AGHT+IEYhNAeRh9ONe2PLD/A8u7wUHFfcrYiceM9fcEYENn8XLe8Y1+j4qublU+HUjK2deQ2vLtn2qxDO9n4pQzAFnM=
X-Received: by 2002:a25:9d84:0:b0:dcc:8c7d:970d with SMTP id
 v4-20020a259d84000000b00dcc8c7d970dmr2327901ybp.47.1709214687813; Thu, 29 Feb
 2024 05:51:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223071557.2681316-1-peng.fan@oss.nxp.com>
In-Reply-To: <20240223071557.2681316-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:51:16 +0100
Message-ID: <CACRpkdYX1CtmOkDhyfCAcbY2yHHfjjRhTg0r=sW3iA6dvxvmdw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: scmi: support i.MX OEM pin configuration type
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sascha Hauer <kernel@pengutronix.de>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, aisheng.dong@nxp.com, nitin.garg_3@nxp.com, 
	ranjani.vaidyanathan@nxp.com, ye.li@nxp.com, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 8:07=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 System Manager FW supports SCMI PINCTRL protocol, but uses
> OEM Pin Configuration type, so extend the driver to support custom
> params.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

I can't really say much about this as pinctrl maintainer other than that
it makes me a bit unhappy that i.MX95 is not using the "default"
SCMI pinctrl bindings.

If the spec allows for this, and NXP Freescale is using it, I will just
have to accept it.

It feels like that's the old NXP Freescale pin controller living on
just hidden behind SCMI, so potentially it should also share code
with the old i.MX pin controller driver. But I think you wrote part of
that driver so you would be the best to ask about that in any case
I think?

Yours,
Linus Walleij

