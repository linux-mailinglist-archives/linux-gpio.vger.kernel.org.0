Return-Path: <linux-gpio+bounces-26538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5FB99A97
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 13:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1210F324569
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 11:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4687F3002CE;
	Wed, 24 Sep 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m4C0wd8K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DA1DA55
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714702; cv=none; b=htrb6tVbPDfGgB9R32foOdIO86dKEt35Qe14M9d088nUcMENCeRr2tg6alRxTokp+ul2aL5OwBAPLOO+oN8eUlqtBhct4ErPXigV1H8D9qONL/7+gMSaSlW1tf1RZCmAjaSM24FBo4x6VSs0zCJENh17MdJMPISzN5Iayyt7caw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714702; c=relaxed/simple;
	bh=m9udRDyHRd7Rsj/9wBYHP6INEkJoGlz+LmtBxxlGfAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ODRfSaf0wg80E6AVBuD4BAPSD6XCxHqE6g9ZZRayx2MXW8tnOwFF3XUydwJGNeJBUo5qxPG5vR7Yr5Nb9HakC39fojKG0/P13Vlrw2jNVeDYoTEQSzpRKf23gx9CHrwqOKK+SqyUFTgWDd9uD4EnC+K6P2D2bn82dtMpEOIbGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m4C0wd8K; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso3911018f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 04:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758714694; x=1759319494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MouZgkYvZZ6gSHXSJjdKF/cB6pNj5ClHepYp0r7Pvfk=;
        b=m4C0wd8KjFJK+M3u468X9LiY1yPSM334O4lBdhJpP+C1jN5dfia+c77Lhm8WzfIagQ
         yFZHzHyPRRzi6sJ3y71E0c5nHLeeHzGFjHBbpDhmx8z75Y8mBRjXa7r4DHr7tWol85gN
         JKGX0IOOTyYdbRqnbP5h3yCTUQrzqjsp1Tt7msH1PCpDQIzougychfdYgd1vIQUX5J+U
         5qGwCaDqhHyfnN4+I4aE1ouz4bNBrvCfz4vLvefuNZoWJGzLn3y4XzveojTwLI8wsuiJ
         GLOOkyM2WvegA8Cdm40EImR5qdc9ciLyZ5C6b2RqyQwNAbRZvvtsgp9VdY2yyrcrx0eT
         KMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714694; x=1759319494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MouZgkYvZZ6gSHXSJjdKF/cB6pNj5ClHepYp0r7Pvfk=;
        b=rLAcQ36roBxUQvnNHza4WEU/tH7Wr7XA44pR87QTj96qLANq4sQP5+tAv/OzJor2i1
         Y+rHt6Mc6ZdJzppiIGSrgbTC4WBKlgwhw2U+ucfylo+8ybNnL0QwKZUizYY2Qsf7CZZb
         Sy9RCz7JVDS2MBrv7Axdepnd6i3P+Qe8Ha07cvDu3rtmhhGLenSSqcQayGoW/SQBLHYh
         qTkWLOeHaZ3GiPCu+bW9VTT5uogSIAoW6bENuLqWPHeAf7Tgq1R7L/3/kksJEGMnIavR
         HEvVr63oBlen6oUUct13Sy2x+kvJSeB4XEGfPNqe2NuIV6AEMeD8lABTIudGatIANKPK
         8nJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUJzu7beuxZEZi65Q+GSVtHg2Wz5glMxiaGzEz8+7UI6lloPTUC2piztC6M7yx4YbaSTRKE7lRtIZO@vger.kernel.org
X-Gm-Message-State: AOJu0YzzP+dfIfGBxcjeA/qKAfOHJjRlLbYYG2t5/0k9r3kBTdKR6JRl
	Onbv+y39yvIZdgOQU+zH62NUfZt/lrg0mrj823ipXsdNNma4U6xaNqCTNCXehotQbLU=
X-Gm-Gg: ASbGncu6ZA5bmhHLUPkBPB5NdrhPccYKVHbhkmSku5u/AfY9rOR4yXIl0sHRDxIZD1g
	ww++IFECBo+9lNRiWC5YbrrLL+J9INyykCpqzCuDzQG4DCmBioUq8vDw3QU2+BEWIK+gQpNaHHZ
	VMGzohQU3jDlqNJ7ngEWm+ACxxKjUWpmkMQM2NNJxAuzCHxe0YssBUeD6kUD/BGsZD3f+m79Ery
	kaHRdCSj8E/+jPLjNmygMQlMMe3HfiAw0n7nTUkNWBHmqDwteCjWKGvDo7EnZmjL+UFUkvMTwbN
	/sJ7VsvzS0iTYAmIKhdV9y3+qbY0dcdcb20pD4MkkvOdLwFp32skqcuuapJ8LkXDj5NEgBVnGnH
	zJ707KbsdUDj+cKMc239o+ceU
X-Google-Smtp-Source: AGHT+IFfNfkyehlN0G3gahSkVgCCL0++WuyaWaeTwKNXMYm5/4Z59W78vrGvVpgP2hu8ixgBlu3VmQ==
X-Received: by 2002:a5d:5f82:0:b0:3f5:453:77ea with SMTP id ffacd0b85a97d-405cc9ed248mr5013363f8f.58.1758714693860;
        Wed, 24 Sep 2025 04:51:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31ea3sm28329915e9.12.2025.09.24.04.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:51:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: generic: rename BGPIOF_ flags and move them to the generic.h header
Date: Wed, 24 Sep 2025 13:51:32 +0200
Message-ID: <175871466164.30561.3331024743245978268.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250917-gpio-generic-flags-v1-0-69f51fee8c89@linaro.org>
References: <20250917-gpio-generic-flags-v1-0-69f51fee8c89@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 17 Sep 2025 10:54:04 +0200, Bartosz Golaszewski wrote:
> This is a follow-up to the conversion of gpio-mmio users to the
> modernized API: we globally rename the flags called previously BGPIOF_
> to use the new prefix matching the gpio_generic naming convention and
> move them to linux/gpio/generic.h.
> 
> Linus: if you don't mind: please Ack the pinctrl changes as they
> obviously all need to go in together through the GPIO tree.
> 
> [...]

I'm queueing this for v6.18 in order to send the entire complete rework
for the upcoming merge window.

[1/2] gpio: generic: rename BGPIOF_ flags to GPIO_GENERIC_
      https://git.kernel.org/brgl/linux/c/63a93d25bcce12580af6dbbaa4d9f3ccd0c9c4d8
[2/2] gpio: generic: move GPIO_GENERIC_ flags to the correct header
      https://git.kernel.org/brgl/linux/c/3fda0cd8fa3b19aa1bb75d55983e02321b0aaf0c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

