Return-Path: <linux-gpio+bounces-21722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD7ADE685
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 180251898647
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 09:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2B928137C;
	Wed, 18 Jun 2025 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsBRnGYx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1F3281504
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238449; cv=none; b=QcnsWzhF14VdPc9YYDVfdgCKmDyZB+FvQA3mv76M1vL1irfMq8pvHIeSTtTlHfRq0+ponnEjm4pCLP4x3o/KsNDs6BD876Fj508wYu/AlM91ygmvGCYqyQtI6rgisotdasGUKHrKSler0s3U/LeBgxrdMxUfD15UeM0894PuKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238449; c=relaxed/simple;
	bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCv/TxoFgScMFtl+EHFkhC0b5mIU0Rf+GMzdJEuZv5kPYNpx+SY3iyHIrIYOWqTKrb0whmmvX7EWFdWkxTg3TRq2vGmibRF5PHKdUhxvCGyaSdY12i37bjWJEheBuKAtCOMoxpGT5Fzmf7t8r8WKykKu1PepOOQvmNwBDZ+gyg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsBRnGYx; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32add56e9ddso54257941fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238446; x=1750843246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
        b=HsBRnGYxAnqjwazuk9LZaX0tF2m0h2w7nLRb8KeO5Sxrq5vZO++4xNQbF6vu0IM2/m
         vKbFC8jjhkIrdWNILWBcOeaQwVReO9+TVWV2Lbtty+EWLVLD8zT88b5DxcvKQsfW8V8K
         BjYGsy2KKIDUxTpJsMSr2B2nQzCRYOa5bUCbVBrYGkuwLmYSswqD4xGdcR0nBP4dAVyr
         2snT/5kQyuwUwqlB0RdVk60qdcCIbAyPL4P9yc4qra218KcTgsrrhzOvOsY6KxJsfOVr
         AoDpGgdpZySEwuiT435NfWqotwrzOG4rfy4/oLApZwKrb9FQsRaJEcG9kp0doDQSwAWj
         NrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238446; x=1750843246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
        b=o/RInwhN9VptBJvAdpB6HnSNlaGEgqi8c76ZqYzlCZYHkZJkRGz+otSgwOyI1OKbyB
         G5hBroP4xBsSy1sqx2OEP3ROVFajDHinAQg5keSpjcIoLUBNuJ3zivKb8OCv720kfNaM
         YT937cVagJMiOx2p5UMa9n+23zuqf81rZ+cUOxxpN7mUt/jyPt+Og3rf6ddXUtWq+ASz
         uPsVTTp9dXs9/3iEIMOvBJ0nluWCkQ8F/fwYPXrccce7Q/8sPChaEoMD7yEcMJ01iQRq
         K/N9P1ECTj+oocjNVfr3uqjtr2v+brUpS2XuviBeJKBGBSSjhhLuO0DhMBVBMvCZsxnz
         qkRw==
X-Forwarded-Encrypted: i=1; AJvYcCVz69S5JSvafUW25AMNhWnToRQFr3HEPmHmaFMj9d8Nblyh7ysjw9VqpnF+cuVPtWfqx1VTImLDoyKb@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQ79ilxJdYxqdp9dCPzkoCKbu+6ux/kr7SOQFgeM21ogcfqVJ
	SXUAKzFcefazbBf4suMqHUToiTRPG8TbpIDz2FoP74lXNI+Lp75FG0kopuHVRc3xNloimwguPRM
	e4YnZYF/H9QLjOAEJk6oEJmmY3T45d1eXiIZ7mdsl9w==
X-Gm-Gg: ASbGncuSHuzhByzzsqtABh5HkNX5PVsgCX/NnVxMdzT1ZOO+o+1+6K6MA55vLdhtpr8
	0gR9HuHtevtqNRCpLQDcTBQyw79KSANYmBSNBkxwY8zcf5vXIoLaogWKdW9DtfCQRFDOtFM8RaU
	N7dhsbTdHDthGffdvnl1QrIE8PLYWEPVf8Xkpa03yFNBM=
X-Google-Smtp-Source: AGHT+IGYHmwuRCbsyGw1J8Pu6GUbhDQ6w+nVs1//AI3lpbzQb9Bb3dDWstkl4KwszZdq0G2erWbc3Ga3QrnKGmbGGhc=
X-Received: by 2002:a05:651c:1a0a:b0:32b:522b:e446 with SMTP id
 38308e7fff4ca-32b522be65fmr41755231fa.10.1750238445710; Wed, 18 Jun 2025
 02:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:20:34 +0200
X-Gm-Features: AX0GCFuWBc_XYewjnfwAEfEgMlAZ5vMOVJJK7KgI8KvNcDIipEswDPcxuF3xpvc
Message-ID: <CACRpkdYVaTvArLVNUYf41nm_StVkWT0CMmTxheT9ovbBE+PopQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: stm32: add irq affinity, RIF, module support
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:32=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> This v2 is a subset of the v1, split-out to simplify the review.

Patches applied!

Yours,
Linus Walleij

