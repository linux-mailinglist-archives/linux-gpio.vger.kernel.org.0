Return-Path: <linux-gpio+bounces-2925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D6849121
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 23:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B40B2829A6
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 22:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53F579E0;
	Sun,  4 Feb 2024 22:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jt3NFkWJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D987B674
	for <linux-gpio@vger.kernel.org>; Sun,  4 Feb 2024 22:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707086889; cv=none; b=a+eN5fHF5uloF4Q2dRvW7EVUwM5fIER9B6eGfS/Xno5T6C8KvSS+EBUu796WnFPPQeS1Tc5pXqJjZ8K61uotUKVjCm23Qd7shLAc/IQ8Vl8AFYguOhpM9dGh3p8/rMbuh/5Ah8bGKoBj0EZgwWFDjEZ/XsUsRqBOvtO+zy6Fb40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707086889; c=relaxed/simple;
	bh=kD6KAqTBArB2SIqT/Vwa+OJYFmHJmT6pAMJN7lY/K7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwqe35kBnqQUD0bN/vhmdQKInmfA/MYQRYVJ9UYHRncW9/Jg5vj8+1x0A//pcE6T2+4A7ZIcaWZPboGqiDGaXYcueFyzAL5CE7gANNIdwTLH5Sb7Wz2y8jCB2OMAeSUzsuRVI5eCmGwXcz3e98PdrXyH8pW+tUsrf6fbHK2+6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jt3NFkWJ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6040d0c9cf1so36856637b3.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Feb 2024 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707086886; x=1707691686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD6KAqTBArB2SIqT/Vwa+OJYFmHJmT6pAMJN7lY/K7I=;
        b=Jt3NFkWJTwPAWRW2YUXKhx0d2Bxl03kN7mLsBSni4gxx1VHCcQR+ihhY9HavHUg4qo
         /uxYqC2rsTau8PybccPuixOfw2Xw8SqWm6bDsUupkEOZcvlTz/oBgc9mALxAQrxNXg5q
         5VzOySTeIWjvqHeyLMHxoBWoczZ0xhVia+9KbQ9itW7taAXWAK6ELIWuaesYIfKFGxW7
         YYV8N8fpPoLtZIvLcCc8Gkd+UHQmpHnQHeM4dZvXxiEZooOHEfdK61ZO69qW/1OBfD6s
         g1vqw6SNsSjL61uhcDPxhuRVX8EhglrrRdARp3hYRkMQk5rNMpvK6AL+MDGGByFddHun
         RIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707086886; x=1707691686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kD6KAqTBArB2SIqT/Vwa+OJYFmHJmT6pAMJN7lY/K7I=;
        b=VR9pShP65NwO04NLjp2KiskTo/1NuzPmlZjZJZ0aMsx11P+ydlVf7fB6vml0zcE94y
         B9tz3IX82nsC1UqaIbetYwQWqQu709EIobtD2piHgmP4cqTjjotiTC5Tzs11xRd/u/3q
         G6lFIxosQhBakUERbvRirvdQYm+XB+xmUfOuedA+ff36YfHwtw4RCXilO0xp1Zk9npQo
         Nu3WvmCkc7OrEp5F7kaiMarzsPpUbXNG0cFShjOkkUPw3EumekBHIZz+HADuDJx+rV6n
         BboMk9Vil5YK95EL0lN9MiO/Yw6gIq5HrS8JS3yTnySYCKr2PbudkermpzlMk4L+N4bS
         SmCA==
X-Gm-Message-State: AOJu0YzcRUVOhMBG9sXIhMil6RqcNA/aB5VPpfbcQlzQVCOjam9gxhHR
	XsY4Olh+cQTOqMflb+X0hTrnNqvPCEbldviyL6n1/A5nBfwX9+CLRj/BAwPvBiDpblzNagYS5B5
	rIvQhtW47JuZtcqHXdXRooHbsJ/n4WP4zKBsAFA==
X-Google-Smtp-Source: AGHT+IHRgzJB6CueGHeivyFsdKulZLOKYp4MBw07acceiUDs+aIfWuO1UqeXXr2XEiqME7pqYmnX4ATtGQg/lGlPcew=
X-Received: by 2002:a0d:d611:0:b0:604:e15:81a with SMTP id y17-20020a0dd611000000b006040e15081amr12206726ywd.52.1707086886066;
 Sun, 04 Feb 2024 14:48:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204220851.4783-1-wahrenst@gmx.net> <20240204220851.4783-2-wahrenst@gmx.net>
In-Reply-To: <20240204220851.4783-2-wahrenst@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 4 Feb 2024 23:47:54 +0100
Message-ID: <CACRpkdZvG4hU+7Etu+1sfiSHoeypX0kiwrot5x8bOxkw+oWP9A@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: pwm: Add pwm-gpio
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	andy.shevchenko@gmail.com, Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
	Philip Howard <phil@gadgetoid.com>, Sean Young <sean@mess.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 11:09=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:

> From: Nicola Di Lieto <nicola.dilieto@gmail.com>
>
> Add bindings for PWM modulated by GPIO.
>
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
> Co-developed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

