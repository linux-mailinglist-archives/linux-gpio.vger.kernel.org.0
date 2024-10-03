Return-Path: <linux-gpio+bounces-10795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D0198F0FB
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 16:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EAA81C20EDD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 14:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8906F19CC2A;
	Thu,  3 Oct 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h8lvj4vo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCFD19B3F9
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964274; cv=none; b=gaGMyalT+lesF0gbCSIvNfR/70ndyM3haDSA71iGDhMoaNQHkitAo6Wx7BrpgiC3Ir2bwnLpEUrxm10Y/2k3XX1NTNpVVygKqrZmCB1PHBopzLMFHsCrewMQ0AhoFrH8bzl7ORQZK52N6nstfpo9HA3DbFAjTFgn8d8oF6vLbJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964274; c=relaxed/simple;
	bh=K4n6ZsM+u/F1YotVkXEi5F8YvS1mKGe9fymwaFVs6+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oh/joC+YE4S6NXwZdj2jC4DCoC2lIzFsFBuhF9AvQnk/xhQVO0Pj4rnTJ48gRqbXDAJRPSE0zBuPztSfoXGb9sQkCgWXTYItlYB3pmF16hcPr3m6f1e1RIBWdALT+xVqJpszKxUIjCxdJd4ka8BqLc8N9scZFJbX+C1Hexd3yYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h8lvj4vo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fad5024b8dso13146561fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727964271; x=1728569071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4n6ZsM+u/F1YotVkXEi5F8YvS1mKGe9fymwaFVs6+s=;
        b=h8lvj4voKCzoBQL+hmsf67LYVl4b6MjTeQe3mN1fVebu8feQ5sCtmex21SO8f5TRj0
         v5/W4rSw9tWIQq4b7CUrawVAZwgAsnuUBOJGjxh675jd7/C4y6FBN0++BpHDWDf7YNi7
         yKwvvWuNFlHg8ep+y1szLqORmtrDWb0UyXtnvHAfFnGJtmE8tmlReouhruKGEzJrjAIV
         MwIvIxb1TXIYNkOJC5/lFybR2uOofLe25xYbe2jkr/mWyGN9rvDiIhgk0yJy6rmJkA0I
         77owe6AetFZOLRsgY78SP0de6PknQN1AHqv3Vvlab03V0JYgkH4YHa4BDYLSlZlWh7Ht
         JP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727964271; x=1728569071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4n6ZsM+u/F1YotVkXEi5F8YvS1mKGe9fymwaFVs6+s=;
        b=g/UxRN6py2N7nJm/XknnvKLyQ0g/lgzg4gxDlRi+xZShTUCZIxil4Ck7i+vmM1816K
         SP8BHKJhnFqJCOMlHNWEh3LUZD9bzzFAuoZnUidbHieWXj271vBT0RWeFJGST3X9+hce
         S3sZccg6FIrt94jacAH33CGXBcmau4ofi1DlP+bipTM5R4gUsQ8r9Vz97V6r0FDfu3DP
         O/qAwY/9Cte+W0c6ysN/xqMRa0JhcFHMthUbcWYwWYcYxlf4jyhxJ0p3VUimgqoIB6mM
         ZdnVyKIjUoCdP3/fFG3rni5hl03pcgJ81ksF5u0L3YOMxDE9rSzV4FcjQ32f7UHGLwDT
         AfvQ==
X-Gm-Message-State: AOJu0Yx7c+Tg4RtaTddcEgWV6JDLFUVo5PZBAAaJPWmw3RBp+LkYhR0m
	PJwwwmkMLO1vMEUENa149vu4EwQ0gGLbaGBJcbyv7GfmOS7qmV8tIDR67TvbuxgklpwiJuFnopB
	THSl6mXUeGSNBl/rtIh8al6SNKpRceS5VdS9Q37JICxiR9SgJ
X-Google-Smtp-Source: AGHT+IF5roGYzAVJ5ppux4avcixZ0DXOWtqMWRZl6QAUSUfW586vAQMwXOotz3azSkTbt6LidHIGwKg8Nrcae+KlCE8=
X-Received: by 2002:a05:651c:b25:b0:2f7:90b8:644e with SMTP id
 38308e7fff4ca-2fae0fffc60mr50857031fa.1.1727964270620; Thu, 03 Oct 2024
 07:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zv5yge2cDdVC4Hzb@black.fi.intel.com>
In-Reply-To: <Zv5yge2cDdVC4Hzb@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Oct 2024 16:04:18 +0200
Message-ID: <CACRpkdbmfE3c5ri1QsahczSSRppYUyMk1Kzs7esjA_OJ5cTWDA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.12-2
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 12:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Fixes for Intel pin control platform driver are provided and new SoC is a=
dded
> to the list of supported. The last patch hasn't been in Linux Next, but i=
t won't
> break anything at all as this is pure one line text description. Please, =
pull
> for v6.12-rcX.

Pulled in, I'll try to get this in as early fixes!

Yours,
Linus Walleij

