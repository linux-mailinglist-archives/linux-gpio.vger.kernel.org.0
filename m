Return-Path: <linux-gpio+bounces-21142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF17CAD30B3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 10:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0D4F3AE389
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 08:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E48281358;
	Tue, 10 Jun 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjdNqlvb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192721CA16
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544753; cv=none; b=UXt+apvFI3fbQT1DYgYUdP8dToGiYTV3EcPHWL73Vqs8c5Cfg6QXpBDAdvBcR/7Bmdj9RU3+j2DHdZuALukyuEcNVJyqo6cElhR8L1isaFuSPFxf3LphwsnUZxBdF8GUdohotSUWpxLTHVUAeJWrx4JuL38nsKRNxobVNLvBcsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544753; c=relaxed/simple;
	bh=Yl4VK5rapXeTeoJSO8TtkOTrZLDEqTO12ZY4/dzcD+U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BqA+I3ltK2Q9243iuHmdm8Cr+1M9Rb0Q+qPMk/1YPc46vLlq/gHBJSIiLYK9QrY2WF68fMl+GAswtJlqiPcBQ4RYtxtSZqu43Pe6fKurLR1D3XRE/J5lRoVc2saTgXk84G2SUOXyqy7OjRKZVc/uCnAK8/P/var6z0wrT2YE+Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjdNqlvb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so41517495e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749544749; x=1750149549; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yl4VK5rapXeTeoJSO8TtkOTrZLDEqTO12ZY4/dzcD+U=;
        b=QjdNqlvbVtV/1IHx2p5MIEVmfvFmv7GtiPiU8legWaocfKjNdHysysQo4h6cNUqZ+e
         OTMf2Mism+kkeKvq11TzU3s+St3N+sAfCqE7EDwUp7Hbapa5HIP2Vbk64egX9HISYu7b
         Y4Lpp/74+8OCyr5YjFFfpTGNSzzlxS1XL9jzrntxB082g80t7AMHan/BWflkZChTk6RQ
         a4dIkvke1p8eJdaEoHaTAHfus7EiV+7xANQYuS+N52QlBLjPYpcF8FVqR70oYZZMLWEL
         t7YRu/EqnVU54W3SaEMegVOCbP67hv6lZsKQLEA4iFRRh1TLYve+DN9eZrcVgv3QhjoW
         o1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544749; x=1750149549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yl4VK5rapXeTeoJSO8TtkOTrZLDEqTO12ZY4/dzcD+U=;
        b=K8BkLIIrzI8A4BCeFzJ3YzR/UiMkaOfeT9qiDfuNoqVtQKqabx69j5KNw3mi6EQxHM
         d5RWyVglFCSkUMZDRK6XUmS5FhfUCAaQRSR2XEwmze3eLNplY6Le/MzJHBE/1xrqhPfs
         wDrMiflPsJSbQM5fypb+EXV7v7mHt3Bmxw56j1TOF41kaxfKPyD0N4E4Swu3tRZhKSJU
         rJHZwoTMaE/0S39APTw/ScdZMYZvlHieIwlyVhNJ3Mn2M3D9ZIrpSUDf2XIkfHoKFWGU
         yBKdfrRW39WlIkDhK5K/eqPVOfHOXrLqscuy+jFShjPrVfG/NdWJlM/LZbnpl+CkIgRs
         cnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVScsjm2cIhcShf5L0eA1buWcl0PkJZc/mn673C7nplETQzmXto5PekHWslfoBr4rLGE/GW8bMteGrR@vger.kernel.org
X-Gm-Message-State: AOJu0YwKI9BZHxq7RrGCRasaw1JPswsrMIVNivKWS/43XeG+HcJ26toC
	bFNEhauS7q7vs/KNv7JJMEVqbtVk6FkwcrM5aCSer2TE15rbZeNJWAn0ST4H3TTFbUs=
X-Gm-Gg: ASbGnctbRGB3rif+e5hA43KXrjZpnJJRnq856wRy6azA9rNu/V9EaTXhz0wgzdrihnf
	LwL1qvhSy9YG+wY5Dr9pJugiIDgUSGa2S2H7/psSfgWMc+zAEhf3WUSCcnPOJ3fk5XTeeZNFtiw
	cRo3CEMC3cpOIQPPFhYuezkuTpsmte4QJV9T70uFD4MpWTNQV+i4sQrGSFreqjwSZBJT8TdaqFc
	lOM2vllv3flt1nUVclYOii/wKFJIIYDfqPJEAR2DrRvpnucdxvDQDt4MqDk+RFn8gme9cV6Zgdm
	/lF8BkWS1Ww74397tMKtKCXfoYRgZlVwrkR1cOo8IBw8R391OG/oK0J0SAUuYPCg1D6WW0XgZcs
	fSQ==
X-Google-Smtp-Source: AGHT+IEgnzAuPZxC9PK7wFrxzn2rTCPjmEyvknSgU3kvtfzCGxGRajpBv/Wk8P5qBxM/ob8j0SfRdA==
X-Received: by 2002:a5d:5f94:0:b0:3a4:ebfc:8c7 with SMTP id ffacd0b85a97d-3a5513ed8dfmr2108902f8f.8.1749544749195;
        Tue, 10 Jun 2025 01:39:09 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322ae43fsm11467552f8f.25.2025.06.10.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:39:08 -0700 (PDT)
Message-ID: <f44579e51082cd2d77dec514c1d2128981f6b3dc.camel@linaro.org>
Subject: Re: [PATCH v2 06/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Tue, 10 Jun 2025 09:39:07 +0100
In-Reply-To: <20250606-s2mpg1x-regulators-v2-6-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-6-b03feffd2621@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Copying my comment below from v1 of this series to make sure it doesn't get=
 lost.

On Fri, 2025-06-06 at 16:03 +0100, Andr=C3=A9 Draszik wrote:
> In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
> as a sub-PMIC.
>=20
> The interface for both is the ACPM firmware protocol, so update the
> example here to describe the connection for both.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0.../bindings/firmware/google,gs101-acpm-ipc.yaml=C2=A0=C2=A0 | 40 +=
+++++++++++++++++++--
> =C2=A01 file changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml
> b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> index 62a3a7dac5bd250a7f216c72f3315cd9632d93e1..408cf84e426b80b6c06e69fda=
87d0f8bfc61498d 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -36,6 +36,15 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: samsung,s2mpg10-p=
mic
> =C2=A0
> +=C2=A0 pmic2:
> +=C2=A0=C2=A0=C2=A0 description: Child node describing the sub PMIC.
> +=C2=A0=C2=A0=C2=A0 type: object
> +=C2=A0=C2=A0=C2=A0 additionalProperties: true
> +
> +=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: samsung,s2mpg11-pmic
> +

Since we have two PMICs here, but can not use the 'reg' property (as the
addressing is based on software, i.e. the ACPM firmware), I've opted
for 'pmic' (existing) and 'pmic2' (new) as nodenames.

Maybe 'pmic-main' and 'pmic-sub' would be more appropriate, but 'pmic' is a
bit more standard I believe. I'm open for better suggestions :-)

Cheers,
Andre'

