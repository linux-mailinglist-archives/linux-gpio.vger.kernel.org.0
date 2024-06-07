Return-Path: <linux-gpio+bounces-7266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C038900D1A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 22:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7AA1F230F8
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 20:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4BD153565;
	Fri,  7 Jun 2024 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="So3o4KgY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65F018C3B
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792913; cv=none; b=EYYtxNc0XiStu1VksBHbvNZC8hVsH8zSaZd6A+VsbqMekOAtraEU08AsL2er0qQiMZOzCDCmS/BnayZEEdPyalds4qqbxWTLXbzHtub5miTLkJudu4sTW16FT2Ba2Fn53uRMWBavoNZwMwrN0PU33NfmFYWWyaqcQ0t3eVNhzuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792913; c=relaxed/simple;
	bh=QwcbaZoQ+Yee26Jb+ql0p85dQz9bJRrQSYUy76gUCq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofSvxL0ZBCPK08af59oaWCGahuS23M4w+6sseEdaF+WsLPlEVdbwN4cc3nqWzz/nDBRkEgUGv0sJpZj3mXuj4iTM6ruSn8Vt5A6LjUer5v+XRp/e81cTnUyMehN38ow9U8j9/ZGzoviXAqOAkVZVy7s/ksApiN0Rk0DaRhkBAIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=So3o4KgY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so757056e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717792910; x=1718397710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwcbaZoQ+Yee26Jb+ql0p85dQz9bJRrQSYUy76gUCq4=;
        b=So3o4KgYFADqTBiZz6AvnNANjvih1XiGUhFyvhOhhuRmcw+Q6uZGTq1GaPDiiIZcyr
         fVdG7C9LsT2eCuhMu/HLCm2f4y0VNDGKng6Iet3DUyrN7w3Ge0Mq1g0ZEmLLRqt+JyQ1
         3WoNX0xTHEvTwa4CNl/QgzrNKoXVVEI7dWvMAW5LbFyj3miVppcmesmhpxnd0E1ZckIC
         wLDx3kLZZcTI/ljk6/RPpt19Iy4ThPgUUNPEtnNm24LhPqWdv1HBoqWBP2oyqpfjMLVE
         PthV/Wchp2k6hp3p8MvoZEQPvpc931s9609T5m4lWtB3Sy5BrN/8x71IkYgipp9T11We
         6L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792910; x=1718397710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwcbaZoQ+Yee26Jb+ql0p85dQz9bJRrQSYUy76gUCq4=;
        b=t/y0iweDvLKdB1lb5NN90VzJ7g9Zp7OGClu2DciSIIEwQXdTwA0kDKMjfCvlCBQSl7
         zKPoNKOXwNBkkDnMfPfcxFFNrfyqe7lG6t2x9WtQlkXR8ilJl+RRaZmKYRjQGTZPP46T
         5LRgCIfD2v5byjFeXrcIcEzd41IuX2JFGCGJz4D0JygzrYSHHc+PcWo+osrwCFNfrRuv
         xAi4SZjsoY1D59qrW0sGA7M7/uyFKstFdGIaB9vJiWzlk3EyW/dB9ydFU1o4isx6mmbI
         b0DloUBZPiOFlisyxhlRN0L3KuBe2vIyaPxqMDdbiP5nNxFAm6Kh1PfLRZ3nMbWOD5fo
         y8JA==
X-Forwarded-Encrypted: i=1; AJvYcCUoTvW+r3HVEVS3w9wypiVznBTcYMfBOzVEZWUCX0H6H1aIlZMjJQn1Kcay+CUVGLmNL841nsVkUzDW75jIiDQCKlUQNW/3zmsS3g==
X-Gm-Message-State: AOJu0YwqX7yap3Uo1R5McwMZySozMgw01ei1fpdpcuVPXo8nHk1qQlOY
	O+5YNLsJmHk6Yu7fbxgB6L6F0hmQAtc4T5Qf/qLxuNz159Yru+hb4wBxxqfq2+4V4QxL6U/Etsx
	/PAwmsB4M/0+NS8V1Czyi0WU8ULSFZq2pRfKzkEbsLIAs7PaZ
X-Google-Smtp-Source: AGHT+IHfCFJf2M/tFYz19u9X+qNfBNDzdDdxpEaj73D1R8VEv84ZK3f41ejPHNA4IddpcKA+3ZLPp9T4DCMairlKTTI=
X-Received: by 2002:a05:6512:239a:b0:52b:ad6e:87ac with SMTP id
 2adb3069b0e04-52bb9f8efd4mr2789384e87.41.1717792910110; Fri, 07 Jun 2024
 13:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523230619.256882-2-mailingradian@gmail.com>
In-Reply-To: <20240523230619.256882-2-mailingradian@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:41:39 +0200
Message-ID: <CACRpkdaPBDRGU=ih6YPV7CwftMV5paL4ciemBswbfM6ZkpcdRw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm670: add pdc wakeirq map
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 1:06=E2=80=AFAM Richard Acayan <mailingradian@gmail=
.com> wrote:

> The PDC was hooked up as a wakeup parent in the DTS in
> commit 71f080633d1e ("arm64: dts: qcom: sdm670: Hook up PDC as
> wakeup-parent of TLMM"), but the wakeirq mapping was not defined so it
> had no effect. Add the mapping for wakeup interrupts on the PDC to their
> corresponding pins.
>
> Configuring a pin IRQ as dual-edge would break it unless the
> wakeirq_dual_edge_errata flag is set.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

No comments, so patch applied.

Yours,
Linus Walleij

