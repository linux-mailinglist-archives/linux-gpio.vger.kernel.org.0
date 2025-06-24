Return-Path: <linux-gpio+bounces-22096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C41AE6FD6
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8CD17B937
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30FC2E9EBA;
	Tue, 24 Jun 2025 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFEWb1mq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAE526AAB2
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794061; cv=none; b=MGBO4l1MUhCsFoK0Pjcwax5j5KBlC1a59PuXf6MbsmLncvymZMxZ6TrRkUcpXr7lSEGooScfqNJXZddKWVvwo3vfd7DS6E0z16hfGug0vwlf3ld4DEfiTHOu21aZa32ZE4B0FtuqJ/6inv1mkNg0LyalUWqF07ektq/eOOr+w/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794061; c=relaxed/simple;
	bh=v3BnJq5LQEaxFgCM6/6sxf7x2jYyXjVWSnRn8QlR/f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOV+N78VdsjIZOmpfsJGAiLU+H8A7LWJNoU4W/+7ir9NiBGiSS2gxE5TuYQNPV2B84Qm9jZxkmAJDL9IGxIWf3mftBRdpld/PzJI81SFc3m4B5LWqLjTAQG/gVcmYH+KHstEijjTltAsHO9b7hqRTf+UeG2XKuDau5oCLos6PVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AFEWb1mq; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553bcf41440so868846e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794058; x=1751398858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3BnJq5LQEaxFgCM6/6sxf7x2jYyXjVWSnRn8QlR/f4=;
        b=AFEWb1mq5CPJdumumk3sziznQwPhwH6b7yd6Um1kG2joo3xGWQcglTlunBbli40mNe
         Jqa059X0pJONyVSsTZEbeCCnwrDOj//HqycfMmLl2vVX4C0e9RLnj1A/rS6+OmfLcBQD
         b9gvGlcRIWLnjDYKzQxO2lrqKhpY0uiV9l79ZJhLKB9OVCdBIr18VfWHvo8dYqun0CVr
         ZkAah/7oFwFrcWW0JbYolxRKwPp015eozp/m3PYSxxNuNCE6Qgvj/t0Z2m1DFf8Gx1WM
         WZc8zUIG2WgLOsHVoCprukTHPhaxnxorG4p0TmIByh+mzfDVxdI8S9rKDTYOJ0i0ojfF
         Qsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794058; x=1751398858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3BnJq5LQEaxFgCM6/6sxf7x2jYyXjVWSnRn8QlR/f4=;
        b=dHukzDjhbFl1rhcX3K2ZjlUMNjDxSy6LuNX1YjUH0OLIsiy+FMY0LPN6QplFhL0/IL
         WdtHWq9O8KEhysQgHB2NYGOdN2lDCJtZj8zNCwjZx+09/gdWSOXGV9bchZbyNG9/BVgG
         ls5Ythtowy02sIFR5EJ5gZm68f2BULNnbWaTTn5qvET1wve0ommA37tIoCYf1RunWHXS
         7BwWPmUXjqdZ1CypzhXDQruM2nGj7Yk7qTIdcsNAidVlHh2aUC09cY5ztHqukN4i6WgV
         atLFOZRnSSQl6Ax2zlyuwXOp1+bejSy3LZrX0vTyB7kIObGGSuWGabVhU87+eYasSQdc
         81PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk5j/eS+Q5RI6lrGy/NZ5RtmmxbdJWR4o/bmS6F+im7WHbVnGxAfVQyVXU4BcTPSjFpP8gJnzT247+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23aOM4o3ZLPWsHtnOX/ZMmzLWhQDZSvY22rajWionbWdl7nOf
	48pcMbrh6UHmGKgiwQlzDgxrP4KXva+jYUd41DPh3ll0yskYFlOBqcjzBglwtY66rD/ahRYYXzs
	aXfcsvXsUjJGZecLup1glknxHsS3+XiNke096CKArQF7oN31O/vYai9tKwg==
X-Gm-Gg: ASbGnctUebcuj+7vsL65sB/yD+zVCBa+m5sbWx6ZC2PrAjIJ+XEKrfdi4c7OGgJjh37
	I0viN1fjQOfL3lqlDL7LC7a71F+9Xa9frxQet5bJCt8majuoqDxyn0gKHAv/hMfPkRH9MZuZ2yO
	eXKxzWhEagI7fYN6C0OuArL0AW7SWX/fITYLYIY37Ps9g=
X-Google-Smtp-Source: AGHT+IGeXWsd2KZRikpXjgFDmBc/qqqZ9/rCy22guOYB7u6OVOcVFigKyeu0DQMbioQlth4Oki5hGk6T6/TasorD7hM=
X-Received: by 2002:a05:6512:118d:b0:553:af30:1e8b with SMTP id
 2adb3069b0e04-554fdf9676cmr31086e87.38.1750794058182; Tue, 24 Jun 2025
 12:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:40:46 +0200
X-Gm-Features: AX0GCFuS6mww0UGvkfja-_98m6Xmqj6RLmLWfp6E97Yy_7h19_QAZkV_Etx9c9c
Message-ID: <CACRpkdaW_Ce16EAXSEUqYTuBB4E1y7NeAkhLLik6qtOm25+pyQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] gpio: sysfs: allow disabling the legacy parts of
 the GPIO sysfs interface
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a Kconfig switch allowing to disable the legacy parts of the GPIO
> sysfs interface. This means that even though we keep the
> /sys/class/gpio/ directory, it no longer contains the global
> export/unexport attribute pair (instead, the user should use the
> per-chip export/unpexport) nor the gpiochip$BASE entries. This option
> default to y if GPIO sysfs is enabled but we'll default it to n at some
> point in the future.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is great.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

