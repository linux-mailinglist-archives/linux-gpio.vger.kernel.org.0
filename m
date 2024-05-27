Return-Path: <linux-gpio+bounces-6668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4E8D01D8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAC9629488D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FBC15EFC2;
	Mon, 27 May 2024 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aeGZyS+5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511561E893
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816955; cv=none; b=DxcP7O61ZQBPxWAbm6o1Rx56eOcu74GlCRBq7/34Oc87OPe9BaRsnw+xMtRthonfYvXorOxvvbASUOtb5xhz6C4DwAfNJCwImRRmny16paUYYJHPl66Lzr46gwD4t95stsPJUpdhpZAEk8ex46MC4a1jiVlN/qSPaanXHx3LkyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816955; c=relaxed/simple;
	bh=cHyWOtsQFJXA3gHNsv6N0XMoE/NjXO4PiddAGoUoIOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCXcpD5Tvh66zRCtGM1sFXKcggAKGlxoVkeGeNAvAJW3JD770magyKKe+QJ+UahdkqqW7pOp2sX3CoikGOr2TTBB4V/cMaR4s8z8/cVNBWnkjp5eLOHlXGTqNZlWzpvIQ9p+NC6hTFdyVBr3PMKwQppTTIifKP5cjb3oYQ2WkPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aeGZyS+5; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so5582558276.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716816952; x=1717421752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l1MPZiDRQM4PHTCb9pi2jF/YP3Ix2IGNRYszcmSCQY=;
        b=aeGZyS+530nyZWWgxl7zthUC3rtD7VXwi4R0m/S9NVh2swl5mv3if5f3ezZSMtgllc
         6uvzKpCTJiWjzp/NogUsYvtpWFvwXHKHJtLzAlciErAl/7ascXoEyKyR5weq+cjmXzyr
         6b1XZC5sFHVPQVba3YQmZE5sLhV4NIh8WW56s3tD+o8ak/hIQnqiY4z0WsJQjaN1uyRy
         spnvZ9E9FLRxzvi+WGqzbE495U7MBeuTHU3YO/NY6YxI+rP9J3DFN4yTlOVgDOr3P9Ix
         FYG22KBAkBi7z87RXfTGqnYjoB3EmNav/bv559rpG4x2b1p48MrRQollI1obUjo1I3tg
         Pgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716816952; x=1717421752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l1MPZiDRQM4PHTCb9pi2jF/YP3Ix2IGNRYszcmSCQY=;
        b=dJ0BXeJMbL300rXStKCcM8j/tK2Su7imk/clL979Z+OimyGzd15Y8ebtDUdSllirIG
         GvrtBcPAKB+2QO5sqsG9/yszN4crf9iHVNBS6wFjrufIzTWCLkvL30PnvXkfw31sGMB/
         KjGmuz9bsfRy5bB1pm7+1XAsDfaKFTOif1L7u3UgnYegmIFCyL7MRHLEkJp+JkYgoDwo
         iJb4ZIQ5kG7a/jkcrcZ9554TsCaHf4wyCgjehNkxVMWo2Hpat+94aoEMJsZ1S7Cu+wiX
         IeYebtM8sUd17thB24SGuRfBF5xPaeqqVHAAlBE7ap82fRVMioAlhk6Ho8bhJdTJHM7w
         cGPg==
X-Forwarded-Encrypted: i=1; AJvYcCVI3SLvxi5b2JeYyHVS2JoNShpJJ8/Z9V7dcDBTqZKpvVoTZ3FpNgXPGv4fkyl6JVBv0CsCPL0KL3IMcANCn4uVWbZdt46c9kDJhg==
X-Gm-Message-State: AOJu0YyExC1A8dDbIvvifW0Nvx2kS2dcFvgPYFzeHT6KvXt2eENTSEKh
	DdavtZL+EN6SAvUXCm/kqwyPhTUCwidhhXhlJavYny3jJWru8v7yBiwl8GvhO7uJs7Hvce+QVTe
	DIij+HN8XLVWAXaZrm2JGIsvhQSG223rAjk/vAg==
X-Google-Smtp-Source: AGHT+IE/LA8ME5QhFJ+uJHDIypk5nwZTwYjAHyFG+KUSEiBlCoShGuRS8LXccT+SSLRQq1cYnHUOPX0IwhCX6ekM/qw=
X-Received: by 2002:a25:ab14:0:b0:df4:dfa4:bb89 with SMTP id
 3f1490d57ef6-df7721c8a64mr9723707276.32.1716816952282; Mon, 27 May 2024
 06:35:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-10-johan+linaro@kernel.org>
In-Reply-To: <20240506150830.23709-10-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:35:41 +0200
Message-ID: <CACRpkdakSEGLsx+GwGe1PwTaOT3sBc2a=P0vvdUA3Q3xxHjGsw@mail.gmail.com>
Subject: Re: [PATCH 09/13] pinctrl: qcom: spmi-gpio: drop broken pm8008 support
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 5:10=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:

> The SPMI GPIO driver assumes that the parent device is an SPMI device
> and accesses random data when backcasting the parent struct device
> pointer for non-SPMI devices.
>
> Fortunately this does not seem to cause any issues currently when the
> parent device is an I2C client like the PM8008, but this could change if
> the structures are reorganised (e.g. using structure randomisation).
>
> Notably the interrupt implementation is also broken for non-SPMI devices.
>
> Also note that the two GPIO pins on PM8008 are used for interrupts and
> reset so their practical use should be limited.
>
> Drop the broken GPIO support for PM8008 for now.
>
> Fixes: ea119e5a482a ("pinctrl: qcom-pmic-gpio: Add support for pm8008")
> Cc: stable@vger.kernel.org      # 5.13
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Is this something I can just apply, maybe with the DT binding drop
patch right (8/13) after it?

IIUC it does not need to go into fixes because there are no regressions,
right?

Yours,
Linus Walleij

