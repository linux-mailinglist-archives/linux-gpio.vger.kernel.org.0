Return-Path: <linux-gpio+bounces-24538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9BB2C01B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F19516CF15
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81E326D71;
	Tue, 19 Aug 2025 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4m6uvwr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6EC322DB1
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602340; cv=none; b=JAjU4Bx1nBPxuOytNTfNLl8+J1t78IMS2iBS9rAP/GdN9tA5Nj/ZN/5KqpCnEhCjtXIzR3WUOra5f1XDxwclLS5IyfLjfK+wQGIJ8U7K1wj2dLIPsD/q1qcHEE8pwxlfZkAv2IyZiwtyoUKWd/fsfHx5i6msNfc+Uw5D9KmJycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602340; c=relaxed/simple;
	bh=NX3XRbTWFhy8qHA+snouR7cCPmoi3TJ9WLm5fMQGIRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvHrSlf7xTP98JS+tnNq+OBPFCYAJ167ErAq9nPVyX+q0zu6PbzemfCURiIs04oNp4ONffIDdePCgbpUi21K4ZA/KnbpcjtUvmCkuu110tToBEiWKSGU22SqVZkKp5VfVtlLi3zDy6ojWq8uLxwRChG+4vW74BETGXMsSQjW+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4m6uvwr; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f9145edaso38204591fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755602337; x=1756207137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX3XRbTWFhy8qHA+snouR7cCPmoi3TJ9WLm5fMQGIRs=;
        b=k4m6uvwrfbMD6/e0DjBFn3My8ERgjSErOLTCtbE9bD7i7kcIwi2t+E2I5NNRFXdhRp
         IaLX7IQN3VBrx7QHRdru3rAjf3sCwZoaRYgLCp6UqWg6UGpy9/RhEXxSdYdq0H8XLA++
         L2Mmg05TjzxO9wbU5WuGsnoHyV2kXLmF2M6VgpfH46OVNDxFGNya8F6MTtNzE+9iQE6Z
         XnVdb9wCPTnm88lAWW+9yj2zgjWqq7C2p7P5GtzuQZ9b2L1tBZ3v0kXr6BsGcUPVtRpo
         GToOJx7l2xfLSJnqE7cBKmfv7dX9fQ2p4rbbybfCExdsCsiYrhA3zUtwacCqNr934nqB
         4+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602337; x=1756207137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NX3XRbTWFhy8qHA+snouR7cCPmoi3TJ9WLm5fMQGIRs=;
        b=OMKmb+8+3bWh6xn08kQocY1FVYsYJTFomWeV0SmgcMofgRH106bmBupEJwvhjgloPI
         9yQRYsD0QrGWZC2AuPDW/7eIMuPpW5q11aDDy/KeZusTedUzRC9224obQ5PfnLIct1El
         Zt5/S8QN9G+jOqGQYWCbxPG2n/94e3Dqi2w1Uh+KYdbx/FTsNpkGmFzIKbNq9KoXTKUt
         ZsAppSBdZ0tCwfJagnttAycVyvXu1/qrZdjCpJ339D4N65B5EC9DLwLUOODewkD4WqvA
         rropSMpJvdFkL0ovwcG58kBR7DkkWcBgDi+20l0a29QdNClNctJI6RWJhJWS7P2o+83b
         4gTw==
X-Forwarded-Encrypted: i=1; AJvYcCUQSx5s9VqpN9PSZ0AitNaPoutRcAU9U7RewGMRKBANOXTxiwZ4vpi45xDjGKZqWAcgpyqorXYWRr/x@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7HJxdhON63CCDPS/I3+rlp35zkRjQ5p3eiEva3Qt2DG6XzfP
	IyPz7cfYrOa07cIvA80v/uA4M1aL6fluIavhhbNJcy6kAofM3jh0I8nQ8axh+opnugB2pQMjp4K
	fIsddbvWjz2u5ypKE4XfbViKGpHnC4xO6JoS8sR+xYA==
X-Gm-Gg: ASbGncsO5TtJ2T8hn2d89lVBt16elE7YvbVgj8BBrzfdSHQZa0huyv3LvTbbhLxrvOf
	Hsu2w6lV0j3MqbETvjr385jfP1J45oy8mrztHnKqrCEgdxafQuqVstTeWWp17sQnsUZgA44IbxQ
	rR/3T8xDgQIainOjUXzI0bNBbAg0goFQ0AZIHukWqay4S4eREirDNcZKnLxm6su9+jWbhGjNZp9
	8fqWyy/ayOa
X-Google-Smtp-Source: AGHT+IF5Rxp44h9YjTaSl1t6nVA/uVTlR8ilarZVRtlGRvVzFqaYBKn1JKCnP2fps/Zf7ov8QpfkeKC1NgQ3gPZd5qU=
X-Received: by 2002:a05:651c:215a:b0:333:7e57:67f0 with SMTP id
 38308e7fff4ca-335307c8f54mr4038981fa.28.1755602336799; Tue, 19 Aug 2025
 04:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:18:45 +0200
X-Gm-Features: Ac12FXxFYBBQyI_iKlXRT-qDi4lu6GUwcftI1vT80UrnP1NXIlX22xDpuKA6mi4
Message-ID: <CACRpkda3jHWF1ww0t-wLndck4UQryAUsEeQQsX=1Q3qa-VLTVg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 2:12=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> I hit a network error when sending for the first one, retrying now.
>
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
>
> While at it: sprinkle in some additional tweaks and refactoring.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

