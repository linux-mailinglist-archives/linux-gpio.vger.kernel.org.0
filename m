Return-Path: <linux-gpio+bounces-17604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CBCA60ED5
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83E5F16E08E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8C51F4620;
	Fri, 14 Mar 2025 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jq0KWvbC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C11F418A
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948097; cv=none; b=ePnz/onuhBl60ykTT/FnE6+ADG9x6C+EhosNG41ojEoF7Qeqi5c7uSYyHpDgiZJUSgsCjUr82cOeFMO11B8+6PvjYyCeSPCvNrKThMBNLLyQ+kX0gpHndHRfELd1T3MjY/iaxPgFaaZJE3NJDIV9YtbpuNdPtpmyqfnPPYKGu10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948097; c=relaxed/simple;
	bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ej88ZCiegXEsXkcCeOVzufq3hea6bQr2/UFmzYIpeSlJlV+L2F8Vi8sEHnrkUIKr0GLuX31nXRU6e/7wqW1F54ZY55+lJ9aH/7nF3DT0kQWABtg1G3qA/c72cNMf62XhPitv2K3LwhjZwPWSefMDFZGndlO+rwtilC95DYL4HaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jq0KWvbC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso2033175e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948093; x=1742552893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
        b=Jq0KWvbC+RGapBxE/79RV0BIeD9VvGdw1Fpe1TB3FQiE3Mx7M1ug74I43skmk/ysed
         pW0eyKCVeuPLLFbAr8/7rZaVq+ypvWIqqp98ONbAm/K0er06k802QP0sKmwApc01jN5E
         LJkRPCM7GjMxbAZVdkkbB+WFpnQ3yeovdkzSGgBhRM8hxbnIqo7S1fIfuHXiO9Srwm6f
         0krXnLDsipucb1cr4hOpq8EflJ5+JkQWavCGVohox/GL31nKFJGEb3tY1JskSboySuXw
         evvwW11mE8FMNJVAwglnLWQuelsD1w2tLYtm1nHAHAZQlQ3gbq3yJ1khhhuBRD+qlb/f
         Bh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948093; x=1742552893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
        b=OHcSQWXr8+l9j7z8F9B50j4BYg7d4mZMMAC1QXv8QcXbouReSfqI2qLmVWR+prYm5d
         HLzjdYNixLePxqRP3H9qdcj4nHH6Ixzg8SlEtGrBBmLPL5b/TEjW/LIUaKnKHY90HDbk
         xNVGJhnmocl+zNVoBS3N5H6Wt8QMCInmOz8jIjH9fiC5VrLZouR0yuBR4A/XcZFuqB6X
         nzVWJVG0H/n9XqWU8uftBN3XfsnQptr/5OHLJ6HEWHaoA7PuaPK7zNxw6vqzu77qoctQ
         CKntjCQ2VLhesr0h3tK77esIVG2Tzwp6qp1pCW8hrO/Wh+ihPq6ySFnlQCkJ/QeU/Trt
         3NnA==
X-Forwarded-Encrypted: i=1; AJvYcCXRiqNzwK+0xRmwwY5zuLqdS680Qzb/+ydBfmQjXR4c3ziAkuaBm4qbtLfx5XUwqC68w/MPYu0xuKqv@vger.kernel.org
X-Gm-Message-State: AOJu0YyQBwl3pRhX88a7ajUibvuV8IlpkhhOevqudZNBC+ptXi7yGIRv
	kVMnPy9Qer9WuC0waM6u0HDVOOzVA+rhL2wDb7GEJOQDj+hJMhvG7SowN94lv4tSvXDDquAMBZm
	WSMV6FhUx52C9wlg6ZLw45Dkj927N/0WUiiQhmg==
X-Gm-Gg: ASbGncucnHbYJugD4w9S1q5uPdrhoc5A8nArjo2ofpLxhvlBB5mmXLCNglq+O8BiZm6
	l12bm9qbp4NULjI2nwSl9vJoIgR+vP7+c/YmmL1x0pnK6K7oby15DM6BAilUVlWr7N3SB30SMmV
	hVbfcBuBsIowJJTawOtc7oKaE=
X-Google-Smtp-Source: AGHT+IEn/Zc2evX7ABWKYXK/Rs9IfMZdPR9tSjfOKy1a8kRLZcgdXcqx09hfLow4+l9JiJIqttYJQGRGb5b/H78iKJ8=
X-Received: by 2002:a05:6512:3087:b0:549:7330:6a5a with SMTP id
 2adb3069b0e04-549c3913d63mr621103e87.23.1741948093287; Fri, 14 Mar 2025
 03:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309193612.251929-1-linux@treblig.org> <20250309193612.251929-5-linux@treblig.org>
In-Reply-To: <20250309193612.251929-5-linux@treblig.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:28:02 +0100
X-Gm-Features: AQ5f1Jo6nSq2AFqXUDepXvu8J8Xduf-drgRoP8FzPPUsiMaA2xVOQZlsv65trtc
Message-ID: <CACRpkdY2oZtu4vtTwHRMFxaoYWu3B5bfPN==thz=BT2F6BHQQw@mail.gmail.com>
Subject: Re: [PATCH 4/9] mfd: pcF50633-gpio: Remove
To: linux@treblig.org
Cc: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com, 
	danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, brgl@bgdev.pl, 
	tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 9, 2025 at 8:36=E2=80=AFPM <linux@treblig.org> wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
>
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

