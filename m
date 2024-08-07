Return-Path: <linux-gpio+bounces-8664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB594AF3F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 19:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20DF11F231AE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 17:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7025A13DDAF;
	Wed,  7 Aug 2024 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfK314dF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A4D13DDAA
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723053446; cv=none; b=FQzuKBzIuQt6rgCFvSjhN+0gt5PI0hCO9zHszpg2EHLA/1A+fK4ha+VOyUqfGy+nwuESdqBP4yuGW47gGo/wb0Ddh9K9vbpBJZCUg7EZeIzNlE//5yEMCPSGTqBrxkCvIHH/yomjgI1HDNu/gF8oQL15DH+G6I0H2Ue2sd/e3B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723053446; c=relaxed/simple;
	bh=uyHAvy8t87Ra4RZTcpeG1rX74PeH24V34S0fCCdKGZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DS7meIvFskIDz/bj8lLHyP7eY+VGzdMtTBRfNraPwTPE2I+3cZb/d41aoudD2vwF3yCzNiXa1BC+GcsH7PNofEo+7XWpzoJDqpibLlhr47og14vlsOvh9VeXXilubZj9sikfCDccTpPdJLyq+924JM8Q4pKhExoAFRbyo2UgZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfK314dF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ef95ec938so76987e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 10:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723053442; x=1723658242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztm2ESQlSomFsNsu1g+66ATbGIT4fJIqgR/hLT4U6HM=;
        b=mfK314dFeKG6L0+EvhS5rtSAIJ4hLplHUjRfC53WDhteHRgO320mvSOBmk3wmYlVTp
         mNS02MSjyz4E981AXN2wBDxGRlanhL0grEml4fII2vnP6lO1SyrBZnpxHEDRKDFRgCfe
         HQioW2d9AunE3ONSzOvYMyGxe3lc29Kk2qEg5wx8hHDEiNnTuCWXXAfIrD14F9tI/si3
         y8lwvMFbHdQ9lewvJTq8jUKIpW1fkMzpN27euk0+3A4uuQ3WVzXYUWR46yZ8razPRzSM
         kzgQCq51VFy+Io+GYZ2n/5isZRP+v/rDoRmYO+Z9YIryZ+bx7/mFdijZIz48qDaCgLis
         2zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723053442; x=1723658242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztm2ESQlSomFsNsu1g+66ATbGIT4fJIqgR/hLT4U6HM=;
        b=eoom/0BNV8kMtN1uRZ2anUfmq+WmdAns5V3VkiV982nRJshmhiXWBYrMOMO4Wa0Ugu
         A6iLqDaua0mTUNYYzBd3aqsiGySxenllHEqaFXBm+OKgzpRdv7f71cHg0i54xfNx7o7E
         Pl9Z2YyxoGyxily8RoFDpBw35t+sIkjYXPwlsa3xFWFM1IPcVomsrZFPCFyyLarnhVRu
         O2HuEQmCcGfqXDWxhdHikpGRc3VTldgDEyZ1jmNsa+wp2QBiKhx16ISuoWXnqRLAd+B3
         aO9CFyA4JLql47+80YmCu9AYC/eOZYENqmtuRJt8tk8eFp6vQXW7PIVDi7qx9gx5S5Hi
         9ITQ==
X-Gm-Message-State: AOJu0YyeHkdA4hQiP8woHdS/StbyFhbSor3s8/pXcnLOpvpq5jq3hGFT
	HgSvJgPxaU36unOer3OOr0YU0+D13Y9sFeIIT5Pec7oZwz82Du14hQcxaKuUqS3d/fyJxetpRcw
	ky20C9BSwZY85gIv8KPiSUJhm370T7d2raGlF0XW7D3KGJyO5
X-Google-Smtp-Source: AGHT+IFTBY5fQFDjOWy5/tmn5UpcwinAKYU2RVxqrdQ96xG/Csnx9YUt0eU75xHYy2Jjht6N+zysLPx+nY1fjAgeEoU=
X-Received: by 2002:a05:6512:3503:b0:52e:7ef1:7c6e with SMTP id
 2adb3069b0e04-530bb4d58a9mr14726685e87.51.1723053442316; Wed, 07 Aug 2024
 10:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806072032.GZ1532424@black.fi.intel.com>
In-Reply-To: <20240806072032.GZ1532424@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Aug 2024 19:57:10 +0200
Message-ID: <CACRpkdaRhAuqC90Lzj7jwjRF7P9i3J6=1zmqVofREESk54QKeQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for v6.11-1
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 9:20=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f01=
7b:
>
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/in=
tel-pinctrl-v6.11-1
>
> for you to fetch changes up to a366e46da10d7bfa1a52c3bd31f342a3d0e8e7fe:
>
>   pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID (2024-07-31 13:38:13 +0=
300)

Pulled in, thanks Mika!

Yours,
Linus Walleij

