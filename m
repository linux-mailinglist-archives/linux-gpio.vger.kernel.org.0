Return-Path: <linux-gpio+bounces-9765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D69F96B5F0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F551F22804
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E5E1AAE33;
	Wed,  4 Sep 2024 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3ee6FuIh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F71A3032
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440738; cv=none; b=sEgl2zXowk8QT8KPMdzPAOiwT59yxgg4TGLXQ+XT/odrmaPKf2g9Mby8UfHPXRLcCHLZj2k8H0g0etDIr5fiOrDoVlGIst/RaeeDP1i4NtDC2vMdyo4Q1hlCcEHW53KEBxzGoJnWbOKJO511EIZOPzMHU1+QorYJP844kLkILWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440738; c=relaxed/simple;
	bh=BMR1kfleE/tdYCVKI18ZZB897LKpWHoW4gxRFDEYJoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIJ+/q55TB+xnwlXXj1qr+IqU6n1v0IdzmGUoPt4nm+N3Qd1kHxoKVcGe7x0t5dOHByiMi7Wfx6lZtvfFbHz3jzBg5mTGQfYiQ3aq7Nwm/7QtfdunrNfjThQhpHAM89K0iv5vNFGZGWWgyOjjmljQHkiryWyGkK0WKjatlrn+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3ee6FuIh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53567b4c3f4so444272e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725440734; x=1726045534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMR1kfleE/tdYCVKI18ZZB897LKpWHoW4gxRFDEYJoI=;
        b=3ee6FuIhc1et1zbbncIGCrgpIZ1Zzxd6bJy2IQZ7Lad/qNZSyAlTQpUN9iG7hViw4E
         glVNwE61+u1S28OAVnebKnX/yCKBO32M1oJ96klOfu3vwq8pOblcnYASnQr91YxoQWUt
         JY5SVzgqyIDj+G4inb6PmwTcIl1fmswLeMFDbfELHjU72kVvrCef/H1BVSqfLS8dEGkb
         ErhNneq3sbnF+3RhTUuMUWNah3ye/Jtg8YC6P+a5HUxLHHkeyeYS8L3TdFnngngSMcSe
         oCk5EEn9hSU6piFaA8irMmJlflCDJfSVqyj5okM01Iu5RmnJmerHD4mXrN8XEh2O2lmQ
         Vbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440734; x=1726045534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMR1kfleE/tdYCVKI18ZZB897LKpWHoW4gxRFDEYJoI=;
        b=eAveTlo8e3RxUZ2huREkJWxzLtOinABsLoFVzfdXxWB4rBcbvQ79nDzymn0iy1Eams
         gGmi45j+n9tJT7jp1+n2q94iu4NhY16RKPJ45B/HGpfbHZ97d/vItwAyAt9RbaZdIkFq
         7MeoJNtZEKGjGK4uuizmUiQDspmnXb8lruzwQ4VbDekWUwiuhxDz6Qdo3Ajf4MMM519j
         P5yBosmYs3F8dI92vCbvw+vo5gRnU4QR3sln9/3roMZMhb519/4qUKbEtJczvsTs3SKd
         YfCMU+zTJyNnP6K8idLQVG36voDAzsKAQWRPobBn1on5/3tuAwRISlC39oB2CbihWbwE
         wk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS9wq26WAlicHLQlIm3R8VHPlDzDwAni/R2xRqSceehgmGXhvL91mvhE1ZM7wzerLIRJgGehjLvza9@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/RCLLc7/x0oXWwyv8dsn0cl/y6v5WyvgbY3kKSqBgbdP8QAe
	qv2FYs5SIkHx9/+NZ9FFi8WNYGUwxFq7lMGPpVE+KJSAAQ+7bxuiAPfvCCA5d/d44s+M2roVoZ2
	poUXZrumuVdlq9F8DIpqZTPSGXzYRR8ttfjMALA==
X-Google-Smtp-Source: AGHT+IHIxKAGPxV1C7ovwqdMqj36yWg1aG4G2/e3QfizYr83x3bbt8yocBM+c3XbEds5ecsliiS/iLjMM9bKnAWRzpg=
X-Received: by 2002:a05:6512:3f26:b0:52c:df3d:4e9d with SMTP id
 2adb3069b0e04-53546b8d6bfmr10650797e87.37.1725440729744; Wed, 04 Sep 2024
 02:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903080627.53652-1-zhangzekun11@huawei.com>
 <172543690825.12391.10926770607261853766.b4-ty@linaro.org> <78c50ee8-a6c7-4eb2-8e56-eaca226b8d00@huawei.com>
In-Reply-To: <78c50ee8-a6c7-4eb2-8e56-eaca226b8d00@huawei.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Sep 2024 11:05:18 +0200
Message-ID: <CAMRc=MedrAoLDOQEGjVZ0Xf+B91BvXX-PTS=ZGsjTAi3cLT_hw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Simplify code with helper function devm_clk_get*()
To: "zhangzekun (A)" <zhangzekun11@huawei.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, vz@mleia.com, 
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:44=E2=80=AFAM zhangzekun (A) <zhangzekun11@huawei=
.com> wrote:
>
> Hi, Bartosz,
>
> After receiving your ack email, I find out some mistakes in the
> commit message. In commit messages of patch [3/4] and patch [4/4],
> devm_clk_get_enabled() should be replaced by
> devm_clk_get_optional_enabled(). Sorry for making these mistakes. I
> think I should send v2 to fix them.
>

Ok, I'll back them out.

Bart

