Return-Path: <linux-gpio+bounces-22099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E02AE700C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019E617C4A1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0CB26CE11;
	Tue, 24 Jun 2025 19:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hP/jpYyw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A63A2E2EE3
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794323; cv=none; b=GQH0wqQQ6hwtn8N3CTblGNUnfU9ZalaAEdEOIjcfHT+BRB4KhBWj7SqEq1kT/4uLOSmLY3yfsDP7fQACbtZYa/bd3O0un2L4bL1BlPbB2xssg9oWLXyuYT5hOn0iANvWyJyPItLdXFurupbm2+Gw9E79weP+i/4dRXazaOOWhCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794323; c=relaxed/simple;
	bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFrR07K7n4eNvCvnu7EKyukmOTlKJVGjNsIIiiy808XpFYlx3AGUfHztOdR0HboVQ3ivoId6cMD7b1FkXtmnwf06jBMbb2s4IYbAx7sJDrycW8U9ZtIV5ZXeADpjKzP16irrVdYTU5cDg6XeKfuGEAsZNHSuchO+KIt9u29Rgc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hP/jpYyw; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3105ef2a071so69028001fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794320; x=1751399120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=hP/jpYywfPh1JFB9YkQ1vVGg/+/Jg0mkwd74myvKZZ5kOqxrZlk74X8dd5v4JAWT+W
         +TYXXGddhgNvRRrlHEZfCtiWpzzVohLCJYSdrQv43nca7M7Y8hlHjkdIsEXKVEnNig9S
         g3Qxdegcxt2ZpMlqYqxX6wK6qsdDWi4sY8yYnjp9176ycdv/YCb/9ADGmM4Tv0ztjVoh
         eHxZm8FjnMw6nV8tUq0Wft+aCAM4N6QnenxX45+qPmgEJMwpEBuy9tkfduQyaNCz91dB
         BsOiOK9Nj1kxneUmoh+SGxn/EIivLF3v5Uqd0X7jJHYLmY4agFo6qcEyzO1G2SX93Uon
         Yk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794320; x=1751399120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=px+jpkbAhgAmEk4TYVd5fPT3tT91ZI/70J5HJf2wDnkCBmOWXb+CY/Y+aPeJDFQWB2
         4IMT/O8QiOqcFtHfNWClRcuBzL0+7j87jKa/NpIAQK8rsGWc2KZvhr9pj1ICxDVQbb4o
         VnNuZFnaLb6PRVfkEmTPnMrab0HYw2Jijoi885Z7Ki8xTh1IXjwNP2CX8jWwsI8TXOXL
         8n3GHmu2Uhow1RKuMPYixeIUU+r0ExwwnxdAs17AkcTa/yDY9dh2PhMkAqtf/SklckcQ
         hVJBFxYTQKwv+rK1TVtv8T0Q3quMu/NdHF6npCqr4zpycabNC6yQaNqKhi8/z9GThYa7
         pCcw==
X-Forwarded-Encrypted: i=1; AJvYcCUffc92rb6NzbgUz08qrRd16P5/WO1go3lf8vzAYmIdVCza6sg2heqHsVHJby8C/83sfXSKIEht1/Iw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlh5wnkP3yNNhj4m/DnIVsh6WUbXSUfBwKsEoyyPTqORFL6oN/
	g/zwhvdeLP0D+alp34OSSpIgc2dTMYdtQ0W/pVuRRaWHIKyXCwYXOP6wJhZeTYbAuXJKu+HYdNw
	pfGuDcEQnSIvUtj6lEICq319gJhGbyT/iLol0ZyfByxhiwN5LNcd3QyMgXg==
X-Gm-Gg: ASbGnct932vDKhc7/g5ubeWXuSlq+5FbNlLdJ6M80JO7iPC7NXyySXSNkLm+ttMiBdJ
	TSKd4KGINGXeXdLVVBzAxTZ3CjkjoIkDuWOii8Qk3EwN83wPeiUFB/LleAGcVyqrTdA4erwWy0U
	sy2U20fjenyRweIPVRPAMQbacs7SNjaw+v3+SbDc3F+5g=
X-Google-Smtp-Source: AGHT+IGHrdlGkQUWphFDOu9KYoSs8Q372bw5fsoYgco33pNU9fbGTgKUqdcWmtZRyS8Ikc4JU9SHkbRiDX4irW201y0=
X-Received: by 2002:a05:6512:1396:b0:553:2bf7:77be with SMTP id
 2adb3069b0e04-554fdd0ba1dmr50743e87.22.1750794320312; Tue, 24 Jun 2025
 12:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:09 +0200
X-Gm-Features: AX0GCFu6Td3LW-_JOyLEYO7GYkA80dSGig80su6HVwjgXpS6hbnfvwIR-aklY7E
Message-ID: <CACRpkdahd=5cdjL4Je4_PqFmV8dkSuuuRLxdPB0n0-gyFKin4w@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be
> parsed by gpio-mmio.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

