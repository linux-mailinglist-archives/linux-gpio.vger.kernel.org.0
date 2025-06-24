Return-Path: <linux-gpio+bounces-22093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D18AE6FBE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E62C57B2DDF
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570622E7659;
	Tue, 24 Jun 2025 19:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVACXzPI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574F3253359
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793684; cv=none; b=t2ETR6CVy5u6LQl2hupPIFA9UWY0aRIU1hfb43PFbSUBDg9BGn2H6F07epodzwwmd3YoASwX3WBIV9vwhPQ+j+GuzKach5Y+dv8T+O7+8rt7zl4j7gPtjIy2pxC/KbF8h+b9jqzu75m1uxacqXUzXXXBE/lp+3ZVAVmfmshWhCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793684; c=relaxed/simple;
	bh=Lz46qTX/CMxria6n5v2ZBDFTKKy8QkwQzt5/KGpgICg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EG6P1WPfoNvm4W5qCRn6bCJ4EGEhGeQeakhBboRnPP76XONNa80GicjwcHY71am/Ilc4NzJdezHKUXQ6kv01oUFwp4ZgfQtBOAHzJNc9zyOPM6F0US6ghqbfQfVnlM2I7QU6HG5P0qpEm1mIbmOFMWSWKf/SsGZQOd93gn066VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVACXzPI; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso2162051fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793680; x=1751398480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz46qTX/CMxria6n5v2ZBDFTKKy8QkwQzt5/KGpgICg=;
        b=TVACXzPI4vQ2TLJsAuq3V9XsWJ/0AgHbOE7MJ+qHQubTgmYqJ7hahY9Wn2hEFBG6Z/
         5CgbUKRvxPvh1ajolJd11bZvtowQBYDkuRlGTqli9Gvj2tgB4dGHpa4DTClnh/jUwVdm
         YRcEjjGlPzXn6PL1SHk0MrOjVNkDE7hGoqZENhrLrFj/7NRZIsd4qUI9+mUuqqFrRneq
         yIH7vyCy/8Pg3XcwQ1X2IZFTNvrHZpNz6lXbBJxBv2fLKzVRqiG9lNTIjdNrmdQlxzOs
         PBkJ7v/EaFe3RbroN0D/DxHsnBjLuquesosmCCjE9l7gm5Tloti+UYdMaKDuSJLR/krP
         57Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793680; x=1751398480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz46qTX/CMxria6n5v2ZBDFTKKy8QkwQzt5/KGpgICg=;
        b=mnJkQ5KV/9g9q/5LCQngCG48iTyxy8K1cK4x50kYadoJqdqsrRDSUybmbK7OegGBgW
         0rQxrRd3pLEuutK8X3iDwWfviZHd3c4iSpkEDyhYN+8UdAYSuh15AvtpMbBa0OpMNw0A
         IoKiYCWo6523UsNVbWQU0fMgG+17V0NBBxF/UjXG6M27O03/eOIH8K5rN8dQmRE+uTPJ
         5zIldSBsHIY7ENmqo6zEX45WzPION5jhiap8PU3oVsNvwWTIbi8HK9jzxGyRYFNvcNG+
         lkLxdf5k4JWv/w97NW6dRDALT6IHBdpauLPY3HG0bqOrAByIoOYw1cv2rwrp1PwlRSXx
         m5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7/5iy9GFYZTloO88Ufo44HXAH++vBwRuMtaTfC/o+aJmBcHk9fNOE8tpcmHdMQoQhJI2pM4cPPQhF@vger.kernel.org
X-Gm-Message-State: AOJu0YxMlP00i2ALrpKSC9QS5jtVVFwGg4yXJs7e/mLrPU50UP/Hl07l
	ov19ZjaAMK0bPtzFSkp8niDC2bv7YCwL71ZI7Y6UDEIRzrkflQ3bLAHp6/TTK/2ntvAH4saHqn6
	yrdwrQUqbfv5mkAXSi/Ldh8tRTuUCM7Y1vB/mdPhgtA==
X-Gm-Gg: ASbGncv7FFHtMfkaIbxklJrpClW+XU1afWqelkHpn5c4N7c/iXb+r4lmiwRELGy8khN
	7bX7Ro23gF1+7u4yn50OLie3fimsTbtjy5XPAUqzJQCIjKBbB82eajpr7MvLrKDm3Qn4PdPWmUa
	U80W0OlRkbQJXenRoOGqfFbWolQ0n93eMI3P9yZGp62Zk=
X-Google-Smtp-Source: AGHT+IHVbzotA1uZ2hNwpUIwoe3RWPlgcD8haXKd+NQSeQxMA5bi55+yxw7JTIg82biNKU6SrxAw69xhLcO0tTP+OA0=
X-Received: by 2002:a2e:a58a:0:b0:32a:6cab:fd75 with SMTP id
 38308e7fff4ca-32cc6004477mr330481fa.11.1750793680368; Tue, 24 Jun 2025
 12:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-6-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-6-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:34:27 +0200
X-Gm-Features: AX0GCFuaTSNwHq8uOXhRGW_DUmsnsB2rkVRNJbeJDAHqfl22Z6mXPr004Wu0yp0
Message-ID: <CACRpkdbeeMsqNJ-cTz94zZHkTXg1suaCYoD3e78qekhqwg9R3A@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] gpio: sysfs: don't look up exported lines as class devices
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In preparation for adding a parallel, per-chip attribute group for
> exported GPIO lines, stop using class device APIs to refer to it in the
> code. When unregistering the chip, don't call class_find_device() but
> instead store exported lines in a linked list inside the GPIO chip data
> object and look it up there.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

