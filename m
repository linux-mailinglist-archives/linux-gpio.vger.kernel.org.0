Return-Path: <linux-gpio+bounces-24737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766AB2F75E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6DF1178C47
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F953054DA;
	Thu, 21 Aug 2025 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VM7mxTvl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D112E03E3
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777399; cv=none; b=lX9ZFS5aPap9vzdMmN8+nzazPn2wSuP5orn1Y5p65C4Nk82oOdnpdKUOX9an8IvRavj3dN8ZrL5Pg7VQE9fLv19LCayvI5Rjxh0Apj6TTvvl3DXK9E/DPHA40vNEr8ieRMuVqMeOTJ+/8/Q0eVBGwJH6KfEzPf3ZWAxP+70do4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777399; c=relaxed/simple;
	bh=uf6vS3Gl2AuJ7xqaJiaRJedxS56Xesptizd08sfMens=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRR2UaY8lgodNagIdjM/QRhnvKYIDTbhdAP2Yh+lAZS8SjN5kqmsYbdpWcanbyX0JBVwjPPCE47npLl6j0IPDp+uMp521on9oIeN5vCM7pI3LBjN6rbuO5GmNleOhB0d9VrWi7teCF9iFuEXc4vnU/qeFfPBstQkLMDGRyhr/6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VM7mxTvl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce5247da6so923478e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777395; x=1756382195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
        b=VM7mxTvljui9g3lu39TOLUk1ZV6pCMH8OG9CoturI99lwEeKkgCehLIJXnFI4/vOQc
         Xfv7eVzvCp7gInSOBUAbKzyCXFHGSOueTtC3cCcSR7wiAwxx2tGtLVVhGe/kiivOKwFp
         IQXHPxpy+J7zMIWq4oHb1H8j55i5msEMt2S8QlNV+wlIqPKD353nNI5w2rEqAAQ6olKV
         SDdC+kFjxAF46YbZJLE2f73+tl5D39nhSS/SUjUPFsFENoN6BuEwradO09gEt8+gTHUW
         euEgTAZc7VOvIBaJPDt6XMqfceDOhVrWPWLB8QEyrZvVj7LXb8plg7+C3LdG5v9SVrka
         bj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777396; x=1756382196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
        b=e7srCK/CxUkjK+E2sUwyghlcUGaKGS4jqPvgWZaQMwJGkqvFOsSQ8azh7745SZdJF/
         xDfoRrjwaYikKFSqZH7ILg0qsJzDTsl5mixXQakf60k1K0cAHQGEGUA8Gk94ooDOS4Io
         sDrRswJF1L1Hvb7RVHplTpTlPdyHxZoO14mDhRXfaRArK8V6KXy7QaiUzTmDkd/fpRqH
         im7DIMwFUUp9+u99nJYdW368fWhm73tRzwkVZRgHy1DB6CZFAwxces4yzsk25XS8IDOw
         gJKDmXWlnV7EdtCB/LcZT8klY7E+GYqg50B7v9hKmfmdTfZWXX5zXOgX123o9aA0Atuy
         VEiw==
X-Forwarded-Encrypted: i=1; AJvYcCV9l3HBD7Ozj/DT7EQfBbHD2XzUa0J/XmO9OIIeAwMEDMRjVZLSpdXf3C9bR/yUrtqB5nQGoOyc9d0B@vger.kernel.org
X-Gm-Message-State: AOJu0YzEGSARWXmX99yBeIHPe6xOfNndwcYmBw3fZPEHDMhgpqkAPyat
	xjoGlmBlyeQ5+oGcHLapYK75TXmnfLPu98ZTZWDs7pCMrrUYm/eRdmtyj9Vp1F4AQkwF5CFSOsG
	U1OvF6KiuDlXMpz9QqLjw4J9KcU4l02+lTV7tAjlUbQ==
X-Gm-Gg: ASbGncuJV4eeBVlihiS+yHWzjJpIx9x7mTaWIJ98tzmKoOT4xXQYWgmL3Ii4rkxRhAj
	qBMzjTmYtnem705xN9sp3gzW0Te0kMP+6tmPy6fq+CQ+dHbevLF4VWYsDi78QpgY1UgzbUK+XQt
	2bdbzGaVeARdzplxtQsJUTcmPTl/HoNHkAIu8R354dZCvQDU7doINIx8aODKDjFB5Sl8YF/b9Bj
	JL2ZX4=
X-Google-Smtp-Source: AGHT+IHLNT7GNgIK+Yc1AUKtRsJ+Pu3qxvF99KQLgmBORucS0GzpXEZZoUCuuB+z9QVIQwaQ+MKKQAluSVZweFngFeU=
X-Received: by 2002:a05:651c:54a:b0:332:57b8:92eb with SMTP id
 38308e7fff4ca-33549e7e81dmr7293611fa.10.1755777395492; Thu, 21 Aug 2025
 04:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-14-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:56:24 +0200
X-Gm-Features: Ac12FXxjp4iK3cFyWU_S6p_GaEq9BIq8dd_UPbgZlXscJTvrfMnMiNgyqvjOGHs
Message-ID: <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ariel,

thanks for your patch!

On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> +  ce-gpios:
> +    description: GPIO connected to the CE (chip enable) pin of the chip
> +    maxItems: 1

Mention that this should always have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware.

Unfortunately we have no YAML syntax for enforcing flags :/

With that fix:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

