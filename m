Return-Path: <linux-gpio+bounces-16999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73EA4D695
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2913A9065
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1F91FBCB2;
	Tue,  4 Mar 2025 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcmcSOmx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B38E1DFD8B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077381; cv=none; b=vFk6VMw4fRFwuPFz6R0n5+kuX1yNszpc7hrz810QIHNUvNyuF3LnSyyom/V7PUv3PiD7GaweSjPPixUHgMR5wVpXuQljtZ7HTpRq/udLi0pjOR9SllbnUw0PlMSlCmK18qUYnUuufUGtTwrJn83eZ8ayn1YmDM7r3AidXZFoF7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077381; c=relaxed/simple;
	bh=9FtHf39x70lKRiD2UA/8apbncV3WIJqKGKLBjqsPYAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8RLoUORMsUhKNOJtQJ6Er2bfIblRxpqXPevp2udVsS4mH4NmTyzTKhBczuvoMoyalPVgq6eKfTOgwQg2cnABb2RTFxk5ogS5f6RAxsqxKK51EFIKMtXQ/Gowa9XxUAk2MzkYRCbyzI6B7lEupGTVkK/HhEDVvKfhVdigOnyw2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcmcSOmx; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6fd5f8f3e8eso20473767b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 00:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077379; x=1741682179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FtHf39x70lKRiD2UA/8apbncV3WIJqKGKLBjqsPYAE=;
        b=WcmcSOmxfFaz0jhgIOyW/QMA4RJ8uAbcBt/0ILAge8F0EdMtYP2PH8s4QcB3O/qf6k
         cmCUzSYbOnQXuTJ1aiFPdZSZhu5w/biXwizZm18W4YvGBopLZBnLAwlrz+BC2yumyOwz
         Bkp/24skJbOVB8oc4ZRgYNRkc7q16fuAzAFfiV3/adAFLkjTw9Kk9sAr9NV6/69fr2D9
         DGwAEG+/BQyJ7biePSGJj9GfoDwEkVBTnMHi1bBLNR+KVjmIAofeT11MDcqeaTGCKzGf
         nLsNkJO1JZNk/Q+gEguLF5n1NXHasqup5swq+NeQQidGLUfzCtbZJgtOEM84SBfBQniB
         7enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077379; x=1741682179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FtHf39x70lKRiD2UA/8apbncV3WIJqKGKLBjqsPYAE=;
        b=kHgWGOpxrvIKTZ+3AvLPI44gjPcjVJ6r+M/CWAYSthEJEgrHYnUa+J4Z9vZ+NIwqtU
         v+WQXKt9tfkWxh4iN9iy/1dV1RrgJH6r0jNsISMHMlYBeslMXR6yKVN0Bigds194wghW
         jXC+MYqF8eNLKDvT8jyk5UHE+08AYCoV6eWKAGSEhU2LFD+Nh1rcf0Li/9ekfzSllAiP
         ALMbL8Qt0nVrVKRX0GQZUH8hwNbHUhbyIYLzmhJsWFpuMMyoGPkzFFHdZVz4Y09VBjqJ
         Rm0q9c+8BqF4m9nodH4pXTioNAhF1qj4zXy/up5caVBQS3P7gVRxo5N+u3j7cue0ztSY
         7CmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8xn6KFoRN5LU+umhxgSGwhAzo1hd59J6TXuX5f9Oypm9MbMsdB2V+i98PB+lUUeJCUICLJVOGa5KM@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfVoof2C1dEamNiEASKiKqHaP+NK1iSb/3ueqcJxjAQSuZGLl
	51xG1yFMwssGes8kuFwpOvT4Igv+p4g7T7XU1SSx6Fp0J+mIRXzoOVu8DLgf+2mNvo/X4gxyT7o
	Vqs1irgPSNdNCt8WjkArpUQ2U+tmqE6pMIzAYfQ==
X-Gm-Gg: ASbGncvQVfCVNUgEp7tbWUR/Zc9HUN6sqq83r7xm4hSYrn7M0zhqTmDnyKGyfcyCIVn
	GhrAd36mA09jE55+tz0uFTkSV6WOd98GuUvNAA9ocegC9Rmt4qiVDViDlwbjxN2zmEOIyxwKEWd
	RIYMTNR4PZpxRL1HJNMSrM8MWTPg==
X-Google-Smtp-Source: AGHT+IH7KErXBPsgkVX3+USvVKOeRbWqfmwhdjHw8SbiG+Mnf6KFFaGyDDjVlc9kwM/1WPTfhMqzFN7oiRITfnPOUO0=
X-Received: by 2002:a05:690c:7305:b0:6fd:4849:62ec with SMTP id
 00721157ae682-6fd49fd1b18mr211377327b3.12.1741077379237; Tue, 04 Mar 2025
 00:36:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:36:06 +0100
X-Gm-Features: AQ5f1JqYjcpUf71HiV3Xuo2BjX3Q_Ei7GefWpdiAzOwYlortd9elEfLSi9brZQk
Message-ID: <CACRpkdbrOC1ONZKFetvWQACmSKYopabgpCkip1ub_14XdrP0hA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: loongson: Add new loongson gpio
 chip compatible
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 8:46=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:

> Add the devicetree compatibles for Loongson-7A2000 and Loongson-3A6000
> gpio chip.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

