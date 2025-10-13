Return-Path: <linux-gpio+bounces-27011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA0EBD27DC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B9824E46D0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A152FE594;
	Mon, 13 Oct 2025 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKZfhagI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F552FE058
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350440; cv=none; b=msQFTcL2NUCTHBz5k6i9tYrgAEA+g9reSuw/EFfa2X9yAIO4ANHrFtyV517rAhCM0OrWkaGf+uGJp6CBIsohjcrZ5fTqU1XQfv2Soq7oyUKwX/upslWI08cKS/MyuAuni9Z2yYdINoZOgtuL8G+pNnh7gULvXQ82XgV8jiul8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350440; c=relaxed/simple;
	bh=IGEdbdnaRYWKvG+bGlTd3zUjiAzrtQYQYYulGQBXPVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1JnYZlfa/E7c+gUwvzBjtIEz4FZQnVcWMaMWGvYYFoq/k9khHoFP181ZERc6pbfp8hIlIqYWcpHI8G9O46sei/uWtIKPBYpD0flUoOM4RIr8832p7FMUTh8qZvvrbGj7V0Gk8zv6X1ndv2f9FQR0yi0yzi/KXrJXHbJOAJSN6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKZfhagI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3761e5287c9so37934521fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350436; x=1760955236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGEdbdnaRYWKvG+bGlTd3zUjiAzrtQYQYYulGQBXPVQ=;
        b=ZKZfhagIj4u6LFe1ocgaUTzSTxvFJFATTfnN1c9c/AdjypBb1UGUbP09Fx3EnBE+V+
         ARQcg4e8vFVK7pMSIDZnYie6DolRBozXlWhK/IRYGJiAPlBofRDR6aylXeYBnpoEuhGv
         iseiSIp6IXmb5/RLAHGKdNmtne2KJEtCyfTYZ0GQx29OIoLNNzHbgbSiteZThI+1fWuy
         6iQ2tqxonukRqZd0+JyuVUslzM7a580S0vPXua/SUOhzrz1GTRaZIO//KZYPFxh0sZ0B
         acM7pGN9n0B7kTv0eVLtIP4kLr/o/6MnJ/hKYZViZoR0nzeRLFC72GSOAZE8q7uqRi95
         bVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350436; x=1760955236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGEdbdnaRYWKvG+bGlTd3zUjiAzrtQYQYYulGQBXPVQ=;
        b=klWXD9q/mQ11lsV3y+RmTF0a/J7n7WxV0xFa3iV5Ie9FUzx0rVxm18LGCmW32PrgJ+
         xvrV4gpO1G4zg3C6xNNvY95p64DqDxIfIrSLdEJ0QWxq53DvyqlsDaFb+vyRSYhf+CDK
         x6WNdTXzbj5TxX1RhOtZTDewabi2fNQM0kllSTvNGKirrYgYWK38g29ytIuojhUQaquw
         LjvrDphbZj7lqNT4pToZHZPBJN/wpXRyGsDKbRwZ6N9BVpr3WxXF2XE2f4YsYUwjQGMb
         MBzk3JYFbHuG7/vG6bzWVIconWtEc4MgoQvOtJCKP6mR5YR1pyTf3SUnszjcX6DMOqGj
         qmmw==
X-Forwarded-Encrypted: i=1; AJvYcCXyT+RGLOdO4+obo5HpK3NyK+V2oYE4tvF9nwmhP/XQ9wNhzcwC9b3bbBq6KtTii915i3uVbO03wViB@vger.kernel.org
X-Gm-Message-State: AOJu0YxOI4DbhSUIctDMxDT99BJBfX8s+EICm8b4XMW8DtpdWfq11cDb
	M3fOK/9OsvSU4zgqnoAigJ+gHl3azoB5eLlXYkEmPqGxgN+awxmpclql5NKIXRsjCsfTMNMN+tv
	hzoqcSrlF5CLJD/IDJJz56ksCKxMKu+4cRplHDbtrYg==
X-Gm-Gg: ASbGncttw8d5e5uWVycffs937RB+zGkbGNbVpn/anujgqzb7Khof0mRp0/S5JOqZljP
	8jkM0/xlDEnwH/6+qgwcj797uYGVHZ1IQDpjFg5lGDizFF5FGWNbINWlWcGMBp6C59JpNAFY0LK
	rwDD/AXG611Pa1wREnYGkPWkIPBzzSrGRKhWMftsfNDhmwi8C+cQjToo9uFO1FXxUPLMIbnP5Qi
	1iFhzPjJtZKdGVSynmejGe0alExeQ==
X-Google-Smtp-Source: AGHT+IEyXfMASnDudG0S7N/mc330ju/Ch5pEVZ3V2N1dVue3s7gHw8dguHiupRcJCaA2bDWHDzkge7BrzB3mH+HUM10=
X-Received: by 2002:a2e:bcc7:0:b0:368:6a3f:35e9 with SMTP id
 38308e7fff4ca-37609e4d4c3mr49784771fa.36.1760350435755; Mon, 13 Oct 2025
 03:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-5-84cadcd7c6e3@smankusors.com> <o23idwppfthjoivpyzjojmoakdorr43gpmo5opmeet6oeud742@qhk2j5bjg5aa>
In-Reply-To: <o23idwppfthjoivpyzjojmoakdorr43gpmo5opmeet6oeud742@qhk2j5bjg5aa>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:13:43 +0200
X-Gm-Features: AS18NWBAyKKP7WpPbwzZSRGYCjWy0-gOfocVoYTqFPcgneZRB7ljrZVj7GcZyxg
Message-ID: <CACRpkdZ8kQ4AKLtXpUXPu31DKAGZ45dtzPA=-moBQDtXsY4Wdg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: qcom: msm8960: rename msmgpio
 node to tlmm
To: Bjorn Andersson <andersson@kernel.org>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-gpio@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, 
	Shinjo Park <peremen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 5:11=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
> On Sun, Sep 14, 2025 at 06:34:59PM +0000, Antony Kurniawan Soemardi wrote=
:
> > Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> > convention used by other Qualcomm SoCs.
> >
> > Suggested-by: Shinjo Park <peremen@gmail.com>
> > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>
> Note that this patch is in a different subsystem and is picked up by a
> different maintainer and there are no dependencies with the other
> patches. It would therefor have been preferable if you sent this patch
> alone.
>
> No need to do anything this time though, I expect Linus to fish out this
> patch from the series.

I fished out this patch and applied it to the pin control tree :D

Yours,
Linus Walleij

