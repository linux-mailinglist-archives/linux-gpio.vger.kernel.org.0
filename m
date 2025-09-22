Return-Path: <linux-gpio+bounces-26505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFECB92613
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 19:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 696C616E369
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE061DA23;
	Mon, 22 Sep 2025 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ch9A2iCK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165A3128CC
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758561459; cv=none; b=QS/ndN1UJvZ5ndR+eRO9KdnvsGx4q62ET5kywBwzPlRQVZWpRKmskQCZ0/A1vQqF/MvNk2iMC4AOWA6EYHQa+2Iqkam3FkWtvwiBZG+Gqu1qpP2Q91Uuck7jlBg//iE40VDbS/sO+K0orCQJqwqv5CfOQevOBuGbaC87i1BnTEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758561459; c=relaxed/simple;
	bh=yDCyVsMnBe1oen5dvPi/6dU/2jOJ8KUMFS4IHKbrUo0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrqhi/5dEWZ3zqw6TEQzxn7mYrZ2phhSDa28+Ql05BzIxXX5KlNw71VfKX59Ng8XWR1BZlIFJq/JT20LUp1YlKArgGVZVxnVCqCg76QFaKZ/D6+4+x8hXhecDZfld82gSFIoVFqmjlAG+aAJkY532F21BvJLDLGIWqrridulLrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ch9A2iCK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso1109416e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758561456; x=1759166256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UdkfUJcWiIhWIQMyk8FB1DAT7E/1t3lcPeSZOWW85BE=;
        b=Ch9A2iCKWlu/r9bbz/b7q4KA3Yuv3HZ012eCJeLS649Q1gaEYghVQbNL+nANsBzIkx
         OqgyXo3Y9mvzx/JqdcRZMdAQxuE7OXV2ZjUWx+/7TjFBqG4I4kDhV5Ka/w7d8wp5xi85
         AJ7Qcl9ZxPr0V3Au3dDHeixq8hIUr6vlS0XxqCYo7Xkkp3ek2f/4hHb405Jnif1cTSD9
         FJXNYOEUCRvGnHieT7jSo2J85KUhIoXGgkE9Ik6g1BywawF3jhD+HPX7zSyoe9l/23Ui
         NSO1Q068Ix26D4xOZBXDj3n7vkh7LZuBhxIf35SvoGuq+F4Ur3bpsQ156dSARULnm72j
         6Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758561456; x=1759166256;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UdkfUJcWiIhWIQMyk8FB1DAT7E/1t3lcPeSZOWW85BE=;
        b=rcG7qEs6l/WDtI9SXyWuyjagO5uRi88qLSqvddEFqYogx1d6BKN0nSnktBLZNJ+U+O
         E02L9HwgjPS3jd/VYsoHm2G9H3F06cxCxrSWX4ZU+OeeT0IPLGDIhA/F/HnNmgyGEe2F
         Pju8NK6swjX6zt1DqL0/1pibLNh7D2nkixHQyHTP2f4SYQFLFq10ptRFsNYiKgK6HMWz
         7Z0eeOym2+dr3zXjIRDsUSIH1FOouCODeJKNOlgx8iCWDuM+vlFyA2eHBZ+DVAqBdOWX
         Py5ZTeUU1PTbBbiaHFncLQwtlL7hbVHMaAjewyPV/c1Fnh68fNHrCJum1r1JJr12yfyu
         jU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSyg29tj69UcMYE+nn+5iuPiCP7Oeg4RfbuoPYqiRTKlqVwdT1hFRLQXd89iBAdvW3ncxhDYsoyDV7@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpZdyld4BCZ8ZJMVqsRb2ePIKpufo4CGpURqa5W6mErDG2jkU
	x0+xDr+QYZGsh7b9Zuu1HwNi3m+uEU5/C//tJqcRYGLB2ol6dTlcjjKPOJQECO0Gj67u4tySubV
	lkaw+LpTITDTfRmRP3hi/Am43XHRnQwiXUQeu8doAbg==
X-Gm-Gg: ASbGnctF0nC2Ypoz5Rp0TSxqVuaX7pCmy9W2lEZTK3p8s134Fynp9MwU9Q13rVtrlgf
	yx+th2l3toltJAUg5dDdhK1vEwDCkRXlm0g2I8P64BP8Fy66VDs0WGY3P8pcaUNqjJaI5igmxed
	Up/9i5smIKzD6z5X+XoecjunEtlj0vmolk0VbyhXtZ3cdiSCGNPNgmxK+IKYdlGbijjELbRv9xc
	ghoTKyjfidjYwlRWEoUnfvrfhWK/1JiBmh6JEnhz523b9k7
X-Google-Smtp-Source: AGHT+IHa5VS93YBVnCqLOZY3pYwvG4eCX52nyQdKku+32y1T0vkVAt7IQymvU+hEJRGGd/QSDHyzANnwRnT18WFvHlU=
X-Received: by 2002:a05:6512:61af:b0:57d:6fca:f1f6 with SMTP id
 2adb3069b0e04-57d6fcaf45cmr2017701e87.46.1758561455821; Mon, 22 Sep 2025
 10:17:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 10:17:34 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 10:17:34 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922152640.154092-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922152640.154092-1-herve.codina@bootlin.com> <20250922152640.154092-6-herve.codina@bootlin.com>
Date: Mon, 22 Sep 2025 10:17:34 -0700
X-Gm-Features: AS18NWDyCQX1J8uZYK9LHdZ-e3eFX6O7LUqq1XRGpyCJLmgX9_jhMo9add6DPkE
Message-ID: <CAMRc=McFZ9rDgBEkUBuUX1c2a9PUwX3+ZzOs-KE4jhbU+p6+ww@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sep 2025 17:26:36 +0200, "Herve Codina (Schneider
Electric)" <herve.codina@bootlin.com> said:
> Add GPIO controllers (Synosys DesignWare IPs) available in the
> r9a06g032 (RZ/N1D) SoC.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi | 121 +++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

