Return-Path: <linux-gpio+bounces-17876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96864A6CC31
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 21:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7E1F7A5195
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 20:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20E5233729;
	Sat, 22 Mar 2025 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VI9R0HNn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCBA142E86
	for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742675243; cv=none; b=FfUTUYZDSCkGq8oxmMi/EIdqTquWTO37EQp/pbLDfP4pcGhEB+X84SkfRwARrswZHq6MS69irOAf/kM2oD80hReITL3mD89FEgFEgPM/02QiNTx3j99NRwIMPyWkSeXqHmpmPst2vcRUBKFCrcvudaW2eSleOjrrW2uUDuVR4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742675243; c=relaxed/simple;
	bh=HUP3DQjJ/dXe89wrBZFX6Om6Xaapd86HWCqzQXLuZT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMl6OP6tza6Z7CJXkbHNNYhYqCjXFVtMdGeCdVkc1SJ//54nx6lu6/UEa7ZybEhR/N0IkA5xuKWrmRZUv3l93bOihe1jKn6mQ4jkjb1n/jHlsMJ0XX+mATl2xDxfCY2WU52nHGsRl4ksUZE7JvqXKSy17IF7pWe9cx3s8p57fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VI9R0HNn; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso3583201e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 13:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742675240; x=1743280040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUP3DQjJ/dXe89wrBZFX6Om6Xaapd86HWCqzQXLuZT0=;
        b=VI9R0HNni0QwfSl7TzyO0BOwG957jKEEzQVrItjGMtKK2Kmof6RIbRlxVV8Y93kDk7
         w4bkMF0fiHJpm4vRtlC16PK6evq1Iz86RxnIC7GsExCjqpl03gcNkSM9Q7zX3joW0MU7
         kTDQXKGXo/RUdqnZNcNCbaAIJRWjmK49o8kJu4OIID27DZm/tytor8LzCPx+KJ3f+mvr
         0EaVfWTcXQFyx1XRjo388JtiQlQvHQZ0Q6BxLaT3pVLk6YvoYSfuId5LV7/TjdZTRaLQ
         oFwndxLsVHoJ3+bTudIsec6pbIAkOIZtTBTZogAUGlrgWK8tv5XCahPkGU/oyeY17jB/
         w54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742675240; x=1743280040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUP3DQjJ/dXe89wrBZFX6Om6Xaapd86HWCqzQXLuZT0=;
        b=cetqhqWTsY7MNRzeDm4Y4vwtXUtJYMNDmTOJezAv37SQGKh20Ec2QuF4w6L8EC01CY
         8LLz+5mj4bPQkQFdK6rhlE0vTSwHRCSr1DuyWjBlJee7is6JSsM3RWXvlvoGSZgWl9hC
         a3Uo61fpJJeYPT0QAMfj67DZb3kD/hLov/ckT0QeWJBTzQSdWSmoXlgsNZj1CEJox8qi
         XPFx84l6+n1XUUllMrOJTQPLcRFL9BZTzLT5eLgWfiyMbauq2HVPL5KxYz3k6AL25pDR
         9NjieZHpfQzlrcXF0VCzbtBeM94/0VSNbA6FY5x1BZqtJMw2wIA04GUsUWxPOignp5kV
         zV+Q==
X-Gm-Message-State: AOJu0YwBjveylsz3prd82bibDphBMnOUBrVFK0+bcz2WOESvzoT7x77t
	YxlrDxszAfZ8Z/qOxf/MT6deoLjfQkNsUYCTcDRmy4B1w1uq1xvZXxKUUfmD7p2v/KYNRlpQNom
	khndCeZrEBP6TnyBMvGnjO43SBpjmLnbEdt/N4A==
X-Gm-Gg: ASbGncsNsD/uO2vE2DC42HW32JPLRrx7Qfl56i8SbLl76MqcJXHfNhHGPhlLSFQFdDV
	bRPhNKBbkHWFCSpcDecfJdx1o8ZMqLL3nDDMxmkIMs8aycXmMS+VuB4wlmKy672R802Yu402x+F
	5Erq4shGrY8VJ9/jFciaroMvc=
X-Google-Smtp-Source: AGHT+IGjs1lPcfmsitI77IbFAv4/GOnlr9+rewkeZo6AtC1o9mj0yakxKkYZaayMrFUUwHvQ6Srt4iPmLjUSmKV75us=
X-Received: by 2002:a05:6512:32c1:b0:545:2a7f:8f79 with SMTP id
 2adb3069b0e04-54ad647f35dmr3155212e87.16.1742675240122; Sat, 22 Mar 2025
 13:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org> <20250321-gpio-todo-updates-v1-2-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-2-7b38f07110ee@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Mar 2025 21:27:09 +0100
X-Gm-Features: AQ5f1JqNlso5uZmHyOD1DDqIoLojJa8I_dLEIDR5fwiXTSIa0XHLO3jhIkY98MQ
Message-ID: <CACRpkdaNix1mGkYcMURT24_9NRtEUtoKPAqXf4W-jL_0CrxB8w@mail.gmail.com>
Subject: Re: [PATCH 2/6] gpio: TODO: remove task duplication
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The removal of linux/gpio.h is already tracked by the item about
> converting drivers to using the descriptor-based API. Remove the
> duplicate.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

