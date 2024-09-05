Return-Path: <linux-gpio+bounces-9829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B52196D747
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C162814F7
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 11:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B342B199934;
	Thu,  5 Sep 2024 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUEJFb2K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979619342A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725536151; cv=none; b=itEzz4DzWTylfMfTsFWnxeACI4digAtt902j7l2iASnjgK3RgOR2aL5y7P3Wsajq74Ft+u+Oj5FgQYr/kFq6i1BNI09W25gUjl8NPlEI8gUV6pTEkqZQvfbDQ4yDcPzoj91gvFUGoamIvwnCV3jAtxeekyQXs5dh/9y1l9HTxwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725536151; c=relaxed/simple;
	bh=7yk3x+ZbeN2BNhaMaKl08JcgwzeeYygIIBA3a3DlQOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVrZty8zqxrs5I5AGZseaI7gO8/qqop7LGEEO0IPPVj8FeKv/GK3+OC0P3XsoOzcxIsk9OtZV8wtSKM4zHdY8BM1+DXPZeaFADwBoid7vuYMYw1pfpgGBhoKEScOSq6592PBVxmFUd6a6vrs+SBrnC+y5lDJ9TWLNg7v6BBl6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eUEJFb2K; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so720639e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725536148; x=1726140948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yk3x+ZbeN2BNhaMaKl08JcgwzeeYygIIBA3a3DlQOU=;
        b=eUEJFb2K2udfs4O6UtOes3ymXNfx0MRAZwKhCG48F8MSR/20b8WWvYyoneNYxB+NjN
         YHbEz0U2L1DcD+0wga2e3H5PSOzb+XORX+uASm/5kn4TYqcK5qTRN4dvkfwIjt+wi7oi
         bDgNWNq2KNiydtyfjsQA0H7xqLD6WZo0i0Kjugent4Ac3t3a8OrdnAXlnq1a9BiEb4M4
         iuS4m/JlJ27enJymYwXSzmqDsHRqYCz+sN2PxZoRJvTwgIHNXTIfAgvzxw/et/jWKVw0
         mtA4JWhN/oZxuvEGGzU8haq58dUUF95IlEEKpNo8H15/hU4Pws80SBY2fC4gL9nDHa2W
         WgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536148; x=1726140948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yk3x+ZbeN2BNhaMaKl08JcgwzeeYygIIBA3a3DlQOU=;
        b=SgCG3w2gI27CtX82KaVMUpgKUIL+pTvUTz+mLANNYa8UQwX0KUl5el7b26NtnxpTT2
         RCHt7TpGzDKVLIG8vVskdjRUDwUp9wljuSO4IEjvR8UXcZsezaidk+6H7YElaVxo+taN
         f70MahT9vxVVoPtBHEV3o6CEtyP3APH5FPmQ78qjFBI3UTW1Wp7tMJfoeUGiV2tG6Yfm
         1tvbXqLkGzhEpFmO8XXyHKe4UZfOap5eb3/yLYI8VUKnEtx0MZlpFwFpVh/QFQ6tUwwJ
         0RVyJMDy+klJ6D5MYAOpcdogGCwDQ6JnlkFGxySSRospC/liEnWEdBz/eNeLvDNCfdYt
         LY0w==
X-Gm-Message-State: AOJu0YwrRsapvu00lk/Cn17pKweaYkX3sL46QswjQsfJ6CB1kRm2v49T
	PbTooQ2KNRhVyPnnqpoYF4ojtda6CsIKlGQRIblcOogFwRa1UnNTn/oOF3FYtKHeOpxK3/+VLcf
	cZL/8MLu0e66/PhKwmtPZkaowuHFMINyqK4Urmg==
X-Google-Smtp-Source: AGHT+IEjAFWpawyNYHX6o04UXdt1Y15kepVJVBWzcsdgvk6TbjbGz0vYtLmv8rsg/6hXc0HmbI0fHBkTDS09WeNY7AM=
X-Received: by 2002:a05:6512:224a:b0:52b:de5b:1b30 with SMTP id
 2adb3069b0e04-53546ba09afmr15547801e87.44.1725536147976; Thu, 05 Sep 2024
 04:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com> <20240902133148.2569486-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240902133148.2569486-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:35:37 +0200
Message-ID: <CACRpkdbVfJf_bte_0BoGK3eu80LjO1kLGP3QzgLO0_B1guuD0A@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpio: stmpe: Make use of device properties
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 3:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

