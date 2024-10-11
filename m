Return-Path: <linux-gpio+bounces-11171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF7F999D68
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 09:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CED1287796
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 07:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8241E32DE;
	Fri, 11 Oct 2024 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8oq+aCE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBDD209F29
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630335; cv=none; b=oxXZdN+3xX83pV3owr4qmJZWjTRVrEDj8OEg59ZujSvP9szno2JPbC/tgSgVLI2JRcXQsuJfZ0kc5ICd59f08bd3CpQuM0cGXk7oMr9Q9yJlXR9hXzrQJ2Ju1cR75leZl7NVilczxtX16BAkeETnmRv20dYVKMxMQ69mFpjOKAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630335; c=relaxed/simple;
	bh=o3wVqjKbdTul8AVVnaYDCXqFq3fTiSJjcEftrFI3akE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OssNM1Dw9TJbaADkIYKEVkLZrUvZ7hPdsTMvYZ6P/G2mux0xAxFsCmDnflulNjCcgdptHnZOaK2kfmILOp/9TH8Ve7AVX7X5AVY+l4DopP5r3uHtPotgbQ1gLTMuPbWuE1zyFJnnaJhu77l5+3ONZ2v7sUwVGpExmqc0dZbkJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8oq+aCE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fac47f0b1aso17499041fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 00:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728630332; x=1729235132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3wVqjKbdTul8AVVnaYDCXqFq3fTiSJjcEftrFI3akE=;
        b=W8oq+aCEvJfWopXCBzTtfmRXHPk5IGeUMpCIcv8HKaKTutz7VVhca/LEeeskh6LMSO
         6sH1dlj/NuuYHcsRpRShYZ21Ok6Ubn53Tv7d1y+8Kqa+oZ+sxGGlaRbF0m3afMlhneSS
         uoF28dhOGQoiT1c7hfijNb+8gDsCWpXjoK0ZQLfLm1kBXk4oIDes09jlu39Q2CnEmp5X
         AsJ7b2QOf4ztv1ZfJt2c3uWv8fOk47UxnyqVzgMsrmHrVDVJ0jYsl8GvYrXtyD41JB6C
         +1iX4UUaZKg3kbHkwJAbzcjnVpwXabQDNqupp3FDHUP3V5ZF6519R7bmKmvUOGc8Gn7P
         WVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630332; x=1729235132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3wVqjKbdTul8AVVnaYDCXqFq3fTiSJjcEftrFI3akE=;
        b=X6wrjElzYNos72vqLTiVtYvS0NWQCP8dNQ9jtSjpIOI4dDgA/eNq3Yp0YhG4tN+4x0
         VxFiBYcyWOvJVsOmBAH/BTbt11e0K/qSNrL05+imPbskib3LogyszHWep7dIa2yR0BU+
         2RdSokplcpp9u1lA67EzuP/KanY5Ji7BUCDCSblntX7BFBB9oQ1LH1PWb1u6QLJi0vAo
         1Sgalsu2faMKnrJ90QHSyuQArDX5TyErRcYRxaOLB+8oWe3YHMWmWyyAKLYa5CtEI8Md
         DQenG1+/IyssOWR4jHb77DgEZV2ngEbyZqVnbmuwrWQmaGw6MqqhmK/AwXQi7IjGemn6
         F2SA==
X-Gm-Message-State: AOJu0Yzls44G7fzAL6aQxEviVgDInwz0HM2f5pcpxkwoWWsGV6CaHmSF
	J3TMs+GmfzQ6SKwoGo8by2c5FoJN5+1b0zuSNIcLMdWm/97t0QC0mNFCn81C3PBhEI7yycbvwRE
	+/BUJ+B0QUJsSL2AvixY5mttJL88WRkcrvgFf79YzZZHL9a+e
X-Google-Smtp-Source: AGHT+IFsLWHKVSQuf8PCZlf0puIwtvwF5LoRI0DzSO4qYGUTPWTB1RZI3Auv5C+8LCpbKVsRtRLFZE1Zfoqov1FGZNw=
X-Received: by 2002:a2e:b8cb:0:b0:2fa:fc3f:d604 with SMTP id
 38308e7fff4ca-2fb329e3091mr5523641fa.43.1728630331925; Fri, 11 Oct 2024
 00:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009162910.33477-1-brgl@bgdev.pl>
In-Reply-To: <20241009162910.33477-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 09:05:21 +0200
Message-ID: <CACRpkdbUystN3iqN1rQqLP=2UxmNRPR+DwGQKJwC64z4dnV26Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mpc8xxx: use a helper variable to store the
 address of pdev->dev
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 6:29=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Instead of repeatedly dereferencing pdev, just store the address of the
> embedded struct device in a local variable and use it instead for
> improved readability.
>
> While at it: rearrange variable declarations.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

