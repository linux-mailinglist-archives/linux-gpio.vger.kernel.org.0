Return-Path: <linux-gpio+bounces-20056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A859FAB55B4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 934407B2874
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5605928EA43;
	Tue, 13 May 2025 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLDzxz92"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036428DB72
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142032; cv=none; b=OQYJ10HsU7UiUxFWLh5x8P0721iz8JdK72NPbTH895AsEN5jQn5S2pwlUCA5zfobxmBwB7vFRN4qFfUq2wEsUfp1AKXuKosf9MdPBwz+XOcRkgX70KqaWxhyjIJ3Cg3hRe6SUxp/0rlOIGdrPtTCVuW7OMCYppTzYDesgp6E2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142032; c=relaxed/simple;
	bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IT+9aorDVXEzrbZ3jCdCLZ0JelZhV3uX+HZO/wYpP9FxUFfKnY0MoFGvH4cevNZ4RLL0Mc0646gWw6d1fbqEU5Wbd3lEvFRoyelHf/2WyGxWXRF1wqErvORY9b73KObt4FOlg79Cg59aO2mlIY0xhUux/wondTN1y7fB4Y+Db70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QLDzxz92; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54fc9e3564cso5458425e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142027; x=1747746827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=;
        b=QLDzxz924SVUm0i5grfkNxKCa4GOuzB++lKlQnn2y0A7NDARziTCf3cjsl0QvBPp1z
         POl0WMA2Pt8z7TkRroAaFfRmCSHgzm++WY/mWDC1K/M0YlM6+MQMGf/H5Kob6VLcoVAz
         3SdQlKw7Ww6V94ZjnudJ/VQd/zXU8r/e3p8x+SAVK/uRiQpSeTkuXBMOxLFOX4l9mgU+
         MexX4fzgmWOq1b2GCeOWH8Gop71uXTpKcOSVSNkQvB97zE2+Tci8CB/2JBX5do8afgPU
         YIxYihcBMApkiTydTF8/FQ0uPkaFXdmLHOTAcIoApNJfyVIvRYKvCmtAW1v9MepDAsQp
         /9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142027; x=1747746827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=;
        b=GGjBpih3s65vnQb5f3lZfdmeXqX9GGJJSP8fwfxlyu9dyRNY8dtwt00KLnsxykyv2Y
         YO2QccM0qVFW4R8VxLIqH+vmf3wYp7OUE2ltstDOKaNQjWtD8vtAyh4cvFsbWz4hP/aJ
         j3gVitvRFmV/ZbOeT+BKp5wGHuvmGfUWOcFaYsUatedoZA1t0qBsMaMxKr2DS5XPBzzV
         33uHN19iLqP9gPUAgGWCkCFDrN2wmRBCfony98dHaZd69fX9OvsW9tH7ZPQ9soL51L/9
         Ow7UXVUPmlF1Qn8Ode3J+rzmExn/jII2bpmVGRX+MbdHdvvPDDRRSkkIX02+Hul04SLv
         9gFg==
X-Forwarded-Encrypted: i=1; AJvYcCXDQnynACoSW4bQ2mjuw6JboCxiXbUCS+N1c6khAY+cNGw3oXVnm2N+yZQb1zGdZ/QYybvxEtMv2b93@vger.kernel.org
X-Gm-Message-State: AOJu0YxQAaGojXQ+7thqqZcY9P+s+g6lPOfBYMJJMBwMvITf8wa+i8fx
	PozRmiQJYrfd4CMbP1UNrlJIj+ui5zwwgCXqnDif4wELk0mKf3SfAI9XkrQLCLU9xBh1xlb7SBK
	VHBJWnqQPEOEiSwHSr+qQjlmMWf3I2nLQ3Y8TDA==
X-Gm-Gg: ASbGncvwWwp17qkZVYfaJuWhTIB4oxWtoM1tMI/vAmm6I0afjOdwVQmgJPmvBgg8nnk
	z0P+H7pGeeHQPAKmzIC5vJSI5X0f9qb5n+GT2RlDt6XXAWkE4II1RRMb42/MQrRoswPx5icahNN
	7aSFbKZtXnMrKuR8eWPbTYnoCq8g3UNSe5
X-Google-Smtp-Source: AGHT+IErd1zECtSWmiueqkwD4t5q1dDN1qHnbcMn1cncmM9gOi/5w9TSouYOqYoqxFwgSSQ9wh2aWvhxApgZaMeuOic=
X-Received: by 2002:a05:6512:640b:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-54fc6764426mr5389978e87.0.1747142027286; Tue, 13 May 2025
 06:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:13:36 +0200
X-Gm-Features: AX0GCFtipyG-m8FrUnzYpmqYR7dxFkSgGJS5zK3dL1i48JJGkPJ7bD5UcE0Rkes
Message-ID: <CACRpkdaDiJDoyW18cAsb1JcJvFvrweWKtUbO0=pUtGKbz1GtCw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 6:47=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> This might be a bit late to post this patchset, since it is almost rc6,
> but no rush here. Not expect this patchset be in 6.16.

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I agree with Andy, why not just apply this, these drivers have
had long time to adopt to immutable GPIO chip and your
patches are generously helping them to migrate. If things
break for these users they can fix it in the rc:s, and if there
are no users testing these, well that's a community problem.

But there can be some fallout, so it's your pick!

Yours,
Linus Walleij

