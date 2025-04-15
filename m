Return-Path: <linux-gpio+bounces-18893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA5A8AA34
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 23:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 908827A4425
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 21:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3BA257ACA;
	Tue, 15 Apr 2025 21:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWT8dXj5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB22253357
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 21:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753234; cv=none; b=GeCrhmBM08TkS/jrlx0CuSrprCp5ZL9Os3DJofvRxcT7RGv6drAAQ1cmqCvLGWW7mv4Iu+SLj5+UGcnGX+PT7BHpjRnIfTlivCACTFDJLS5lm11O3UTCxhJaNsxRI/HIEwcjEZsBBr3GGaTtnrWeZIRaEHb3OEX3KLq7IoFreK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753234; c=relaxed/simple;
	bh=54FlDJnOJb1JJqdwaNPZ3tcJ31o656EoQ4mYBYZWrWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cez0tp8OZVJDBoGryaz3/FbGrqIYNmZVvD+JhsXSzQpptbLPTpTmfSPYdjdGOWtuH7irbEFtCcIDlNz2nW0FZfVEP5uAdswtoBEAXhdnjbWXR5pS/RIxQtFUSElpl72JHinondICBJYjO1gQMwNCIwTt8+bCd3mP070kFtYg9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWT8dXj5; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30db1bc464dso57793241fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 14:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753231; x=1745358031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54FlDJnOJb1JJqdwaNPZ3tcJ31o656EoQ4mYBYZWrWU=;
        b=QWT8dXj5b57DvkBXH6MZYJGXW4PuGgdqQhtW7bzeRXkB/OFOuX1nNaGmh1Thxbo19c
         2M0z4/fx0pwgsYU33yDmEDnyJbEv7zS3eNDnQ2LYIiPpSpaztVW8yhn+e3qIGF/n6igL
         jiwfEnfVpyIqbg09lMu5VGdHyoBqPkv8SEUx7B1wK8Zv7KNCc0GlUuMzAviCPL7kczg3
         uJXCeXVDLr0UwmKoVqzXimrsO04AUTP5USZvUjWeGeDe16NxHLVpbWGuszswXgSYjTFg
         Up7Ydy2asRO14fVvcIJ9UkVziCbd3uaTMNiaxAsFsosIZ1vQTSm32SMHduGaNvPWnST0
         7UZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753231; x=1745358031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54FlDJnOJb1JJqdwaNPZ3tcJ31o656EoQ4mYBYZWrWU=;
        b=qUrh29/9klDPVIMKvT5hc4uZ0tpyUxbWyDVP0Q+D2mOR2l6ABOc92Ji4pYh40aEtNL
         yeBoNlGGSr6/0G8GgEB7I9Z8+kjRmm25M7xdEf+WO0r3aE4Dei+L64TSnrYVn1IE6MYh
         3TdFLQ0okJC3GNU1pw6MyGd6Swht8zOps8ODmVwx8A3W+htefknW+P3TqAymo/7dj+dK
         Qn/a/S6yC6Eg2RfV0AWcct4UViKZMQ2P/QzpTKIY4BPbysJOWCB/zvdFynwMzZwyhPG/
         kvWij1FC3tTcROyddwUtewBJNOFpPuw1WO/WcWv93S90qzJcwdojP0RAXp+l3oeIxvW3
         bJ5A==
X-Gm-Message-State: AOJu0Yx6Ku6QyD6lIO/GlEju529wdbbildixn55lMP/RykfNYeOietyX
	uxkKLElI5fpjhbtjCPkdQD83qkmfZ0Imd0OBLA8xdo1Vmn0d+0yuL8+6QY50HehD3QDRMf5O/rH
	2P9wjQpmstwkJLh2NkCuZW8SrGgStKrnoqxDV0Q==
X-Gm-Gg: ASbGnctQ71oGKsq4JaCntH8BW9mVNipilOE7HYtru+g6yQfo18MlsWvt8Ca5DS0ZF+e
	5PijqlMQlYagTQdEcc0d62QH2/r2u0LxbHjDaneEtTDoPfklhg5W0wHjImpaO9U3g7di8GUi+4P
	nmyoGNK4tGYlO1FU4UrrZHQZWLSh8iRk5R
X-Google-Smtp-Source: AGHT+IFO2L8W0ybEifIeQVLc8kNA1FEyPDssmRhBeFf/k+lAMRy7k5ifx2eCoSwPZM/jDIE33fWUWID/DeBhanitmvI=
X-Received: by 2002:a05:6512:31c5:b0:540:2da2:f282 with SMTP id
 2adb3069b0e04-54d6053a05amr147368e87.42.1744753230792; Tue, 15 Apr 2025
 14:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:40:19 +0200
X-Gm-Features: ATxdqUEVSGM8r-c3Poh961wOBwNSoBIrlb3kf4YpNrhpsuSGeWGlr-u-Otg_x6A
Message-ID: <CACRpkdbtKqVyAaYFKhnd5B2hBfpc8UxeAGv5dYTmRjdXNxgabQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] gpio: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 2:59=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> There are some drivers that aren't build with allmodconfig that don't
> have any requirements on arch/ headers so make them depend on
> COMPILE_TEST and extend the build coverage.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All good stuff:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

