Return-Path: <linux-gpio+bounces-13089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DDA9D1B4B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 23:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB65C282A4B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 22:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815901EABBB;
	Mon, 18 Nov 2024 22:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTYmrDbQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D701EABC0
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970469; cv=none; b=LP6aux871JdUAQ0BVMXpaJ2GrTfnoBKX4hZUQF4ioenPAlzxE7CslODsU5sTuIYgrlnBtau5TAYSW/Y4dGLbECnnb46izSTC4qX47HhjuvW2mMoUGk/KVbS6VzZfHElDqiz3lBp3dl5q8hFFCf+GCt/4CtTX5/6YJY99gY9G4Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970469; c=relaxed/simple;
	bh=HkoCCdRW/H+xh3lTqBY8Ix0PmDgMIJshBbvCetsSrv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ue52C5tRYHsCymP69xn+mYyhu+AzjKVZv+84aZRcpYpgebBSUu1o9ieG+aN2zkaQ0Jcn23S0O6MqwSpY9K+OCTkXrBiHnxYY94AAfcmsHXM0v8F9Rwm7MfvFBB82vIl/RqfZP/tybiRvc//qnfwydGl/t2ac4F0pX0ms9nYRasY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTYmrDbQ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so31574551fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 14:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731970465; x=1732575265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkoCCdRW/H+xh3lTqBY8Ix0PmDgMIJshBbvCetsSrv4=;
        b=JTYmrDbQ+C8TvOUHC3GPS16kpcNJ+yN3KW+JTVMc0jI1NVURaQFuQsvjIFdte3m6zB
         G2uAIzHsepVGFLqBP5JJVGiprRH4zRo8r1T9Gw9eVitF/cIhqFAw59vWgscRH1o8eDUi
         39rbiHPgJ6Q+BxNbnXRQk1UorXKOYyI+9h8O8PLu5N7iHmsT5XLrBGPLq0rVZzGVkDOJ
         G04NcETlHJa1vOopuzLDpgdDlJEgMbexjzGtr1VVs7/FI7KtRJiDcTQ/ye+sLIcDxav1
         mYfmLvcK+Bmfn8e1ztjcrJfUnCoXkSU4bDCv/97iTZTaJFsXkevwbqWJAtiOSK4vWVrB
         T1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970465; x=1732575265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkoCCdRW/H+xh3lTqBY8Ix0PmDgMIJshBbvCetsSrv4=;
        b=l6GiyCeimgOzTY/i6zGi8jVyZO1UIW40PJBqePlg9kH0H6gWGolWS2Sxld+0e49GwF
         QmCuTf1AfAdERbWTgZKCcCRjOpT6Tbm1cohdd/cgKA7k+tyTAERytbtKoEESrWbRkPzR
         Dx8lHNSkJg+B90AGPQj1MZwh+yiiXV7g1DBRpd4rEZMVQciy5upAyFyDPVur32jFTWMa
         SKF/QwPEEQdyMlhQeh0tfvidnkMllPhcNvlnh1R1yrNTKloxScUgqeL40DyV7lBDrx4g
         znRlGcx9u316xQMmoT+8BSDv0B4Yql0ORx4krnqQdVfXY+sFm7ky7AqSkpAztOcS0rQH
         IsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8n2NaU1VNgICbfRw8Q+Twlqy7R5a81Wwclk2DKsbb1gyY3NJI35YMqB0U2w2DMrey395BF/d3ICZV@vger.kernel.org
X-Gm-Message-State: AOJu0YykvRYH+y/F/Wp5j499rdEozLXU5sa4kFq/B1Ox2D+5Kkv9sV+/
	9pawvL1SDetzw5EUTwi57uP7ILg5y25aweaiiOdTj1OZtWHan+42Vq9wlfHs7TzNQqTNGMr7RvG
	Zf189JwkaMTM0N/jnYKRaA+rdcm9R80H5mAoEfQ==
X-Google-Smtp-Source: AGHT+IGHG4Twpe7lD6OgNd5mV9qcyQc83WrpmnfXyZIpyvXqcxMftc1zLuzdmDBbSMgcY0l2Bh6rM2EDwkL6YApVoRM=
X-Received: by 2002:a2e:9fc9:0:b0:2f0:27da:6864 with SMTP id
 38308e7fff4ca-2ff60661b95mr94886281fa.17.1731970465383; Mon, 18 Nov 2024
 14:54:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-6-claudiu.beznea.uj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2024 23:54:14 +0100
Message-ID: <CACRpkdaSuj=nKbz4E90Et5gcCmCKvjb3AZr5Zn6k6KnVeuf_dw@mail.gmail.com>
Subject: Re: [PATCH v3 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add audio clock pins. These are used by audio IPs as input pins to feed
> them with audio clocks.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Patch looks okay
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect Geert will pick this up separately to his Renesas patch stack sinc=
e
it doesn't seem to have any compile-time dependencies on the other
patches.

Yours,
Linus Walleij

