Return-Path: <linux-gpio+bounces-9555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 152829684BB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C720D286929
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E528F1822F8;
	Mon,  2 Sep 2024 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CvIo47+G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5756617E008
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273194; cv=none; b=AmEA66tr70u0ctyC6yVWW1++PMumClcIGnHwBlfDSndIiR6A5R7+mowz9CbtCJgd099RTvBECDGDA6FMiRNuTWufOoRUass+q2VPTa73x7x+befMjtaOVaqlWCyJoMsfso5IhTH/rg4P03pooNGYeHyakDGCtlFKf8TXl6ALLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273194; c=relaxed/simple;
	bh=ntBd206Yvf20SaH7Pj2eQRVkjOQdc0qX6sWfPk/fAfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GP4RuVwafvMTD4a76/NoVUiSKbQfxeIgkNJ+U0umeWoiQPseq240Ha0rDbn0kSh6jFauXy4kReUcKkmJdpVWDpIfj5GwUaWSMoTaVOSRdDC9gF5+0aanD7zMerOsqaJEOmi5wLESLeLgfVnyp4ym1SBVvg/aLfnfhM040e54jEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CvIo47+G; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso5333216e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725273190; x=1725877990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntBd206Yvf20SaH7Pj2eQRVkjOQdc0qX6sWfPk/fAfg=;
        b=CvIo47+GM4Rfp+YjhJEfpuUlwvCaGUB4rZwCPpP4fNRA0/E81UfebSweugmSHVhxbE
         aRjq4zAMGlXEWesOt4jaU136k1b92Sbt3Zjadqzrikp6uTkxN3dmzagQwaPcT2ur01mc
         YL+O/PR61AEbRE+t7LEFl/PnEixs4yTWuaBsF7HvHyMCm1XoTANrqllQL2PUe90aJOpe
         rRb0+hd1ydF2ETuYth2KJ5Tk2dCFhUDjdfJI5/B8mYNSzAYGU1nXZrUXxEIKgCQXWiXh
         hgrzZ0mIuB39Nu045dq/mDOc7bNsrV9aifXWitNyRogBvB16ugSStKzxZXcbuxQ7Zwob
         pmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273190; x=1725877990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntBd206Yvf20SaH7Pj2eQRVkjOQdc0qX6sWfPk/fAfg=;
        b=daTPKLiajY5F1aQsRh5u7q7gsU1CEmsqjuZHFqwN0C9kkC06qI6rCelZuRV/aztKTh
         jLhG5AHZZTAceKP2Ni0ppHIFXbF1mPhuvy5ap3/GuE8xJc/ueY76EE6Tnf+iEwNjWnh2
         dKGZ9ivlDl5SatY5A3nytn5skuGIfV14PsCubUhf1xhTKhADSzlssVEr14pmiFr6bBKS
         6SJ0CGXXEsc/cJ1vZa1i4LZ3Y/mWeIfNM7bDIAD6Lueolq+gu6O9bDc0MJewhypIAJSL
         lvKAODjRZ0+cJwsvGO5ChOYDnbEMaH9vwArIPtgByO1j23e8S8JUBwnUIXh0Z7CI4U2g
         VOuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm8MVr9GkKU6wgDT2Bod+P3XY8vtZYNY0XmvsMmiiQrM4kWkt1QHSdpGdb4z8tPKKVCyOfSAqBHGJP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4N7IaabO+HkotbniwjjJ5JNucmI4O0GBIBwAn/Bvl0aYUz/Lt
	8wFqaWnxQnLl36ObYZAiCIaD5NT5ROLiJ5hmsmDB9KWpVT2eIWULPKmlMggo6uTrJvSzdkYBVzf
	j1tLIOBG5rlmkCxaKu6nQIlORiQsR5hUIpSfksA==
X-Google-Smtp-Source: AGHT+IHR0BjlaxvH5N4Xcsh9oU+BzC5/rnmjLf45rfI9sxOMbtwkRJLYZ/zoGaUuvSzjAzYpnLfsKrP5/6IvBrMJBJY=
X-Received: by 2002:a05:6512:1055:b0:52e:f950:31f3 with SMTP id
 2adb3069b0e04-53546b44404mr8330415e87.35.1725273189848; Mon, 02 Sep 2024
 03:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820121651.29706-1-rongqianfeng@vivo.com> <20240820121651.29706-3-rongqianfeng@vivo.com>
In-Reply-To: <20240820121651.29706-3-rongqianfeng@vivo.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 12:32:59 +0200
Message-ID: <CAMRc=Me0OBPTneoB5WGa72eL_Yu=1=X_yu3nFimsDKUv2X56Fw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: zynq: Simplify using devm_clk_get_enabled()
To: Michal Simek <michal.simek@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, opensource.kernel@vivo.com, 
	Rong Qianfeng <rongqianfeng@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 2:17=E2=80=AFPM Rong Qianfeng <rongqianfeng@vivo.co=
m> wrote:
>
> Use devm_clk_get_enabled() simplify zynq_gpio_probe() and zynq_gpio_remov=
e().
>
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> ---

Michal,

This changes the order of operations in remove(), could you test it or
at least give your Ack here?

Bart

