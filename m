Return-Path: <linux-gpio+bounces-7723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA8918024
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 13:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE753B22A94
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 11:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22A617FAD5;
	Wed, 26 Jun 2024 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yTr+ToUO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FB417F4FE
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402552; cv=none; b=P3/2HIqUkEBzVQ8TO5b9Vr6nJzNd/vJTBdw8Sn8rfefgs1FNEn34nSjoPYfrMiDO/vqjJFa/CqNu9GAbwRmlH/VIOuiYQBgfkKLv2vRBfvu2ZlpGGDWjVtrtBv1rV7YBQxfONh3q04jhIb8M8GvwCvYoYd7VD2konMP+Ovj7O1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402552; c=relaxed/simple;
	bh=YO1t6RF3glr3rCz97Et9FOGeJn8Z+b5W8m/w3Gj5amU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4UH8cX7ICvySP1AX5lShFlMe38WtHHcEChjPi3gkYoINT2COxeQSv7lyEqKyNcbnarlUJq1KJrnbCTV2KuKn0gtfBHZDo4MH97Kad9lPkdh5apUzl7fTaPb9d1vmJQrvwDn4DzQ6BGbOg6OV8kabnaNRryDVv/Rmul1AoTSYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yTr+ToUO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cdd03d6aaso4548262e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 04:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719402549; x=1720007349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO1t6RF3glr3rCz97Et9FOGeJn8Z+b5W8m/w3Gj5amU=;
        b=yTr+ToUO1KDd0Vj7fZiyEDEZSZO0u+f5S0/Zir6OnlvjaxCO6v8sjzAPow4Db6gMUg
         MeYdd30rY2XrgrpLvnIfekDckrRYuxzi1bP43InHQX4CZtVHWh4tY9uM98Z5xN0FJcaQ
         6tWRvmtMuvSvSBMGHJTrqgA4EMoulUeYNZiRi/WR9v7qzPU4lXnQPJPg6QYZ+H3mbny3
         WOANFeL9YPSgva0/Z8ofXxcRXv8SU+lgpxw2c+5QEFO+mreGqIEBJSbIuG7xhan2xD09
         y2dcSIQ4P37R6GsITiqF15NIOuxfwfxl0kSZGUBzvEyENTHDOhvyRxWp1TQXE/03PqVU
         hUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719402549; x=1720007349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO1t6RF3glr3rCz97Et9FOGeJn8Z+b5W8m/w3Gj5amU=;
        b=a6P53YTaEBl+E0MMSH8zH0ooWCWYVMKUk2tTbYAn/Dk0XMmqPhevGtQ596RmCSJAwC
         dHyhyksTbWmyB5iwld0yNuZlRXU7+VPXt001yvZv74MmL66AyPsUmK4ZB2h1iNVpw19a
         Fv7iBC/52C9AMUefQ6WwB7IKBQO9am32/mks5lFAGfw+SnMSOrXzVClCp6e58T4EipdZ
         BL4j13kncZEAiPDL2ypAwKXal2VqfeQcmlDVhi4H1ScunmSt2AtAlerRQqGdw7lXZK8L
         dlsBtK/a1Qj/sRkX6zX3gEK7cgEYuf4QbaVpy8VQOxhMXSGgc91Nw+1u9EkzG1xkC9Jw
         ZaUA==
X-Forwarded-Encrypted: i=1; AJvYcCV26FIdpgR2hzQ26UesbnnnenAjby7UPc9SSWTZ2JdkuPLyozSYeFrCf2KVz3coc5fkJDW4jfmFOW1mAVjMGlRDiqeSk9moO3KssA==
X-Gm-Message-State: AOJu0Yzv2R5r0daDVGH+NPdwRa2j+UTchFmxabwXosRBZUe3PaafgyIE
	8dU5UiCPoq4a/R27ADHD5nk2+xJGFKQOW7AzJrNte17h+SkCa9jINvkGYn/OFDH3n3nwT6Muo54
	Tz8h4C0Lo6vs+rYEZoHnA2RIJosR/pOm/GZ6Qig==
X-Google-Smtp-Source: AGHT+IHN7aInxDMIB6i3bGQDmb/JUI7qoajbt6wkmr4ZypVyLp9oVk4jd00YUfJaTtzkY/gO9rVTtu8oZUeLfxWlpgE=
X-Received: by 2002:ac2:4eca:0:b0:52c:cc38:592c with SMTP id
 2adb3069b0e04-52ce05f8bf9mr6292345e87.0.1719402549050; Wed, 26 Jun 2024
 04:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624093934.17089-1-brgl@bgdev.pl> <20240624093934.17089-2-brgl@bgdev.pl>
In-Reply-To: <20240624093934.17089-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 13:48:58 +0200
Message-ID: <CACRpkdb7ouG6ocHd_YiAj0JjvzXcbgbGzY6JPSntzpHOr_rDPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] genirq/irq_sim: add an extended irq_sim initializer
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:39=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Currently users of the interrupt simulator don't have any way of being
> notified about interrupts from the simulated domain being requested or
> released. This causes a problem for one of the users - the GPIO
> simulator - which is unable to lock the pins as interrupts.
>
> Define a structure containing callbacks to be executed on various
> irq_sim-related events (for now: irq request and release) and provide an
> extended function for creating simulated interrupt domains that takes it
> and a pointer to custom user data (to be passed to said callbacks) as
> arguments.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fair enough, I see you agreed with tglx on this layout so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

