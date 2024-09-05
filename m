Return-Path: <linux-gpio+bounces-9826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7E96D73D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2FFC1C250F9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 11:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D99C19995E;
	Thu,  5 Sep 2024 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GKaf/VLm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DFA19923D
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725536054; cv=none; b=aryknLO63y2GZM1QVbfn/fZftz4R6bzPuLPvR0Trbc6R7KJRRKw8oOrWnrwVOzlFfdllEOvpTxmyG2+DpT+ghzhdhhPd0eW8jKA0xKIDP4mxZ0ktbrmCfLqVGVl7GOP6tHlk6panmPzg6NEtd9rJ3tGD/Q9d/YCMiTAcT1cfGj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725536054; c=relaxed/simple;
	bh=bLDmb4u45gfKegGAaWlNWOEqcWS6avYoGfdiMI2tkYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ovryg92Fdy5Gvls0WnTjdtoTpuOAvL2W+JuX4vpwDzcYR7Za8o8jd1gP3xHw6KmVS5pwfDiRLohFzmHiGmoEKv1UeukDv+PuQZyrEJI8toQdT7J5agq/Tp76F1f2CKm4NtX5shFAs1nDaOrdXp2yK6zEcWCN6KmJn4Cyt2gRse8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GKaf/VLm; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5343617fdddso1031554e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 04:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725536050; x=1726140850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLDmb4u45gfKegGAaWlNWOEqcWS6avYoGfdiMI2tkYc=;
        b=GKaf/VLmLR9R5KyABurbdCPYMqKDiN5vpWjZg8r6IH3JeunxtgaPTuYAMAyPDVa/KK
         xYJOmLTyAajWX22STThoAV3fELT5CA3EttlgytVtIiM+9lqBEOAKn2hxS0M6cQIX8+Le
         XkGGdrOJtulQ6ExcnsK0F10zWys8DnnNag/1qGezcWyXsLqmacuPwCk/Kud9brUUtl9M
         MZX3y3qumVkphMx95cnrD94a9kspxFMlBrDuojZ9aQlk5pFkJBuvJvQVntqmbaVpsbY6
         vMWHlOXqDRyMJiv1anKxvHKLTlVM2sXR6HpRtyd1u25o+PpHhaBv4m3XSUS+nTSdiza5
         N4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536050; x=1726140850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLDmb4u45gfKegGAaWlNWOEqcWS6avYoGfdiMI2tkYc=;
        b=vPURnBtb9A8ft4x3UMQRSZXBncLj4TVce3L5Yybocx0UoXy6jcOXIuOhjwRmO7kld/
         38ZIliSTkc9iRkHPbMZkdNQ9vGsL9yCrB1chewMSJl+Jd1p6N/A8H4pSayYcmrkgN0Ey
         wwjmW9/WzB5Ufn1qC/UsTZIJeRLPyr6vp0IeaNO9MheRdrfyXP87Li9QOrPOUC4poMyn
         3MnK/8GJD1ZUEVtfZn+WkOi1xMmaRPJq2zAdnC1TAsumb/tB3g9SDkJsLEih/it26Rw+
         OLsTIQNcskNpL59huJc1ODywcaAzQo8aVv0QHQhF1RR+01Ow9n3DUfvS4UJWNlQBTAlx
         53eQ==
X-Gm-Message-State: AOJu0YwvOG3P4aGf9PnLewb2LLmuQBUaCi1UoSnk7GhKMW8PwqmRRL5f
	UwAf6KCJqAEHdqlv3K0t2p2K0kIDy/dQ8PIRcMiIBVz1OiR0q90N39JOdNtV154mvJNGeeu13gz
	RryGDL1niTf4qghQftQmmoYAncL0V0pxwBtuqWS3xKpoYlcva
X-Google-Smtp-Source: AGHT+IGzsgH7C+tzPtSN8VBNWiDdDaXjEPSwwJUrmvuJsG+F6lPhfUKhjc6NKXyqkx2vA55fxHGPX68sblNZHKLWO6o=
X-Received: by 2002:a05:6512:3da4:b0:530:e0fd:4a97 with SMTP id
 2adb3069b0e04-53546a55137mr16340997e87.0.1725536049827; Thu, 05 Sep 2024
 04:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com> <20240902133148.2569486-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240902133148.2569486-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:33:56 +0200
Message-ID: <CACRpkdbskty+v0V90MrP5nm=S-mqHQq1B5C07QciaYJr09-88g@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpio: stmpe: Fix IRQ related error messages
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 3:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> First of all, remove duplicate message that platform_get_irq()
> does already print. Second, correct the error message when unable
> to register a handler, which is broken in two ways:
> 1) the misleading 'get' vs. 'register';
> 2) missing '\n' at the end.
>
> (Yes, for the curious ones, the dev_*() cases do not require '\n'
> and issue it automatically, but it's better to have them explicit)
>
> Fix all this here.
>
> Fixes: 1882e769362b ("gpio: stmpe: Simplify with dev_err_probe()")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

