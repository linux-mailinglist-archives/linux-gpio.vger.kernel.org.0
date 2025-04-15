Return-Path: <linux-gpio+bounces-18828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C917AA896C7
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 137797A4DB1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EFE28B519;
	Tue, 15 Apr 2025 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H40CaPJL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E85A28B4E3
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705918; cv=none; b=nRz+7/RJ80XobYZKRSALopyPDhL1fvn57UEGRcxSdzwiL6lJ4ZCg3E1a378mACGeCNTzodna++7fYz4mtkMCU+hCNjNLJLCpodIQ2h7ZYKCOj0vfBK0l3ORnBmAV4SWyj/njObUVDKmfICy6Cagz8z+x1+mgn+MdicXdcqm/ktU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705918; c=relaxed/simple;
	bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsuFGwh727i1cv2/VWwtEWN1D87dC5+nez5+ofyA7nv+jwgyAstBN7V+5dOz7bp2QUhydP+8Z+aYq9uH98CU06a0A1MfUJ5/v6H5Sflk5YaCe+3X6R+gE7AaDpYyVqJ9E3tvtvsIodPe2apQv4Hvz6IbXgFVQ2m5/qJcnAS+50o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H40CaPJL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30c091b54aaso47263501fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705913; x=1745310713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
        b=H40CaPJL8XETrIfg/KZlt4culzIj5IK3oUjUHAxBXbc5jY5TtDcMWxUxU/kTV1LokD
         4Ko7Y3yIhouQNwWAhH8+X4XxwC4exAdT1SDkr4Gbww9C3jY7iec2RYV1DfBsEuwYxSbi
         8k4jTzIV+izcINn7vCinToOaIEi8G3iziolRI803AQenJS9/99W9mCXiaT9yyLazwMgX
         25t9/05lBajlqbaI93eAeZL3s6V1IwCOR1KP4yYVb8GHGfVqwon/5cMGDOt0FQ6voe3d
         pgDH7RZ8krS52135oNmV14Ov8DCxaZ6vkoqzKyqk0ygb1v24JVRKJrpuj+Z9HfkgefTt
         4L5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705913; x=1745310713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
        b=vErdBICTGz0qSqSKf2IwRVlgmSnPKp7DQitGMmNzG8FJmn6NjSx8nvzD/Nc4+x0mJd
         0cW9TGWhkZJdnzm2hfkVoHC9M9ubzAx/72ftHKZEkBgwERBARIvFcAaW9lLN5W9D0E4K
         zdPA5QSd7cgmcTsYlt8WnbDO5wYnNp9+4FMbdwUFZyJR8Ob6DLQjK0TeypejNOYOdXy3
         RHaSl4tBkywc1BUs1W9cSHklCRGAllP5F0xuFW5F9XPhBMBkHvipc5JFQzPVN8qr4NeC
         ZO4BNV0EMDNzEuG1phZDm8v0o5PDdweE5MxV+4z7gTEX3I/ezh69e1LR0uYxtoR57Pcy
         G7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWzsE3QLYksFS06KfI3v4U1LCyuJnk2OXWAR4D0TrAueAql/O1OJ0pqWQA/dKLfLuJ9kS792JsiXHPo@vger.kernel.org
X-Gm-Message-State: AOJu0YxpKBUAIVgSjjXzblpo/O07uKsGjg/2ElqVJAgu2rSSe15QGiq3
	ZRVTwOLiOSA1SZk0/voh6taYervZ0amdCrsJY6ysNYOt4rFL07/Mr2CfiL6Rchs09jJmvyDJTpo
	xi/6JYGgkioMmovDESGLfrYWf9kPHOlj1EBuMHw==
X-Gm-Gg: ASbGnct7qBTRuBJvCIYtOoWEKvnpNp7H3CcaOjdsSBpz1hJxdjL+ZgUt5tuK3tSapN/
	efErLoYhpfpZoD7BJ2eydp8g8nQt5FKqBUMfXvn6FuiNd0+H9r8rJYVjozxyURU2ZcMWHmGRfUi
	vXXaSszeAGI5QfUg9yPpEHVw==
X-Google-Smtp-Source: AGHT+IGH1ng3eemaLiy2FccAdv5wmGCyisWcTNC6F3IB//KuZUZl3sZBa6JyDHfOEAGA9K0ahHlVeoeGPs038wmjQjk=
X-Received: by 2002:a2e:bd85:0:b0:308:e803:1180 with SMTP id
 38308e7fff4ca-31049a7e306mr51922881fa.31.1744705913598; Tue, 15 Apr 2025
 01:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:31:42 +0200
X-Gm-Features: ATxdqUGjreib7Xgx47uV3zG2PDCmOkCmRcW5QPy9tyBeeK1O7_SOAKwD-7sRSTE
Message-ID: <CACRpkdb0Dy7m51R7ssrAHvs-PEiyEV0V19NHLPUbKqt77znQgw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Input: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:19=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the GPIO controllers under drivers/input/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

