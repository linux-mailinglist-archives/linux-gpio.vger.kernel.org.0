Return-Path: <linux-gpio+bounces-12448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 035039B8F6D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 11:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3AAC1F23CFE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 10:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B3B1953A9;
	Fri,  1 Nov 2024 10:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zQ28Uuwo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691615855D
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730457474; cv=none; b=tv49pFpvGMOH/wBCDSA4qUKDeykds7B7sgxAY/BZLU77EEkmavtJMOtbgHrOT6FlhAESIuBeuPA7W1wGFDGPDnA4t3ZBcfS29C5CCf3fsqz/ymHqXKzPMw49DT9mHJSEGTqqUXR2tmhIDsQOkHvhxOXnktuFycDRsffMFVUuxhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730457474; c=relaxed/simple;
	bh=SEXsyuUv/zpL+7o8WfbvjDmj459BwXYn7J33DO6qoB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4YONfQFavrU+kf33mdMdElK4OjghHlYQiUiVuKuzLxCuqkeGUkuVF40/oKY5HYu5fCaQx+Z6Erj+v6Au5e3PoQx/GDKPWup8vEwfHaDZj+jrRxK5e8zIzlQY6fh7dzLHxhrdKtNZE+JRtfhCJj2bK3gkshjxfAr/xPv+26j5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zQ28Uuwo; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so26123771fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 03:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730457470; x=1731062270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEXsyuUv/zpL+7o8WfbvjDmj459BwXYn7J33DO6qoB4=;
        b=zQ28UuwoPK/+f/ZhcxeIFqiu/8dd/HAIg9sfHIPXIqU9u5Uem0IeL6EvLN4ayxnTAf
         AiOwIgEFloPZmaSEGjKoyc1MLTx11gWPpUDPPzv1/VtayHfw2XZHtkiZD50cPLxHry0H
         POaNwdGwhsLsa9ldsdvU/FL13T2p5o0TtmEXf0A6xk7m+kGItxPaNG5owMpTE/dMGBp7
         ymFx+p8lGTl5auywvwOkTfZjqUCOImpWBqbfeo41Gbe+laN9D4Lg3AepRzCMrT4sd/ds
         61Hndp16LR1YCoLePJ+eYMpP2Mx3itiMXsGMZ6x25UyC0gYtCvAHZvfDOEofBolQjwWF
         9F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730457470; x=1731062270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEXsyuUv/zpL+7o8WfbvjDmj459BwXYn7J33DO6qoB4=;
        b=dOjEtG4gm8qFC2BVZKKEU/l+lUxKojSjh7BOmMiD6Ny7i8sF1j4anVAlZhMxKFefvS
         G5MJrCFOfkyX8o7n8tZHEV3+UQEl1wz44jzfhZ3L2fcSW1KL3L1CsHn7O6jmcw9yrcXR
         LK71laq3poEoMWTo6jeahRj8NVgN87m2WNuK+YEfmWNmbJpQ/meQfslIHWpRfY+0/peP
         ucf03eysAW+Oy1NahP7kzutyVNuMipntYcImhwCNYdg8aUk9iZef1ffKDoxylrNQHjJO
         HJjeeBJDb7QtzywH+US/bpa8A/tuWwSdrqjk7En7mz/0fhC3aSMfejSBN4183sjqZpY3
         Fr5w==
X-Forwarded-Encrypted: i=1; AJvYcCV/MP9RUgJ9FbMKFXUq+Hp3GVMB/L35dZmjCvyOhnrUBVxS6FBuY/J5M1PWfvv/ng87/PZovibquiUm@vger.kernel.org
X-Gm-Message-State: AOJu0YxXIWrIzEZeX08zoEui83ZiVmxQzWgp3M/UNkLPnBPZq28zNbt0
	DtVvV4R1omdICwqe9qm32bJqwkYTawlgVPiTUJsir7uYoOOdp0YXcg7ek7I+VsGOZKFVY5KV+9T
	5chSztNHd0xioVBzP/+v054Oc5s4e9++sckExfw==
X-Google-Smtp-Source: AGHT+IFZaz4OJWLcxD7W8HNFxX7PN6RytV/GkYqTlpt5BNGxxWTgIxe38KUVVWzyElDosf9w1vu77mBqJt8d82JE4DA=
X-Received: by 2002:a05:651c:12c3:b0:2ef:28ed:1ff5 with SMTP id
 38308e7fff4ca-2fedb46e4ecmr11597241fa.15.1730457470496; Fri, 01 Nov 2024
 03:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101-pci_iomap_region_gpio_acces-v1-0-26eb1dc93e45@kernel.org>
 <20241101-pci_iomap_region_gpio_acces-v1-2-26eb1dc93e45@kernel.org>
In-Reply-To: <20241101-pci_iomap_region_gpio_acces-v1-2-26eb1dc93e45@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 11:37:39 +0100
Message-ID: <CACRpkdbK9pPEzwuaZ7k8qJX0=tjr9mAKHQMjMGhouaf6d4fcRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: pcie-idio-24: Replace deprecated PCI functions
To: William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 8:16=E2=80=AFAM William Breathitt Gray <wbg@kernel.o=
rg> wrote:

> pcim_iomap_regions() and pcim_iomap_table() have been deprecated in
> commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
> pcim_iomap_regions_request_all()"). Replace these functions with
> pcim_iomap_region().
>
> In order to match the rest of the code in idio_24_probe(), utilize
> dev_err_probe() to handle error for pcim_enable_device().
>
> Signed-off-by: William Breathitt Gray <wbg@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

