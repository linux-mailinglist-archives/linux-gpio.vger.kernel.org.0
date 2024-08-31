Return-Path: <linux-gpio+bounces-9504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF089673D6
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Sep 2024 00:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE1F9282729
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 22:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C331836D5;
	Sat, 31 Aug 2024 22:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/56gX9C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657281822DA
	for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 22:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725144389; cv=none; b=s0WlkM1gNyb+Qr8SV1e003AWp4iVIUYjYmeKgGZgVMe9HpAIH98SrVRSPgY+Tq/NJG7noMdnGzLvFoTgB0svmD2btxuVSrmMIQ+/GNFYBUBlHfUJYRzSNroE/mVIqIrMNJmQOaaXTSzwRVvXTowk8q/Jri+OdFgfT7kw42orDLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725144389; c=relaxed/simple;
	bh=BRm+ARDpczVRlIDf6yxchqx5sSkNF0E4CYM58sI/Jhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tvr0DN9OICGRBcJES9UAeAFLO3paNcaeXNKHKH4KWwd5v5pHUYpbrWB5bTaMvaAxhOE/h5vg8/JVgSn0EO8Z37KXHBlnuhKo/u3SbQUOFgDvYKFnbBPhz7nzCVeBsD3FPjhztzE2IpQjUaK9W/HUONGG4GY7T84kJESITab3QtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/56gX9C; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f4f505118fso34717641fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 15:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725144385; x=1725749185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRm+ARDpczVRlIDf6yxchqx5sSkNF0E4CYM58sI/Jhk=;
        b=p/56gX9C9Is0FYyastNZgM67X6ZOfSE4T/eUt7408YiZad6uJKF+tL0w7lmvP65EKB
         byn2QhjKsjebSnB2PBcLNZ9gbKClR8i4ahuV63DqhqMaDNOXRXkqBsULmChFIcWCBXpe
         UWK4dk2h0MVTGgRY66bf69LH0LtQjppvazY3yd59Yb4M8pxYWNF4ErF6e4pf/BsJUUAM
         fsTlVTpSSnfNQRZgVz2r3qRjb4Ni2c4hqc9Mj+HThEZLaKBHozxtYlI1wB1L12AkViQh
         nmoHGRlSDjfrkxAM1z4x/cFxEyNBncKJZz05zIp1SDEsd4igvYZuZF3IEwL6qhyRJbrv
         pQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725144385; x=1725749185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRm+ARDpczVRlIDf6yxchqx5sSkNF0E4CYM58sI/Jhk=;
        b=LGcrpc+3CBFWZhNvSb+9BpAiSNfh2c4+C50Bje0YYibVSGr/AeVR5k6P8Ypn2e26/4
         3fhOINXwm684fjtjerrYpgRU4TgWcUqs/ZeyoI2yWg46DUcE84BFz1UgUl4x0/XVa0/F
         eBSz7gAWffAS1hylZa4YFtbZnADZeI+r7v21lF68z2gfTqIl2Y0vUz2r+6jCG+4u29Rb
         KMgHZfmCCovQSPHGto7HJy/3maS3BT9oILyPhVwvfKyYU94+3Fu5M80M/4WYA53om5FO
         PPhIEr57vxACKXM9HPweGP2W31MfU2gPPj6nOD39kMNum4r0PfiVVxSfrHwIVN9ppzek
         EZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnPuVENSkYHVA/clMspxOu1+AYVrQqq+4mR4LiAW4YOI7NKzdnrQgaboR5XFUbG3poWkJ7yhLMDzcs@vger.kernel.org
X-Gm-Message-State: AOJu0YzmaQp5vUXshb9WWkL3eTDUvofb0CcMF22Th2ih+hJaxAhH/UZT
	UVUt2VU3DklCWR2iUoXeLybrw3Vz6q6wGoWQlbk/gdyifm5ooylqvt+D0vNQd4/Yu68wyLmbL6j
	Rm9FEP6mpHxLDU/42uK38tLFtampk+HvXMBS2IOJ4wgilMRxF
X-Google-Smtp-Source: AGHT+IEa2JRQUG0eUtArY4JUyXRBDslBLdWQtYoHMyvzPXfXNsUanKaJzmlwUkEiXA5xQcEobfjDIFVUjubiH726ddk=
X-Received: by 2002:a2e:e1a:0:b0:2f3:df8f:bfaa with SMTP id
 38308e7fff4ca-2f6265d7890mr17467031fa.36.1725144384823; Sat, 31 Aug 2024
 15:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <IA1PR20MB495329EBE498DFFDAA1EC457BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB495329EBE498DFFDAA1EC457BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 Sep 2024 00:46:13 +0200
Message-ID: <CACRpkdaoCw9LF7f9rgg2NZxmSrvUZJEgS0p0aUua75wkUwOPUg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sophgo: cv18xx: fix missed __iomem type identifier
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 10:56=E2=80=AFAM Inochi Amaoto <inochiama@outlook.c=
om> wrote:

> As the variable reg in "cv1800_pctrl_dbg_show" misses a "__iomem"
> type identifier, a warning will be issued by the compiler. Add
> this identifier to avoid this warning.
>
> Fixes: a29d8e93e710 ("pinctrl: sophgo: add support for CV1800B SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408271555.kpOmi9I8-lkp@i=
ntel.com/
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Patch applied!

Thanks,
Linus Walleij

