Return-Path: <linux-gpio+bounces-3064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9A84DD11
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50DA11C2688C
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 09:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55FA6BFBF;
	Thu,  8 Feb 2024 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AmjBv5z/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975B6BFB2
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707384935; cv=none; b=lAKekYO+hDTXcjRd1YUOVwF8HMv4u/D1Xuxwub+PbR4miRZRK3PMXBWWWHdISuJFH9Yjipwhnx69o4gDkZaM+61wH89qBz/qAUBcUYoLNuz4Shw2/eg/aKECn981Ku3girikOB6GPeD/Q/Eub75c6QUQr9q4uq0WfnJ+gVdhuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707384935; c=relaxed/simple;
	bh=2Ef4MXQbcx6AIgkMzRdLe/6b60bd/1WlTCA2XekqYpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERH9YZDzwv8oDF44Jvoq/Yh2LQoCQROm8j0yQ7Vqd+06Nm2hZgvIUlSlDx70yo/x5zF1gFZPCOS4Fz5XPvt6k9osU94yIuIapPtOlduRBoPiHscr6MpgEebLv9s4njL14uQd8aDLwKom7jhaKveZwzyzL6ly9FJfUSDr7vj+Le8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AmjBv5z/; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d5c7443956so722098241.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707384931; x=1707989731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ef4MXQbcx6AIgkMzRdLe/6b60bd/1WlTCA2XekqYpw=;
        b=AmjBv5z/J2X+E3sIQrawqjN+1OY+sA0/+V1vtISKCGUa0zgnvTYcVAaqGxQatwL2cw
         JfdQJHMccNMv6Lgb8CSEkI7H7o8AIKrDhFK4fA+qPWpMpwNfYT+Miu/KHDjdlZgUTaNY
         7gYwaw/k4TltASFpW1h4DPqESZ7mqbuCp+POWaL9VcM4i+7FuT7y7NQs2nfr2iZEH2UT
         h28/+qBmcA/uHUufUazXdWsPLaiGjMHAFrzpICMRnumdI8+A2rqDHqqtU0gk7KcdyYOm
         dPKjMsidFnyRLpqCdS3F85CeTJ1NqrSBKSWesQ8Lmlf8GaMxDvrCaQ7oOsfygZR7epPI
         /UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707384931; x=1707989731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ef4MXQbcx6AIgkMzRdLe/6b60bd/1WlTCA2XekqYpw=;
        b=V+yQpOlblGO8XF/BdSs5EyDIhjOMYmu9YIVtKKlb2Yo/iDqvj0rIIpweWLxoCUtuh8
         hxWBSo2fiBXgpVUWwk6fJlgGXPwngsfEf7O9PNRdlhVoMgeUO789q9IVpnR7hB4PMa1G
         hZneyY/yu1mC0+yyK3IoW54Wd/YsTOUF9SwYz62l/AUuMzg96VWv/JF7jA0Fi+Lc/HRv
         GlDUJEhpR6XN+EIKwLvLch3MMG8Ih8e1e8+jogAFSqbzROEvWtDgmn3/u/NCceLtgk23
         +EKkNv1197crnCf33oxJl/1Vd7+s4WO0HaI5BYLTNCgpWR5gfEu5ePyzVM0lcNNEx+KJ
         tGiQ==
X-Gm-Message-State: AOJu0Yx9as/2W8/2Anaon6XkNoDGEmZriATP7oXOHPRtbWQRu8wK4m6O
	cQAcunH/NitNYJlnQnuHIUqOPtVB+udVN9JQgDVtrctEG0uqPJo6Rjxc94fS6gHO1+qHXnHdiuc
	8pKsGD/d7cRkZCIlXcdyxveTlAIYB/REFbpGY5Q==
X-Google-Smtp-Source: AGHT+IGHYkhsqhK7jdquWbdRQFNxSjng3mgHAtet6uTK6szct7lKLlpp/s4hG5ha+PgzbQ8FiACiKfNtBKdrQtsQi4s=
X-Received: by 2002:a05:6102:2f3:b0:46d:3a99:7f0 with SMTP id
 j19-20020a05610202f300b0046d3a9907f0mr6053745vsj.2.1707384931130; Thu, 08 Feb
 2024 01:35:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205102229.42460-1-brgl@bgdev.pl>
In-Reply-To: <20240205102229.42460-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 8 Feb 2024 10:35:20 +0100
Message-ID: <CAMRc=MdzQ9hTo8fG09T4EZDNP9-idTYELoA2uHZYGf=OfxLtFg@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove GPIO device from the list unconditionally in
 error path
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 11:22=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit 48e1b4d369cf ("gpiolib: remove the GPIO device from the list
> when it's unregistered") we remove the GPIO device entry from the global
> list (used to order devices by their GPIO ranges) when unregistering the
> chip, not when releasing the device. It will not happen when the last
> reference is put anymore. This means, we need to remove it in error path
> in gpiochip_add_data_with_key() unconditionally, without checking if the
> device's .release() callback is set.
>
> Fixes: 48e1b4d369cf ("gpiolib: remove the GPIO device from the list when =
it's unregistered")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Queued for fixes.

Bart

