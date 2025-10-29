Return-Path: <linux-gpio+bounces-27792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AACC19F4B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38150400116
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79F8329C71;
	Wed, 29 Oct 2025 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cNCyeeSy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8F3112B7
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 11:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736594; cv=none; b=LGeZcO4FAoSpiEM6mk3DWWMMqaGnDQi2cPiFSLBqpQPYpYebbWjHs0naU0OE24Rcg8yJbdWLPj9JaKucLrsAPdkBap8D6FHhGu2kdD/71cfiScdLn9pgUSLrNQWdYcNTmXf4F3DJXIXY9C5GPIBrC6c0LQlZrSJSIr7Fq6FaCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736594; c=relaxed/simple;
	bh=xeF25thM2PZPH5jzTzq98NGYuyp2mVeCEN2oT8n+yjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9DJ7owEDvdV27kBhXq+EqmJV/qOK4pgAyxbkimLvkBLHpYI0mthpvMk72i2Qd3d9JrLxevcRifeH6pg6zoXhGDsuaf/9+W+xJMx21cNnsq86o6mIQQX2I2bnFl/aus+KBZahtRnZYNVfE0QusKz4Y5MUnahMXlu22E2VaBUB/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cNCyeeSy; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-592fd97c03eso6732130e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736590; x=1762341390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeF25thM2PZPH5jzTzq98NGYuyp2mVeCEN2oT8n+yjQ=;
        b=cNCyeeSy1c/ns/q2ev1M1GRICHpQxKU3b0FsCkG670ToMDntZwMdj0xQiE5v4fNqcg
         MMWjtjENHlbFgHbIalUWWaw97BBFsloJWhPGBPa+ywJF0ZtV6ai0YCIUpXfVdgktGDu5
         8agU3FMUyzEXO8EPq824YTnHkAmlJI7DG1/zHMyEOALP5SY6Kn/6C6Hz1LJ7UUcs2gFt
         9ubSzwZh2F7B+wg5xiaenquYpcKJ6oyrz1UIGaCS+McKsqIU+noZ2ToJDqp0/q4Y28Ht
         nlB+DsU+QAkVxOEQgAV7EZW+xw9CgbHIpsTjO0KOlW/hGeHMhChrElzuHJXUr+10ZdK3
         C6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736590; x=1762341390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeF25thM2PZPH5jzTzq98NGYuyp2mVeCEN2oT8n+yjQ=;
        b=IuZJN+hmxUr79fnbzxteeFiwZ/LR9sl7ZNTnjNMCnvHQe2Z/IExIEPsTA4VPG8doCR
         2EoUUfR2CHlu7UpibM4dbsXsSMdn7igv2kxro0Pk4uE0xw2tOOdb0+fviVsBCw7bvR3Z
         Tid6fwD7A+9dIBfm1FKm+5c9ugeDMwDXCfyeXV0P/DFNTd76HW1+jg/CXYYjKGfLtj/E
         wnLTrqx9p+kdZnTq31ByYwnGd6wYrcAodbQ6N/vy5nSjcet5ahVMitZGGj2qRWr2uIfL
         6C97mOsX2EjCsLnuGgB2ZUdTefwwNJdwK6KAjnscZOjrwiDU02YbOZ903X28o31JJrTd
         u08A==
X-Forwarded-Encrypted: i=1; AJvYcCXybHj3takQl1GXS6B3X3SK3BK3193cUhmSBD7wgP/lsXvNJJjpm0RxclOH/FzDg/Ly+Ns1WOvymnxH@vger.kernel.org
X-Gm-Message-State: AOJu0YwQVtvZigQmBhSypSjbW/aDd4ov0itO/uTokBJvYZeORv7g0d5U
	BQMOm3Nu97BtQ1K+07sfblRb9QLabUM9TmqeQ/x+wow/BVZ0jWtw/EHlGRr0hvrHsG0ZivhYA6b
	9x5GGTIDabYXbjG8F9Qyv4yQ2N0mo0NjQDLTpMTh67A==
X-Gm-Gg: ASbGncv+boPNlrF5clGBwgnM/SDkfwKtTok8bcwMO1bL9JdmY85GQnSyc7zojho01BS
	dmZtaAQ6ErMSo42gxuJBzd4thwc41/D2kuE4CpX3iAXiseC9jnoQwKsbHGxCs72zeU8Lmp1sQDu
	hEZRH5qkiaCAPAN1P7EqU6+F+pdR6yzGlsGw9F3fB2y9aW+ldxK8iimM5WphAi+dvKV3mtkKd0z
	caNVmm9LFgS3XAjQtOLtEsEVZmpAWFAmIzzXBzY6nOM1RjsTOH2dydLJY+WddzaLhh5TlPHL/92
	p9kmBJpme1jIAgQ1
X-Google-Smtp-Source: AGHT+IF/PPqVroPx/2tFULvtimKphv304ar6mv/wspGSpJtcnQw2H6jG9Ib/QTIpk1kNC5MMvSUh9nk2G1XqNVILan0=
X-Received: by 2002:a05:6512:234a:b0:55f:3e82:9c7f with SMTP id
 2adb3069b0e04-594128dc455mr1078602e87.51.1761736590136; Wed, 29 Oct 2025
 04:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029062050.4160517-1-raag.jadav@intel.com> <20251029062050.4160517-3-raag.jadav@intel.com>
In-Reply-To: <20251029062050.4160517-3-raag.jadav@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:16:17 +0100
X-Gm-Features: AWmQ_bn6vqgzrVesD9W2JQVivGMWV4bU1ue1SAUFnBIzZij3ttVsyd0m_kSvm1E
Message-ID: <CAMRc=MdsF6VoKrHBgikMreS9LDNhdwMVRvr=TrM211O37YuFqw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: elkhartlake: Convert to auxiliary driver
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:21=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
>
> Since PCI device should not be abusing platform device, MFD parent to
> platform child path is no longer being pursued for this driver. Convert
> it to auxiliary driver, which will be used by EHL PSE auxiliary device.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

