Return-Path: <linux-gpio+bounces-11545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 216829A233C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDFBF1F2225A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402131DE3B3;
	Thu, 17 Oct 2024 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pExeC9Hc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3D1DE3B1
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170711; cv=none; b=cFXjP+EwpMgF9XofYRyE0YlIAMA95wZW5Y9OwEmXCuAgsH0Gy+2G45KC4aV61D2rF83BgLulLGeZyhO/XYHUUiIS0IObnPDVwIhIB/KysvmE9/7asLN5Xs61fGXe5weHwDTGcLRlUY+V4M5ZMihgO9KfpBYvyQK9r0nOCdWBciI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170711; c=relaxed/simple;
	bh=aLH7OvsOxUR3HLTNUe4piVOzHeynBPMA8XfCziKa29A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bARaQpOMVoyZ4owQirTY7W3j6CUqdkqOegAVvg5tkx4pF8EhOV1lX8ndZr4Q6/fSL1dA7se8U+l/ik8Pec1K+mQerQVlhgPbog9FFnwGhFi9idCArM4GN4+N+rsxIpcAg6rsU4icq63YRB+PRqMcRNJkgoA032IN1505CXSoI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pExeC9Hc; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so10082011fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729170705; x=1729775505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLH7OvsOxUR3HLTNUe4piVOzHeynBPMA8XfCziKa29A=;
        b=pExeC9HciYEFfNZmn5qfftyaoppmm5uv8usNTbFg/QPS3dehG2VzWjTpD7UsyQjhCW
         yEnxh8PN4eJW8gbs+3CwC7NPB9/w7GSLuOpWAhv99lxi0pPYNiU2XHxT1DIjFIHzzwDy
         7sDLXRZYg56+evuQuctwEOPcmeXv0KsWnsHj/GwAzCFwldgdVG/vnqN21/UNasSkXI4h
         101NjmzInx90KAxISZ0/ZyNMTuUu0C8cvk9AXvNQnPYyLpW6AzhrT/Mkg1TXADL5/c+6
         4tSqtW/lflygakVzFzdOYmyUM0Zcl82PmmN1QnCxTxo7KbF9uiQ4Xtm7GAYDZf2g0dTQ
         AObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729170705; x=1729775505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLH7OvsOxUR3HLTNUe4piVOzHeynBPMA8XfCziKa29A=;
        b=VOAfJMxd68pKjGC65QChTOP6ze2TlMX20CSQcaV1TZt5yY2Lu+cshg6hjqntKA5O9a
         dKm2hIAXOo1NxW5kEe3tstAAqv5+jK7hWFdIsX3JCvvyChWdKZ3eHGMQq0ZIPrSCcQLA
         r7NGn8Sp27/l1sT4aagzq3beDyMpsaND2G78k9J6SV3OqIaH3pRgP5W1tZnhRGedRI2W
         UWu0CkqvGw2u5B3t42d3aZS6rd11YbUMM5zZdcURMSfR3Kp/5vOjkXz/wCpcrbSYHGb0
         tU96YpEDKO/Zt6+PwjGU+QTscmXntPObT7dnPcvkhOqDDVK93NA/mOwDgV2Wk87gfqkD
         U5LA==
X-Gm-Message-State: AOJu0Yxl6Lng6vOfbon+zE771H3WmvMQqyT4g6RJurAhaoreMuZgzUCd
	b3ZOmor4pPwlmTBzG7L/5j1f2x9647FCQ6I9JAdVQEpJAneUpCqeQh1SI7nFns5vBGnbeSVs/1+
	nYDWq4s/Rv1TGonH3vt6gxbYKvGN61ecq3Pi9Hg==
X-Google-Smtp-Source: AGHT+IGeczUw0X+jpBNy92OMjij6ePEZ5fWwDiYlvhidwPPcE35grKujR1BomvUIeWB7B+SgmhXrxKpCwxOVWLw9fkw=
X-Received: by 2002:a2e:b8c1:0:b0:2fb:4428:e0fa with SMTP id
 38308e7fff4ca-2fb61bbdf56mr46303941fa.36.1729170704854; Thu, 17 Oct 2024
 06:11:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017121447.73754-1-brgl@bgdev.pl>
In-Reply-To: <20241017121447.73754-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 15:11:33 +0200
Message-ID: <CACRpkdZ83=ivQrq2Sr5kk33MSSNrQXw6Wx-kwmF_hBCdFgeLMQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: max730x: use devres to shrink and simplify code
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 2:14=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use managed variants of gpiochip_add_data() and mutex_init() to drop a
> label and lose a couple LOC.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

