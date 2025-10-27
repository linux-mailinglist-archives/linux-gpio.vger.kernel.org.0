Return-Path: <linux-gpio+bounces-27744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A9C11E03
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DEAFE354137
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864322F6173;
	Mon, 27 Oct 2025 22:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lg2piTrF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BDF32C937
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605208; cv=none; b=RPAu1FkoTSsSx5SUoblvaWFmE7fBnBs4sPwGJRgCzyy3gs0gZBkUElZQygB0wExrsy9SPWMXgf4Ed/Vlz9aiVsgSEL24sndhdn8IufNo2tMhYxvMxsdpJB/OAqE2yz1d2v9aTwV3h+STbuWW+q+gGA8JybUYaxy1Bh0E2Jc/Wss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605208; c=relaxed/simple;
	bh=ZzWPnnOZXKXFtrtRoq6w5dfem/sBKT4+3f4vAqBe2dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/5D8l/nfquapEfWmA7MT6sjWsJnnDeLxX9tXWuuqGaQVGagUQDxROvLxvK75sP2pqipD0eiQr4D8KmyGc8tkn0vw8OSdrUql/CgbWxRRlEpfTfI4kPHOudzFX/ZSZvjT9dlIg4I39Sa+Zb0Gkk4ZtVH2VjBCivLatQJ7jXVnvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lg2piTrF; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63e393c4a8aso6292384d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761605205; x=1762210005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzWPnnOZXKXFtrtRoq6w5dfem/sBKT4+3f4vAqBe2dA=;
        b=Lg2piTrFtmJAqKxJ6VeXW4HVBFDh6ExN9b6wbHYawq9Ue/Oemy5aUWRGDAeBaUVSWL
         0qc56s8Fd9rOg2Wcyp5zDxjTU5qi/USEd/TsIGiW++zb6APOXbEZMIzQ09M2jUmSA47k
         uewJ4Baq83ac06n4Fgku8Vsi92c4YOeGAluUbghouvhpMotXvaXBot/syCKPB6w9d7dJ
         h8AUaS8h3Bvr1J0b8wRTTSYi5z8cD56NAt1xvf3jUDTNf6vNx/5AHDQPsE1qLhlgBNY8
         RNmtA2l6lI/gY/zEVglbFtpBFitoAQp/i6exFH9oY3XoHPguWYIkWFuFLFCJxrhZ47mb
         J/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605205; x=1762210005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzWPnnOZXKXFtrtRoq6w5dfem/sBKT4+3f4vAqBe2dA=;
        b=sHIp1Wli26KB9rltNWEo5z6JQN0ye9JyuC1/061kVQD1s8hsB9lco4ckH/uqeL30Gs
         5MvRSwpPjZrnuMEuqSPludFKGQwaCB5gNXhPGYRHVqcW5S9RoutOIGJSUh4RCBWdZSP+
         uiWIEs5Ub3HPWtTE+OZWfoaGNxFBDB97lmoz/o2iAaI00hJAC/UjvwRi3KyPxi1aQP8v
         8IL/boanqdgXsIm1djkOvZQY+dKY3hPofR5zODt3v2y0M/bP9QWYmHe3MIiSWHQ3mC2/
         wmV6bpFxbCJbGM7NvlOkMoNkomnY9FfiF9Fo1vVXxyVLjefhTgPKBeCW2uZAtIqb5CPB
         SAeg==
X-Gm-Message-State: AOJu0Yyx6G5Z/ULG7JHW5no7QjdLD7IM1/qJlqr5pjD+cnquWbzddPaL
	jsOvp/EixLyUEF7IUMOfD/DIhnV2Ivx6Bvc0d5bUNkoxWdMWSyDBbVJrikDys3LfjUczxk60TS5
	8jBK8lsv5dW1TKTifdatnQaKmzNqj7A11ylhast+ERg==
X-Gm-Gg: ASbGncu0DLLluZFO7ytGfAKNsbx+1h5cTQcZThq2nHHSZ7g1JBylLOTfl8ZdolJXXhn
	1/4YOsOw2N5y+kd94KlQgvoreG3JywHQXwGZ1cE3cWYR8M0eO1CLI/HQy4wQb3DvYWQV3+nv86K
	tdHnG+Xhrzxhss9p1T1TXt2S4ycMeHnkmtxXS80Ukfp5cpJrUtMoulsxWWnlQ9OccrTgTXsVjB1
	uEg1OS2JVHhwhbuqXOcyc8mySlP3g/rvRA4EvDeC/vmcKEvpVT7xHu14O0cl6cfszWMSCWvM3rC
	+YhbDA==
X-Google-Smtp-Source: AGHT+IF58gu9w/k3l8GdP1g5RlDJqG0NNSjKKeSe9p6ePIJR4FON1eLAwoxl+nhLHyhOGuGLmO/nO8EfMXRInSW0EWM=
X-Received: by 2002:a05:690e:15d5:b0:639:2794:3416 with SMTP id
 956f58d0204a3-63f6b9d159dmr1313309d50.19.1761605204155; Mon, 27 Oct 2025
 15:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-gpio-mmio-refactor-v1-0-b0de7cd5a4b9@linaro.org> <20251027-gpio-mmio-refactor-v1-2-b0de7cd5a4b9@linaro.org>
In-Reply-To: <20251027-gpio-mmio-refactor-v1-2-b0de7cd5a4b9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:46:30 +0100
X-Gm-Features: AWmQ_bmpt0BdgJRwL5QER5dmVrqtyW3pITM-90osLs6GzKPhyaRFTjOuGCubgCQ
Message-ID: <CACRpkdaYUbMbVGK-qfUMuBij=+fNfzuED=E3NTGRP8jzR-QYFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mmio: drop the "bgpio" prefix
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 2:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The "bgpio" prefix is a historical left-over. We no longer use it in any
> user-facing symbol. Let's drop it from the module's internals as well
> and replace it with "gpio_mmio_".
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I don't even know why it was named like that. "Binary gpio"?

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

