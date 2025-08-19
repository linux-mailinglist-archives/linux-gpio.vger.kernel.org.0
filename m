Return-Path: <linux-gpio+bounces-24536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E967BB2BEB6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97665189CB2F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 10:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522952773D9;
	Tue, 19 Aug 2025 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnFwa1SY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64727876E
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755598669; cv=none; b=IvHJnfWdzBCmUAC+6Wrqjo/6FEx0H8YKCnB8H02qBt9QFTvTZLQqN7uL7y8t0D5A8w5O+XSIoUkcKlyecrRekXygBuLemkW8H6hQ4mAFWi7ElieWxmRHzrmZjKEzblbVDl7fSGO3rl/LsKhIpIwMesQU5nyasdUHVyHvqr+GPRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755598669; c=relaxed/simple;
	bh=mI+27DCsZb1xNev2FOWjFwDPtlqZqOZA1lWdJsmrtJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHxwz2GnaybaPt+ICMZwOzZYQeHekJbyOKobdY/suSCQqEPVpZnJCuEUrgLa8BnV7SlIgT3PGf6cR5r6BS8v7HccaRhltiqo5ZjsFMxE31sdfSULrsRqev/gREW8IKKfXm1IvtOik7mK3HxC/gCcpNmk60zySHVxCltSCAWQ+jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnFwa1SY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55ce5277b8eso5288328e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755598665; x=1756203465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI+27DCsZb1xNev2FOWjFwDPtlqZqOZA1lWdJsmrtJA=;
        b=KnFwa1SYqz/iacHm0j6MWxIlCSeP2ZxkHjYQ1KjS/v0zsLeTb5Dd9jHzUVarrlV5Vo
         30b7IcActYWz09MGEPQsmTAdSUzfxJ9jc4TXSRrbcjgI8He2AK1cJCYeVcFdoFEfV+SO
         yZdiPMRWjpBuK1OHSyv2SbanvQJw1BtdBR5kJ9SgKqmYCmPMm4jv8sIgbGK98z7cv24z
         bZVb9YzwqSw/u5zfumwaZ14HSQYESHXwU8+uI0FgDS7m7lSRIjt46iKzZyKfS0rkSNQy
         l/Yk+GculYFInTLMqIyvMxEG/PcieER5Viq9nBBmP8CC2g9nTy5of7nMS3lQpw/XgApB
         f1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755598665; x=1756203465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI+27DCsZb1xNev2FOWjFwDPtlqZqOZA1lWdJsmrtJA=;
        b=EqGq7466lwWLzVBMcRWRg53H2g52ed7WKcL/0ABMSqZOSeV/o+HhcwoxWd6mqP/hDt
         CgHifnwllxkQr0GLaH5UpFGCMydPD4ZA7dcOhd8EvLzz+CqhQy5+kQRu3geykN210V1j
         9olk2HND7x2mlRuy0h+4f12kpaOet3UtOjXOvWPtmvX/6valCWE8JRat4jzo18a53iXK
         RcnmRz3E/V3UQ/kswZwoNz9QYh4NUybPf9fkCESRU/044zBDP8lo1Vq6ePW+Y2bplE4/
         XwsBQxWChsc/N/RZSe3BS5UluS6C9iECl87lC8W5l9FkcdwStF1k1IZvF7gZitlGpjbD
         tbkg==
X-Forwarded-Encrypted: i=1; AJvYcCXpvFPQxMORWdiIFV6TklWVUnm/eON40KLUaK8eInsrvVNriVpQEKLqBzFDeeBjcsXyb7UesBnfv+U+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3rhUPXJw0gcwEpXea0tW4IL9lBZ5db+IiYHII8LvvrPTnGhDY
	bksMnu3Eux0DUxOzbx3sMGgmWq4NQukT0IjK6ukGIWyKOzOrY/g7hAe1azackMqOJ4EAJ69wCGb
	S6xZ4sCXbypB/4MpKDUJ8fdUQ3dr9YBWsSO3OG2INkx7Mlcfm21ThKxI=
X-Gm-Gg: ASbGncuA52ZhRhhL3Vcjt5P5Z4jC2Cv6wQPFC0E72Z5Pf5Y5IiG+VR7BxcJU09BqsVN
	1j9PeEBFgid7se0rNvU7JB8RB6f08jQmAQqkUbhvEoonWs3CyijsRWCttMFM4mOkLRBqBj+gV91
	6DnXQhkr4h06WK4XTQVWXbdei2S945f1aLQnE3ClqQhV4bfB1VXRtkKORsqCIWeb5R/GnUXhiup
	lKg8opB3bRv
X-Google-Smtp-Source: AGHT+IHiB13v6ofDRBfj238q6m/OnZ2UwycLVlIeVJlojO24mSwpVb7ABxP+Y2+pth6WAptkaxKZGGCv9O4q9eeKwRE=
X-Received: by 2002:a05:6512:6286:b0:55b:8a28:3cbc with SMTP id
 2adb3069b0e04-55e00869ba0mr639574e87.51.1755598665286; Tue, 19 Aug 2025
 03:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org> <20250812-gpio-mmio-gpio-conv-v1-1-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-1-9f43e95dea98@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 12:17:33 +0200
X-Gm-Features: Ac12FXzXb3piolgH_vHThrJa6suApvy9Xnpd7N8-_ULnt_2vbNUV0h72uiLUeAM
Message-ID: <CACRpkdat+HR6DC0xC-XzQ1V08QA6zqcp-PGPFfMoCWo5Y+efug@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpio: generic: provide to_gpio_generic_chip()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a helper allowing to convert a struct gpio_chip address to the
> struct gpio_generic_chip that wraps it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

