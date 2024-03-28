Return-Path: <linux-gpio+bounces-4751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D6D88FB3B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 10:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F4011F28819
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1AD7BAE4;
	Thu, 28 Mar 2024 09:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XIcCcuFY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4E86FE07
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617729; cv=none; b=Ej7gXIv8zzO7FDFJ342HGRl1HYms2vuMjA6DJfwQtoL/1fVNkP+0ayetxPdNDYh1MDTP2Ts9fEOCw2Jhdz2+GFn9eLYFDFRBTL576nZDfA2TEaiEPiQ0fyRAaPZAaV5Inw/9UjsRmgxsQ36qveIRXFYFgRcQlaAr6nJgi7W3A3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617729; c=relaxed/simple;
	bh=KmM01ktywWehktxODkpSjA7WCyV+sF2XwLnzGhFtu0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VFgPP7vPLnK0KZc1hWuTBvea5SONM4uzKLKL5GPz5C88G4LgYk5jJvC4N51fEjEoITWmhOakfOIEkGLxgAzLNNt+a3x2e63oosq2p8t+p/3yN4P/EAn0q2JfyC5IWSnjnlxSPv7dT7tAGpKvHOqmswS3ICOZAIXkKBQsBN7bs3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XIcCcuFY; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso756843276.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 02:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617727; x=1712222527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmM01ktywWehktxODkpSjA7WCyV+sF2XwLnzGhFtu0w=;
        b=XIcCcuFYo/ZGzlCsA9S6F/mv6nJyh+xdp9s6IRpd0uzxm7EEV3a3rWTvSBa6TcfHZV
         XYkLHKgR3yQpo91TmXsbANVBsZwKRykqrRGN6SCfiqjOdi08P6qW3xvmLiYxEWPu4ZIx
         TT5WTHUFDxwsbuQi4U4QCuMV3nu+CV2BmK63Z+m0LYJYhbvakRxfzSaV4FOUV9fBp1zU
         /Qow8jJDSmKQNo60AmPAo4F0lATgKkunvHiGKCbeNk4NdjzarvW4rwzbl6E1vf8O4PR1
         n9vIXSntHrOjsXe6q3rre+0PBZS/VlYZoN3V0aS+MkWG5tPOximAgqlyjfYJiA0Zvj/M
         YUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617727; x=1712222527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmM01ktywWehktxODkpSjA7WCyV+sF2XwLnzGhFtu0w=;
        b=A/TzFSC4WlFvkJOebM1+I9Hzx/mmdXXfHaKL9yxn7gESsHxq5dFSYYpweDcFM8yeMd
         ZQRfo45zGQNI4Q2dSuRXu9teONLrEetYickgA9cIpBzLpUQyO70tZ6ekXrNrsg7DljFD
         z03NbWAAXVLfYIIZBV+dDWtDP4hRVHdFCSzpPjcoZdiDM4azXAMieRjmuO/dv5YBBcIM
         J1WRUJQhbt9vkF02fMzAvZb73qc17Z+w70Xp5/AKO/VwiFqQQHh0HtVHY9qdZ4KmcoCY
         DEHHheKMMisQKtquMQkKMFzZPhh3iMEetFOGI27t8lLzy+STjOiQpMgsGVgfngwhYedH
         t1/A==
X-Forwarded-Encrypted: i=1; AJvYcCXnHneTGATZjGfUbes/SjwebKXIeWAd7v4XvAzy0SuRXsqZxAflw8G9imXmkl+QNNiz2nzOg9ksrvGQFehKXqzP5eUOLhbljavVpA==
X-Gm-Message-State: AOJu0YweMJFQG02iB+wdo8KGUha8srsKV009GhGxZGupHV6xGA9kV4mA
	Ni/VV+4ybNVAqFN4srpHIqxWhYyTzC0FCwNMSoBpQLV/FkgOZbldmNEGjBj/EdXYJ2v/39PJSP/
	5ImvuzDh5iPFOAPGnZ999wRsyPk9VXfCoJislwA==
X-Google-Smtp-Source: AGHT+IGySaDVmJFg1Xn+UuYwx8+Ype6KnAhYqICfy2/PSAfH5Gv9Rq/+PhakcOkeIpkT04dMSdTGtY+WLZOt4y0BmHM=
X-Received: by 2002:a25:68c1:0:b0:dcd:c3ba:d788 with SMTP id
 d184-20020a2568c1000000b00dcdc3bad788mr2378061ybc.47.1711617726741; Thu, 28
 Mar 2024 02:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313235422.180075-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240313235422.180075-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:21:56 +0100
Message-ID: <CACRpkdZUnmnLj6ZJ8_p2tyN4txCA1fkSvqPo5gTqi=v33FToKg@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] pinctrl: aw9523: number of cleanups
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 12:54=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Just noticed that the newly introduced driver has some leftovers or unnee=
ded
> customisation. Hence this series. It may (or may not :-) be sent as an up=
date
> after v6.9-rc1 for v6.9 cycle, but TBH there is nothing functional critic=
al.

There is some speling mistake making patch 4 fail according to kernelbot,
if you rebase on v6.9-rc1 and fix patch 4 I think I can just apply the lot.

Thanks!
Linus Walleij

