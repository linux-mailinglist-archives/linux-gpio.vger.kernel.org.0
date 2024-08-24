Return-Path: <linux-gpio+bounces-9111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEF995DE61
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 849DEB21B5F
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8701176FB0;
	Sat, 24 Aug 2024 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YPv9UcQN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A431714DD
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724509910; cv=none; b=cngIkYeebyatrOejs0aDY4Md0J2qWdS3ttgMoBXRe/x8G8d8g09pRmY1Co+tdu1uRZIgvLH46bQ9kBjZuy6UcyH3fjWMowWxlmxBdX77COzSOcBgjEjdJY6FyHpj+PAqt53cmdD2JNn3k6lpIA5Q6A+zQiiVuhgLu4Sw2sOQlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724509910; c=relaxed/simple;
	bh=s7+9Tif46h8xdWgv9tV4+W6VBTxepXWo871kPw4QGH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSgcU34viXYt6fdWoh/rmduaSiscTGNHIzC/yp5Op2qxtDEdAcB3p01IhgupMz1BAX/25Kip+gPZ4ncBGJa9jCgs3vZzJhexwyAko7eeWj0p6pGQAuC74U345BzzaK6ZDix2A3puzAd4iLJRKJzN5be6xOCzmG+qzKGEXLfW6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YPv9UcQN; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f409c87b07so30137381fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724509907; x=1725114707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7+9Tif46h8xdWgv9tV4+W6VBTxepXWo871kPw4QGH8=;
        b=YPv9UcQNXGQo0RwhAlFgcEiCPkkgCK5t33PfjPEXEeARpLL2LcWW/8Fn/f910XXLLw
         npUSDEzDOf7WAH+JgaLbo43he2ydjnqNLK6yub198N4oQrYSJLf4IFNdkAypOGwsBIbf
         H/TGmZ1KoPD7LzzVII3K6OGgThKJZqBwugCNIermaXGbclQriShNxySuRHw1EUSADtBT
         bNTHTas8wZYDml9zXWZ+mTpZ9vk8qRajQdQvN+iDht9PDzwZiR5WkyOkJfEg9Wszyw8M
         f+uuxya4/YvIkns8z21BJAKl8Wkj/l/Sn6qu+d4rwrKDvjxvIrlWsvgGu8o5t2FLL02P
         +Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724509907; x=1725114707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7+9Tif46h8xdWgv9tV4+W6VBTxepXWo871kPw4QGH8=;
        b=gGR1Cy8fenZmD801qb7GNyzi4yTPa06F9upsuMOtzTRAlF/v+GBPpTor1oAuGWYvpS
         6OiC5WOjFVUPTO/iyTWPLHV5bVRai4XTp6dYdxKGWc9siLrkj3pLEfTeKZb2A8RXQbHE
         7YY83qLZySSdknVSvtSCPPY0WkeGL2cL9qsMT9taFFmEToGft3cVVfg7x5nZWZ5QWZmR
         QsNiUeH0GspAr3GMBL/ZhficcK2cbgjE0b+bc1L2GOY2iZI05VUIbJKQOQukfyWxuBsb
         GBEuJe5SQ93mduzhSeATTOD9mwcUWHSPnjFAva8NPbnYFMOxm4nPHlhFVQ8VjggN7e7O
         VPcw==
X-Forwarded-Encrypted: i=1; AJvYcCWcZ812HGUExKWNtx2SmNBEkOwsDmLoOEIbj1c6ixGhsnrvXRaUMx+XWkJuK1+EU3E7zndVUmOmxsku@vger.kernel.org
X-Gm-Message-State: AOJu0YxQOdAMsa5YnWmquqwdvBByR+nGiaeBDQ9R+ZdcpJinHMlAM6r8
	VmyOuBfpUJN4Pngt3tsb1H1ebIPM0B8sbOfUKbY0yrnlKsrVX2mApDlC8Agm97tqLDWp1BLAh+Q
	Osc/bugsaKx0n6udd9W/5+E8kZ0gvklYw9ukJQg==
X-Google-Smtp-Source: AGHT+IH/SwAi8KLM0yeMY8CjaTvOZhn5MgmfhtRwVTj92jYxo65VGu6YYQ83n/Sa5TY17gIQdFKzZPUjfjwKlGMvpQs=
X-Received: by 2002:a05:6512:3ba3:b0:52c:e01f:3665 with SMTP id
 2adb3069b0e04-53438783dd9mr3785098e87.25.1724509906414; Sat, 24 Aug 2024
 07:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814030155.3876069-1-liaochen4@huawei.com>
In-Reply-To: <20240814030155.3876069-1-liaochen4@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Aug 2024 16:31:35 +0200
Message-ID: <CACRpkdb1VxVv1Yngyi07=GmCLxiCeVZmqGvmcOrYOaLzW6CkqQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: pinctrl-zynq: fix module autoloading
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, michal.simek@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 5:09=E2=80=AFAM Liao Chen <liaochen4@huawei.com> wr=
ote:

> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
>
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Patch applied!

Yours,
Linus Walleij

