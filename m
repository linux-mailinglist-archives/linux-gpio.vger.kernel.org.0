Return-Path: <linux-gpio+bounces-6259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9478C0725
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 00:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF6B1C2138B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 22:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82021332A9;
	Wed,  8 May 2024 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NUKw/+0m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6818C132C16
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205966; cv=none; b=a6YauaRAcuqeVZ1IHLqaK3czk7HOsJPVP9f/7r83z11am0xGLpDCim5FO+/G7692vhGX2zZnXCH7lRgS8tAF1drsMW+7huYR0hAWkTL/u7hPH+MU4QasaNe74uDiTd27D6bKxJZtNg/z1wERrpDTXyf/7RV4IejcGiaQUzIDNzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205966; c=relaxed/simple;
	bh=4GmjLoOojpEg7WhLizCXheISc+kGTWTFxnKHwCHw/Mg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ce1r9B04P7EbEtM4lXdc8xRzd6W0zEvcQei8pR8dbOCFiDQC97GxMc/A++vTPVd05T60b/Q8GnDN9PeTLB/m1slmIp9I1PSy8Ry3n005KxvqlU0OkzR8y5j2fMSMU7pQAOv+5Ob9+S9y/p8LJ1BQaZ9jhybGpvAXqvFavorMHZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NUKw/+0m; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de45385a1b4so247375276.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205963; x=1715810763; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GmjLoOojpEg7WhLizCXheISc+kGTWTFxnKHwCHw/Mg=;
        b=NUKw/+0m0ePExsvsFHD3SgHPUZge/vpDH/1dWH8O7p8/C9Uj2ki0Z4odqVes8b12Q/
         ovAjzzwOCEd06dRukza9R7ezMxIptvyJGeEYkB23iOx9kWqVy5LIa6lvh50iE4oPGwsa
         l2fFjjc5rqAsG9atJybFMht7N9T/73cXEdgJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205963; x=1715810763;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GmjLoOojpEg7WhLizCXheISc+kGTWTFxnKHwCHw/Mg=;
        b=rV8DU+TbAXNmhEN3WCb2rV7AdTcTBsfAsSPKsOKFRt/EzM2WTJMSOYmFJgTs/V0X39
         UNXPEcPGIfgSo/lZQi5uKDh5Y1I5UCLR2f9q7z9WIACzAzr7uH06bpnYuPXgBjCVooRm
         bcgPLM4snD7mjPuhbJ+WHwQkU7GT71Ktcfo+o0x+fEpPvKlV2BPA3YHzrtDj8j1e4LBu
         XhvIYXpjx0pPeqhp4bpm9Fvo+ZOzdcufDEvrCIBjmvZJgIMKGGDDOvZo+xqM6lYntkv9
         g44qHloNteCx1wXSRY4LBzhHs33R7WuQMQ+Imc+e6JA9yLErUwcRNuPSsvlBSy8z8HqY
         fK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtGcLh5booMtg5kyL6UUXqrJD0TbGxAaz9HNKDkNyRP2pOfvCyeA9neFbq+CmBmHDPiYpWjAyYaRf1pmiGZd+Gyj5HkqPNcihRzg==
X-Gm-Message-State: AOJu0Yw1UT+yYW7ufpjX+p3R4KSp9RFVRnw13FkQAoj5WOwQKSgUt7Nk
	bmQD/F4U2a9rkXMyEhfa+6doV/5f2WhsrHLNqRKpL4XXSx/l/Ivhbqh4bPWTtlY6+6vgNoT6U74
	G31Vz+tHCgeaYKTkBwSDuJe09twb6s/bXZgkA
X-Google-Smtp-Source: AGHT+IEtqqWBmwa9YminWEi55PV7HF4TSL0XOzGl7mR6y7E7ORDiXSQKZtGJ2hpXVXVDyymKtOMfdIRRGFW1rvQ6Pkk=
X-Received: by 2002:a25:bb12:0:b0:de4:627e:b556 with SMTP id
 3f1490d57ef6-debb9d89584mr4172658276.16.1715205963556; Wed, 08 May 2024
 15:06:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 17:06:03 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-9-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-9-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 17:06:03 -0500
Message-ID: <CAE-0n50GbXpc4K-zKOUxpGiPyQwzQfth0+f1fPDnSRH3gfwnsg@mail.gmail.com>
Subject: Re: [PATCH 08/13] dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:25)
> The binding for PM8008 is being reworked so that internal details like
> interrupts and register offsets are no longer described. This
> specifically also involves dropping the gpio child node and its
> compatible string which is no longer needed.
>
> Note that there are currently no users of the upstream binding and
> driver.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

