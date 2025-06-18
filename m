Return-Path: <linux-gpio+bounces-21751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5C8ADEAE8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46408164C6F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8218F2BD593;
	Wed, 18 Jun 2025 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aiB6xGUZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714122957CE
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247545; cv=none; b=B7aUVN2sxA1aTpxqvP+gL3nYNfRf80h982gzF2aj88bruHZw895ZKHE4wKw3V5W3vVKsrDf/OtOkmRUroLZDhokex0uRnBJFH6vMjuC7occqXgR3G/bGzF/RGMTuoG5hTMpaQeiu/AsOtO3zBzdnHHAO9xdmu/agrQtJF8l0B1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247545; c=relaxed/simple;
	bh=eU5b1jLZCw8nEnzB6yiVdmF+qD8sNWEFFSroG2gd7fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2fP5dft0TVVy32FyxkGZXFDaKBve65yMWO9as7lm/+0hVTWoP/ABRrlmPKwwN2MGTj+/2EzooYwxfBZ5ltv3BKCJF/MPZxMoEuVUiJ+KxMkQguOwgD0FqurqM3dkfCdRh3Flh7VAT74lo2S+bPfRtipzvignREyRwWKr4VNKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aiB6xGUZ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5534edc6493so7326990e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750247542; x=1750852342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eU5b1jLZCw8nEnzB6yiVdmF+qD8sNWEFFSroG2gd7fI=;
        b=aiB6xGUZOykjxsf3HYlkaHplMNq57ST94UOJs+JYv9XKSphRWgYNkKAXLIuWfg44QP
         HqUwoknbkVAZFbCL7yUBwqrBuH7aVlEIea3beXfbXwXtJP9js+eswPzqsTUHqF+9v0fl
         8UGr/Kp7i7Vr8PxUsoBUA2aQO5fPIx9tUqMDrgn56A8knewnIchmCT7r2dGcv4gJpmpm
         7C9ibt6wNoiw6ECW7rrwrvyzHRjhBxOZkv307erGff9QCYgxOBBf49PtxXwjuYRsjRmC
         Gk/fQ7YBf1v/oL1byEkjEqVzpGm2xLDuzr47OmJPmIfXWsGvos4ivhwdkBYXMyuYfP5j
         az7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247542; x=1750852342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eU5b1jLZCw8nEnzB6yiVdmF+qD8sNWEFFSroG2gd7fI=;
        b=o1IL2E4rjbKpS6VfzixNLokn60N8xSLUSF2VA6ncFXIOzFq3Zhn3B6xV9Yka28wrRt
         jJ1pAMvJ4An2iNtdfpV4Z4sBBxRLuNEYlN6CqBRYiq991ANBdPDv3xLIMi/+oYUZAske
         2f+K9WggmkxFVGCwXB6l5rMeZVIqbE24IgGLzP8gjE3oSaIz9sB+lOxzJmTqJ2ZJStkd
         pSY1aiBzZRNm+yBO0gOov8Fwi20s3MpDwm8N5xPWbIHKrMA3uc1+qatPohxlt8MdQSwh
         eOMHedmDfqmtRK/8PUhf2LdYUUIIA7lZ/p8lZPU+6sLwUsQzsT1SHwkBHyOMNx3Zu9hI
         bU+w==
X-Forwarded-Encrypted: i=1; AJvYcCXSeBlVRq1BNahuL1TUMmNMqD+YlQ4eTt3KtbtiExvu9pVF6dt3RQfVamvMeY68v8uO9oVT7hkUlJP1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe40UsiDQAItcSAcJhOR/FaRofPKyZzZ5kPoZme/7Zwmwh2SH4
	vlR8xu2ogSbx2Uzbb9MWNjgcsH3aG3EQ8gmQdLlkBXSVK+zaG5D3I6I2qFVH7fDij2zqZD1X0GH
	j3Lv7IUToKYAht5XI4sfKihnCXefa2Cpk8wckvzNivA==
X-Gm-Gg: ASbGnctS+hASURncRHnkPAMP4q0GLdQBq15foNNVjY5E6/koe8oo9oLNXbUSUslkmyO
	eirg7M/AL0ZeNUvH/bJq7rigJDD4y1xRanWYtqGLLLMuwDouW4P+t16S9Kbw4wl5ryWzaL0Qpkw
	gT0FcItkqwl9nRY76prMXVzV4alO34cqqY6ITlGhZgpMk=
X-Google-Smtp-Source: AGHT+IHjWdSTmS4aDTVqDd7NBp2OPbykUx652+t/IZOVkWWGf64J/RLFbhbxDCwVOIM7rfV41BeoBeUWfyaPxf5hCjU=
X-Received: by 2002:a05:6512:3092:b0:549:8675:c388 with SMTP id
 2adb3069b0e04-553b6f5fa33mr4843249e87.52.1750247541573; Wed, 18 Jun 2025
 04:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613114518.1772109-1-mwalle@kernel.org> <20250613114518.1772109-4-mwalle@kernel.org>
In-Reply-To: <20250613114518.1772109-4-mwalle@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:52:10 +0200
X-Gm-Features: AX0GCFvi_Kw1gkeOTQZNsLTIvoCnOqNgSVyelJU-92RYyRLKgU7_lLqQN3HGdew
Message-ID: <CACRpkdabkT4cGLVVrAfSk_ehiiY9HLzpfsvUOEXH4wH0bXxPuQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC
 pinctrl and GPIO
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 1:45=E2=80=AFPM Michael Walle <mwalle@kernel.org> w=
rote:

> The TPS652G1 is a stripped down version of the TPS65224. Compared to the
> TPS65224 it lacks some pin mux functions, like the ADC, voltage
> monitoring and the second I2C bus.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

I guess the #defines for this to work are in other patches so it all needs
to go in at the same time, so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

