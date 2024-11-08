Return-Path: <linux-gpio+bounces-12750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E2E9C2566
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 20:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F0C1C230F0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 19:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868F21F26E5;
	Fri,  8 Nov 2024 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bnhapw5f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2C1F26C5
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731093085; cv=none; b=Z8jq/5Az8HE/JD8O+g84iPFcDKIraQMmZQlxGpWsfUs3bG5jesV59ShpvMd8Zd4DVAaedPAGKxcWl2CmJJgG9wc2k3gQ3vZBoU56/rZ02yEkQxZ6KrqD2onVTUMn7bjhFynNWt2t0K64NPUXZAbKqlYaMK1eAyb6X8jcEJ9xnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731093085; c=relaxed/simple;
	bh=VIRkx+efX/6GJFRSs+ScK+sQvOdc8uMwqc3bnd22j8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fl0rdC8tf0dzmg5aZdimpRHp8T1qC3wIZxTtXMzf/2jlYML3u98EJGpr/rlOCcKBzTGy+MJ7RPeHQ2WTSWL65dV4C2/fHqgwcXGc2LTt3tf0KZi87vKta6Gz+3aaLsHpYRaIdn89dWS3WZmGF5Y1FzVevNjt/Hv9gn+oJCxFL2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bnhapw5f; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so21052531fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 11:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731093081; x=1731697881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIRkx+efX/6GJFRSs+ScK+sQvOdc8uMwqc3bnd22j8Q=;
        b=Bnhapw5foka1Ig1WeR6wObMuvHk+Lkrn7kqmlqF+/eF0YfntamtnA6RoJgRnXGf8Jv
         YY8KT/AFztF1GTtnF2u0ZfaFB4SENE1oc2ohWEwM+3YJ6l3x/q8xm+gMvfb4Tpurs9x+
         G3YrI9rB0ERKoVnfLENfxxzYRGlFQAnWdT8O1Tm9EvhVk7W1RieTNDgGPABuE0KxIdMZ
         WUGfSyzxXFKUEHiUVSJ+REFhwODHSMZGwOa8jDg+WbsWtfVlAboZivA5VPaEXC3Crva0
         S6sPm1NUgCBrLKt8FTfWYA/NddiT8ORoS+FPzyqc8A7RQlBcWwCmySP12MrPwhC6gq9m
         qUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731093081; x=1731697881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIRkx+efX/6GJFRSs+ScK+sQvOdc8uMwqc3bnd22j8Q=;
        b=ZbnhVzGYlBpgJpEGR1JiUiNjrXEQQPQ3iQeb7g8UFnUYMWHz3qMuOdCNedtddRKR+W
         8e4iooWjGEDdWyCPZwjXKTGzGuimHzu9l1WGs8fAFFji5Xo9ScffaifsMFKN3iyww1f4
         gqqJrKhr4AALv0MuM7yvKy+gjvdeZrCPtSCmlGL98nNDGptU5e3+4Jmd1NqskJtPcFsi
         8i7Fh5y0BNbfND49AwmdTNg9C/mTkUnsym0o3l2ORojFn8A0kDaGP1PuFYQ0lDjHPQ1W
         iyEliUuwrslfjQWC+/R88lPfkiVkUH5nhNmgGittrkvfVStafCQovBcCAvJ0Rs8+UKJp
         pxAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEblZRZgXFr4f5anpcUr8oQasVASA5Mz1zgFTFbUPiEtFdhqM8YYiTphD+PGObVMd9BRk1HF+S7Wtt@vger.kernel.org
X-Gm-Message-State: AOJu0YwQDRILqM809qEHFoPH5ePbcWWbuojK+GVJn5Aq1deRlwaFw905
	1k6iljqLo0foFbL5lvAtcOCuBTh/cZvXfuux44nQM+3bWiy9oWnSy1ODsU/oqyOvmnkvTldhyvR
	VjAlK4DB54kM6zhkChye8lovPDhV806txH5kFNg==
X-Google-Smtp-Source: AGHT+IEyu3ErGRSaoQFi38Acb6XQ4BU2dWUjhmoCrPXW6aChPPUQ0fFsyrxlijdB2I2MeCnQFX6bAQ4S/Z/CIgMGk7U=
X-Received: by 2002:a2e:be24:0:b0:2fb:591d:3db8 with SMTP id
 38308e7fff4ca-2ff2028a90bmr22074941fa.35.1731093081457; Fri, 08 Nov 2024
 11:11:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220616013747.126051-1-frank@zago.net> <cf32d676-831c-4c3f-8965-c9be3abd5300@gmail.com>
In-Reply-To: <cf32d676-831c-4c3f-8965-c9be3abd5300@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 20:11:10 +0100
Message-ID: <CACRpkdb-VWnOcHBcHOfMMxKicDGvGt3vB-dSo2nhz_M7oxq35A@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] add driver for the WCH CH341 in I2C/GPIO mode
To: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>, Howard Harte <hharte@magicandroidapps.com>
Cc: frank zago <frank@zago.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
	Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 4:58=E2=80=AFPM Matwey V. Kornilov
<matwey.kornilov@gmail.com> wrote:


> Hi Frank,
>
> Are you going to further proceed with this patch set? As far as I can
> see, there were no updates since 2022.

I suggest you take it over if there is no reply in a week or so.

IIRC Howard Harte also has this very device inside the USR8200 router,
but I don't know if it uses the I2C/GPIO portions in that device.

Yours,
Linus Walleij

