Return-Path: <linux-gpio+bounces-25167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F19B3AC75
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 23:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3664B17BA84
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 21:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCF021B9D9;
	Thu, 28 Aug 2025 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cyq+MfqN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB91A8F84
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 21:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756415200; cv=none; b=EZh3eBPbjV3P8BTitFMSthHwlPOxXIuv8rjP3t5APjH0qxHbnNmwGBEUzXls9bx3SWCU4N7v4oGOMqEJfJVPv+QEvgkZqgkPClEFkzKXkrT5KyNDXPX/44GUJ9W3JtJ6wcBkJhVRgmwYzedBN/k4Lu5jb0JnNEuzs4JXfCclXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756415200; c=relaxed/simple;
	bh=7m+Z48htqbSeqaszf53BBB8XMcsMLgtn18U/+YXKB3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/65mk5X2v7a3bswpDMk045A8u3Mp6+dT8G7estnSiZxQ0ooO6w45jzYD1i+O0iJJ8PgpwANEouSNi/Z1ejSnzi8dJkSj7biPm51xFJHYhlZ01Tivr2rbSWnjUNVH5YYdbZFpJJngIsJxy0GajIOY1YqRYOTqWawlhIg8ZNBsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cyq+MfqN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f3e4dfcf6so1494819e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 14:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756415197; x=1757019997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m+Z48htqbSeqaszf53BBB8XMcsMLgtn18U/+YXKB3U=;
        b=Cyq+MfqNRcRe/faS0/tIKOI0CgfcsXCbvqF8eAwjwZoRvKVVI4BKC8rvv3VjnYLEng
         VHGKk5iMfptjtvPPSPto+ZYqD5IXds0PtYzBk/5iGedPuwjQfbWVhGh5AuwezYY//7j9
         +Xfbo287y3XVAerUMMSAf069lWVM97jfxC25liWEvioCYb3c5FQBuEePbzzELI1IDM2n
         TqCOgPywqHrgtTdmcAv4HfB/Q7QCdapGG0ZbJWKSM+0BHGYQ9L3vVe1YKyXkRcWg6X7/
         SPI7BYkIlF8nan8kHEZhgOyzCuYrfMePE4yo4Xeu6Eh/U2CahORkVJ7aTSNmnQG2ZaFK
         N4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756415197; x=1757019997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m+Z48htqbSeqaszf53BBB8XMcsMLgtn18U/+YXKB3U=;
        b=b+tN53cPNijQKUXXopIaJUAhjSaMY68fSndf2NzulkK50ajVGlgbum1fEmcCbxpZvo
         zIOZv0cx16CVta2JWxeWp7tpbwLy1N+ef/aeq70oBe4RaC2E3orEzOqA6EUPpA690KZQ
         MGeXiyuEV6zBSP5lde9ZGDtjT9Ahps8GcNeRGoIyt8U+TtPiWuMy6X+3llhgfv2nG8xI
         9Li3b+G1GmNpp7r2lQ2SZXcT9UxR3th/fHfp3bUAkk8Dd4ICZmrr5RS1JQ0p81ZI4emH
         ahw1I8Pc9znTj/Y9dcZCFsja5jQwm/ShCmft502Xj504XglORqKHXQespTjBITfP0k89
         PoGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTJOTUOzWC1lkdP685m70EOEqzZ11VXIokVpgc7k6qQUIXCDsc1VqXcaYnNC3SFLIC0o7ONk1Gm90v@vger.kernel.org
X-Gm-Message-State: AOJu0YxArPDwscviKXGgo+ShRkoOB0P9m97ch9CR3OjLTLG/CZw7GhNu
	lWnQi1nsmdls/r1lggkzcLzQXmREUftmkZa+rdrJH9otgwEA0RGlK7z0YzwerrjWn7pkqieuPPa
	wxY+YhDYmXfmh8oI1BFXhuInx0wWfmvs3vZ8rOGciCg==
X-Gm-Gg: ASbGncuJ7T2fchVu+kUg2OwDdxZbMT/aMAg/f1/sd7u7nYsuLVr8h3Z+FdTEeksPzSB
	rIGTTjXk1oyQ1WvIYmOV8J9G7KRjAp6FhIMqFIoUGe+1DjHxmPD8fnOs2J+76rvEShN4m3ouodE
	Zos8YMvJXM7+mz5+kraOTIN3xZHN5VOh2mJQ1QynMLKjVzmzhsxRgUTrV51RPWXYDqXia9yUwwP
	JRMq4AKz5AtgMEZdA==
X-Google-Smtp-Source: AGHT+IE8AFltVgez4j91MqcXLZUWY1SjsHiyvDbOchLsj0qPF+cSQKWQwUdlDcjOa51JtKhpYUq7h1LMip4AqNUm6Pk=
X-Received: by 2002:a05:6512:1356:b0:55f:3b94:2119 with SMTP id
 2adb3069b0e04-55f5f08b2aemr1135534e87.45.1756415197186; Thu, 28 Aug 2025
 14:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821233335.1707559-1-da@libre.computer>
In-Reply-To: <20250821233335.1707559-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 23:06:25 +0200
X-Gm-Features: Ac12FXxq8e0j1LLbbJOtWrnp5TZSIUBHLi0lcAdK8TiCnwMxmLVQkeLVBf3QIC8
Message-ID: <CACRpkdYMdF43s_hcAvzHJ+wmRGyLoHtiTaG03ULoL24WwdQCMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-gxl: add missing i2c_d pinmux
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 1:33=E2=80=AFAM Da Xue <da@libre.computer> wrote:

> Amlogic GXL has 4 I2C attached to gpio-periphs. I2C_D is on GPIOX_10/11.
>
> Add the relevant func 3 pinmux per the datasheet for S805X/S905X/S905D.
>
> Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
> Signed-off-by: Da Xue <da@libre.computer>

Patch applied.

Yours,
Linus Walleij

