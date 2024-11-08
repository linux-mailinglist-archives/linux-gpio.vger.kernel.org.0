Return-Path: <linux-gpio+bounces-12709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA89C18B2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 10:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1A671F248F5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E1A1E1A08;
	Fri,  8 Nov 2024 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVT1cdzd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15B1E0B6D
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731056595; cv=none; b=uJibcx8fI6OBlPWHQAOCNfsYRlJ52qYAcahkC8m9Xxx+S7Me7z23W2z73K9/1QpiiugD5ng/A6eYexERj5FLDpDFh+ihw1NrEdLucNAZ67R9KNjbUGtN6U5CC14uaEXoi7koZgx80lAlmihSgHSjvmoE+ZU7yPN2fzD3ozPUAew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731056595; c=relaxed/simple;
	bh=mM1q+PpNsdlYYSy0+MS7uMGw3FOxO3A/2cgbrpd+lLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WX8mCeiFBGFy9SerpfSjd3r7IP9bxEhLvxQSCqJDghPtzWZQEEdjwKIUhBxrOkBegooy5WduWBjy6hQyHz6LZZBxGeotDXi85Nyzk8xRbcvBzvJA9nKYBpDdTeuOgFDj/z3WFVDMPfN6gh1U9X4dzOoMOBD+5rKN5IM4szRHRHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVT1cdzd; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb3110b964so16259481fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 01:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731056592; x=1731661392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM1q+PpNsdlYYSy0+MS7uMGw3FOxO3A/2cgbrpd+lLQ=;
        b=SVT1cdzdHhk8J4vvzGfl0QSWqf9+mWHG3SdlfAcDe9PjrxutdF5yiF8H95Z1PFjvVR
         GTmsbsD0XnFwCGEKTzto5xvS2OxItki3d1o1cm8eUr+gZLdGA+sAFnuHWk3w8sbcNC+3
         b9wLr0OBz1fgjWSD53mNY6LbkFSyahQAcf4Z4qO63FdHY+L+7DHZMtDLrMbnQ+94DPGK
         CAQYHFb5eiloltk+gXe+2L3cxVcYB1LOHMX2k3f+acxunE1gpqKlW7is/68uX04CrIFU
         fWwYS5kjAFp6Ts3Q1F+ya1tUp4jTozE573WTZiPx1j/fvRj2+FnTUFy5htVNjJjBSVrq
         Y+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731056592; x=1731661392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mM1q+PpNsdlYYSy0+MS7uMGw3FOxO3A/2cgbrpd+lLQ=;
        b=UJGBd9RHagdV0cTFjh77fh/uuXKifUKmTSYnPwh3+heLqhxqg+tBaZbftMlrl+O8eo
         zUaLvcYmiq539h73LVNTcf8Nbxw6Y/V2NnUNVlbvm10oqfXy/fj2O7W1NLzx0g0R9U7v
         goZOpzbkbr3wBDdfB+tE5upHq2qBA+CBJm6zw9YTeyF+j625ENH7m8Z9n0MYBHZcZXdI
         N+Hr5npiKfLCFhUAcTnJ+sgJYr3kNwQ/TrMFLfG23WGR3BoTq35rY9HDTii48rVlgn9Y
         uQkRKw4O4DLmRyr7u8AA2rdkBjusaW8HlJQ12Hn3wAIw1Zy1fUomwqsy8lsf0CRJ6ftD
         KquQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVIDLSc1vT7x1Vj7Eg7FKgm3efnFTqUm2Li5bXCaJgKwms3N1/fLx6jsrepVbxdpjL0+ZDY3AFdHZv@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0rN2CxxbVKFoFQwYIShJR3j4yQkviOQxaV3fsNSg9ajf175F
	wAkowGi5zgfjC1za83FfJU7VQMiuA17dCJsyypIoK1YMgi8VS9PY72tnyIPXxbGIy+9EP31kSmN
	camYStXigVuFsal6wYhlFiuM+6LjJslx3LTSlSA==
X-Google-Smtp-Source: AGHT+IE8znKU2mORtpqCkmsGs3P+cyt3qFPqf5rFKSs3v09PAE6qN06MrjzRnmT+Va62FCJoM1OHaIoEnk1727lsx7Y=
X-Received: by 2002:a05:651c:554:b0:2fb:4ca9:8f4 with SMTP id
 38308e7fff4ca-2ff20209f08mr9538661fa.23.1731056591608; Fri, 08 Nov 2024
 01:03:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107-msm8917-v3-0-6ddc5acd978b@mainlining.org>
In-Reply-To: <20241107-msm8917-v3-0-6ddc5acd978b@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 10:03:00 +0100
Message-ID: <CACRpkdamugexe6y24Tk2fDYPP_t7QLynibdGQrUMFMwF4y90cw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Add MSM8917/PM8937/Redmi 5A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dang Huynh <danct12@riseup.net>, 
	=?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 6:02=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> This patch series add support for MSM8917 soc with PM8937 and
> Xiaomi Redmi 5A (riva).
>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

I merged patch 1-4 from the v2 series, don't think the have any differences
in v3.

Yours,
Linus Walleij

