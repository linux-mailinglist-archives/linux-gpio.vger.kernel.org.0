Return-Path: <linux-gpio+bounces-16722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B573A489C8
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 21:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 787E1188F5DF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 20:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66481BEF7D;
	Thu, 27 Feb 2025 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sXa9rgGI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8E26A1A4
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740687842; cv=none; b=N2zRhKbA19tJ2VcU+L5Kmn1jEC1Qihc8DE8J4T9MAl6VqDfN3KGvhBLpsOUJYyk69rILGO/1mb/k8umI68nsLrlzNAuT8B8kI1UrT5ZY7YZl5uiRuQHMR7oDT4kvOl0PyA/9lD9yg/v5YLTy7FRaphGGczeiLKJPuxgriLav1fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740687842; c=relaxed/simple;
	bh=xzuDAtDLsMklMIj9X/3E5DszvjVGsPUE/6ktORRqvH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCtZVZ860Uxcih1WQxOSd/FjkTauTvydFkYMN0bgkla2QYooY9jQs4UcmhI+bjwNAOGo54DCbafmBNsMVG0IamDKlADbC4CwWXPu3azw67UQqJ6HpibB9TBx0nLBNkLKryLTP7MP0GH0tf3yQDbvl1hBw9+LJ1CddatNTBbBAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sXa9rgGI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30b8cbbac91so4629651fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 12:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740687839; x=1741292639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyq7rCZAildVjmFezfKBEpeheeeS0M9w2vanP83edP4=;
        b=sXa9rgGIe72AnWm0kXhbz3sA5TE/JUAwI6iiCqmenS/s2pEofei0vZHc6nvjWCSyNQ
         XDpD77aRHuidyuC+OXRs7wtDaQs1v9jELmLnKwSR8HxERM5eNJVkLvoLBGNiuKMijhFl
         p11C2I9WVuxd6mJ1HpR+ABEBKdm/1c2w0WURWljxCJjwZrFekIXGu6NOIUXqXqw4aB+s
         7BoP3r5y2F4KRaiohrYJfptuXZ6nlxs3cGTb/NDyB508SzRTJWMERZWL3EkesLpyAFZH
         VGbcQuQc0/VqMCicmazGTA74QJCYlxVO78OowOVCzL8AjU5ZePoJ0ejjBLZYuLG5soxZ
         NArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740687839; x=1741292639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyq7rCZAildVjmFezfKBEpeheeeS0M9w2vanP83edP4=;
        b=h6NhiGmffREJTOrQq21mU91haC3iYby1aQaZbtr7wv81NQSNhqAwIVeKDXOBBm5yF8
         LL+ALI+tfD6zo+C45tooWuO8RcMr5CUB2n7f6imEepbpT0mr3Mydzkun4eysb0zh4nSW
         gaecvSvX0ZaKKpMLhgQGfs89/vq6/MMpMOkPMLCQTF7yZuNTjvBn80eQhHVc+HPXE0Nm
         qihAyn9Am3NnjO+vjxMIPCZbDZfuqXLnEb+f6MDLChE6ITg1QAfPQ1ODwsuAHSz8+mx4
         I99Gkpf27d48KDYMOwQ2jjGO6/j6eyY2UcenlRx0tkexC4xfKa5L79hzryZIYwT5o0HY
         Tztg==
X-Forwarded-Encrypted: i=1; AJvYcCW+QQRNFisCMx7i0NuoiqDo1BmD5rc3LZc06e5vo1iUegtro+Xf2tBj9mNBNBQr19iRMQEa1wzeNTNx@vger.kernel.org
X-Gm-Message-State: AOJu0YwQXEb0hvDuVGSD2q6tS6ShQhT0ozPQB/83q/gA3k9SWZALGSfs
	/U6hdHcDf9uffQeiZOvokznPF12jYXIeBVRIvjpMEKhIOISZUHqTZmuT6PlkIJxWl4KCPde0IU9
	IItmEp4EwXrcARDUfT+etGuxEXPwsMLSvWd5G2g==
X-Gm-Gg: ASbGncsywiAt5t85m9K4O26NkLir94Gl0rdDkKqBkxp3LDseyMrPGjegcP7zPwZm2u5
	tMrT9OQJw87WfZO2O0MdokH2SOIQx2Hh69GUDRcyX34s7jeR7PS5OhCr3rf4CJCgappJN5WhrlI
	NZkPx1ozI=
X-Google-Smtp-Source: AGHT+IF8jr1RPuup3BcxHI4jeLlB8xSlyodMY3QSAvlSz4clUiZCsM6vxrH9ix6FZsUN5FoNEP8fAezlutGEF+kORI0=
X-Received: by 2002:a2e:b8d1:0:b0:309:1f1a:276b with SMTP id
 38308e7fff4ca-30b90a0d479mr2534371fa.10.1740687838584; Thu, 27 Feb 2025
 12:23:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220085001.860-1-vulab@iscas.ac.cn>
In-Reply-To: <20250220085001.860-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 21:23:47 +0100
X-Gm-Features: AQ5f1JrSbsBZYhsgrUajyxaLegYWak-pVEINzJX3bUZh51BhE0XwC_gtDg2DUjQ
Message-ID: <CACRpkdZShkMhO9vTvdbyEzkGLL2+mfnLmADGukNZ-Xw=NNxksQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Add error handling for find_nmk_gpio_from_pin
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wentao,

thanks for your patch!

On Thu, Feb 20, 2025 at 9:51=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> When find_nmk_gpio_from_pin fails to find a valid GPIO chip
> for the given pin, the bit variable remains uninitialized. This
> uninitialized value is then passed to __nmk_gpio_set_mode,
> leading to undefined behavior and undesired address access.
>
> To fix this, add error handling to check the return value of
> find_nmk_gpio_from_pin. Log an error message indicating an
> invalid pin offset and return -EINVAL immediately  If the function
> fails.
>
> Fixes: 75d270fda64d ("gpio: nomadik: request dynamic ID allocation")
> Cc: stable@vger.kernel.org # 6.9+

Unnecessary to tag for stable. It is not causing regressions.
Skip this and apply for nonurgent fixes.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

