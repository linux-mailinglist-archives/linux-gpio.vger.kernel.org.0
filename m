Return-Path: <linux-gpio+bounces-2394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD69835CEE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 09:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E8EF1C21658
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 08:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0235938386;
	Mon, 22 Jan 2024 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GYMwIiNA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8436B10
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705913051; cv=none; b=WH6nUlGNCIlxwFWmGIfUmrXHi6TrPRzIdTVLwCFnjyFUE/5ViGyhLTVfzTgTm2XOfiUjuwyeT2R3Bo1aXbtphtZWW47X9U9zyg0J0x3bzQC82dbJpYHnBJbWfu2ZmYHEFpem1+SdTXLwicThZ2iuYQLrXlEKqxbaNyZhch6qpQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705913051; c=relaxed/simple;
	bh=6Orpfk4kCHRKM48wIGB/ppp2sheE0CmDME8PTpB+BKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NySgzy/yD5fLmvROSpirayACDTrUmNN1MuuDDTbjKEk+uNSWrN0tkfsXpT4uAXtY/ELT+B5KvVs66Pa0t3PcF1NwnhGRmIhIor4swACgeHM+lTwY8t+aA1yx70nR2qKUioZTRt+AmRLtyHRGHPbzXBQLm97fUgTi9PrYji05qmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GYMwIiNA; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-467ec031988so458103137.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 00:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705913049; x=1706517849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Orpfk4kCHRKM48wIGB/ppp2sheE0CmDME8PTpB+BKI=;
        b=GYMwIiNAQvkOP0dn6eEhrLGrSlVfmlpIWmEbF1X1xTy22P/ApN4A8B4tXF8Zh53TeM
         h/ZLZj+LiL7vPqCW81WJQFAKSsFTYhgX3QAHNkc/ZgnxIb7A5OyZ5xIdxItZIlYDJ9S+
         tMedu881iHQ63p/qSps+IbM9j/jG8oTDj6bdRn1exmOAIIATd4Sg6qRT9iYpzXZM3/v3
         fEsjZ7ej0V2HsmLwaB//szPKaUgBooTx4sAHTtJ1yW2AxGCAhcbusO2mtNGDkdGgI2WK
         bVFGyaRRbxsRggzCzTf6NwXuxzl4WcOQwQLDI0I8xJAXGsJ/iUG06vwMHIoT5ZHc9XZ+
         HB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705913049; x=1706517849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Orpfk4kCHRKM48wIGB/ppp2sheE0CmDME8PTpB+BKI=;
        b=RytXKK2RpHuR8MEncbEmx8naXDtPaKiP4qqXuMhZl8RDLgPbsei1VHNvIESkM1Jz9J
         nds0YlPNGFIz+w6aEt4LXhFJ4tnVCBet0QOHZZx2/qzI1kSeO4iQitt2XbYov2BNBK5R
         wwRQIaNFT0htZvZ06AJWTxGolw9UFeix5A2BVrJyOB7YhoGsiwsNgotPMaSf7kpGQerI
         9zYe82quHpTouU0ywKEenwnNqJFoBb94j19sPeDIpUYPciyzNepixr1llXB0QzbvYwmv
         9+fy2XgcY0Ahg+UBbxqYvsgRG4daA+za3DqSHJXx0gHZQbNULPNbY7WZdUDtGOfvMg6A
         oMQA==
X-Gm-Message-State: AOJu0Yxw7ykTdqzNwv2SFLAfvvEAwLsUOtVCfvbddt7ZodM3tagHWSkF
	LwQ6vwgZO59qSCv2905L2giiyOvK31OILmcibqGXCg/Gyv9WoR7ANwr+n0AUlqhLd4so8X0PmWG
	otaERrFwBZ8geXvkkpKqVijV/4+tvPuu8gYIkCA==
X-Google-Smtp-Source: AGHT+IHnC8OABMnzxXq7v/L+d/1b3g83T0UGg9Qx3zA4qUFauCR/yg9IM8eJP2r42iRpZs8+qJcH6lLe8x6g8NJMOt8=
X-Received: by 2002:a67:fd8c:0:b0:469:c143:3d53 with SMTP id
 k12-20020a67fd8c000000b00469c1433d53mr37187vsq.26.1705913048867; Mon, 22 Jan
 2024 00:44:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104182034.61892-1-brgl@bgdev.pl>
In-Reply-To: <20240104182034.61892-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Jan 2024 09:43:58 +0100
Message-ID: <CAMRc=Mc3A-UV7x-YJUOU1zJQmDt-o5ckkbXWVM+trzesT3CaJQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: legacy: mark old interfaces as deprecated in kernel docs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 7:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We've recently had someone try to use of_get_named_gpio() in new code.
> Mark legacy interfaces as deprecated in kernel docs to avoid any
> confusion.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied.

Bart

