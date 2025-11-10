Return-Path: <linux-gpio+bounces-28295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86659C45F14
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 11:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C407E3B6B5B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 10:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497F430149E;
	Mon, 10 Nov 2025 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVT8DuZt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32006225762
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770663; cv=none; b=bspSGUJa6qD+bWvAtJhQvnSeSP8WfjzhM0ZCNlB2Cv1lDhwOQXuUQipfzu5xK3Nm1QxmJjvhKff/+5mOE+EQ3jrnYoD6PmRsVIWePE9dTm+66Tu61rM731OZpQgeeQe6J2ODx1quds4XtSo3H+FU1Y1tZG7LICQwWzKHhN5AMwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770663; c=relaxed/simple;
	bh=GISx0LVyM2/QgivELlFUbtboVFx5/0Ttdw8BgePqXok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SosQ0dMroXTaalNKnI/PL1gC/9SxvOQpkuCgaYrgr/4H/FdmXeNCL6tKjN/JEM/WJhjJdVBTgH6osMmDsEpZw+LMT9WFaYlJ98WcEFBLP1VYcbAHB8KikeElV4hnCm+kqTqoKGyM46vnLuoqDCqLTbCyBqzCKlV4GlVOWkp83K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVT8DuZt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-594285c6509so3085987e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 02:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762770659; x=1763375459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU08++yZFWV12YufiFjJiqJethik/+S6rZcQDhNnBws=;
        b=wVT8DuZtYqJGoFHtBH+2Yw8BycLbNfKvuz7XIoCaZ2aYIEJABKzAS9INK3go7kiOXO
         0x/EvkIXjfJxrIMvEmTROhOjkITQ136CY2l6r3qYLISernAVQeFJYpAF7bnJHI5wP4/A
         zh1ayRfklvpvp7vxCd34uTLQoyg777PuNg6tRlcc5EynL2eQEmy1rFeXSK4zcxiYSLdL
         BgMfSF0S/GS83DqGvO7YdqNkyLrMnYuJu4j8xteFM+Pseof4PvStY2PabnNFdtz5YHmK
         4CNNILVl64/8gR6uTlGZk3B6oXytOaqv9ZuF259AqNf2yiy9x9P+hCPFm7IqpjpPH3xY
         LYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770659; x=1763375459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QU08++yZFWV12YufiFjJiqJethik/+S6rZcQDhNnBws=;
        b=I8LrCl09gfQM0J9Xop/LY+4SgphpoO/BH7zpLb8/T5jKdYRJ9nhC3f1blSOgXdGLNu
         oY1+w2JyO3NzxmR67JQFLstOx6LI7VEJfNeT6FQyMD8Q9NPEEE0IoSgxjV4w9R0DmSgZ
         15lUzOLCvndUg/ZjdikAbb0PsmFSs4fIYa7lt7fHy9RLSKBRNqzqlSAV29BRBU3IWinI
         6hQHkuZg3N3WXigpaVz+BzETBiQpi6WpgrCKnJoE9iX1f/pqvc/QVJCsj6SMNswbAv/Q
         v7GyXwetGuCL8kXNRT12czFtKx8nAWVgfXbFOOQ6dOcB8E+Ta3LIfuIMZS8kspx9RVot
         KN2A==
X-Forwarded-Encrypted: i=1; AJvYcCXq47UhdcrRH7LGezVYoAkefj6P7ShwtQfU+MMp9g9/AOlnKo7Mcgnah/lhqC/mZ09Z4RxvEN0ZGJvu@vger.kernel.org
X-Gm-Message-State: AOJu0YyA4XiFAotTCR9qBaOU6HR1CT8Bhe2+YqyBieQJJwp/z1E2NAtm
	GVRobHDjC0VZ7QDChEemvodV4zLoOdDjb2CvaIHeg6D6VoRELVOivO8d8ivCPACYV1XUnjBdCPP
	eJMGfm+jpqk8AO79lhaHAT+uHSjL2GHPtTOthgMTZGA==
X-Gm-Gg: ASbGncv4GDmsg1ZTLbQ/mMWkq9IVwTd2xPclBGlUVY+WYAi+97joeqYSXmnwZxVcjKE
	87C8nE1gkJMUg011Vt3TNDOUjCkh+1SXORLtCrF9TWZ1Gb+I7Tbj0tPieQgYIum1XA/8z2xbpct
	zpYWhfQItK2fGXLiqHncSiCpupcMPmxFjYqFIbYA8hBZrLulyCPkeS7xaC3ErldXMgDucJO/5l4
	qD5OHIw4t2ui92VNmVR0gK7eyMD8Xbzm7rTnjkw3eAdTSpoqwdr7lLqa+YCVCVvHU9R1QI=
X-Google-Smtp-Source: AGHT+IGIXbIku+5fYyzKohAAT6RG/P8U2C7G8e9kXvVMEvCfF8edHPq84Zw+IaV6jNgp67Ypm1mnZzGXPUSxOGgBk6I=
X-Received: by 2002:a05:6512:3d05:b0:57e:c1e6:ba8 with SMTP id
 2adb3069b0e04-5945f146395mr2089860e87.12.1762770659287; Mon, 10 Nov 2025
 02:30:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031160710.13343-1-antoniu.miclaus@analog.com> <20251031160710.13343-3-antoniu.miclaus@analog.com>
In-Reply-To: <20251031160710.13343-3-antoniu.miclaus@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 11:30:33 +0100
X-Gm-Features: AWmQ_bn6eI5FE_ScZi7BjkTK0y0_CSDlwCtPcUJZzvZroFx81ufpj8BGANUbJDU
Message-ID: <CACRpkdYdtcnxyP4xVsqVK+geurEOEURqZO5eLC96YMqh1sE5Sw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: adg1712: add driver support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antoniu,

thanks for your patch!

On Fri, Oct 31, 2025 at 5:08=E2=80=AFPM Antoniu Miclaus
<antoniu.miclaus@analog.com> wrote:

> Add driver support for the ADG1712, which contains four independent
> single-pole/single-throw (SPST) switches and operates with a
> low-voltage single supply range from +1.08V to +5.5V or a low-voltage
> dual supply range from =C2=B11.08V to =C2=B12.75V.
>
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>

So tying into the binding discussion:

GPIO means "general purpose input/output".

I am really confused as whether this is:

- General purpose - seems to be for the purpose of switching
  currents and nothing else.

- Input/Output - It's switching something else and not inputting
  or outputting anything and this makes the driver look strange.

Yours,
Linus Walleij

