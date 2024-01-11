Return-Path: <linux-gpio+bounces-2135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DCD82B086
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 15:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A93D428A4D0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 14:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98333D3B1;
	Thu, 11 Jan 2024 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAn4k2aZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00853C47D
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e784ce9bb8so43137547b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 06:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704982991; x=1705587791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82LMk21rXTaOAuZPn/JpTaNt+mh1ufAOYBK06tgEzW4=;
        b=QAn4k2aZCIff0P4+zMaNwOlw7j7E6Rc65IA+hRIvMTZ2j95mOWc9rUwI3s2oqvKicC
         MubvgKeCBhWRkYygHSR1ep560tDm0qkhhGs2vuB4q2xk/zNKrJJ+qhnvFxqiNNymdHU4
         lXppZKsBCtNm+j72T9nNXeJLQx97bkftmuvwXozOXo5cxC6J7BDiuwO4Qn9qlIsiZTtx
         p7PM04k++AL3Se8K4JBD0PnXrM2qup7EfI64PAaFhi2S9yVAtd2wNoMv7DAifUjTOACk
         /224MbRGLp5OaLYK4iYaAza6WGTMLYtF1iLWCXPJVwHd3C0v/+kb/kmN++DwVSAbJnnM
         8a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704982991; x=1705587791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82LMk21rXTaOAuZPn/JpTaNt+mh1ufAOYBK06tgEzW4=;
        b=G5boYwjrPTHlFOLFM2lcC7HFbICgSedeLtpz0s274fQnzLMkpF+Wh08yj2ph/CNavC
         XFdsqlRYJ//rfpV88HD9SJYIJa1n0JwBrGc6KaBCsJUvUhhw3UDNgJRqe4I3g/8gvNRB
         fepoa9YpgHlKmPokfD8HXSDYzmIV4/KhiFeoq5sIuCes3XVpbOD8MOEJp80LGl57q+Nb
         d8cfhqgZWFXyKk5c3B8Vw6WNgirOAhxCt+csg6HB7i9yD7RAdrzkuvmKZ39OND/cWO7h
         9Gi/P6ZUtmBwzJGz+dhauB2FofmgEoQ97bwhPCmcYiZ4N+g2qYGmRVFI9JAfjRPPe7Jc
         wlAA==
X-Gm-Message-State: AOJu0Yz8bbQIOkJ3JN3SHxHm1ad02rpixxmtXcEJwtWvqVKC9WlkBS57
	K+ugJUiZes27aZ1k4sRhSXbusIJwF4VEop3lkDxBNgJ78dfL0A==
X-Google-Smtp-Source: AGHT+IHGnWm8idFr5cT2v8uG+5SChhoOvI/illCDzUTIoBYIRefwZu5c17k9Hax/9G3MDNccmYF6fieCFTY6hWzus8k=
X-Received: by 2002:a0d:df4e:0:b0:5fa:1942:f055 with SMTP id
 i75-20020a0ddf4e000000b005fa1942f055mr349315ywe.48.1704982990940; Thu, 11 Jan
 2024 06:23:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111131904.1491496-1-hector.palacios@digi.com> <20240111131904.1491496-2-hector.palacios@digi.com>
In-Reply-To: <20240111131904.1491496-2-hector.palacios@digi.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Jan 2024 15:22:59 +0100
Message-ID: <CACRpkdYvXEBPWgFYEgF5kx=JLjSadU38UUUPPNOg+K46ff2kCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: vf610: add support to DT 'ngpios' property
To: Hector Palacios <hector.palacios@digi.com>
Cc: bartosz.golaszewski@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, haibo.chen@nxp.com, peng.fan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 2:20=E2=80=AFPM Hector Palacios
<hector.palacios@digi.com> wrote:

> Default to hardcoded VF610_GPIO_PER_PORT (32 pins) but allow optional
> generic 'ngpios' property to be specified from the device tree.
>
> Signed-off-by: Hector Palacios <hector.palacios@digi.com>

Looks correct to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

NB: this only makes sense when you use GPIOs 0...n where n < 31.

We also have the .valid_mask and .init_valid_mask() callback if
you want to mask out GPIOs in the middle or beginning or so.

Yours,
Linus Walleij

Yours,
Linus Walleij

