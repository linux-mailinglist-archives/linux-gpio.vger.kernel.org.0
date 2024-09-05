Return-Path: <linux-gpio+bounces-9828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500296D742
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C71C42813B6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 11:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75478199956;
	Thu,  5 Sep 2024 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pnoQaL6i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B219342A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725536127; cv=none; b=GFC3R+3n7odgoE0PguJXpLkaAxljIgcxq8Mxh34b/V4DVxDHM/ST8LosdDg+T5pflXknJK47GF/vKFA9wSMwKibg5NuS7nV6iXBLI9FFCLICpKOA7vyOV3YsyRCzYycGF63jVo1ZkKZ/kNWRhX9gDTITSGz4ZHJEUsmGzcQir2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725536127; c=relaxed/simple;
	bh=D8LOK6g38BHVUQYIn2cRYAM0mfKu91TTBAaFY8Nhf18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TY7y5RYbKd+HIAfWMYMsrUiB4YUQfYpx9YKNmjgym6gP2n3v+TISqSnFo/Z4iZ1hfsa2JYURbpfPEW+Bm/I4LvNlFmINx+WUk13LYeZmdCHE09diJrOC8FpgUImR6saQ4iZtkb1NG+ig2QX/oYwWqRu06MMxtoLex+rWHkcNcOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pnoQaL6i; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f502086419so9218181fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725536124; x=1726140924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8LOK6g38BHVUQYIn2cRYAM0mfKu91TTBAaFY8Nhf18=;
        b=pnoQaL6iBGXCUEutcL0WLBXTnd4fcV4nTFgH2YmHT4Ncu6yMjLiZG/lnk0jOql4rLX
         eDUFADaJ2cpdrndoHfAq44Bg9Gf1bIDiwrnF9382U5baKWoGvxvNzeU8vjV8P65lAdUa
         jIJ7EZvwB6qRSHdj5rWEIpO1a4XUpN21/keO/yytTPtoD7xd2mS0jEa4jYquNmkb5Orm
         mJ6xUcqPsRElA4h7BNnbqYMmRs1+451bs8P47JVt6AHs4w4P6hK+6AzD0dQzD1KZYXuG
         z7qcb8TLVrx5qw5/afXKMVAY/cdF3D0Ri7KzkonOs0wzSZRzzRjpD2SsRzsdKkUj0iWd
         Yl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536124; x=1726140924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8LOK6g38BHVUQYIn2cRYAM0mfKu91TTBAaFY8Nhf18=;
        b=iVW9J+mvawlqzH+ZPSrNALjJaCssjis/q6TiFJ4kbKrbLdDVtKMzBJDl1TAEkU5UC7
         bMcGCXImxIBqnhowFo/LygDYQz2lgLjgDXCcxhH8a/ghG5Sms8cbmjzTjePM7TjtXcb3
         I1ukASPsr2KL+TAu2qPgKlgTnK/6zrQM8ZgffBVD2CN0WJiiK0KCqH9pb4StFD8vakAk
         5MhYoMbsS0S06HYjPdpe3DQHALj670xHFEdq+lHD2DJZTgr83NXoP3xf6SEzUTiI483L
         PsLk7TMJfrLnBHJkpYu8ozq7ag97bMq2zK122L4YPWlsSt5IHUTB0ZDDPxQLErXBuBx2
         4Aag==
X-Gm-Message-State: AOJu0YwUKLHC1Bugf04dGxxI5gmj/3/SSL3lnxclNLrgwu+mSXfcqrxS
	rydSgGlXrjEUsPQX8UFWoHKq+GDYQWl90/jjDH6a7J/3lziqWkHEZGqYdZoFZaUfjj9B6PZBSFf
	yxFU9nl0CF/RIc0jBlS41Kd0srMWMSsbuYIxdEQ==
X-Google-Smtp-Source: AGHT+IH50s5Z5WFlFfNldch2QeQuYIA/dIzAsCjazzpfQvumpfx/biIviPNI+zjkOOyT+8fP2SwCgivOGNYW44aUWD4=
X-Received: by 2002:a05:6512:3188:b0:52e:f58b:65ee with SMTP id
 2adb3069b0e04-53546bab08amr16289049e87.57.1725536123383; Thu, 05 Sep 2024
 04:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com> <20240902133148.2569486-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240902133148.2569486-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:35:12 +0200
Message-ID: <CACRpkdYWPdha2Viz4v1whGcHi1J0wqThE2ng-=AuW9f9g4oQWw@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpio: stmpe: Utilise temporary variable for struct device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 3:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We have a temporary variable to keep a pointer to struct device.
> Utilise it where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

