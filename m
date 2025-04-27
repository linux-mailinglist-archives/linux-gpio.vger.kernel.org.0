Return-Path: <linux-gpio+bounces-19340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D8A9E137
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 10:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E48F17EDE1
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 08:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33E0247296;
	Sun, 27 Apr 2025 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeWoDXkx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D6246326;
	Sun, 27 Apr 2025 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745744119; cv=none; b=oqUjkKDMJL+aebN8bHNzAITBj7fLxb2+Vqlh1ynq/KcF+G5C8HNum5WkGvRwHgJpq57ui7QkKYIkG+8Jz/Sg8rcC7cyWNOv8/jOb7EPZWl8SC2RRnsHbPhV5npcyvAsqkaHMfPwPAD8xZRSfYzDPh1iYi3PvwX7FB+YU3GF1p1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745744119; c=relaxed/simple;
	bh=xoJ/+Kxws9hcyMvKoFMln5L5fp0JObvMuvDv3kAi3Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z32g/11iBW7YMo+XVO0q01ZM6B4byS5GvFgiCsCC+a/pN+GRnKsELzuP49Oz6GbLB5kfu35S8/8CaLn/Tnnu7yy91zIZ+ZzG4cTtFdnE6iUp/C+AyeWmCkY4AMW2/YU1mHnY5e92SbMrLOF/lT47hYrZ0E2xzsKVa6Mt4XvSOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeWoDXkx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso619454666b.1;
        Sun, 27 Apr 2025 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745744114; x=1746348914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoJ/+Kxws9hcyMvKoFMln5L5fp0JObvMuvDv3kAi3Ek=;
        b=IeWoDXkxbU9Gw1rmwdVgSyxIjUgzxokUKLbDAe+3cOHhuzX0nIGH2a+Z4M9BRwyW5G
         nXWxzq//sJkIYUbHPDjpEEyFXiXM0TmJ6qyfppODkTWOxkp4VBLsvKZtlcGGbkPEpCsx
         86sayopqnCzpayAr8J89GIem8bAIYQvKmfEaojBlq4AEvwGt+RY5GV76b6YLfANxF9Ef
         iyXpxBpFg6/qu+9USOZcINJaJdoplxNvGBCc69ezaBku7T4v19Tt51Gcaz2XhICNUfBk
         LeDvLqiZflxH0z8ts7TVF1H3CMpynLGOf/emE/mTiaLXrEXBg9peNa/CleBB3dir/uEM
         2bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745744114; x=1746348914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoJ/+Kxws9hcyMvKoFMln5L5fp0JObvMuvDv3kAi3Ek=;
        b=LAD2Uz+cnXsKuftT8aMB+wmDkjNaRPZPgjVCoL2AZ+8NhtVtK/NpK4Qao0ygIBmH3g
         WIXThcAUcWfMaQ0+PjVARzxtlYF32UhbZqCXfN17aWmLdMW/gGIK5XDj7XQliuBNXi7w
         NgDXYtcCHZjj7Vd+mshjBgqys9yTUwk5KuLyzxnXolFNbWfusUyYaazWopXk27DuI7sq
         ZNNWG5R0XEOuy/1LXMzXa2n3ZnzjGzUIoB8HsCMN9LhL9fbb0gMbVCuHpYybOkO4evgd
         5roKXILqQtlg07L1eosCNffXvuk6PXl5UXiCZs68MgbqAprIDwihD3KN7oj2ccLlIiWK
         TjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU79OpvURDqawaRvAeLeT5/Mccw6wNan5Pw7R7qhF8UbC3UltyMgNPqVc7hZmEMcsSsJARX6+aiDfyg@vger.kernel.org, AJvYcCWQgDh5bgmNoTNsMVgu5gaujMK5q0s0lz0OYmm9TOJJhTQS2v1Peq0g48N1hyhQTemhdUVqUqf/km+Gsti6@vger.kernel.org
X-Gm-Message-State: AOJu0YxQGmKTNKFaTq1RSOai+qt/lPoR/bcuDk5MbHtcz2sy0bIbxkgi
	+ehqqmWDTdRaWA8tKB3WCDoGeVMJiXddEsi7fH9pBpWimo4qYy4dkb0/XbPyU94+gtsE6gPi2Fb
	B/j4guzKtHJHwJJJl4OBIFZPcAGo=
X-Gm-Gg: ASbGncuBl3cBQS6privUvzNX0PZqSrzWjWOFZylcNTne3Me5jqRsD2JIeSNBei3V0uU
	GhyqjwdqPOrYtIjS21WJdeg0iBXNM5SbY7CsP5h1wrju6pbhYCQOsllZ7yPQJt8xZW3lwnYKSy1
	PL1231b4qrCvz9NRPWleSbzdjM+SGBar7g
X-Google-Smtp-Source: AGHT+IFWiy9LJ5L5w5vCuPgZqC4QHw+FesRweBH/UokuUi4+dKeIyxrTwPSebkoZVCO8QO4FAgsPsXoV5xqijAh9mxg=
X-Received: by 2002:a17:907:3f0b:b0:ac6:f5aa:87f5 with SMTP id
 a640c23a62f3a-ace710a20b7mr623326566b.14.1745744114072; Sun, 27 Apr 2025
 01:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426231127.190090-1-ariel@simulevski.at>
In-Reply-To: <20250426231127.190090-1-ariel@simulevski.at>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 27 Apr 2025 11:54:37 +0300
X-Gm-Features: ATxdqUGWzCZoGHYF9n1Zc1OjBcvlWH4y0FKIuKAiyIfaBdwAYt6KFZzU8gWm-6Q
Message-ID: <CAHp75VcAM0ca6E-wC7m-mkJ-LONweYesWdP7s4=kMCwYQPO4Lw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: alderlake: Add missing I2C2/I2C3/I2C4 pin definitions
To: Ariel Simulevski <ariel@simulevski.at>
Cc: mika.westerberg@linux.intel.com, andy@kernel.org, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guido Trentalancia <guido2022@trentalancia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 2:11=E2=80=AFAM Ariel Simulevski <ariel@simulevski.=
at> wrote:
>
> The PixArt I2C touchpad (PIXA3848) found on several Alder Lake
> laptops is not detected unless the Tiger Lake pinctrl driver is used.
>
> This patch adds missing I2C2, I2C3, and I2C4 pin definitions
> to the Alder Lake pinctrl driver, based on Tiger Lake mappings,
> with corrected pin numbering and proper community assignment.

Thanks for the patch and report. Why can't the Tigerlake driver be used?

--=20
With Best Regards,
Andy Shevchenko

