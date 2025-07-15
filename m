Return-Path: <linux-gpio+bounces-23296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4875CB05B32
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 15:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECB143BF8EC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0602E2F04;
	Tue, 15 Jul 2025 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m0pE6wcl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B03C1A5B9D
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585443; cv=none; b=V8kj84ea/saSAPr8i0fABVjipV3pbkiRCvVJRWjPv+12IlSrL/jErI8ffP4tt8zcJBXc6GyAK8VusPf4aXfPOO+apfp6gh89+6A93ujLilN6fZlbGN35DQWNC4LSU5tvxVY7DfAW/7x9N53FvfM67yIMKIBzWWSglphjnGJ9ZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585443; c=relaxed/simple;
	bh=EbPOhYxKmhpuxZYPk4B6pkAFB6wXuZvAR/vSuYVQ5XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l54onHKdngKr64vcQC4X9Kwyt47dMo0+/VkE71J7B1nr98QKvBwsB/kmurc3fOvef4GRwaKGFkxc0DTnU1Ho6YjjRkH6sGt8aUV5zrnLUICsJKASe6QJ7vZ5+LNEciG+UGJ2nxyeewkndOKmBLt0Aawk0UV5xN5mS3LIxImwVak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m0pE6wcl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b49ac6431so42388131fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752585440; x=1753190240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbPOhYxKmhpuxZYPk4B6pkAFB6wXuZvAR/vSuYVQ5XA=;
        b=m0pE6wcl9/rA+zZrcKJgGP+4k0hvB0TUxfzPkMuqyTqdcwrQqUD1Q4dz770UY1P5dq
         ou8rGDrKbPjxs2F2dzgOoiMh8JQrGzU+f+S9S/hMY6HPtoUJ82xT9lg4wq3DGlapPqwk
         FeVIAAPiwQkwl07oon3Ti7I+TB/ZAT26dmIYg1VUnf+CHOQbAVYOjYkVTg6P1gNiJsMg
         yxb4rgHLpvm1+qX5AUppvm1mq3lgvZ71RMu/lZD2+MjRHkOEQQPvIJFvRXl/zpYJI6O/
         byrIND1HhswYcDapYJ6UKAegvG6ecjHLrpXTJO4jXuGvxuKMNMxpnqz5ldn1qGIHfjTE
         woNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585440; x=1753190240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbPOhYxKmhpuxZYPk4B6pkAFB6wXuZvAR/vSuYVQ5XA=;
        b=JTJSRGmX/GusLjXO7OgkU9kAMQsmMatOZ2QVxAIk6ifWa9s1IXWYLSL1rByPKlozrh
         apf6T4c6Jm/jUrcTmeajqrgQfIS8CvUQ58x45CmnNRpAFJ4gnriGj8wz5tB1msF8STpr
         9qM2zSmUYGKSDp1lZVsu4Bq22e35fD1Zia+0sBH2Xy+uCeyiOv4sr3nCcxt/YzRpgaRl
         9me4t2JLkRdfIzaDk8oJ53WSO2HiIBwDfajAeFI40kVQIOLrB1EP118A//m9rtvaLS1V
         +HMyCWd5UCqebjx+oFyws+/jEYA9b8wal4uz86WY+a4xT+vYhc4fjdshGUdyvokUzNCe
         tsXA==
X-Forwarded-Encrypted: i=1; AJvYcCUW6RVORWU8pEP++qRLiwmKYCsoVBmbNyUBQlHqRNaLt9F7Hqpskt59wSMpfKIZyQokXJkmgbQSoI0d@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8jDyx0vHTZjTOZSFmWFpDM4l39NeocbOmPKjj+xfZPmiFrd8
	eOHZ+PpXv/OZa9xMB54HV47yaQIun9X/7VQITQShl8NZab1Z7vUq74S5DzzQnZnma5Y3gAv+uFK
	pbjB/zoPWMIz/mghkrr1cExPuFZOyJtIWtkqLAKpajg==
X-Gm-Gg: ASbGncsuhtCDo3dKgQwANbbQIDEJQXgan0Aoz/VQG0ehs+DEhaSHMoS6cgVc/N6uEiy
	4IQ5w458lDslRIBb7Qd9c6Hq605c57ipBNVE1ENpuKkUelItwVmCuROFtZAcx/E4O62f9l/T4PG
	lN7zPuzvnkADQjIh36psMu/RmyZbR0+2MF2kmpgGfY2EIArpxKGT3Yk57rUuggVT01pksClTU2e
	UuSBJBjRUYYPdwYMY52zqUu6f/s7/TAKFg7DK0=
X-Google-Smtp-Source: AGHT+IG09J9PA2KclI10YV95njLPiWN/K6zvwX5knhUkHxQZ1/HA1h98MK7b6qFAh/thxaE0FtygrGZqtBXWqXa8aSM=
X-Received: by 2002:a05:6512:3054:b0:553:3770:c91d with SMTP id
 2adb3069b0e04-55a044d0e3amr5712015e87.4.1752585440185; Tue, 15 Jul 2025
 06:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
 <CAMRc=MfS5Em65n0fwbu8JtJsc3rTgQO5cv+PymSonJtf6_zRKQ@mail.gmail.com> <824ec6d1-4272-44c7-b3bb-93d716ed3d43@bootlin.com>
In-Reply-To: <824ec6d1-4272-44c7-b3bb-93d716ed3d43@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Jul 2025 15:17:09 +0200
X-Gm-Features: Ac12FXxvAYS_y1k5VysfY5vrsZKSD3qX4LU77mI9zq4NyAOxI1SkYaUSlMb4VSs
Message-ID: <CAMRc=McnU6TO5p7Jwy-DOg_8-=AS7rFRfaPD0yH1SERWXM8L+A@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 3:13=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> On 6/25/25 10:26 AM, Bartosz Golaszewski wrote:
> > On Wed, Jun 11, 2025 at 11:00=E2=80=AFAM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> >>
> >> This is the eighth version of this series. I just added a missing head=
er
> >> file in gpio-aggregator driver to fix a build warning reported by a ke=
rnel
> >> test robot [1].
> >>
> >> [1] https://lore.kernel.org/oe-kbuild-all/202506092324.XqSwWl1z-lkp@in=
tel.com/
> >>
> >> Best Regards,
> >>
> >> Thomas
> >>
> >> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> >> ---
> >
> > This series looks pretty good now, any objections to picking it up? As
> > usual - I can take the GPIO patches and provide an immutable branch
> > for Linus to pull.
>
> Hi Bartosz,
>
> When do you plan to pick the patches? Will it be ok for next merge window=
?
>

Well, nobody responded to my last email. This is a cross-tree series
so at least Linus must confirm he's ok.

Bart

