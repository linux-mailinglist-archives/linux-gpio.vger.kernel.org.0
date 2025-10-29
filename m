Return-Path: <linux-gpio+bounces-27859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A13C1D990
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 23:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBEF018910AB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 22:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F26E2D594F;
	Wed, 29 Oct 2025 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPpqN9MU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6B82C1587
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 22:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761777497; cv=none; b=JOKsTeO0ahhkOPBmZkxBXIq0ZUnCb5iTkuJi/uGpdeRmhReJXjiU1ZgI+Dvi1Vi61dgY8hdO9TLqgsgXVxBUEzpYhO0SDB4PO8Uh/1R/zdU7hdyNOYWh3j9+ybFovuK2O27AoVh8ZlbVRLZ30cdWKv6I+ZV5vhrtAo5zP+/k/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761777497; c=relaxed/simple;
	bh=LzhhJeyhuNotVzEFbkuilK+xDg5eMa2kqkHmG2gliAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDU0P/++/G745Mr0kcbUGIEkPnsaHDUJV9JktgxZkic+8bYpU5gD674kESpzoUyBfaKTQ6HjDp6MTX77tBd6RZJZkyDLEmBNamU466yrm3qWX+XWh9Av216gV2akmTuG1ALATLPZ3CC1DqBZg59gKdZSojBRzL40wMbDy9AybKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPpqN9MU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592f098f7adso505645e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761777494; x=1762382294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzhhJeyhuNotVzEFbkuilK+xDg5eMa2kqkHmG2gliAs=;
        b=pPpqN9MUWQS8DSCB7l87y2AV8zKWw9R+G5PA4zzS7WSQznwgNprLHGK8gJKV1c1C/y
         AOZjfl9X9aMzX+Accmr8Cqjnilud1+775vvnG4Bm61ndqKKwY6kYqB1OcYQaleOdHdl+
         O72ExMWKIHT6dTI1WezuhG+5K8+AJOl5Ee1zuOYyJGJgrtEnQrG9w8noHfPozGxXcgW6
         8qtHqHjd/lAXzMrFA90PHFtY4NhL6na/qBjUgv7rKf1tp/O3ihf1RxRoeJo51KuekKuk
         mJI/XnswqodH/clqBqsqTX/ZvPBsPXpcK8QYao9oy5dkfKAg+1dG54eh4zZYB+N9IFgV
         ZMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761777494; x=1762382294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzhhJeyhuNotVzEFbkuilK+xDg5eMa2kqkHmG2gliAs=;
        b=EaWM5cD8U5k+7gScyFDbMiTlz4L0WOpSTvvEA/qqOEWzWC9BZuVR0IhO48UAVfCEUu
         MJuPrLwvPQp7FXCiDl/4y0XWzEX2LeE2ex3zIxfRNusyXj6CjDTwR/PCq/hZ+5noexAG
         ivzZykRuy24ZYEo1r1aOxgXsbddYbwKjiFCcM3limLp53U8cAyGd5BmAXhF/aVPdvX98
         +zICcPaX47Gpb4/69yXsOPatmbtR6B+P8q39jVhFax1G8CFlaUO86UYdBYkNwKxN8WdV
         D3b7rP/l3Zd5kI311279YJHOHBIwwi14daX68lS3FfYU8/WQdfTwoVDXUkNUxhpnVJCS
         bK4A==
X-Forwarded-Encrypted: i=1; AJvYcCW8wkJuW2JzH7vBZPQwdNPR49IVmESW720szGuOrYDyYydwZPRxVbuSPzCu4KhJ/rAqfd2XKmY8IvUI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25ECvGDlxb/C55EmWB86X4Xl0IvbVEGwkQI6aoIfgV7IoZ0fe
	UzfQHMfmllGVbZla7aMkUaEh34MjrFpa3eXFbqQLM3gJBqCVWBbTj1h70MNDCCrBnz4XzZqPBEd
	yHl2l/TpXogqdiP6NXYTQqIOtqmrt5DGmVUl44zppBw==
X-Gm-Gg: ASbGncu4a9iwN5JYyFj4Y4jv5Uo0bV3GJoUUZtKbtJV+yfIkQV2gyxqoqdzGu4KZGdJ
	k/vi0TRSSBlJCST0aeXSUgQTzFl6d6nAGzcc7MYIaYRR6nC2zEOG8ZtHijDgvUNkoFHhQ84V2Ox
	71NNJKDh5c3IT8tcpkbKR6LH3qrSUjLmNPCQCkFRgcJiQCPWtVBQTHe+7tIL7BJ/i82e3WnqwLR
	aT6ErqGIVqj2hZqnTuXSfYiBlg3gYcsXhw+NNXwRfRephOSdJxahQb2DxLc0Gc0q5xxK98=
X-Google-Smtp-Source: AGHT+IGSUDEU3GIah9012vj+4Pg6s5GLROpJXSNa8R5tFKJQLl26wMkX/AWwD8Tr3hAmRNfydWUkSQRxKrXdGT5PldQ=
X-Received: by 2002:a05:6512:3c96:b0:58b:8f:2cf3 with SMTP id
 2adb3069b0e04-594128696femr1551857e87.21.1761777493571; Wed, 29 Oct 2025
 15:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029014252.178-1-vulab@iscas.ac.cn>
In-Reply-To: <20251029014252.178-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 23:38:01 +0100
X-Gm-Features: AWmQ_bkwwJG8Z6hmew0Xb94qZ2C3iHp-j72hqofQeN8YiL8UtJjm3k_2tYVG6MQ
Message-ID: <CACRpkdanWwXSAu4oH9LnnTJ0mxB+7sorUKj_juFrRebhdL1WKQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: fix hwspinlock resource leak in probe function
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 2:43=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> w=
rote:

> In stm32_pctl_probe(), hwspin_lock_request_specific() is called to
> request a hwspinlock, but the acquired lock is not freed on multiple
> error paths after this call. This causes resource leakage when the
> function fails to initialize properly.
>
> Use devm_hwspin_lock_request_specific() instead of
> hwspin_lock_request_specific() to automatically manage the hwspinlock
> resource lifecycle.
>
> Fixes: 97cfb6cd34f2 ("pinctrl: stm32: protect configuration registers wit=
h a hwspinlock")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Patch applied!

Yours,
Linus Walleij

