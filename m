Return-Path: <linux-gpio+bounces-13961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F1F9F4CCD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D440164BF4
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 13:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC161F428F;
	Tue, 17 Dec 2024 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cgeJ66eR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0261F427C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734443518; cv=none; b=pFO2q52Yj2hKyOOiN9JvQz/LemdO7hu/+UoYi1HN5JwdF1BiCkNw64M8wN7OdJyvp50kj0ws6bPaoqXBO5yZ1OZfPfVPSZyWWRGndwAi8gevEqrFc7gaR/L3ZfBrur/VbD7huCOsaBY+mhWDedLKVoer6HZPutUoCWiDr+FACag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734443518; c=relaxed/simple;
	bh=h8hZa0shBeOvBBhYcCnxg3/TvPld1ws9Sgpa6d41cfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7cdBFQvg8zRihJ/v8syMgHCWeai5joY6JgKz6r67RvRRdI1SaLzoxYm62Bq64NzkvpJwGROWmDZmlTHuPk2U5oQWP6dhcksbqcvPel/JHnNTcVzQS2cKlPMoEw2CTQTRcePBAHHqy2oEqK8kaL54SNlqerCR0OrGEbhS7pgEGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cgeJ66eR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso5932996e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734443514; x=1735048314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8hZa0shBeOvBBhYcCnxg3/TvPld1ws9Sgpa6d41cfU=;
        b=cgeJ66eRqPQThPQAJ6or6kknsqwct/k29AUP/gEWNRVD4bnUcNNPRWprO7hn/GdwPt
         pesLPDmqrUn09lCNu1iX3pcrZ0iOdZUVTqt0+VSn1kDZQ3egibEmnenjKoaziqIdlJb4
         5DzJuIS6vPlfdcUYTdSgXD7GJg/HY6bW0Gjj7bqlUbhinSjlJkXg01wyGj+UrvMhUIBp
         R8ycyi3DwZpgN2hsLRmW5PkEwj/iU3mEeE/YruXx1VLoXZDB6Bwekf3WFz8kO9EyRqtU
         thbtb3ecN8ofBfBXUKWR4traLYLd1cDIoUyutjG8IiJZ9hKTbSoTElxNu3DX4H9V+tHU
         8gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734443514; x=1735048314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8hZa0shBeOvBBhYcCnxg3/TvPld1ws9Sgpa6d41cfU=;
        b=bHAFWAVE6596RcBewR+VWlSrwvidqFzcSICDAj+tEtN6hHUHi1T2K+2pxMcK72VX3X
         YzNxzANS+2IuG4pB7t2ic5hx7w5ewmagJzNepxzL01LqoUwBABCo90DYqCKTjtyw6KSg
         tNRKoHY+SMsQyV0Cbi0P07udV5hYkNxRg422vk21k9eq79U+pMH41gN4Vo6zivEs9IqU
         Tk+idTsGE4XCMn1KPdXMo8Jkx2QpLCxUqFYjkqUuE4lLPYZQBlgLt77GoxbxfYPo8fVZ
         bJDntqjMUnB0rD5gjjQRK7qatgXzS2KryYX/I4m0ZzSxCbQpZSWUuJEdKKCbvU66WIQy
         fiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmkkq+B81ec6OAbt0pbQPFbhYeqFDHWjgDwRWr3WcNXZf+X5iUgQBqiaAxeTF7AvNQtus8AuMeTlvR@vger.kernel.org
X-Gm-Message-State: AOJu0YxDM+XqW8SDuTQED39h61SPSUfYlZLmcNGeXl4YPY++8o40SCCw
	Ze14OeWg6lc1xrSOmuOGHmN/KVZZ1Poe7dWTSVt7Bni2daRXyyOFQRqmnENeYR5YbdNhd+6eT0U
	vb6IqjWfC0lkDrNzvDMZn0RRDDFqUR6Tw6KGukg==
X-Gm-Gg: ASbGncsexuvnX0/jVaIWaGYcBopL0RY75Bpp6tuSz3JjwD8g+XnsZBz1PsdTeHPFKip
	AEj14BPKVo9jOlATJsIYIHT5JQ34PCGYB69my5A==
X-Google-Smtp-Source: AGHT+IGEoFk2/Y9yrHF2fZnMacxBmdTscNpmAK7EbqwQBtmcHIHv87leDmZg8DYb1oBejBKphi50861qTul7AFls5Aw=
X-Received: by 2002:a05:6512:4005:b0:541:1c5f:bf83 with SMTP id
 2adb3069b0e04-5411c5fbfbdmr5399848e87.35.1734443514494; Tue, 17 Dec 2024
 05:51:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205042214.2410982-1-zmw12306@gmail.com>
In-Reply-To: <20241205042214.2410982-1-zmw12306@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:51:43 +0100
Message-ID: <CACRpkdbcn8FD8v8PYv9g5JObC3ty+6xvKKCpS2uc3WKYXcmLiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 5:19=E2=80=AFAM Mingwei Zheng <zmw12306@gmail.com> w=
rote:

> Add check for the return value of clk_enable() to catch the potential
> error. Change return type of nmk_gpio_glitch_slpm_init casade.
>
> Fixes: 3a19805920f1 ("pinctrl: nomadik: move all Nomadik drivers to subdi=
r")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

Looks correct, patch applied.
Thanks Mingwei!

Yours,
Linus Walleij

