Return-Path: <linux-gpio+bounces-9120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7150995DE8E
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 658CFB209DA
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B3F1714B7;
	Sat, 24 Aug 2024 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="biHFKvVJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E138FA1
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510836; cv=none; b=Czb8LzT8VKBaD1UfpHrEEvEwgzGQEc1PQOykzC7MM8Dq5ORZNtpUGCI4fIPwOHemilN3sST7s1iAwKTyh1MepDKtS8Tt9Z+JADmKHiMo1wVkJ6s3GASi6E/TiAqkOizxVMtiAN6bzudQVMvpuTwZcy5IlVIDTeFA2hT+5TWgb1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510836; c=relaxed/simple;
	bh=VxmePK1MR2lfFIOHVIYLSnRBuh/pse5SImux3VQ2L0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrdOXKdRx01MOe+Fw0npdv5C2o3xdzcaPdgMg31C3LE7kWT/J2d28az2WC+f0AsZNrMzRe2P3saG/xKKOaUITgy1N6Hbdm0URxucveu+Z9hpkCexHJLjVQkDPudbHfHI9ScNTyOTCsHStpEsVAxAtwIe6/KS1bf0BqXQRCOF6WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=biHFKvVJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3b8eb3df5so29259541fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724510833; x=1725115633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxmePK1MR2lfFIOHVIYLSnRBuh/pse5SImux3VQ2L0A=;
        b=biHFKvVJtKG5yIDMHAtzqg7rmfSJPEM81Rz/CI6Gbwqm4HplUVpCQZRBhqNeDfsAEd
         YyHmIpTomL3QIji+ESQhKWRXuX3/9RXlluNt7rZ2C4ufXRXp9FIYIs6OBLjA0wZwuUPZ
         pUC83y0VeIFj/6cEy0r8T4IZ8wNULV8sffKUo1BWt/xr2EwLgm+3XDEX/6+e2vMY1yo4
         MiM/vYlZ2oNCn/6JfSBrUdFSuvlLxRfz8pHiIYqQzbTCmgrY96lsGc/a2Y/bGpW39efr
         zaQ+rIyEWIMpLljFUHkmGNuaSQsvM/wkDAXVeTGVj4JVJQWLThmaYGxcvM4oeNgFReBU
         Yl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510833; x=1725115633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxmePK1MR2lfFIOHVIYLSnRBuh/pse5SImux3VQ2L0A=;
        b=ep7qyfVDDKRgq+Sc7XhJc4IjB3R1sS7f1I0vlLVqEe8+7/X4fz6+l8h/W4ByzNJRQd
         cAqVFqYxAX9FmB92O4lx6VcALGA0xYcADx8ASYutvXdLH5pVqGRN556FnS3yEzf81GQ8
         poJLBLRXGl/yLBV5GWfCqEiL+ZcnoyW7i6V9VQudQ5tSrjd2ufoOTdY0VWTr0JwkBeH0
         MGJG71qZ8DRDKxKBdYXn6ik7rNXw0mn3mZ9SUqwWsohdR2w1Fo10j72pPHQmSEWMnFt0
         adjRbPg+3/uOLWzGeLicPNMNeccBmyGeYNZz6btD9RMB6FJcuG/MWTnarSS/43anpSt/
         aGVg==
X-Gm-Message-State: AOJu0YwanSKld838wMJY6223M8RvY9hGc8vUHGOUM8np1BZVb+mD0zFA
	9I2ECRlUdVGbi4PBsfBV669OJtybOi3fQEhozXvbK/qWSMOT4YRBfbCMSWIl05SOLCRK83QhViW
	y8qJLoz3uIBHvMuskiGRxyNOVkm+en2piErvZdw==
X-Google-Smtp-Source: AGHT+IE2mHENN/zOrvG7aOdqBwUXQbceX1qjSYkYZP6RbiQu47UeCJukYn/GyAu31qdflvCTn3ooMOoDWrd6FY4SgaU=
X-Received: by 2002:a05:6512:108d:b0:533:415e:cd69 with SMTP id
 2adb3069b0e04-53438831ee6mr3220445e87.23.1724510832107; Sat, 24 Aug 2024
 07:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820122604.42736-1-liaochen4@huawei.com>
In-Reply-To: <20240820122604.42736-1-liaochen4@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Aug 2024 16:47:01 +0200
Message-ID: <CACRpkdbN8yDLqVVCJQkMtOz0c99ykqDQwuh4gEE1TgF_Fw=fvQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: bcm2835: fix module autoloading
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	rjui@broadcom.com, sbranden@broadcom.com, wahrenst@gmx.net, wens@csie.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 2:34=E2=80=AFPM Liao Chen <liaochen4@huawei.com> wr=
ote:

> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
>
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Patch applied.

Yours,
Linus Walleij

