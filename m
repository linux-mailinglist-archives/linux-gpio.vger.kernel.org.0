Return-Path: <linux-gpio+bounces-19186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2FEA983EB
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 10:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D53B9189E35A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 08:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A75D278172;
	Wed, 23 Apr 2025 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxM94OvQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F072777E8
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397510; cv=none; b=Mfh3cBRSigEKqxeHCtmr6gTpxr1jyYciS85Kg1CtT4F1C6hg5SZV1kHVsE5kHZOpunO2vvkGcko3kShh/Eoqnz2MZQ70UeGcFz/Ot0s+byIiqG6tHC8G775mQJaFjMRiGFy4bVWtr+6BEvP8kgbxcO0M3nHI5CF1k1teiPl3SZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397510; c=relaxed/simple;
	bh=qBj3z1T7rwn3ux+C+eO3W5yXwh6jAnKUWzTTH12y0wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DN9Y2ztgQM6N4hJ5CM+If7oRsbdvR4b+PGn++EVepFBuoU3nmAeQfP6kVREqSMZU6trw5odytGiyt8saNBzhp72cto0bUPWGdCCEu0YUUbIgyX73iVfKrBJTvKbk3xRspPMyyMsnt6IFnk1CgQet1eL6bMzu+bKOSLfKqAvkr9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxM94OvQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-548409cd2a8so7956386e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397505; x=1746002305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSDycrf39wnAyWpIWRB4jBBrGHgujqLhxop3dNMcnqc=;
        b=GxM94OvQC4I9HSK2KjtMN3KM5El3+HIV6zBJJ/20o4NWKjVnnU44pH5Yhx0VrLL3f8
         NMV1HFXVXZjBD6ilOxRE+2UmeynopJK7V/cG+hBqdWErXemanc2pw5uqvI27lY9QQBF5
         0HlZEZrUy9iWQ5nIVHyxvUrclhU5e/P0J47nId9AnEqZaiKYYJEBjMbQ2y9BeOqWUN8D
         X+TtiM2u4nolK/b1WZ9NgkEhp3rsQPlazW8u4NknmQVGtHMEIu399h9h8CMbOscCq1TG
         6Tyes5Z9d1PN3dlwuSiohvm/fjW7h0gVLyV2eY5sDzeREivCJKZz7bRb+uaWbHBduhMe
         ORyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397505; x=1746002305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSDycrf39wnAyWpIWRB4jBBrGHgujqLhxop3dNMcnqc=;
        b=JIAXZZBDpch4qFhyagHX6RBfzK1kLhNX4jo+Jd5TFs+uFZWPmXmQQxODw4r1kRMjfr
         nlIaiymugFIFKRtwgRknfFFgI7oR7MzkmPXEB/Tjw25qwJ9Jv2cGWtATN4d7Cb1Y8p5W
         bIoWtCbpvAObQtAo3co0Y+FOtzhakbTFR9srAaCTzK+2ZU/HllV/ZISR3D3mRYV75HHv
         ZfpTTkTT3eBafHWncdtK6WZYM2ge5ra59/pw9KRK8z0RqKPBdUm/r1ahA27BTsqiTf4t
         R35IsINSNeaMCkH6lXr6jf0vWEnBzimP76UBflfmJxSvqHQaB9N9p4BKqnUXDvwBrYrU
         AtMg==
X-Forwarded-Encrypted: i=1; AJvYcCV8zRkR7v55vv9XtjpLIeE65aL234nN+usN0Tbw+jYPSCTLFL/YQFiQ6pqFc2FZ2wHgdNxT+FQvJnSV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6NxYwV2Dq6/r83AeJiLlumIIM2/O9OKzF/RexZdbyHRhCzY00
	ewArZZeorTwuhGs0DCAlhWuFBw9+SH4wQp1n96v5mbo8781s7ExbPZ5EnjgLJZfo0Oc9jgEO8Is
	AJWCrRlOeCFtjcj+ubLSOcqsQnNVrtn8ESFQFRw==
X-Gm-Gg: ASbGnctuFbUa4D81bu9+PV7ae2pKePhPHDHkWXnfa444XU8DhwuCwiyZYlhEB9UTYk+
	C4UksujvcQ2bwECdz5kJMvMWrUPj1mijlpSgFSw5yLVWlu75Ah6D/K9AbRn3A+zieXHhbZdr2sm
	bSkSz8/CZdYA01QfQGKp7s0g==
X-Google-Smtp-Source: AGHT+IF2teZ+utBk3nbrptOE1OwOQHV13ZcYzWp4JC8Rks36uJd/7V0CNyiI6xhWlLjjle8y5+kVGlRVXioIPF4arc0=
X-Received: by 2002:a05:6512:108b:b0:54d:653c:351a with SMTP id
 2adb3069b0e04-54d6e631790mr6082193e87.31.1745397505326; Wed, 23 Apr 2025
 01:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3fc723de-c7e9-4a03-852b-93d5538847d7@portwell.com.tw>
In-Reply-To: <3fc723de-c7e9-4a03-852b-93d5538847d7@portwell.com.tw>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:38:13 +0200
X-Gm-Features: ATxdqUGxmUFjZwr7eCepx2PgXtnPDoeuvGQPnxU2bfQ5F1M995XyX7ukEGxVZ7A
Message-ID: <CACRpkdZKuiR7jaa-gsVTc=w64yhXv_Pny9u_zOkHDjcyXaXSeA@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, brgl@bgdev.pl, 
	wim@linux-watchdog.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, jay.chen@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yen-Chi,

thanks for your patch!

On Fri, Apr 18, 2025 at 10:24=E2=80=AFAM Yen-Chi Huang
<jesse.huang@portwell.com.tw> wrote:

> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
> It integrates with the Linux GPIO and watchdog subsystems to provide:
>
> - Control/monitoring of up to 8 EC GPIO pins.
> - Hardware watchdog timer with 1-255 second timeouts.
>
> The driver communicates with the EC via I/O port 0xe300 and identifies
> the hardware by the "PWG" firmware signature. This enables enhanced
> system management for Portwell embedded/industrial platforms.
>
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
(...)

> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0=
;

I would use BIT(offset) instead of open-coding (1 << offset) in all of thes=
e
instances.

The main reason we use it is that the BIT() macro hardwires U (unsigned)
to the parameter so no mistakes can be made (even if you have
no mistakes here obviously, it's a good habit).

Either way this is not a big deal so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

