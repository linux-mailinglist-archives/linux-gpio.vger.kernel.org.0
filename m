Return-Path: <linux-gpio+bounces-6533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E10498CB2F4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 19:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EB92B21D69
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 17:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A927F48D;
	Tue, 21 May 2024 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH2jZwff"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1512B179BD;
	Tue, 21 May 2024 17:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716312945; cv=none; b=rscI7uZQ0locL98a98a0sbpK5AGrMRPcMGPBFOQqVOHBsswcmKPHFbycP3Ms34F1ETmXg7VJptqAP/0g1D4uafg9U3J1z0pgCboNcAHiSUegeZGP0GXNUld6Wgl4v/k/Okn6PVVcyemOXqP212mMpSVDz0+H8alHaqak50awruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716312945; c=relaxed/simple;
	bh=/oe0OnFOCsN7qwnG+OO1ZC0BL+QPtS0uFcQRGKdgsss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThOpbzYRjDyGTjnEu1sBeKcIM8/u/VsGKBdniJPm9xMtjwFR0bT7ef4nQVS2I2661QXL6EV2H2dTN3HixhW/6jRKnT5ZdHqHEf7fvUMs95y4EeIoBdSCjp/BWwhLwF2F0i/t6fNoQ54rHJ5U1Y5igH/AdGBJWQub+teLWQTOQKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH2jZwff; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52192578b95so6669684e87.2;
        Tue, 21 May 2024 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716312942; x=1716917742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oe0OnFOCsN7qwnG+OO1ZC0BL+QPtS0uFcQRGKdgsss=;
        b=NH2jZwffiTF4ASdbDy3dJjrZOtVxGJT5AAxa71rOEyuinEqt0OyNRK53wng8bVi27K
         OkDgQQrlSDB4smfgANPL4yu6jOptSryTAh4gQ49sLwQ2AzUuWIvWi1/8AOvaPsWgYr7k
         tDDSzphRNfQ5HEwM7wV0sNb2j9oZxKY6H17XZ/7AjMKCBusv8ca6ijLh149ylXPnl1IY
         k8HI6eBidNW+6McDWAQc8X1qJbrgojlH2muQ7hNGYtczZZIKkGtIAm/XP5KFcrN/0vU/
         9JzPsBXRJtlDtbE8WmsijxT8wMlBjiSesuCQD9ttBUk+5fWfvUb8CJh+qUl/0JrjAVay
         bd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716312942; x=1716917742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oe0OnFOCsN7qwnG+OO1ZC0BL+QPtS0uFcQRGKdgsss=;
        b=BuESh6BuSY6yJpj6awlGWly3jfqrMau0XFVzwk4Tzit0kUW8neE2nqj/tkEkg80+Ru
         2QdFQzxhGQCHcRrnRqaFw6QboZrBP9DJvTMUoTGqc0HqDbKGI0DzAE40m5ukq61rbBaC
         Su+fMnCmxpPx94dTvdCKjIWRQKBHNQU1L5yCK8Akgs9emJB/Abhfhbcv1aKHwZ5s4jKn
         6tUAzD6+rB+28pPGr7DsLgLBpqe3oYaa3ckYb1b52OVQ40VfMe3gyepzPz1g6A8Ltm2a
         D7zV+IbRoKVuZin2wDNGonX/IglT1A6TtH4l/H4byaMEZZTl2pgcwwdjPQq5RlC3uoKz
         kn6w==
X-Forwarded-Encrypted: i=1; AJvYcCXI/fqEOw2UO0Ctkusuq+QZcbTTG//oiR82G6JHTPLwryiH2aA1QNuljriKxeolOvOsW5GO4Po9xNMpPUAjRGzIP0DH6vNspvHsGYm9PXRhV0O7Wu7Hsy04qHbeyNL6cKd+rmUYFNTVXA==
X-Gm-Message-State: AOJu0YzOlKgp100ZLiOMUkpyDjrpG+5Ft4DGIRV4li/JHVIc8P566jkF
	Bk7m+vziUs6wnOwR3LYRpS8wB4fK3lajfA3FxDr9JiQ7V6XhHuYr6O1Vybf8WvK7Peoxpyko/Y1
	pmXTLuCIhcKzgZCNke2RQiAgP2pM=
X-Google-Smtp-Source: AGHT+IF9CsGMbeMjWAduWbxNDxod6ulh3/+E55CP+6y/hiYWcM3ZaxYwWXQSCt2Ihs0XWLova878TF9t251L1I2GPUM=
X-Received: by 2002:ac2:46ca:0:b0:518:95b6:176f with SMTP id
 2adb3069b0e04-5220fe7a008mr19171508e87.50.1716312941979; Tue, 21 May 2024
 10:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com> <20240521152602.1097764-3-patrick.rudolph@9elements.com>
In-Reply-To: <20240521152602.1097764-3-patrick.rudolph@9elements.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 May 2024 20:35:06 +0300
Message-ID: <CAHp75VdigpKi0NeG=2G17h8gOzxQeP+0VxEyzfstqzWZqOmM-g@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: cy8c95x0: Use REGCACHE_MAPLE
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, naresh.solanki@9elements.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 6:26=E2=80=AFPM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> Use REGCACHE_MAPLE instead of REGCACHE_FLAT.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

