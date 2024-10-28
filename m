Return-Path: <linux-gpio+bounces-12227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A09B2F09
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 12:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82E8F281290
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 11:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964921D619E;
	Mon, 28 Oct 2024 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtiIxZNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576AD1D5ACF
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730115416; cv=none; b=g8jqf8tf9DfOKUYQOpYVxmWaTyberhMSlUcvhWMLxOt0BL/RTNgmpzH1xdvNHO2E2wYwwQ585Gb1aG1W/A8hofYevsfR/nszh2I3+pbE9kX5sCTxGI9J+/8luSNyD6STv5Mv9k1bT2JMTg0H8Cep99OSiXDfb+xFqDZDOrvWkD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730115416; c=relaxed/simple;
	bh=RArrHGF2YIg63gV/XEn/Mjgwbf5E87zkb6MWL2Cs69w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMSkPyoRwK1SaRssrCUdzd3M7Uo7cFO4xLeJrGdFx0XH4tVFwxfQaRWJ/qlLzSN73ajKHfUgtYLfN9Vqs2SLWEd4RLKk9J4kmEO0xegWDHzou7OTTpuoW1OVIk5UHwUQc3Ed7sCoR+FTB2Pd6ldc4tufymv/EmB/GRig1/+dBsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtiIxZNz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539fb49c64aso6853793e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730115412; x=1730720212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RArrHGF2YIg63gV/XEn/Mjgwbf5E87zkb6MWL2Cs69w=;
        b=vtiIxZNzPF6iwiZiBck99Ic2G9vV+W+nP9ux4e18AY1rQ2vhpQulqE23yACVMsgCRX
         VdeiTxi7A8ZJO1RrI+EAoihg4kXTvVHxwyhDOlllnRX0gI3fXrgpWa38sHfbngNxinN/
         sRZZofpFaVR4mS3FciCGHXOAJ7zMaTCQHMQyE7KvcR+RkZTx3RESsGdlfV3t5wDo+mSc
         3zLir7RWvmhHNHhD/KsTxMD/zBcyJu/xMw/2npZUEiGaIGHeer5mu0WTUewjA6Tp4LcJ
         Wv8EIGyCS6+Yq1oaLMAWaZ7IIwiV2KmL5BPRZVSTLx9bPtKfyKyjy71705ZaMEOOndII
         TEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730115412; x=1730720212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RArrHGF2YIg63gV/XEn/Mjgwbf5E87zkb6MWL2Cs69w=;
        b=XJIaIKHL5bYGNXKh9FD8ZksU4obiQ0AFxSNGASOWB9QFcIWxYHmd5PWF+rlvjaAGzi
         hE7YzYU5lZ1D+o0kCt66YKvoVpk6MhAtSpesoMCg/vUHEjXJ8o5vIn4cHVNpoVkarU7k
         uIS9urKbcnG1BdkkTXcJGbRsrtpPqFlwj/OxRmVASoR+RMSzJF9o71Yjb54uctI+Y8PQ
         uZ/Ckfit3GPpyWmZfJvLL2utDkUDRxz9Sucv6HcsJlU2lulUVgUpj9IE7JHWsKKST4tv
         pKhhBfEvFhwZ4hmyuCwm6pTtTHSUVuy2c9MsMi6GugUDbDhOuBsCHn0Gxy6UuYTsiMfI
         2IUA==
X-Gm-Message-State: AOJu0YwKV/kNP5C8LQ0gjiewgp9n+c+MTLdAybwQ05GvX8vDrKO3HTYK
	yS+f0cFy0KfT1TnBEaVPX9r8gMaWhitRvQFdG85TeMCmPRFhj8pmhBPxKAcgKaGwkIBBR+5JW4r
	gGAUfUsMqJqMHDpKYLDbGmhaXryrKjWKwsARF5cjagtxySjvd
X-Google-Smtp-Source: AGHT+IHCQ3wGv8ZOcI+3RyfHBAwIMvlM2QesKjoj+hXCwieVABwtxCo7klOO7mF1F+OJkyzlIbwSliMQSyYprcP+Nck=
X-Received: by 2002:a05:6512:b8d:b0:539:89a8:600f with SMTP id
 2adb3069b0e04-53b348cfdefmr4961269e87.23.1730115412461; Mon, 28 Oct 2024
 04:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014192930.1539673-1-quic_mojha@quicinc.com>
 <CACRpkdaAVE8VMNCFA4jQ1+YLuC9=4mc9Bp2PRxeNFQoHB+NJrA@mail.gmail.com> <Zx82vLyD1JMv4Cx6@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <Zx82vLyD1JMv4Cx6@hu-mojha-hyd.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 12:36:39 +0100
Message-ID: <CACRpkdbCox2VcTRRwN4EJ28SivP1R_bF6nAV0kMimDycZTsa6w@mail.gmail.com>
Subject: Re: [PATCH v3] pinmux: Use sequential access to access desc->pinmux data
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 8:01=E2=80=AFAM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:

> How to check if this has passed the criteria and not regressing anything =
?
> Sorry, I have not subscribed to linux-next mailing list to get
> regular update.

There are a number of automated build+boot tests going on on linux-next
and no news is good news :D

So far it seems fine.

Yours,
Linus Walleij

