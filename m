Return-Path: <linux-gpio+bounces-20052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937AAB556D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 14:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0DF83A4B31
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 12:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB7228E5FA;
	Tue, 13 May 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NaxZ9zaG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F21928E570
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141157; cv=none; b=J43tUhM8ZIQ5WNiktt1+vQHbM6X7lW9bSUuqxzl+iDW2gWoMSCy9/6YGLQ2WnAhTd6NqIir60yq9UoRnriw7zhbKDpLz7dz5wqxQMffyBcnWhZ/owTMMPkv9kxMEfqzZZ3piu5UeoQlOu+Q7EeaNl3eITl/6LJ0yW0ykoYLmFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141157; c=relaxed/simple;
	bh=8S3Yph41W8zJG6kDyye8/3nlQvoaGabwx2YL+oI7wA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPpLRKFnbMiX70pLLiMp2631jNNRWHisaPUbwni3SpU4Ovoyn5P3tDHhJut0uu9PRTywIYaGgz0JD6RPEX/wuafN4NwOuPT0PJT/DlZSxD/s+sHq44IPRJ2v3/r/oMwrMOYsGRs3Nm5VzMUsVk5u2PCWY+W4JiOMe8ZSv5nPF84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NaxZ9zaG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b1095625dso6665542e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141152; x=1747745952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S3Yph41W8zJG6kDyye8/3nlQvoaGabwx2YL+oI7wA0=;
        b=NaxZ9zaG63W4bd4VUkxGiFjRk5qHllCf2EsWG3Q8Wlxxh0ovnGDMS17DSPvSegcGHk
         CKTrpclXS/25nQlxrZUmog+3U5GRuZ079Laxxr5mnCOoJza0uc1C4GtJUWUoy8pp6fmH
         +tY9diaQMwSTIrRNgOJbOuOMHhYroALAXFCEKmVFPm4IldVff4gfq9aKS5zmxHRymClk
         8sMpZCtAthCl+MD6g1YulmLYy4acwLOvqqTlgNLVCRUwTkxNSoAd0oDgKvR5SNGWIWbt
         gilcE/aP7IPVRU+nqXfnziFEx1N08mwebXX3pnhfyhhb+JtlyVOwaSzoZyuf9+NQDPXy
         XFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141152; x=1747745952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S3Yph41W8zJG6kDyye8/3nlQvoaGabwx2YL+oI7wA0=;
        b=Y1p7rYMbwQPvLxwphvfjs2xZ8mMOf5R7jtmPqVzCFL8B95lwO92cFjCtBWJha0qVEw
         x52SqPlwI9dtZe6whib9YvWe+tAJeFF1GJxo/xNEgrMm0MI5drqiGZ8QadNLCsYluqdq
         1ixBRESXLPv66+l9ao+N42pSQnFma26/afcsGwvIQOoOzqUU0ivYVk300XxlG2otH2NS
         wKMSS3WWxUMliEzifeEziRSB+4TXL28W8ILYnXEfZIY/jCRTAjEOdTWddYoqpbN8RG4r
         3XJpwPnO2+yRd0UQB6WMrC+liWI2CX69RF4af7CZsCn+x2SQULOY+7cMU/gNbChrMYpW
         yQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2BFbet2mgqpqy7Mdl158y+13hkQn9i6yl0PAvNIvGiWdFkLRCfAeagR0R0xbAhZelSxUEhu6Heze1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1cHuB0s9u6Tt+5GyL8Yi8iMKCd3uBKmo22BCYxxr5tyFBPXv
	APqEn4QmBM5zm3xIoPX3pJHjJMyYDAzHvX88aW0jEzKTzw7d3JjyChdDNDY+ANBKynhhX12kS+P
	idVcyn8WS95VQw3rv5uW1kD4iQCKQ8DvXuPK6LQ==
X-Gm-Gg: ASbGnctjdCKEYwSpOS59IdjqN9Dyok3kQqwJlgFYrzvjlgpsySy3fpnisST8YbS8AEg
	4BfZGjjhxT2rLxQnHFowG2IDR6NoG1k0ih7ZWgmND9a3kJfYhlvg7Qb9Wf/OibR79JAt+W7ALI1
	3HjjEjActaXRqxC4aoaLCkEFQSbPF0B5BN
X-Google-Smtp-Source: AGHT+IH8XHefqNP0R9UQJCUOm8QNLo2Ezd+mWaxac97cDIiKEKJXNuZgmWyG8hS99tlcf+2TC0nBCMeUjZpkYFyc7oA=
X-Received: by 2002:a05:6512:608b:b0:545:2cb6:af31 with SMTP id
 2adb3069b0e04-54fc67b8e2emr6534510e87.15.1747141152348; Tue, 13 May 2025
 05:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-2-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-2-3906529757d2@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:59:00 +0200
X-Gm-Features: AX0GCFtmi1qs_gSfGas8GoZGoCMX4N_wHeVY3_msDsE4LWjvnIpjpsZUBZz2o4E
Message-ID: <CACRpkdZs+Hb=XGMvKxTTgNVBKDO1cjOCjfY2yQj_bxWtjwbSag@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] pinctrl: remove extern specifier for functions
 in machine.h
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 5:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Extern is the default specifier for a function, no need to define it.
>
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

