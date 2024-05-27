Return-Path: <linux-gpio+bounces-6634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96F8CFD95
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 11:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 285C52814B6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 09:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BC113AA4E;
	Mon, 27 May 2024 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OwZyc81o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FB913A40C
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803799; cv=none; b=kw3NfhJEUsjs71jE3lkbWauWa85mnx8uFOSHbKOfP6VeKb4XgICbPm8/rzfHWcqdUjbYawDiBKQxMyfeJyCMixBapp6Z8lf7ZJ7Pn4RZbCR+xBqRdWh9pWIlArollz/APUzbqSZ0nsCP43DX88ABPCbwiTe/kW8ibJKXpaWAq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803799; c=relaxed/simple;
	bh=h5jXgRKsQkIcgfD97Q5AAMa9LZ0uTBSUY0djiFxnNdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8u0+dDcbS29FBbldEWaiiDyn0bJsyzEGEmqIAcNfysaJEHgtUvKJnuigJiW8VPkbQvNCDgZ1+4OfMgqjslJ7AlenmULIp3s6lhuzdsUGtioCTW26zHw6g3HlSBngsEBIwjfrdbcfaQbpZ/XIE0VrHi+Mw36kQx7n8MLveI4A3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OwZyc81o; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62a2424ed01so13481167b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 02:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716803796; x=1717408596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5jXgRKsQkIcgfD97Q5AAMa9LZ0uTBSUY0djiFxnNdM=;
        b=OwZyc81oHXBDnMV3uNMxqSlJRYsWOthjL5fZK2YxsR7yccd2ZaPUemN11Zc//VBDuP
         q9AvTGyyIJNE+1QaueCdotAutEG7/s8iHmMRbsK86csfjd9M8R7nyNw4BaTzTA5HU3rl
         N1QZHEkS71sCNIR3xJhqsfHfeff113hVZ2eN55ZbnFJ1nhZyQvDTA/olsEJZerJXHPxJ
         YOoaMzar9lZVfo51KpfQt5KH+Tjm10CX0mSJEctLWX7o0Vw0sbT/S2M450usXd8yrhvI
         zV32JlmgFfoYwIMJLlKssYQl/JiSgnvyEMd5XvYWdtgFaQme6118x9GE6blFTrpKfmas
         NAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803796; x=1717408596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5jXgRKsQkIcgfD97Q5AAMa9LZ0uTBSUY0djiFxnNdM=;
        b=VJDvR6YhAeDyf6Cm2DzF84Oxxh9aIrrASSDlYQE3m0ZFJxrItASnrLz+FWq4VZ9EbV
         jBs6rCF75O3J6nIl28G6i2y3kfPOkfm4VaG/UBqGYfuH5IbNHTfNvpHVZ1KPIhbVYtiu
         eyTRTFIp8LFp7xw8XIfy4Xj3Qog6KIh7/57gzx1jl5GTefNcnOhU9sLGLEz3V7pi+o5u
         CwxPeMqIpVGlU+zo2w3vk7Jd+T1aXMmO52sZkyQggGdYV8Pyjysn1PLAEd1r2qxCGt+W
         kY4P+OeAb9x4K2LV2gkMuLF4uxL/eiNMtcEuEmaSBNt0VdiSeVjyLvq2/p+yzd+C5peB
         1Qwg==
X-Forwarded-Encrypted: i=1; AJvYcCWFn15GSlzxaNyWJAjhs2ENrQlApEThbHcZ5upo8A2KqJ8l8mWeePHld+Y/PIcI/44fGy7QG9KiclBQjeT5Uc/ZXQVxQF4Ryz3A1A==
X-Gm-Message-State: AOJu0YwBmPhdEbRuxpPVWiTfLIIBlfcCKNnt/4EKymR50VFFL27mOCRe
	jx/CKEpGLeDWXUBC3AQMud0OY4dLdRxgJIONHJzHPsokIDisYFWNIpeoz8/Yz7KpjCgL3aPG0ot
	3XTfSzvQnS8C3NlefhTc+71KwwoQLvLr8bcceaw==
X-Google-Smtp-Source: AGHT+IGpccHoFCMTsrdaZe9Tm3wWZXSUyc/MWc6ba+P+ihM0RdYtqT8i31GHF/bZGJjJh4akODp67cOD7U7PAxqiLSM=
X-Received: by 2002:a25:c7d1:0:b0:df4:e794:21b8 with SMTP id
 3f1490d57ef6-df77225ad0bmr9332361276.55.1716803796507; Mon, 27 May 2024
 02:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204220851.4783-1-wahrenst@gmx.net> <CACRpkdYmOECdug1g2gYxjHZ-+Y040SR70UtDAgKD8yCb58Ob6Q@mail.gmail.com>
 <33d009cc-3378-42e0-8d40-a74a0b583a44@gmx.net>
In-Reply-To: <33d009cc-3378-42e0-8d40-a74a0b583a44@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 11:56:25 +0200
Message-ID: <CACRpkdary+kDrTJ=u4VbSTv7wXGLQj9_fy7mv0w-Zg+eDvGXVQ@mail.gmail.com>
Subject: Re: [PATCH V4 0/2] pwm: Add GPIO PWM driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	andy.shevchenko@gmail.com, Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
	Philip Howard <phil@gadgetoid.com>, Sean Young <sean@mess.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 10:44=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> w=
rote:

> I could rebase my latest work on 6.10-rc1 and send it out as V5. I would
> be happy if you want to continue on that driver.

I could probably do that! Let's see v5 and take it from there.

Yours,
Linus Walleij

