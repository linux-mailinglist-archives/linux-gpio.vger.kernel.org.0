Return-Path: <linux-gpio+bounces-18837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFACA8980E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 595ED1893EEC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C74288C8B;
	Tue, 15 Apr 2025 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6rvqVDp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5132927FD76
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709582; cv=none; b=GXFVnPOp9c9prv7KMcYSspPZ/F+U2mYs+tlxDB9b3RcJloGn3VSg1Z350lIWlsvUDnvkaPeiZzEQldGZDE19py2IK8PmGoNjSl1kH/S+fZsQyNcKHPkCKD4Wop/PWoFA2tc+WIOeDlsXM9siTuJCrltGyt7Ecb1Tb3YqkBNNU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709582; c=relaxed/simple;
	bh=TYo0D+KDl11xFC39h9/SnQkS4gevK+SUbiiPgxcbnQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skO27QaZO2v8xYbY1Su8dOLtBDZ3d3Ww3Ec0nU+QPG7ZHbtydxuitz5+znQJdGqW4Mwubfgt/FRooKHh/LpHbNCvmwEtZ0R6iF1bPkvxfKUHOHQKkRh4D+eE82TmmGFuO07niYaZ8y7ZLC1bIauNdf2Eh6R33sBLBvbPAZTdIZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6rvqVDp; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfed67e08so52276641fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744709578; x=1745314378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYo0D+KDl11xFC39h9/SnQkS4gevK+SUbiiPgxcbnQo=;
        b=B6rvqVDpegf7DGD4yfK0AKuAE1776nur2Is+Hx7iadg0V2TwzBDFoDFHlKzeLiQedQ
         yw9RGJyr3HMMZDR4ak4DHhGM3lxKRPR/1XHJNpNihQnQ1W6+ErfhBdLepRM1aor0wOJl
         Wv1Gj2a2zmObgjudCHJsZGRDCCERfxKFuJclAVLQipGGGF90wUoDLhs2itWUEdhcxMSZ
         UWAtzzUjKQ0+fwCJpp2g8n4oWWBSnEeYVk0K2LX8LCrJFcn6LxcCIB1oHvrIMaBHjqiy
         TblYr1pRAh640bbCESmeLGq+HtXS2G5DN6Hdt9dNrO0SjDfT506e8s3koM1Wf673YbPQ
         7mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709578; x=1745314378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYo0D+KDl11xFC39h9/SnQkS4gevK+SUbiiPgxcbnQo=;
        b=AYQcPL6SuWqLsLrWsXZg/FW1ZtvQFiA3OsO5cmmokYavjr6Tz6RbRUYPNuM8TwdtXk
         /b3npkPchhZ7iefUwh3V3MhCRhbuL7LD785TJB6zZmUooDhlrwWTuGZrGmymVqi4aDEK
         1Hg1oC3RvkR+/0OpmPgQDh2ok1MY1o1YRNTdsbHL+8+40kFOAEOI+/svUT6IOxANBTH0
         kzDI1nKLTorZ/FxJtTQ7GTyd/8PWtMaiyu4wRfBjlCBKlV5XkDjXyoIqjtmQsPtEmUg1
         zTX0xOSgtRBiQ3cStQxYvUPJn0oNVifu7NZNblDc/HCaQFq1xwKFPTB/wAk8ajfJlAeE
         ZNfA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BxHrotOTNPYNs7CTHhHyN8uiBu98miKt+E3dA3tp+gbGLVQkgMHR61qzUBRF5SAY8nFmIoRhdSTi@vger.kernel.org
X-Gm-Message-State: AOJu0YzovZGgZCaaUGGVie1CxRilgF58DlsjbEd0rr5cUcn/4+XScseO
	CEJKJ9DHKTGrnQwSEUHzLlQ9W4HqDl5OqD4LbEI7wkdr5C0yXbim3QBmhtFSUBe2s5sKDTWXAVP
	MeZhcHdzceHKCDPEHZOvFNuJsVErtxvFSbOx2Cw==
X-Gm-Gg: ASbGncsYbdRVJfrAsqvY44+a5qTERgMkCXcs2IjLmYl8DERpJxe3KDfeiUGpz27h5+q
	EkxkyLiKT8Y6coDDhwFXH2PigzF31wywkXqBIWIcDxl8Ea98yWaidOBv4o4NQ5p9Ql9ptUozx4m
	Jbj9ELCUd4yDP6mkfMjNAsNg==
X-Google-Smtp-Source: AGHT+IGU2b9uF/Mr57XthdvMPG13t7lA8NxInFQyj+fRoSHR4tQinYzmzSuhecKB5pvA2tk7Cr+fEwEs5eWUwydjpYU=
X-Received: by 2002:a2e:b8c1:0:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-31049a80d31mr57193171fa.34.1744709578159; Tue, 15 Apr 2025
 02:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
 <Z-5BHzTEed607Afz@smile.fi.intel.com> <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
 <Z-5uJxij4jmhint3@smile.fi.intel.com> <CAMRc=MdPiz_YD451Arrm4mT-SwU_OdK1U-WozPxsvt11mHsLZQ@mail.gmail.com>
 <Z-6Lm_Aqe3-LS4lj@smile.fi.intel.com> <CAMRc=Md0gD=XPEkb=C6JJcRvDpBbcJb5Xv8fE-v94iT=COHw7A@mail.gmail.com>
In-Reply-To: <CAMRc=Md0gD=XPEkb=C6JJcRvDpBbcJb5Xv8fE-v94iT=COHw7A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 11:32:46 +0200
X-Gm-Features: ATxdqUHT3f-K_QRzZoZnTfm9C29GKiIq3DgoOZEp9KXQm5MQ6Pw3GxYPP1ol6S8
Message-ID: <CACRpkdadk7a9QQUjEuS5w-aWpxBW1mrqZPe+qTbNZuL6t-YMPw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 2:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> I explained why I believe this change is wrong and I will allow myself
> to not accept it unless Linus is very positively in favor.

I am neutral on this unfortunately so my opinion doesn't help...
I'm simply fine either way :/

Yours,
Linus Walleij

