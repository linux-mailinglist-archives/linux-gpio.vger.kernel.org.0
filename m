Return-Path: <linux-gpio+bounces-6670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0A8D01E3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C8CA1F28222
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD2515F323;
	Mon, 27 May 2024 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KOnIKTNj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272F15ECC5
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817159; cv=none; b=MvhxqxQE+5Hswz8lnSqH9YP4eLVfPQ0D7s1/MfP6Ot15JGXsERH0Zx87ppRlbJSl/zGHnYoOnIwcheVDrqu+j138vYwr7M9cZosIO0pFRH/7r2FkJRd94TEedvYt4t+ROATAYiCc8ps+o2UmfB3WikqQdgT1SE6YN2Xg7ZZMt0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817159; c=relaxed/simple;
	bh=Q0QJSfZ51BjlCjV1fzHNY8jwcshLWXrd/Y3XqvZCfeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUxfb2K78/HTo+gS6eJ/2z/B1EhLZoWOr9YbSkNSaw1HWb6H3uxu4douYwFZB8G1WBer9j8vyfMO4n78UQpMbc6OM0QiYfK82oj469m2kIVndIwecLm8CSuHKlg9j7TFwsnKe0/m+Gi4bYPt2V4aUOeHfft/e/YIHcrnemlJSwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KOnIKTNj; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df771bddc0dso3187938276.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817157; x=1717421957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0QJSfZ51BjlCjV1fzHNY8jwcshLWXrd/Y3XqvZCfeY=;
        b=KOnIKTNjBXSL4sXJB2DG3Utd4EPV6UXPpNtvQkN+GYrjgA3h5QiMDJMfYjK83v1m/P
         SVpf5HywWLSvSuh3Tjzf6x76F9B2byAmMwV4k65B9ZpcmU2s+GVvcFpHolxMhTdRPrX4
         RWotj1b+PSBs3P4uCGTtIexf2z2fNsC3R1ipvmObb/RsV/3dgMTCT+7wAM9ldthiWEPP
         r3GgbFrrnDJdRfJczwWHnVqcUxO5JGBG0BY9YcF3Nghcox1+PbsqENHOlSyoygI4cSPd
         aPBUHvcXQ1rYTPToxbu0sxN0ynq/tqwbFC9ErL/VJWPIGDUniUSHruAJR80+YWn7vnXS
         fu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817157; x=1717421957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0QJSfZ51BjlCjV1fzHNY8jwcshLWXrd/Y3XqvZCfeY=;
        b=Nu/sJlaHJv60/l0UA5CWbhrAt7AeOEsXcMI+j9bnl8WZWXPK4VmwP8bP9XCjO7YDT4
         1Vsr85IHYcPezcOhvN1aH733z+whTzwI1cPI1hsjYYoJ2tFFRaYRSfWEENQV3TTjPK2/
         ZbK32OpICZ6dChAi+XJzDa0/YAMgxj5VUnCpSrP9/dS9pk4SPuJXXO4Ogql8J+YhPFeS
         PhRht6O8FC4xRIqFxTqz/XBLXTz3WrCR8kQGeHkA+NHgINDdUEb4yngGEp8AEkVhnJtx
         J7huuiLnirefIGPqv04ApPBXKVr0jSQ7pflGTJA0nV44NHa0uHOGz+t2S6kvCiwrZN3B
         NYig==
X-Forwarded-Encrypted: i=1; AJvYcCXLZx2SfBD+NXnFrk+UQtSQeoqt7k6qMY2XNCcQ+MjVYKez+oRko5siCgrR8Va+dwHkTxRPCU8yoli88LBlJMJh1gDQrCf6/n0FIQ==
X-Gm-Message-State: AOJu0Ywl9wybwm1mxMQhZYmWuLcbvTGIWR9vbbh8UHj+GSzcyFRxEJxv
	eZV9zN5GisrCEl0UjS/7oDXuPff+tD5bNf1sG7HwQcbZB3hFjK0QQdhrf8eUpIqdI5yMdrn6TyH
	2zAKMewunb+LU6diBxrpImA9+RlKR80gTDwq5KA==
X-Google-Smtp-Source: AGHT+IFc+duNcD3dnl5PlfSWaeU543iVanFJg7u8zsI0JSvx+fv5ZxRzO7wGY0GpKjQer78ULichDeY/NaieOEgzTKI=
X-Received: by 2002:a25:b11c:0:b0:de5:1553:4351 with SMTP id
 3f1490d57ef6-df77218b217mr9183346276.15.1716817157481; Mon, 27 May 2024
 06:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-4-johan+linaro@kernel.org>
In-Reply-To: <20240506150830.23709-4-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:39:06 +0200
Message-ID: <CACRpkdZrTPyv_4LuN7VNhL7VFqoNzPq_WcooJLzELfmCBaF_jA@mail.gmail.com>
Subject: Re: [PATCH 03/13] mfd: pm8008: deassert reset on probe
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 5:10=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:

> Request and deassert any (optional) reset gpio during probe in case it
> has been left asserted by the boot firmware.
>
> Note the reset line is not asserted to avoid reverting to the default
> I2C address in case the firmware has configured an alternate address.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

