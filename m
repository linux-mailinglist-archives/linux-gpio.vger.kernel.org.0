Return-Path: <linux-gpio+bounces-27029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C545BD2F7C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 14:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A52143C5452
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1754B2749ED;
	Mon, 13 Oct 2025 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuHyV48c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BCF27144B
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358603; cv=none; b=T59NhJK/6RhHHsmHyxNEYvTL4gMxjRugNkQh9Y6BC4y9MR7RTUxrwUajH7axAT+9FctjKxUau3drn4GZhGJfErKjGSYXJxEm4wzkJpd3B5CgIs2gPn2kwwcQwGmAFLerFCrauAV+27bKOnRFztHQJnKbGE1jkF+gwZZkW3bAFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358603; c=relaxed/simple;
	bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWk+4oc7BBih+vfW/skYgi/tHLeMA0M5UqDR1dwCR6hceMlg2OOXNVxNRSAaZiGia7a9QS9Xfp5F4OhznD5ZwX0iMWMXDjzFiTrFUS3XosZqEhB22C8xIpgLW9UY/aFZI9gv0Hcq69n+S6uvkC28BZNUB+LbPD+Sgbtp+JTOOyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuHyV48c; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so4947032e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760358600; x=1760963400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
        b=WuHyV48cutS3BFuIeIUDZMPcLa6tMnyBbtcxK3rif3mfMAQ8/KPy23tjOczWdZwsOA
         pM7W7HYN7Is3DwRnSLIdWGYpbyL6yYwOoSTyHH4ty5cMcpkR4O3R1fFSfhY6ProapXL0
         c0YnntQczYeTnH6jS3oG4RUimeMHmcLW2HbYOmM9HXqNY5fSv+DmH12+vmzJ62E+/4uJ
         QPPGCDpNAZ2BHfBnyyqq4XppsF6skzr0cUoZzM2Nh0iQGnu0TVH5rhnO3S9kT9E+gKw/
         NExo/fyCqnnOezgrh+c0EREEKaZtYThXFgCuHGwnx6DciKiin7I7JfuFwJpXjUOGxFuU
         ZKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358600; x=1760963400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
        b=BwGTafpZrLUEm8aMwTVFQoFc2VLsN93pd/FDRHQ+tcIvCpo0BjyVGZ2Dqeac/XYECu
         4izb3WPx9teDydj6e4fwNGgNOPnjg5BysBSwgnGICKsLK4RVnI3cAus1hqxmVa9f2Hu/
         zO1JckajM75uhqHdzTStAdYooJ33+178ZngVPIooa2bPO/8u03DsWU2QmORY03nOimEa
         P5iHi7aqZNY6aO0krUof67PrtO9/QMw+AXZ+cy0ckOQ4QzfiPoZeZx5V8j6SG1MMzxva
         ojyWvUkOZX1pUDsugnxTQd9SV+HLt9/x6eRLkvMOkCyCpqABL2BbjJ/iAsIjmqEC3T6L
         0S0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVC6QCn1T3kOxjwYCtk8/AomZLjwYNUV2YyVbgIBhITBCGnmBv3rzmANqTGUlovxO1FCucAQM15kdgd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxij3oFaanJCzsfmrZNjTRKNIUPRkZpottU90CsJZfWKY2YfrWR
	OQED2htZ4/ysD8XEBy9CcbSs/oKf3yz7Sg0VALQu6cyF76I7mmXokzBqwHMA0IG5Kw+ESb2s4IZ
	EGFd13fk3Y2tGDm2VAxhBxFRvOt2BIow4pzJFPdcEyw==
X-Gm-Gg: ASbGncsVtQR0yIr7H2ezutfDbNg5KfBe6cuPHrhgGxHsaWY+f1+I2lUo9soQoiR+AVm
	EMpvUzvv11Qpc5TXwq068plpfYWGGm4qR2Cko45fEF3DCwJyJvxccRBEqEiJHK29Fw0ImFv095t
	0QJa0IlU4H7StMaT6NRUlkDJggb49uU3uTSe5d8L+9QnMWmH/xvqIstAPvhAtMmlWWMtTiQXwP0
	Z65KkwxbyCIjGHghs2ENFjLjGlYFv1g/GqQKj6Q
X-Google-Smtp-Source: AGHT+IHDziq/3pEjSE34Vb9xc10xnYDJuQK7aFT0KnwS0eJY8GRc+vGU1CYOsUeevL8U5VlYG6e//6jV5rAnbmRrIB8=
X-Received: by 2002:a2e:bd0d:0:b0:336:5d33:c394 with SMTP id
 38308e7fff4ca-37609ea5185mr56779601fa.33.1760358599989; Mon, 13 Oct 2025
 05:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org> <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:29:48 +0200
X-Gm-Features: AS18NWAyQHOstCpKlOfzZTMdQhypcq3gyuY9Qq5Lmp_pCYAjRMed25BVKMqEClM
Message-ID: <CACRpkdapDastXAED4YhKAXQ9byvMH6SHqt3zHHniGRJzuXhDRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 4:03=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro.=
org> wrote:

> Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
> to be compatible with sm6115 LPASS pinctrl.
>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

This patch 1/4 applied to the pinctrl tree,
please funnel the rest through the SoC tree.

Yours,
Linus Walleij

