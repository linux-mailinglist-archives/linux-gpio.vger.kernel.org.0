Return-Path: <linux-gpio+bounces-26707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79977BAF9FD
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 10:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C0861941586
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 08:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9216279782;
	Wed,  1 Oct 2025 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zy9qHqO0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57062836BF
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307388; cv=none; b=LDA874HZ0tKzHeIaEolGNQQ3uebDdS8YjfQe9qrD6Ob/0AsGXFlGtFvkxgBOLMkqyBMUik9r/CAADhukk5ElgDzIJTnhhCGnNBs3QC4XWoFX4+z+ghEip9ZhaBskNlvamLhc0lBzESPoImLEDyjqprzlixdv2IK/xTdZVy5RqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307388; c=relaxed/simple;
	bh=7Xx2jvOSZl3TfR9fRrStFK10SHKH19//aJtsgQeAwqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfqWhsaSbSOeuvMzu3Jpvp6nI683FEcEJPND7bPvee0gLhVFY1vzOJDDBcBZZFSpycV21JK8037nVOI8I0lO/rFPKvp5CRWhdxL0uchsLqga19HKWob090mzuwdKOEMNzFLK05fVPN23Iv06TDAtvMpnYyu8HQRH9Qp+GiqHheI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zy9qHqO0; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-368348d30e0so67123911fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759307385; x=1759912185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Xx2jvOSZl3TfR9fRrStFK10SHKH19//aJtsgQeAwqw=;
        b=zy9qHqO0QMncBG/acJjQ/B36764D9eNgb5lh2i7E7NDD4/aCAeqYAmZ3G2rru4CiJH
         I5rIbb9MmQuN/qump0bVelVHwABrAnEk0AAwY/3a6caoe3+29rM4VfhyfOdgf2LzefQM
         7+I4RBQh/aWV3K32lCjA+62dqt46P08uJhOv5eYccuWLw2tZn2B4EDKpjRZDwUdU/fVJ
         AujsH2ymBt5DgZuQKDh4NZ2mmgUNEsqw1cxWcY4H2VsBZu6tZtnSyY8sYdpq88L/dXQo
         45QXYBI+DJybCuZXsZet9k1lt2uo5wwH/O3EZPz5VrtdXzxsI6iv9UR9UdMwnv+aUljd
         /iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307385; x=1759912185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Xx2jvOSZl3TfR9fRrStFK10SHKH19//aJtsgQeAwqw=;
        b=RBXry9LQIzwRsdnoFb4errreo+g5gmHLYwNJ40RHA6c0Pwb5iOIYrAkmm8MXzfPXOd
         NPKJA+uuM01FQMVZrZ32iw1X9t4WNC+Eheg+1y6j6D33itfT/HsP45ooNt7w15uOE4k0
         sMmJf55OcVLd4EKpm4cInOwvXwRiUJrQAZY2WKqe+CQHBNMSHCHbR+1W2rq50KwCGUtH
         2XLNs+uDz/U/i/AEcKEqPV/vzAHuyYW2yyYRhCKvYt/a2SqlkOds2hY4ynWSvEZaJU9n
         Qaor1YBwBk0kOZOXxCXtY38vUL3wrjoa8p+c+0eY+RcASl/bt0NalPtOr8HqVifk/4YT
         ejoA==
X-Forwarded-Encrypted: i=1; AJvYcCXRJeDNhNL91jVWoHOB6NdxXXMYb2XHxrwrMnilmTyTNFM3WAGTsqjcGKl47xLmEXXzaEOs7Db9KaNw@vger.kernel.org
X-Gm-Message-State: AOJu0YynKAOpF83GI5eD/dHZzcsZxiuus1lB/lj2zerSgUpwFR72UMGb
	U3aFKmtlASrfddBUEQdKSkLMWl1LBgawE+nXAIC1LM3waS65iDW2u6Et7mCRbhMJEmrGCoi/HF2
	3tNv/VeJ1u8lkAN/FzVljo6j/+4UXWatH3nvl+8D87Q==
X-Gm-Gg: ASbGnctMuxVECNJg0d9BWthqp+wwkLJsC1f+j3B/HwyDuQQRHYJXpzt+cTQ3TCD/0RI
	Hc+pe1+geuhNb+4ZfdHJguzyCQPXVzejNsUPanhxYI8/M+tQoi+L/OJnZmLN0vq3JZEeRtsNXLW
	4ks4kNIK7ACUeEPUgC8RqQJ9zJsxiSjtt36FTAAMtdbkgmTaB50eygZOjQr6WuJRR9ns/5q2X4D
	caMpEfiqM2UYR/zUnQEhGPdWI4fRWI=
X-Google-Smtp-Source: AGHT+IFauam3sdlZB9QJWbh4+GAxmh0ubz1ae25YEEvzWcWVzhEhcPdH1Ybo7BHPZBgqZuxxhl4Xu6FjAIJviWHNZDg=
X-Received: by 2002:a05:651c:1a1e:b0:354:6fe9:8ad2 with SMTP id
 38308e7fff4ca-373a742c8efmr6440061fa.24.1759307384849; Wed, 01 Oct 2025
 01:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250928054019.1189591-1-alex.t.tran@gmail.com>
In-Reply-To: <20250928054019.1189591-1-alex.t.tran@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 10:29:33 +0200
X-Gm-Features: AS18NWAMtqMUn24GGcmh7thNWTR5vUbfn3IjRIXldKz77cgiT9aQbr-9m67Tq0I
Message-ID: <CACRpkdZdfcqoX4bQfi1hFTmKPfZcumBFC4tNVrAODGWQJ8bTxw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: gpio-grgpio: call request_irq after incrementing
 the reference count
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 28, 2025 at 7:41=E2=80=AFAM Alex Tran <alex.t.tran@gmail.com> w=
rote:

> Remove extraneous dropping of the lock just to call 'request_irq'
> and locking again afterwards. Increment reference count
> before calling 'request_irq'. Rollback reference count if
> 'request_irq' fails.
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>

This looks right.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

