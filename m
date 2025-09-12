Return-Path: <linux-gpio+bounces-26049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25EB54D4A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54B8D7B18C0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 12:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845A2301018;
	Fri, 12 Sep 2025 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw28qy1d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C4304BB5
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679462; cv=none; b=uWAz1Siiq7in5dg4JtPvOR1zihohjK+RPREtS1nD3vDfZLJTVNtUqzpI963kyA9INXa8ff1tBEYNqQ87383hW/2GfZ6TIsJrVgleESA5+z9B5NrgilBDC5Y2vXujV53TwZxp7GAvuMVm+4592PG9we4JaRIIbgCqN7YKKEGYRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679462; c=relaxed/simple;
	bh=pd4aahjlhiUPcExV+Rbm+9NlrXRPwfzHUZwRcgIhFKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1uUV1jvj+f+M+WjW+u2GMJ3xv+JeGJnPqE7ECqzttE5p9Hg1C6ILkfCgo4QHZsv8udZXBeyWPKOj/0byoE9V3BOqlHkGRgMLavsLHZeETTp9TuZ0+HwbUQBd6XkwBei3KmvLJkDTODxdejRbmImV1xfVtVo/taIcslOFXdOl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw28qy1d; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so1109751a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757679460; x=1758284260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=Cw28qy1dAaBkoa8v0Xg2OuQD//xdjKpHRDj9G5d+5BjTCVRNwjyarNX3N1bDvMeS/n
         w4sku3I5c3B7yfoqaagvm45OC2hr1EGNNfRbSkGr4FOWJ5MeqO2vtOKDh7lllHq67mwJ
         9A27Kc47A9HdeF8j5LY5UkPPspVChN/lrlmjNTvPJE1e1lHzo50BdIWfLOohtjSQRNd6
         UNROOvGpk0m72wUpzkXLsPqYtk1fb5NhKb+m6a/E8iguOXJpmK6x6QBR45oIm9yBCqQS
         z/x74GleHSnD/n6rvK8YMovS1vQg6HxsLx8kLK1J762UViAVpCo12Dxjh0Ucvkd/75qg
         dlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679460; x=1758284260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=dLC/MPWwMYFEYQv8w2EQZnK5s1mfyv1VtoBtT2gz8+zwkWka//+S6NmHat3irl4N7K
         XQ0Ao2iMn4IClwbG3Ad6Q4fJO8+07/oOmXBJyRGqDXlhs10V2v3QSCqXWIpSZbXABVu9
         GPNTgkqlHqmexuVOP29VDcnU2DyLEYmFAMAEs9L9nzWLDzH8U9FLsyW1ieCF4cZumPok
         Mzpd4VmD7ySRPAq/+k+UWE1q9PGTRNdeGEDWG65dEWVBHF/8NAY3Ih2WeH0AwtWrJnPx
         o88cNO3Nxc8xJjK7ZWkTry7FESghojp/jBPG/mhyv7Cy39T/Z5S/OEk4c/7jdq2sVqHi
         nlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW398Ng4KeyRG7l5oP9a53PDRCpf9vWrt/JphMYF4Kbd7DX+Br1GoJft0T5x6DS8zmRu0aES+XErHk1@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQiEJDnnZ344vfl7BXpIVrEdqabTgXDxYG6CnYCWGEtjk4Nfg
	WO416xDsSZUiYDlpuozmcsBXRVGuScO2Fv7d7SObZjQ8l3Oqiz78ghWpvB3hnrxWBdOPbsV9hV5
	/zCentu9vq5+sTr5eibUiaLBvQ2Ym5Hs=
X-Gm-Gg: ASbGncsRhTUFKDB1lO/NH5mMUh1YhleUPUdPC8KyDW+DqAB8Iqjrd7hxFrOzdEPmKBi
	t/kyN+rf7rfZzCE0hRkvXDqE1THNsbgnfaBElTpBoQJd4gFWvQ+guMfBDcY/vdq17QiIyG7udCr
	PUDvMi25FFwDXuj79jONHvCgdLKMqUzo1uBA1xeE4sGoAP5372PO4mMijP1EQEaT12gJD1rjUdN
	nptXg==
X-Google-Smtp-Source: AGHT+IFwtZ97HGjsQnwDLaSscYiXyUyWaZRXiTzaM5M046FWDXCWxB8k2YOnMd3VJ+Y3cvmtimQrX/EgHhgmJ4CE7Ho=
X-Received: by 2002:a17:903:1207:b0:24e:7a4a:ec59 with SMTP id
 d9443c01a7336-25d25678b88mr27471845ad.22.1757679460088; Fri, 12 Sep 2025
 05:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org> <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 12 Sep 2025 11:49:01 +0200
X-Gm-Features: Ac12FXy3daR3VOEp5n6tNwKkhCq--fDPiLYS4w-Toaa60ZTGN2VkMzc0b_ryiUA
Message-ID: <CAMhs-H-1VrKiknwoukGY2i0ox2VNd=pmFrMcR50mn7tEZ0pZ5w@mail.gmail.com>
Subject: Re: [PATCH 08/15] gpio: mt7621: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

