Return-Path: <linux-gpio+bounces-11342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4C99E021
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124152816CA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD07E18B48D;
	Tue, 15 Oct 2024 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2VwPFkO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EAF1741C3
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979279; cv=none; b=MSrDl6i6tYo1FTCs+uccTkw9oh/EuGr5cIkQs77UUD0aGY4u0YlhuPQpbItIaM/qx/nqPjmVTBVaGDYQk7WN2BKxxmxl0+GvrFY6H4kGyRp1R8UNf7VatbINjpuV1FIsRU0Mgj2iSBb/ZhvkPGnn9FUwiP1nSYju6Vnrrer65QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979279; c=relaxed/simple;
	bh=pIgO6XYwXpJc/EvDj62RGinZYW8LiDBdZLoR+q+waa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WserRouDPqsWlEgflk3Om2PPe2YK8NfcoIvnXPmgLm0Gv0TJvaJpZrIRWa492fJWWw8PPXLo72+rYphvTHLtIgiP03hnjP7yjndLRWtnl/NzgEKlqTksUhOQumxEL2DpcYflt21f8M55P3Yr1A2C/5IKETw1DZDqqSwV8SQaOec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2VwPFkO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb49510250so15724281fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728979275; x=1729584075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIgO6XYwXpJc/EvDj62RGinZYW8LiDBdZLoR+q+waa4=;
        b=W2VwPFkO2jOlg9/RnMI25ZJwEnEp4r/QMXeRkrs1lkslYJcZiZZNvNSIQM2gtCdN8R
         ZH9bCxOi5I3Ex6OpphxRmhTVSxwPBaSWYOMJLz/rx0tBp5wsHPiuEnfPb2ZtIxdcrCKe
         gFP5bRm847jw2PuxkCnBHAZFPrDuN6IS18vxnt0FZyob45wzE6qcnb34E0zUROjYVVVz
         gHtJFgT+sqDlV36It71Hscu200olgpTF4G/7wv6PjfrOyGKIZwMGAPnDOCNWWeDCww+l
         gUq3H7AWsRXkWByVbpv8t7strNHaFn5HpfCdPQ9J26Wcj72RO8Y6/mvZ0BDJP09MkRNX
         Lt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979275; x=1729584075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIgO6XYwXpJc/EvDj62RGinZYW8LiDBdZLoR+q+waa4=;
        b=MeY8CF5HuIP39hFtW4kBjd0lSdrhuM2938dM/X0oGKZF9kfU0QaYAXhfy91V93is6/
         E6FotTdQxG2ccejBlEisPDF6BExyluMj9FGVfg5iO+W4lhXABRneeRT3jESSI41HNNta
         uctTijWCNiqtStlnTSNPHcEMtBuyuCtnaPPUHeN64VL3F5ld72I0hwWWtvgE/yL94DKP
         QB5MDErt5kbgsS4oCEGg2uGmARpsMj17+fRvF1mO+obbQ0p3MF7RbPPY1ojN8Ymp2P6k
         mrEa9Gs7qnGSlZBp8E1Hvp1amc/+bo8cI0KZNlNUxJeL007GbnF1rRSAUOJxu5F1zLVW
         3rbw==
X-Gm-Message-State: AOJu0YwVBL+oR8jaPD/rA2BVgUeUpJ0Z1Kaw6/9fg7DaffErP4CMTkaY
	IELSE788jS3vrWJbukCd5B6fu16O+pU5ZnPzCW6wrvzygs5HwcXRghG4+EoGF7ADs3kVzxLxuOg
	JtQ8OvKw8dZiQjbyCAiFDq2LtxhI2vRL1bVc1Ag==
X-Google-Smtp-Source: AGHT+IGE/sCPCFMXV/AfRwSUXg7lkFjR6NSHlew0WV7C2E88OUkUL6CHmuX2QQd+Yi2duv7AODl11Uytgr0Y/xNW1YI=
X-Received: by 2002:a2e:a9a4:0:b0:2fb:2fbd:3c54 with SMTP id
 38308e7fff4ca-2fb32740379mr53333381fa.2.1728979275047; Tue, 15 Oct 2024
 01:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014092909.90607-1-brgl@bgdev.pl>
In-Reply-To: <20241014092909.90607-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 10:01:03 +0200
Message-ID: <CACRpkdYVe_SVW_o8HkJamZ_m2izKvbV5vj9qOg4eTmGX47RerA@mail.gmail.com>
Subject: Re: [PATCH] gpio: amdpt: remove remove()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:29=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use the managed variant of gpiochip_add_data() and remove the remove()
> callback.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

