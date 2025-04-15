Return-Path: <linux-gpio+bounces-18831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C39CBA896CE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35384189DCC4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2E623F410;
	Tue, 15 Apr 2025 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NluUiR6w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7341D959B
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706007; cv=none; b=raYCchIMc4q3UpP91UkxD8IscdzLLNQbSgCeeelhwUS9+0tYwZRvi2tHympdm8NqIybDXtr7QonmzFzMDy2RY7NV9Na2IEsk8J+iGfNeXaiAvwmxBp6nMerIjDNc2G72slpXZZKViNEQuyEZA23FkioD9X4UE0E9OkkKYwpnU+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706007; c=relaxed/simple;
	bh=BVq44rUWz2Ng76u3u2UZTBQ+iG1mC9PAk3X824w7T0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gL00wVT5FcvpYZV92PUxkp0ga6cFzsXRfqME2gtgFsT2MiMozZaZim4zONVyr5t9mkI0TikfbXg+CQs6k8vX+4bFBnee+kTBJuxRo+u6+b87h1zUg0JojE/HYhPCxMsi/IpJ018ebWdBuU56jLyqHaUFsScfr9rcwjlJpfjVz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NluUiR6w; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso51127671fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744706003; x=1745310803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVq44rUWz2Ng76u3u2UZTBQ+iG1mC9PAk3X824w7T0s=;
        b=NluUiR6wPTq8SHzWY+yBbO9bw1e9QriXtkVUMaqsbbPWY1xYyUnykSLXlEli583CwJ
         catBIZhrhYGMCqlxNLWYZMDAnRoD9kCTVUcaflYHTwdCI8jIZ7JRM719IyWR3xtXqkP9
         8znovBZF6ozkKUcEFdeSJGMzT3HczEjnOnugFOvXQYXGvyQSSI4hpnr3tVtDCcuGQ5sT
         gkwkO5qWoKI+Y6Qz/Z7P3gDSej2f+9qRf6La5ca+57JWEbZp6GXn31ssr8DdyQWdZ5Iy
         pHirL6BCBm+i8nwyKgILGrpnRreepW0ow/W/GbXgqgRGgvN12LUjNIv4qiLTpAL7HQLw
         y4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706003; x=1745310803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVq44rUWz2Ng76u3u2UZTBQ+iG1mC9PAk3X824w7T0s=;
        b=wAfjFabZ44YGluActqtdOlhOxKGA93jDOatwtmJYq8neseDmqQRnMnx7Lv9cjeMWOV
         1nwwxbVOxDnVRXSarlHuwleZCMaqyUkQkAq+X8QBnSldXxPPCEM13K0gUeqwd30Vc88t
         zfGVrJBJ0ojx1Z2IgR8oZCQYcWokBr8nFdcVXah5cgBv3HmoQJFHARDdXeivL/q3Cji7
         2u2KvFlmc1FbM1VZkYE1+v8iZKnUXLa1jHhmEkJunx3gfR1VJTvZdic/k3+OnyUc7U7T
         +5fXXVJvRrzGCDsR+AhhctwQVK7GuTZwYM3wMsaQQ/VuAeFZ0yGMoBzgtR6Mnycll7Z/
         AGQA==
X-Forwarded-Encrypted: i=1; AJvYcCW353snuAvsQmzxOqkcZPH0m6PciQHD7XPndRSuHOL0B6qjoU5agory6R+4Yp5sMc+ZkRCNsllSNLuT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Vk/D4m0unnoNcc31IfEmq3aZnSJeNrWGr/vB0K27LVxaZLOZ
	+AOOZhczxu71jN7qFXRGGHjyl49+qs7HQj20+se/TqRVZU58jgCgd5TqY59Z3+wbNErJYYs4MyA
	Ykty+UB3IOAC/v/nKAdjpf6PRVcKVCaAgEY1yEQ==
X-Gm-Gg: ASbGnct56BDI1cQsT6vy6R03LD3DfC5fC+RHZ7g4kBJLjkI2TJU58gsFPLIcJWv148W
	xyVC61/FYQ3QkRJz0+tJCUFhIkNnpfGw6VFZtZdELN+rQGWxzvT7iPlEXXrZANt9WMBoiNULz+W
	LeFqM1ievwLDvEZO2BPAMBlg==
X-Google-Smtp-Source: AGHT+IEd5j3qZm6qDkFbtbUTVHnuADdbaQWk+metpqA/AlzIHuMA1sSiTw/XLml6l2Q9TnXYbPJqqjE1BZkT77NNJ54=
X-Received: by 2002:a2e:ad07:0:b0:30c:aae:6d61 with SMTP id
 38308e7fff4ca-31049a80156mr48550281fa.30.1744706003557; Tue, 15 Apr 2025
 01:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org> <20250407-gpiochip-set-rv-gpio-part1-v1-9-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-9-78399683ca38@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:33:12 +0200
X-Gm-Features: ATxdqUEnypAgX3dvdjBuXa1nxNBH1F6RCCsFWROhOuXbV9-fbo2oM-bC4KfkygE
Message-ID: <CACRpkdbjyNqiJjPkhxaWYUp65RYpLvciNyXCKzgd3n7PNgDY5w@mail.gmail.com>
Subject: Re: [PATCH 09/12] gpio: htc-egpio: enable building with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the build coverage by allowing to build the module with
> COMPILE_TEST enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

