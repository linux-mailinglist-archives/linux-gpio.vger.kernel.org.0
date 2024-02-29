Return-Path: <linux-gpio+bounces-3958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF786CA32
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AE011F223AC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83727E579;
	Thu, 29 Feb 2024 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="diK6zDaI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036717E563
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213069; cv=none; b=d0DkWcupZ9pNU+KFJ+gzLvFfIzTf6yywXu+2PFvhrNAIVA+12JTUssPVfcDLjN9Sx4UoSfZyqBAeDf6kzofiqmu02TLCUL0rec0iF+Eg29N9bRxiNT0whAxD9MT/ZrlA1L5UWw8thGJCegQ7ZviTF+oe7jsBxLdkRW+m079LqGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213069; c=relaxed/simple;
	bh=5shKJIq6joWiQf1OMpN/6d1kx+W0ECYnM+AdFjTkEVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGFsfupplZBAJOe638ly8rcGqOVY/Ec4B4TNhFcqvOlC+hofMbYQ/RMkTl0bkFE+HbK6N6kCP776vYd0D3RNdzO28V3ICAso59YZcIaQY+Gwu/ZDnJmMt3MMRIjn2gnz+AG5/gvYD3H7I83noiy0zjNLgSZkYICAWvE+yDF9AyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=diK6zDaI; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so859528276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709213067; x=1709817867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5shKJIq6joWiQf1OMpN/6d1kx+W0ECYnM+AdFjTkEVE=;
        b=diK6zDaIjPNE2V7pvNGH68rA+DFSWmGbIJiwzirYiWR6s6XrojlKdeAh2MvYubHcq2
         ELCRE3qa9p6DAgXPLXPjwIMeo3B+zbmxkU2BXtewrUUwMrVs83B+SRC64o+sR6mtnFe+
         rtsEu3jGXCe+dqGfMG7+ODcF6xeGshzwUIS1wuqZt1sSw6TSQ4AGZAFhy+13waEg2FWl
         IE7zKEz8soWg/9BRJEw7qZNiX8QBPrBfJWv+oqja9pKLKEJ/KlQWJISPMjgc0gsZhMsV
         0HpsPrNgUDE8XR8j5OVBtF63Z3xZIL9MfTci1Cka0PlCq4jUZRH+ZQ5+mN0tCbrf80Bh
         fj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213067; x=1709817867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5shKJIq6joWiQf1OMpN/6d1kx+W0ECYnM+AdFjTkEVE=;
        b=MY69s7ApBCKPuwwCjvNdwRc8Qz/SP4dxknEG0zwZHglSgUpIGvfqCIiSbTl/k1OUlO
         gfGm4Vt1X5+33V1vTonSi0tygBmnGBrwVNYXKyvUKaYyGofAOUmDzkDSDRexdH1CGe+C
         PSIgtCacjNThwg9oX4iaWj7JWBPzNzeR2zPU/z9T8Tsb22o6EzeNqs6mZQSOCfNXJcUq
         QjhmsnC1K7bzsaQnAh6NdzbJQdhIb1v6KetRr6St5kkNx3pGoWmcqTA4SDfMBUCPPe53
         lHWURae8jKQ8EVbyWjQ24nOvFgnX2oZH02niQDF6smtVVY8L9yi2oCive0Gk2wJnaMnW
         4IPA==
X-Forwarded-Encrypted: i=1; AJvYcCVHDR0vuK3Tz//Kfc5oKJ6X371NUejU0Py6sALXhiwd1nhR+jzResiEfbWzbncF3r0DduqoWe2AY6x3W3pXPVf0sWqVPDhtu3QEhQ==
X-Gm-Message-State: AOJu0YyDpiwqH+zv6aeTNtYN+iB/3qgxjG38B3a2oxy74AAwGQBY4Ljn
	JY64KiAG2ADKY4x7DRjkR5rqPbhw8EVMaz9ubkKDGBZa/2Llj7wCSe9GyVx3ZzTK79pVOvcv/Ql
	JqTGR9ErLKljKZzPEh6Uj4CR1NMplPg8WralbmA==
X-Google-Smtp-Source: AGHT+IHtxtxLc1PV2T7biqX/e3kKfkY0L5vzXx+f1q90xelaRpKnFCLjxEZPqxD5C352GVD5oDSCgXpz2Z6iKLkdUDI=
X-Received: by 2002:a25:ad85:0:b0:dcd:30f9:eb6d with SMTP id
 z5-20020a25ad85000000b00dcd30f9eb6dmr2299746ybi.57.1709213066996; Thu, 29 Feb
 2024 05:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223093701.66034-1-bhargav.r@ltts.com> <20240223093701.66034-14-bhargav.r@ltts.com>
In-Reply-To: <20240223093701.66034-14-bhargav.r@ltts.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:24:16 +0100
Message-ID: <CACRpkdZzTheR=+=in7RYTFM2dquEPmGDudB7n1zoiUU4B1UCVg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC
 pinctrl and GPIO
To: Bhargav Raviprakash <bhargav.r@ltts.com>
Cc: linux-kernel@vger.kernel.org, m.nirmaladevi@ltts.com, lee@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	jpanis@baylibre.com, devicetree@vger.kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 10:37=E2=80=AFAM Bhargav Raviprakash <bhargav.r@ltt=
s.com> wrote:

> From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
>
> Add support for TPS65224 pinctrl and GPIOs to TPS6594 driver as they
> have significant functional overlap.
> TPS65224 PMIC has 6 GPIOS which can be configured as GPIO or other
> dedicated device functions.
>
> Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Is this something I can just merge to the pin control tree, or does it
need to be applied in lockstep with the other patches?

Yours,
Linus Walleij

