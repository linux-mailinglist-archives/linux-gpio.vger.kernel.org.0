Return-Path: <linux-gpio+bounces-2774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3D9843880
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16A4E285B8F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED9955C2D;
	Wed, 31 Jan 2024 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FaW8yFzq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5270E5A0E4
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 08:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706688484; cv=none; b=ub7m/40lLV1MdV4uae7cg5IzSbbKm6Ou49DQkkue0mpihkj0nkNZRMCi8Ld7hSDXYrsbcEmslcC/JVprWnosOSLYhb/eqPSEjFkcd2vyxl57A2bVKyFUa09YfnvPIgnX08VVCXh8G3s4+mEKHDkczqSkc+nNdKGqGhb5LWuoxQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706688484; c=relaxed/simple;
	bh=cxJarr+Nb1HMC+SQxpSSHWDecf1r7VOqrOt12aIi6V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tjmo4iSgs6Ca8Kh7BXAL/VMC+828hmHpxEP8elre8VDdTNHZTk+HAGG2ZpL12mlWq3j9je4RkH74jdVk+nabKoA2Bvz/U7CiKVtKhFFzL/464pSf7mb7cMcXFSamC9QGH+MpFx/XfVlDQ93c5Uu593XkIDfqBODwoQxXOegy5bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FaW8yFzq; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc236729a2bso4838320276.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 00:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688482; x=1707293282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxJarr+Nb1HMC+SQxpSSHWDecf1r7VOqrOt12aIi6V4=;
        b=FaW8yFzqLAHk6J3Val1sX3RxHMgQ6e5Rv/pQ/m/q2nRMXfoNo3Ird3oytN/cYra9/U
         j74MiOPOmtG6U3e+93vR5ldHF67bf+gvyyKymfhlO7iR56iu/AcNrImFt6GkbP2ppA6A
         aqCKjsn5qm5/ezZdLxGm62KZbSDvjI4WvnfbMrqc+Jp+9OSJT03qY1sPz3TzinkYC0q+
         HgT4Nre2uiPhQbuaof66vP8YTPR9gh/BCAzTVKuLgjhklOaKsYc0jp5M4xPPoW5lD5q2
         HNoiFyOIvYMhZsW40XgSH2Tc/AF9Mxs8SQMZup/uBX4hluw7Ud874x5HYojzHNjixoX2
         eL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688482; x=1707293282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxJarr+Nb1HMC+SQxpSSHWDecf1r7VOqrOt12aIi6V4=;
        b=Yd6IXinSw5lZioBSUSvPDYe0LPoarNbUbkX+orWbnz4fUJITgVEkA5B5hw4HoVv9z+
         iXroHB8cTOqrHnMfEdYjuKeWrtG9npmoC7derD7S4ll29v0MYmaQU6z0F8bCRgc6Abnn
         N0+qgNbVRJJOYQtxpUILroj64lVQTIH5auRIdeUwL85kdbOLJuEwffZNGUK026my8c6k
         9N26bvzcdI9qGMihLDEux960Kg7mk/c51L3wt9aH1scLDFXBMQFpis34U+r20lWMoR+B
         5OtjwRH8CsLS68BDsN43FafXtZ2ZG7bOOyADid055xG5JAJ45cKv+Eq5w7t5df5kn7YV
         AwGg==
X-Gm-Message-State: AOJu0YxBSCCbQHLjcZmeWTstJF17nQVzdkX/bgG0lFlHDsg9uEOItn3C
	PK4eoU9//EZN/ifu9SZ1SQdVNAJI9oZKyeZ44kxAPJu1IaEUmKaiRN+wKUIpjkHEmf1FBxRSs99
	w7ItlgW8RtCTMcNFZN68FIAYpH5z9w/BnybOPzg==
X-Google-Smtp-Source: AGHT+IGJX0Ll/pN9RrEqTeMJ5I+KtCVrji0pP40CSJDw2wi3bOHlKyBHFIXAxoI0f6YPcwBuNm+aKN7VcP/T8lhxZc0=
X-Received: by 2002:a25:fc26:0:b0:dc6:c3e0:82d1 with SMTP id
 v38-20020a25fc26000000b00dc6c3e082d1mr436656ybd.60.1706688482257; Wed, 31 Jan
 2024 00:08:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124100606.22700-1-brgl@bgdev.pl>
In-Reply-To: <20240124100606.22700-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 09:07:51 +0100
Message-ID: <CACRpkdbHnD4wWtrQ1tZr08xB69fDySgjHCxEdHsLX-t_7Bm7Cw@mail.gmail.com>
Subject: Re: [PATCH] gpio: unexport GPIO irq domain functions only used internally
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 11:06=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are no external users for the irq domain helpers so unexport them
> and remove the prototypes from the driver header.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Makes sense.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

