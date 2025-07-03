Return-Path: <linux-gpio+bounces-22771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DCAAF8334
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 00:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C461C209CA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 22:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D7623ABB6;
	Thu,  3 Jul 2025 22:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+B/KEzz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6E9230269
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581014; cv=none; b=YQi9SWSmRiI412+p9qFJ52lPT3RAgZ/ETpVAdX/Ds+m2wo8OnhMXjescNPwhMaOcm0ih9CmZpemPRh+jkkjaYDmdfzM/3Ot4aGJ4ELGKm0mruXzLSEvAzbFGIfjpSZ1z/ayJpWo3ztj+Znk6IvzbM5xh+ApvD9y8rDwSrTdvBpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581014; c=relaxed/simple;
	bh=qns+/5/wmaH5gEHLSzb2kNg2mClkJN1DhgEBnA9xZck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=je7kFY9fWFpFmJIU2Z8aloYQXmFdFIzvfcshq/ls5pm4f7gvooMzi6c51oY4hxqCvpa+RBvCDFKQG1n1XbXRO93wj7ZrjOI3BW/u6qOJW74/mFA1+l0pywYvcePIW8AKkW8ERPEKxBurdxbhECnIPHwPHB1rOs5JzFXPyIsAhVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+B/KEzz; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so3532911fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 15:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751581011; x=1752185811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qns+/5/wmaH5gEHLSzb2kNg2mClkJN1DhgEBnA9xZck=;
        b=t+B/KEzzzBsrTePKsenTt8yQMzkdSmM3kUGXn0eyjAzhEq3D1pz+7nvkHjfVEmr4e7
         LuWg9Y0lv1gmqPWTBY13WzstYsb8yn38mnN2ym+eQgRv6A6hA2t9PWIbsQA7Nfp/I8hF
         3kZplK9U9GeeArXsLyU1cuLU7oX+VTSKgmzZNyhXbYxnnu+3fHcAAtEcroSpGd1qwYGg
         O6tZEmgcuZ+FyV14GadIrehvpBHnM8075klu4P0yJTgkZ0tX6TmyL35JI0Hq2wjoujK6
         xu9xjzRZkxjsDCD/+KwTTPhv2+j2ETLlubSp32B3nH8IpS12Bq9srY34kmIHtmrdfyep
         TF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581011; x=1752185811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qns+/5/wmaH5gEHLSzb2kNg2mClkJN1DhgEBnA9xZck=;
        b=cgTo6G9bNuaAZBW0C1bCUt7u5BVKuXTq/Bqkc+oPa7XvLnbr8B+uLO3sdLBramSW5c
         eHrf4DAtQZIlccylcGLHJ0mjLc/jk0KG+ib15S3Jcz4RxI8semeSrIljGBBYVirt+Bxm
         ADHFfsZsJBXE9+h1O9ygQ3MXDeuNd4ol7x0xjF1RfiY4hXNNq5WJki7z/WVreGMqsxql
         DbOX2YmSXFTxaqDw62eMm8Mzkrr4MDs8mUXfkpk4LbKaWg8mTs9Yv51t8pvwdiTf8SNN
         ZOJMSOQsSr3sQz8r0PwURwLzHUV26PeaL8N7OOlHSW5ocom4/h3jdBNETYdgLM1YxLxa
         O0Zg==
X-Gm-Message-State: AOJu0YxNFam3oUDRMZrvdKMAPdhNAdtSR97CQcq+evhj5bfTW38CaDs3
	SFoMenia1bzjq0d7+cq9oPbS0NyBOPsC0Un01JK0ZQMIpseIELkuPEX610bPa7tlZkon3hZ5tsI
	UkQ7vmBOjb3zV2R56FvTpFYmBjavEv/NdZCK1/tb5jUHEgV6ttHgaY28=
X-Gm-Gg: ASbGncvWS1xa8Zxuvv8tFIrwYxBTzleUElG/WQbKH8J+IrVKV+HS3KxCV6dBMHOFyoS
	Hcibo2ep0tppSzVamvULrktJcV+jDe1ope6uovP/9NrNDY0sgSdAjEybAE7+0KkXJeUTKCIgVfa
	UrQQHhqrYVtyzJ7o7XyOy8JBB0THJ7ZzR7ugbgfq1hq+Y=
X-Google-Smtp-Source: AGHT+IHbAqlUHw4CgKXIISSs2D4mEIwznT5OK79sA9hJOvGiPiorrc9V/vwRyTS9A1TWDwResSD7wBxEuFKKAGBsPdg=
X-Received: by 2002:a05:6512:2346:b0:553:26a7:70ec with SMTP id
 2adb3069b0e04-556c679f933mr66932e87.0.1751581010717; Thu, 03 Jul 2025
 15:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627005419.3124660-1-jchng@maxlinear.com>
In-Reply-To: <20250627005419.3124660-1-jchng@maxlinear.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:16:39 +0200
X-Gm-Features: Ac12FXxIKFkUbl07ePXB9dy0wboefUJA6BiyEFwiqL12APzUuNWUSKWdKqJhJRM
Message-ID: <CACRpkdbAr1DqjqUngj4tOmrrWJXndsJoOCvtt-8m4RKQ3FiROw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: equilibrium: Add request and free hooks
To: Jack Ping CHNG <jchng@maxlinear.com>
Cc: linux-gpio@vger.kernel.org, yzhu@maxlinear.com, 
	sureshnagaraj@maxlinear.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 2:54=E2=80=AFAM Jack Ping CHNG <jchng@maxlinear.com=
> wrote:

> Add request and free gpio_chip hooks to support
> gpio allocation and release in the driver.
>
> Signed-off-by: Jack Ping CHNG <jchng@maxlinear.com>

This makes sense. Patch applied.

Yours,
Linus Walleij

