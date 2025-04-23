Return-Path: <linux-gpio+bounces-19197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E173AA98489
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 11:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FD147A88F9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2793742A8B;
	Wed, 23 Apr 2025 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wmYogycs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145A51DD539
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398872; cv=none; b=DxAuMbZV1CPL2VB3xhhxltRdO1RcK5FZH0JnF9jPfKrfoHNbcrscVJgrdE9LsupGhQj7Ez0EQ84ZOGyA38Cff8qq06y5bDX+uW/A9oLTuikT/Qisl3MDkkchdhdsbMtemDLE+8zai34Xg9xrdrK/83FdBm+V/hWComHqudOPa8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398872; c=relaxed/simple;
	bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMIimePiE+r4zxRgDDsB3pY3IAsrY7WOt5If1m/N8uWaqMX0S+6X3DeiIMcWdr2Bk5C3TogFuFl/J/ljwdyNXFg5tu6AAU1owHVPLhfypbXjXsCk90vtjECx8+iv7KtI4YDgIW/W5i3hWdK29960Cg+zDevnUemMQbei72Vd9L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wmYogycs; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54af20849adso717251e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745398869; x=1746003669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
        b=wmYogycsPxJrT5IkGprAIkXL+9jDAOIzLQieuEh85TszOBHxPFwG9p5PzljEidlh9+
         jxUbO3Bs7L3VzNxJCG3vQOvxvwU2DWndvi3ZmNqMjkOsvNHzS1Kd9Gwpt0ieuSIzpkzp
         E00k4LvPWP3IQWV+IIP0whnT3x7gij/Gn8YDAUqvs7vTHimgW3aRByw5dRewYdZYYv+Z
         TGpDFP0SUJl7kwYo4+Hd3Xxg8+05yyZQdtvEgL67A++QxvrTw+goSumWNlJvG5Dn90Js
         CuAsqfDh6ZQgnmmwg7gfNaf55Ns7AD3pvbd9IhMSzw/cieBV21UxQCLF9F9j0spVAjqD
         Obzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398869; x=1746003669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
        b=GRmF9k7mAcLbZdXUe4jtn5kLsSC3Tj6MxwVbtd3WBV9kxbLWJ/8XvLAap4dsTPGVh5
         wryNL94c5bFFtQPAInYkFeCAs/jC0REO/86LJPpppVmprr1kSHjw1kYvw+rkyBSl3WMN
         yaZb4LtEV4+j/ZgNQVcBU2QyyajlP4hMcm4hm+1Tof4XHnMJWWCarPuz0FJkp15XRzFA
         9ncoRA2rsJyzJ6tyt/quK5/O0yxYlgHk5lDC8vXggovBFJFZJrrPzb25F9iXCFcqMOig
         XN0AcK0Nc1lZlo8X4WiaB8OF6rQLyZtLh2fG3VqeXimF7mbkJBayMjrksiMDAb6HHk9g
         //9A==
X-Forwarded-Encrypted: i=1; AJvYcCX5rHZu9yVuVuA6ZZvie5HyXtSwI/lmji4pXZQzNKFT7cirelrlrEL/Z4WQChEBxc8vvkZ91IDuXP3w@vger.kernel.org
X-Gm-Message-State: AOJu0YyitZuRgTyISFXvHaaYKaaADIdZaKjnlISKZ7vCTZL2flZpytO8
	rJ4KbYDmubDuzi51CtmgSLyE/hG5zK42nWkAhxm2dNYd2DebtMIhktW/p0ExmG6So+QSA+IR6r/
	Xy2ceCpKnXOdloq8XFDkifq4rjUk+2Q7iOJb4MQ==
X-Gm-Gg: ASbGncv/eHO4EK0C3gEJMWe+aFVT7JAAvpb4ttxfo2wbS7lIjP8lgmSh5BxnZUO2qKn
	UDZ0vryZgEn9diTZc/0qv/TG2sIMVQgDVb27a4WJ5UE2wlDxm7JSVMuMFRt6nnz9j3YiUDG9ADW
	x/Y3VQsUgR9FTbF8XpuwHdCg==
X-Google-Smtp-Source: AGHT+IEEUsAi88UCbofnaku2lk+aEb48FzRJxri8OckiCKB/AVx4JpJsbdKyriMomMEWTnYqEIv4ataPoB16Fz19o6E=
X-Received: by 2002:a05:6512:a8e:b0:549:8d2f:86dd with SMTP id
 2adb3069b0e04-54e76b22a2bmr572698e87.20.1745398869092; Wed, 23 Apr 2025
 02:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417152158.3570936-1-Frank.Li@nxp.com>
In-Reply-To: <20250417152158.3570936-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:00:57 +0200
X-Gm-Features: ATxdqUFs6bNpuAZ8C-mefVn5vnH3rPvKnGkG9Xz5ALDijczN73qOaRKozbezrQE
Message-ID: <CACRpkdZkhQRdDCTBxOUifT3uX047us8cFExhZiuAUueegD-zeg@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: convert fsl,imx7ulp-pinctrl.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 5:22=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,imx7ulp-pinctrl.txt to yaml format.
>
> Additional changes:
> - remove label in example
> - fsl,pin direct use hex value instead of macro because macro define in
> dts local directory.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied!

Yours,
Linus Walleij

