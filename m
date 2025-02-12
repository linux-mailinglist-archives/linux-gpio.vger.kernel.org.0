Return-Path: <linux-gpio+bounces-15827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245EA321C8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 052323A6F1B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A48E205E0D;
	Wed, 12 Feb 2025 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rHoWqk9K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50187205AD8
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351341; cv=none; b=g4OJnUkSgaUtGg345vu9WYE0aKUFPb61SJAQEeLFILR+ZpbvDUFpJBR4YaWbEyoGP4f2q1k23UZDHypiAqb+4Z3hyXOIeM7Ljnb9LiPGLJ1U5XqnVUp4pF7o9YJKN3U0Srj/PQeav93f4d4hLyQ3vG3LdfCmPnhoPQiWuUmb1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351341; c=relaxed/simple;
	bh=n5wGpnFwIRrA8Xe201rtdK31/WPbH4qcC7pqdJpe9PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZiHPMW9xInY8Bpk8Q4F+6EVS2X5t+Hs5fBFhwc3u7l23WQCyqnr+4TMBsokAPjMAQjtfT/n+x5T65yukZL5iyA0N164SvV/cxkUwwWC/xeM2YnLKeeqvEaCWD7ivUB0hNOTCePAg26nsFdvBNYsrMZ4vz1Z2FBjjeWPc2SkpfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rHoWqk9K; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5450622b325so3875889e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739351337; x=1739956137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5wGpnFwIRrA8Xe201rtdK31/WPbH4qcC7pqdJpe9PM=;
        b=rHoWqk9KET0/UQ/ypo46bbvtDE7KVr2A0Su0zP99gIi13A5YypM+5rtXFlf9+Pi9XG
         S1p7zWrmM6Cpf4+oEjbBfjNNPAUn4RXEJWT2lB92AYtmk7OU1OOF53vNerZYnsRNcrit
         3WTY4zd57B3VAxztrC4hOGhKP1xPmbrur1pGgTi3NnrMX8uA0MC8gPyUn5Pe0t4WyMb/
         J8e6BstzphqbwUUjxcB3b+EjL91JKnWq/UhyrShnawCmKwugtdXjAYBhPMNPiKeV96ch
         LBzU8yDrM0bj2PSV/7FG5WlLQ7SPkcRxwobkU6MfLZcs8L1cfH9tfnrHAbbyKnSciCcq
         6ImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739351337; x=1739956137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5wGpnFwIRrA8Xe201rtdK31/WPbH4qcC7pqdJpe9PM=;
        b=BJyc3nddQsG6qD/Wg+m9wFbUTs/+VGEUwzXwSarnhMGc1nPM9+t9mhhpyUOOm+Z3cT
         GG3ugWyRqpqixYWdXoSHgPL1J/yYK59mYqxdiEzZueR7dwyp+kkL9tynwFEehFTcbzWJ
         kUIgGjxdwtT+0jCEE/y7JtbIhyFzV+92PS8MgYKWGpy8gvoDZxx1BTghbFGafbSopq8J
         XA+Uk0ZNV8Izd0evvD2AY2wg3blnr1DL6lqbGCYfHCpSxtAiF9lUwlgkS0gTNfVD+s9d
         BoZ8OA73mJa92V5MAlJQFq5NctUiYvMfr0PnWpDg+LQkBMZMscU8jPVn+GQyLT+5PKdF
         S5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCV2GjX9pUIHAsE02mcDzOLDib2k/U3wsnOH4dUAauD9ITxuywU7rZs+uq1/RNGUbWZROziGIw702Xw4@vger.kernel.org
X-Gm-Message-State: AOJu0YzEUE3QdWvb+1WS1H7TjGyjGye1lcbNZwWIlzCKABmbd4xbZ/2S
	Co+t4sWzh2pt/XaNtqSWxxbItXLtC0uHIxfpDcRfwydRPWACSrpIp6q18A9hLG0CnsBNQY0n+lz
	6mCUiZlwFjCoeVZDTG6QmhRuPND1cJkDuJuuxWA==
X-Gm-Gg: ASbGnct5eFPndv02d4bnIC43YsH6De4mPTQ2QbkRjP4vsnC0AH4+IBrt7LKO4bP0ZbE
	27XMDB5jmLB9LhfolGmlcSM3NtoS+TQzM6UVNPBLq9oiBMW95d60mxPHRxFw2lUNrS9AyviSy7Y
	irwnjUs5vAe6th9qeQhkXPjOooHKwD
X-Google-Smtp-Source: AGHT+IHMVhNH1DsYiwDgLt8aoqLJRbGu0lSkpmAHQUbgHbclESRiO+lCCFE5NmUMNPANjy2YyCxX/m9IzHXzQl+nN4A=
X-Received: by 2002:a05:6512:6d6:b0:545:450:74b9 with SMTP id
 2adb3069b0e04-54517f7b432mr715928e87.0.1739351337360; Wed, 12 Feb 2025
 01:08:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211203222.761206-1-superm1@kernel.org>
In-Reply-To: <20250211203222.761206-1-superm1@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Feb 2025 10:08:45 +0100
X-Gm-Features: AWEUYZlOaG0fdFZcvnZdGV-_YBOc5ks7TZt7wQR5Pn3UZrMzduFNjTZra-BNIVw
Message-ID: <CAMRc=MfOjfHWYGWMx3jcqQpnn6Kn+TFHVLZ355P7zG27JkqFDQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Add a quirk for Acer Nitro ANV14
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, westeri@kernel.org, 
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, 
	stable@vger.kernel.org, Delgan <delgan.py@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 9:32=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Spurious immediate wake up events are reported on Acer Nitro ANV14. GPIO =
11 is
> specified as an edge triggered input and also a wake source but this pin =
is
> supposed to be an output pin for an LED, so it's effectively floating.
>
> Block the interrupt from getting set up for this GPIO on this device.
>
> Cc: stable@vger.kernel.org
> Reported-and-tested-by: Delgan <delgan.py@gmail.com>

Please refer to process/submitting-patches.rst - don't combine tags.

> Close: https://gitlab.freedesktop.org/drm/amd/-/issues/3954

This should be `Closes`, not `Close`.

I fixed the two above myself but please keep it in mind next time.

Bartosz

