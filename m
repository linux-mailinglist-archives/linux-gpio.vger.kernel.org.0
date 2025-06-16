Return-Path: <linux-gpio+bounces-21652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592CADAA1F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 10:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61FEB7A3D5F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8AA20E31C;
	Mon, 16 Jun 2025 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BelxP/me"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420D2040B6
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060747; cv=none; b=pH0zjNskVbIP88nihUer8fB9R4VUZfbQlTcMDj/0eVvIwdD9waMigSnjI/2G3Ow0qUtL4ub52eBtZcy9Y/fhtWgu3YxvXusTTTwncoruYVKtv3rLTp/UqgyBEWvAXOIc21htOofqUhn1HqyPU0bsX4/KXc672C7JDeHt58vB5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060747; c=relaxed/simple;
	bh=1T6IjBkkCJHFBnh407HmUfHb7FioXPddTUWWBz5WE20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9p5qAyoLl4AXG2ToZgqtWOjJl9JRNByEAI31FTpZtGiqCMCLYKQouY7QRieLzT9hcvtv51c6X/Tp2TgAurYqqWlLGx3aZL8Hut1Aj0+Feq3FDtSADihLm1/khvXERMyNPVxANA9mHhTH87WHPiynHFOUcdSGnWB82rvpNdt6Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BelxP/me; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1039102e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750060744; x=1750665544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2If63ODRfbrLnHFFfJzruxm7jiaMfANCbY2ty3Qo6Q=;
        b=BelxP/meLxsFS4kqLnYujCEVSd5BmNUvX7G6XGN7v2JCcDp+yXOwwZau74YvLiZcIi
         Oz656V1y4Rxyxc8HE8IV8OMW1fcWactlh8/Oxbxj8hrIbOsAnN3lV3mqMhr+LJZiEAmX
         zPLEj8dkPiDPbj6IElDEAB/E3gG8fXIk51mXfI7+XWcrLYhzFd7FR02dcGWuXLoFacw2
         c11z4lM2ksjyWq4RGpLqK3nXdIJA0w19Ju3/XlnydHr2Gbnt52/sQ2K2ip+As06ZOIR9
         I37wocXsD2tnTkebEWMgLf0Flz5Jf4fbwZws76rhyqldiJX7WBSPYO605NKeb2M4Z1Wn
         Fljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750060744; x=1750665544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2If63ODRfbrLnHFFfJzruxm7jiaMfANCbY2ty3Qo6Q=;
        b=Nv+KjtuKz6bL8r3isHVPgD/en6KYKLsdRu0IdPIlh6uJNgKl1PeaMMR6mTaAhacWBH
         HvU5cOHO8Umi+475yjyQBwG8aa1R5wRJTfDcC11I3XWpcrJqcFdksqZy1DCYrORd/ExV
         giG6Zwq0iXd4PsohWlhq4h0x6nkEHfz776eVTPQSuqfr9+/tKKiFox5Ut6NEPMggTOq9
         XqRQ8uJcVgLEtQIx4FTHavHinTZNaeeKFdYkCQE2a7MucMZ1poxyxd3wMyDudYrmochj
         rUvfjV5nmVbKJ3OGjGwIlMYjgOs/PBYmpWQqLF++Y/th89HAkxDFGr4EmvDHp3PB5XEj
         V1yg==
X-Forwarded-Encrypted: i=1; AJvYcCXMi/mHq8sFccvU+JESicCkW/XhNU6U3mv+EUULrvxMLCYIoFYRMaS97f9BRplKaLtrLqJzddG9MaBB@vger.kernel.org
X-Gm-Message-State: AOJu0YxjEnpuwiGBfEFxg+3FODo/wa5hmN+lS/xIovc4Vz3YWQO/u1Gu
	9u3H2cy5HbCa0AZmzprO2bz7KzwC0/aq7YloR3IdK+uqL68R8QlUUL6bXmaGSlAlxojNwDP6UYm
	zkbmzNZzCBtpKsHSU5YDjTqwcpkIytnjhCfE7OUgbokXPxAo6ieklvCw=
X-Gm-Gg: ASbGncsXJbA2byknplJlPOWuVLWG7VW6iaA5XHHAL+lmDxOmtvEFWEVnlAUUVrUxdI5
	i2kSl0Ke0Axh9r30SEQCSX1UpXu8E0q7DerxZG5UM0eZjV6xwZRglTtBzkuAeQl2je+vOO7DAbs
	zDtAADl82ONRSR/u2tbaUTEBHfYFR5RJ+/03kfBtqI16BhgubSkzo6/Lb8UlqhRL5/DBIUpAKtO
	jvHKEDvJBnmow==
X-Google-Smtp-Source: AGHT+IFLwE4JolYrqDY3ucORLYbsDctWANWwZn+tNURixWHAHEPOkz0T4RT3JCHwLsZUBmNxDU0qg9OgbnLEQQotids=
X-Received: by 2002:a05:6512:691:b0:553:268e:5006 with SMTP id
 2adb3069b0e04-553b6f48e6fmr1780051e87.55.1750060744234; Mon, 16 Jun 2025
 00:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613163443.1065217-1-davthompson@nvidia.com>
In-Reply-To: <20250613163443.1065217-1-davthompson@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:58:53 +0200
X-Gm-Features: AX0GCFtnLMsiIB7hgD5na3cNfej1HTSWmpdWk_0nyRo1gv66sbuxt9MHDo3g7SI
Message-ID: <CAMRc=McQ-dAdt=eAkk+j+5qs7ZyVDuipE0ptQTrbmGHXf9jjKA@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mlxbf3: only get IRQ for device instance 0
To: David Thompson <davthompson@nvidia.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shravan Kumar Ramani <shravankr@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 6:35=E2=80=AFPM David Thompson <davthompson@nvidia.=
com> wrote:
>
> The gpio-mlxbf3 driver interfaces with two GPIO controllers,
> device instance 0 and 1. There is a single IRQ resource shared
> between the two controllers, and it is found in the ACPI table for
> device instance 0.  The driver should not attempt to get an IRQ
> resource when probing device instance 1, otherwise the following
> error is logged:
>   mlxbf3_gpio MLNXBF33:01: error -ENXIO: IRQ index 0 not found
>
> Signed-off-by: David Thompson <davthompson@nvidia.com>
> Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> ---

This looks like a fix, does it miss the Fixes: and Cc: stable tags?

Bartosz

