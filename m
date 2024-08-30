Return-Path: <linux-gpio+bounces-9482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E32966C96
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D7731F23E5B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853C71C2313;
	Fri, 30 Aug 2024 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ReisPl18"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7EB1C175A
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057363; cv=none; b=XnS/p/VJdDLVtPvbPGUMR/fvGgxh46sX3noFjh0qWaZvZAlRfSFLX2+l6VOsjXQa11w141/mt7ldbBvyfMgBQFYxX0yGoi3yluzv9jSgncro7Jgr0NpV0TK4TnQxWrzh6gg1gfiuAasn8DdTfuNHb8zNVrCiumzD1nPRTsFcpqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057363; c=relaxed/simple;
	bh=5ubH1gmMll/KtJ75pK43tyQO81N2zdPbTNcskLEduR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZrfeRUjCMeIMM6JO7sY8JrxP2bnBKiAhDnz15lJVw5efMLvcZSiBy+sQ29BI04UdRcFisRUdpmmG4ivcICxZ5mtIl91zA2O8zqNmBcrOQ6ET3aEHJoL/0TYXs/HbAlUm46ytsmhYDy//7xOqjLwsA7er3PlJw6FqGrqtwPW620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ReisPl18; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso3204356e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057360; x=1725662160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ubH1gmMll/KtJ75pK43tyQO81N2zdPbTNcskLEduR4=;
        b=ReisPl181UstCeEMLAXBTPQ8e/wqQHVYyWMvYuJuhAE3GEQiicHYrkIsqKoP2sPKi7
         tTssBm8vlSrBEqcV5u4c88+Y/3wMYXFC6KKhPk16WinzlcdhH2yceHK/kykI4fE/pPa7
         Ir0FPAOiH4m7DlXeyL2sApo582n7Dw/qHryYHBIchfRXz9JWM9GGFSdaUYEwXCXGWL8D
         fesT2rxQK6t8AO7qnmOSkhNYSWvDdUKjjOIyCyfyJsK90es6L+QBb0ZVgAMIDzgG65xB
         5OT3KM08vvJsIMu25NqQceQVQOdTLYdwWqvJt51OcEWqQe4Pp2962dfusv5zUAoEBSf3
         T1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057360; x=1725662160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ubH1gmMll/KtJ75pK43tyQO81N2zdPbTNcskLEduR4=;
        b=Fun0febYIUkLgP9bymIjQoSefL4Y3C5wZAm4Zt43st0gWxBWVxJhM57p0LbBWjq1se
         WhCmwC0Qo0Ye2Ht4C6gEbOBXcwhPCDSSqAJ/UIqHsXXpOEL5iGP2HDj0oo0qYBfkefCo
         IJZWatRku+Oc6hjPQvHs22ak3lIlP7+ubYbvplXawLcnMYpy4fnBdmQA9BIRidCZV7DH
         vVYeKLX9VBPBlnhNTrbwhg61pGlRQfIcY7olKyeS2Hc/OtIY08CCsG+2uxn6I5gWJAzi
         mG9CESjD0SsIwklmRVKG8d1naMTwArS8AB1ERJOokdrQTDlKO6ZMV3Ow9Rh4HTNaFgDC
         kO6g==
X-Forwarded-Encrypted: i=1; AJvYcCU4x4yp3NFnFbHKCCk9L+8fPpHl2XErGu4jKhm/c1xHWtiN+ErgpjI3VRUjWlMvkLoA0y+IvDNolV7n@vger.kernel.org
X-Gm-Message-State: AOJu0YzWgmM9ozkzBXyWRWibBHb6oJKkTj0SSmK1Wg/AXzAzirBQ8f7Z
	34EOKv9c8MBquCzu3SlimDWNqZ3MBdngZO5MQ2uoTjCjvFFG01pTvpsPP59ylBpR+l567TaEvy7
	pl4GLJALV/Yy/3jBxybUZOfFFaFqmbRwvOiCiPw==
X-Google-Smtp-Source: AGHT+IGb6QZ21CncL1PqX8rrayfUs/VNrmLcACeg7p7siwoflNUJ07DBDda6cDKZBzbwwZso1JtiW1c6D4j8N57dcEU=
X-Received: by 2002:a05:6512:2344:b0:533:48c9:754d with SMTP id
 2adb3069b0e04-53546b41e00mr2694114e87.34.1725057359048; Fri, 30 Aug 2024
 15:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com> <20240828142554.2424189-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240828142554.2424189-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:35:48 +0200
Message-ID: <CACRpkdYjb9pJ=Ehw1roV+3cM+jvPx86XpAuPUVeE7T8h6Hq4oQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: legacy: Kill GPIOF_DIR_* definitions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 4:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Besides the fact that (old) drivers use wrong definitions, e.g.,
> GPIOF_DIR_IN instead of GPIOF_IN, shrink the legacy definitions
> by killing those GPIOF_DIR_* completely.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

