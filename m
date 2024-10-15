Return-Path: <linux-gpio+bounces-11387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2E699FAD5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 00:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A8F1F228B3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 22:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF971B0F1C;
	Tue, 15 Oct 2024 22:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUjeeelq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3621E3AD
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 22:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729029851; cv=none; b=TqEghK6EkM8Rc25WKena14rNPL7JVOt0PlW4FeDBM1KbVtBPcjo8YLvRl7LqJjQeEf/IkLH7+uelecym5VVDqK83K4NuGgUZk4p/s7qFu4KA6RagH76kHSLe/oP77dyCd0J/A+HlN/4PB3O/Y+o5QSfNz8LHR5MO5UuLcIK6u/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729029851; c=relaxed/simple;
	bh=VPcANrrYfcRQ8GqSxRwzDX3uAO9aDGVZV7uw3FWCPGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxTfZbPV36FdKgMsGeUmJLfvHPzkkAdHeaICj4savgVsWbgg+0DZ2J7rGUN2OkAuFjZ/iUCBMyxqrWU4B2zLbphfSDMQOJf1BlOyrI0ACbjzf8uSQa1Io4Kg4tvIpREQLwgxj2gnKB0DbLcdGBiXrohdWqm3ZEIvsM5oBbO8m9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUjeeelq; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so37047511fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 15:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729029848; x=1729634648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPcANrrYfcRQ8GqSxRwzDX3uAO9aDGVZV7uw3FWCPGg=;
        b=KUjeeelqCbWEtffPRIimJkZ7a0DHPMmEbLRIeLoug5oAG6YPH0Lyhev9aEGV0wehqQ
         jcXBQcXd+BqTZGO3TmVOzjXZH+d/NdnStQe8i02jfoZyg9fJrszNay2B5Sj7aWeqODsz
         i5j5HUEGJSdocWBcPtElVFyLj2s+tuKr/A7tTzZ+Ghw5+UGR9opG7qplGIh8Y2ND4bUR
         +otmsNsJFlQ2M6W0uv/kGfXnPc/GqEmg25A1KDmUmb9O8ugHJPZ8RDzbFcx2dfy7l6lz
         eK7GHFa4OZ0qm5bwGh0jPEmQrMa6TzPi3C9m68Z/hXr3uZqtQzdmlnPMyU6UHahe38VT
         C23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029848; x=1729634648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPcANrrYfcRQ8GqSxRwzDX3uAO9aDGVZV7uw3FWCPGg=;
        b=C2oiX8uuO0fFVn71H9RBvLLPZpWS442DbF4niciKi8x2Ve5BLX8xy4jpd6cb1fm/SL
         DEUAuS4fFrSFdP6LTGQUPJMDVFGFRinQe1I7Dq8KK1P4SFx6fDMosOZzoTnRt5Vo8fM5
         vIGcVqHgmVtqz/dtpcyUNTc7NMING2JiOHONRiswrWFUBJ87TtQC1JiwiGdOmHhqR2sc
         b4dNwaSpd71m2HtOBvUUPqw3oW30E0iOyIYMstsNiH4u8oEQO5K2mcjAJDBMjicqt8f+
         k50jQe8hDe4naRwNuroe0emPQmkZKjtlQE7E+aNqampFGkKIngOlY8vHMRNfFue/TInr
         Fn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyt11nG9D6S2+XIbBsGfWqlbUdEqcFT+Xkt3aajY0tDHz4u07y+jLBGJgX+CcJVOlQl9IAinNYfgMs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6v0Wp5PUk3tF9IUco/WWanhVelt2rgFQHyglC/+ur4TR+E2sH
	GDzUrdWFbJDW11kj4JomLRJ1OQ+Xv2mzASMZnYQpkMo8K0CKeU7pWfpamusAf6d0tJPs7P+R0Kt
	2GHQmNr8Oe9ySLHPlTO1WxOgr86fm3pQSVUfMVw==
X-Google-Smtp-Source: AGHT+IF6RhD+I4ZGyhwoenBD2UdfngqDgAsWpG1nqLHbt7UAXvN6GS+/y+GcELirvTfs2pHtrr4F6mKi9bx+XXxtEr8=
X-Received: by 2002:a2e:752:0:b0:2fb:dc2:21e7 with SMTP id 38308e7fff4ca-2fb32b05989mr56027841fa.45.1729029847788;
 Tue, 15 Oct 2024 15:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
In-Reply-To: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 00:03:56 +0200
Message-ID: <CACRpkdbpbU9ZwQ-NnVw9+uXmyT4HDcjdakCfKdZpKi0ziLQhFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add Exynos990 pinctrl and chipid drivers
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

thanks for your patches!

On Tue, Oct 15, 2024 at 11:05=E2=80=AFPM Igor Belwon
<igor.belwon@mentallysanemainliners.org> wrote:

I love your mail address :D

> This series adds support for the drivers for the Exynos 990 SoC. It
> consists of the pinctrl driver and the chipid driver. The product ID
> of this chip for chipid is 0xe9830000. The pinctrl bank types are the
> same as in the Exynos 850 chip.

It looks OK to me, I expect Krzysztof to handle the pinctrl
series and send it to me by pull request as he keeps track
of all the Exynos pinctrl.

Yours,
Linus Walleij

