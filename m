Return-Path: <linux-gpio+bounces-2657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A809083F10A
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 23:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F53E2830A1
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 22:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218CB1DDCF;
	Sat, 27 Jan 2024 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1M6QTxM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1401E52B
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 22:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706395520; cv=none; b=dkHCHq0nV1W3eSOWOY5rOOST97+XNXtvazIKXflG8TE3VMxSOhxWFdjtwXpOS5FILFT3K+Vrcsd5EDaNjxV9tXdTh9GMfbF2oYPSDyVPy1BmuSHiNBMXl6siGl9pLJvDm1byZ6oeuPUlMXLgfUoUkrq9b6SsTIFOXiKxr+/ewfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706395520; c=relaxed/simple;
	bh=xecPV2ck7m8m2Bj+DmGE1mFxGjGKZBGhQIgMVrM494M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugJvzZjt7B0wEXsFIVaPxDEDhzDHrqnucdwjPFskKvSjjphqA5svSGrcXQR4vrHtuupNC2jT3SUpJM1Na/dY4mdKpsJAJanlGIoMZH+dSGJcDp9WRaWloQrOfeabkPnvDdaUwvVzmObkEUtZLEpKtYDxO2fQU31jtb61er5/2yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1M6QTxM; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5f0629e67f4so19116517b3.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 14:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706395518; x=1707000318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xecPV2ck7m8m2Bj+DmGE1mFxGjGKZBGhQIgMVrM494M=;
        b=C1M6QTxMTeuGuzXruYxcYuFIRvUGZGt492W0Y7vgugsMWoMu3QTtG9O4MVu/Gt/Y9V
         CN7xKjQqZhNHnvN/ONACIp7F+OEoxKKYiAwO5trI5rO67z2XgJe2jdVxS8EdQ0pDXwKP
         xQIXO00BPyxOT05N0B5PilQhKuXy0n2FUf6uVMF6VwcEM8MLom+tiVZMRIKI+p6u0kW/
         1cl8maus2YI+eLTQDpbgRb2D9sfmORWNxhtB8o30mgwUrzUtxLu2GTV0J57gPO5JlyxL
         CTCLQH0NqU6hfYKWtltduK9kpE1RKl9boNIVJwLMiIrpcA9uYj2qm2xP+//c0PWWmf/o
         4gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706395518; x=1707000318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xecPV2ck7m8m2Bj+DmGE1mFxGjGKZBGhQIgMVrM494M=;
        b=WjIDuYSJ3qojc1bpowg6zyAFVr1RzkfXlOAJY9NiFPer3+oM1cxhVNybWKjXj4USzD
         mb0Q/cuyZfvbqG8owwe8oFwmsOFYUnVmb0shRhN+XQ/7Z6X7UWnAeFawgLkEZaGCJob3
         tb0ngwWAE7p+fPzZ5pQf6kvRRlkFHeo+FnxaaZUxp1FLgpaqHnUcq3yoQ4DTSo2hAdoa
         VXmQv7RDLeWL2ceB451A0PC6bZr06ejxEHpGGyQx6NRV3IJvOtZOgB6u3iEt8t5ZTr47
         aSQuvlu60EIaF9wk0rUIa4mDFv6bqro7TB+1uP/1XN/T6SyxRhL/MCWbFfFdY+Syc2PL
         j7DQ==
X-Gm-Message-State: AOJu0YwM7CuB9hiTuCpf3pI1dx8/9hQXy6NbFyxZkBmF+TDbP191H/yE
	j4TToPl0F8ddndGU+xRmKq2x8x7jREaPqAJHPGvTejpr57u+eCLX7fCEv6IkaAk8/ZvF7DdOWCd
	m5KFCXzK+wtnoBW+g0XJpX2b6hiQVS6bZ+ChTdw==
X-Google-Smtp-Source: AGHT+IFzlJ+CaxE/jxoveHqqwzGcPTygUDN5MaqZZdcd2xMYLO9DGN9sGaPRnhYjNznjTqvzvce8wlkY1JqxeSQA2NQ=
X-Received: by 2002:a0d:cc4d:0:b0:5e9:dca:1b14 with SMTP id
 o74-20020a0dcc4d000000b005e90dca1b14mr2359381ywd.7.1706395518464; Sat, 27 Jan
 2024 14:45:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240103085058.3771653-1-nichen@iscas.ac.cn>
In-Reply-To: <20240103085058.3771653-1-nichen@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 23:45:07 +0100
Message-ID: <CACRpkdZ_3tKpgj9f=fLO9fBtcBhjVTeGxmYP3OS_AWpH+Djz4A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: st: Return pinctrl_gpio_direction_output to
 transfer the error
To: Chen Ni <nichen@iscas.ac.cn>
Cc: patrice.chotard@foss.st.com, bartosz.golaszewski@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 9:47=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:

> Return pinctrl_gpio_direction_output() in order to transfer the error
> if it fails.
>
> Fixes: b679d6c06b2b ("treewide: rename pinctrl_gpio_direction_output_new(=
)")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

