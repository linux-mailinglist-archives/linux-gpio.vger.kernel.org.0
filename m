Return-Path: <linux-gpio+bounces-14321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A129FD68B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 18:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F03188592E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C0B1F868E;
	Fri, 27 Dec 2024 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w9oMWZXc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2331F8675
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735319962; cv=none; b=J6i4W2PJnRIN/it3OH83avMJ6cIi8rVw+B9F1NXapPUv3+OVCMlQL4L38B0aZqHNezOOKFS8zfuTSWLPfuCeKhyfy04fHY5tymiIzpMw2V8ckcQjXpEuPbOh1wclbWnrKFfxIBOr8hTHFmEEjGaA1XxnbOQ/XQTUp4e9RZCtrmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735319962; c=relaxed/simple;
	bh=xaseaOSb4gDzo19cHSzqAn8l37pR6yYKnK4+eq6lscM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSX8L0M8ulk339yLGMaAlFf1KYsVPShpjriAEUf89ZCoGnEF43o2FVwnjt1z80Hm4CHJTwskKvgtsWmXofymMB2QuouwAJ6g9y9B1vvfVzHYhs1SS1NRmyM8wQWuoIiIbiogmj+zv1xmwAuHAL64SP9+GzXQoyZ4AqRj/ZwcchQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w9oMWZXc; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so7857331e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 09:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735319958; x=1735924758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfE1uA9z/wnOoCflN1CWK91/mj7Glf8TAJeO4IAX/hg=;
        b=w9oMWZXcz+gs9kKNEpu1QJ+ZJOaAa2+N/SVrxyHiixdA95sxhVi2FOnCp3N8/ZZFBF
         UYLL0D5krhm0rfxNJSaq3GP101ZTD8lY++UMWm0+ZXClq5G51+22Hqh+DluTbQZC26Tn
         bwVU5AeBf7V6sKN1B8nJTwkavUsXk8xcZgYQsRICRRUmHCq6IqOSC02aN8+e09RBEpJ+
         UHfcPVEopEi04O0SUDdEjV0LHheQ1BBFdzUs7Ivza2rgGOkP1JBLtMyGeQ9bzH2NgC+6
         NCREGm+VhYbB1of7fxqwZGa8TJjMaH6iIlmQLhoAbPHlbqKTpYVWx+IQ/ePJVtzR/zEW
         AXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735319958; x=1735924758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfE1uA9z/wnOoCflN1CWK91/mj7Glf8TAJeO4IAX/hg=;
        b=EHwaCnyxZ6R4ciUAiNHzJ3CX5zrggsHAqiHSpuuen7RhaFkzluXmVqxtR0iMowTHmp
         YgrKZKC2bFL4xPc7nmafH75Br6sxi7DWgnRhxcuOx/FZo5+3nJQXx0egtVe4FMAOYyaS
         Q9DKjsMjHfGB0kG2Na2A/ZXNkdRcOqsGElDT3j+oogODcMr0R4dWuWOQmbNnTObCt0Ab
         ZcDAVxp8aIY2z1mj4fQqgeDBVz+DLe0Cs+yI0kxYy+mUmOOULS+IDS2BKFNmy2cx/KTQ
         sfw7hPs0aXDwfsvuSqDTFL3/1ydGP0zFTuec8r6+IPUHhgESCC/kFSLsnr4gT8+1Z2Yh
         UZiA==
X-Forwarded-Encrypted: i=1; AJvYcCV6yC3Sz6JnM2tRdPmvn4VkZtVLRZHscyLeFpeW5XObatrckCgF38K4QdACSGXvWMadtRH5E+7wimvn@vger.kernel.org
X-Gm-Message-State: AOJu0Yygc6jvhpfB1/jz6fHxjkNNzPkSCtWKEhZDbreeZxHceC5nGEwm
	5E53D3mGU7NHV856nLA93v+xA9On2gwKP/vq0ZD5krQsVp+AstsZTXwXriwSFCRkTQXArs0E2Au
	M0bQjxF1eK6si6Q6SeWvJG1nZbv4SbIqDJ95X5Q==
X-Gm-Gg: ASbGncu5Z5NtnCw18e+GUbNtuoW4yhD16ktNfV2DoVixVLYC5tWK2RniT98Jb1tDh1v
	JLMVDWDxxXiSyW1wQw8PX9PzgdHXVRRVgQE3B
X-Google-Smtp-Source: AGHT+IFzNcSWitAgqLSjOZTRtHRUbR1A89jwQ+VY2x1PRVkphXKNjTxz5Znr8iriDFxh86d6rMupXkeYXSvCWzdEP2Q=
X-Received: by 2002:a05:6512:1246:b0:542:28a9:dcb1 with SMTP id
 2adb3069b0e04-5422954b10fmr7658536e87.26.1735319958460; Fri, 27 Dec 2024
 09:19:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com> <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com> <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
In-Reply-To: <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 18:19:07 +0100
Message-ID: <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Huqiang Qin <huqiang.qin@amlogic.com>, 
	Qianggui Song <qianggui.song@amlogic.com>, Hyeonki Hong <hhk7734@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Newcomers, latest patch set:
https://lore.kernel.org/linux-gpio/20241226-amlogic-pinctrl-v2-0-cdae42a67b=
76@amlogic.com/

I included some of the prior meson authors on the to line to see if
their mail addresses still work and if they have some feedback on this.

On Sun, Dec 22, 2024 at 10:08=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> > > - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
> > >    so we keep this sorted by actual vendor, sunxi is apparently
> > >    yours (AMlogic:s) isn't it?
> >
> > It isn't. Sunxi is Allwinner SoCs.
>
> My apologies. I mixed it up completely. :(

But wait a minute. I see there is meson. And in the "meson" subdirectory
there is stuff named "amlogic" ...

$ ls -1 drivers/pinctrl/meson/
Kconfig
Makefile
pinctrl-amlogic-c3.c
pinctrl-amlogic-t7.c
pinctrl-meson8b.c
pinctrl-meson8.c
pinctrl-meson8-pmx.c
pinctrl-meson8-pmx.h
pinctrl-meson-a1.c
pinctrl-meson-axg.c
pinctrl-meson-axg-pmx.c
pinctrl-meson-axg-pmx.h
pinctrl-meson.c
pinctrl-meson-g12a.c
pinctrl-meson-gxbb.c
pinctrl-meson-gxl.c
pinctrl-meson.h
pinctrl-meson-s4.c

> What do you think of the idea of a separate drivers/pinctrl/amlogic direc=
tory
> though? I think there are already quite a few amlogic SoCs that need
> to be supported and more will come.

So what about renaming the existing subdir "meson" to "amlogic"
and put the driver there.

Also I want to know if this driver and hardware shares anything with
the existing drivers in that directory. It sometimes happen that
developers start something from scratch despite the existence of
prior art simply because of organizational issues, and we don't want
that kind of situation to leak over to the kernel.

Yours,
Linus Walleij

