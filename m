Return-Path: <linux-gpio+bounces-9156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 393D995EC48
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E45FD1F20FFC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B8613D291;
	Mon, 26 Aug 2024 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASfzsf84"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319AD13C693
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 08:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661826; cv=none; b=U8GVznj4izjmqGPKJGc4PVivocVXnPsfXTpPTMoOfiloIGr7ydCY2E5Tthc3aEj3GC5rpzJ2077Oyva06YwMdt7+5gEOZCgWi+wYgFid+i27tT/BNCIyLsZYmDqTI6JwlWlDiyHWR5IfU8h5hZbnro4V4bpIfXHyWLn4onGtyes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661826; c=relaxed/simple;
	bh=usDRGHjYoH2Eb1/rWVsYCToPL3nAPYOEug0n3l3P8zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAnMws1jJ7mrCp96kk3DDvJfxz9YIrR3giVolVUu55KsZ8gHowaEKYoTiUfirD5KfGE7dmZ8RrVon3v1qK3UmUCagY46WwS+Y9HmIWDaFhbDHibifXiSgdE5BQuKL2rgw/Cz0J/i/bCHf8YvXtqMpOHs4RgiVlDdl8JRzyJkK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASfzsf84; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5343eeb4973so2932697e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 01:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724661822; x=1725266622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usDRGHjYoH2Eb1/rWVsYCToPL3nAPYOEug0n3l3P8zk=;
        b=ASfzsf845MQ2ug1YLhMNsKapOsBT10x+lujSQ3a/M5zVjNyE+tO7bUYJrPTJMEKB8y
         9mqDo7GkGxpKt4c5UmghJuFBbc3s6CdFlh1lLhKplmW2q684dPDquMVaejV0wEnyAByY
         IRwTvfikxQD/Upk43RfwHCWC3kyfS3p8xYx4OMaPfK834VTomAZR2we8YPI42ZTpBpz0
         M+a22xojpzdgowj2IzUVbLGFVwIFXkp/s57dcRPUf70L3gPU5QjulxUony+q6812hOuj
         KdHShZX6L9tVAJnRwM1tOQw6zwps5KzApT4b6LCigPuooyB8oR2lc+IAyy22DTqVmHTH
         8zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661822; x=1725266622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usDRGHjYoH2Eb1/rWVsYCToPL3nAPYOEug0n3l3P8zk=;
        b=dTo1haYn/G0a7l5Yj25uhYTQ4qDG4XjF1Mq5HFiWRzgSaBJYOs5diSMCUH7WxodUSg
         MwCAaEEpfxyNxTx+6/zAji4hl7xfuD7mkbsJLa6x69ru2nlVZ+G0331m3N7VNqYjQQnq
         jK7eIayWhi7FvxHPamnCn9G/Jyq4iB/+ML6sOhiVX0rf7DlR8GkCqpK2D/G635twf3lk
         O4MhC+6UQD51L1DMLJvFTA59CDv4G1xxdL3F2Nvbp6yQ/XWQOIQJZNt+yQ4AXSOYC8JT
         Auoi35GzUOf6xwvAKj0ikGYKttog+90L1H+y4QxJ9k1G87OtP/TwUFk1MoTofRwi/gVS
         g5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV5Wh0+ySYDSxJjV2PRnAUKVsBdlDsB5EFONVVJPnImYnR4PnMHzctE9oviROU9jhtJ50oNcXTOgJi@vger.kernel.org
X-Gm-Message-State: AOJu0YwVo+kPS/0uCQr/ujU50nlA9QTrhhMTtQoZPlSLSn81VooB0u2d
	uBZQxB/00l/yhn0NZgittO/PdzM7xVK+Lb0nlA+wUtvoXnw4HIBvkU9N+bhA6smotf7+OZUYqcZ
	jCaNRvRWgczCWM37cmlgRZufVrNj2Q/y06EkN1w==
X-Google-Smtp-Source: AGHT+IFkTwcnJo5plPnhMtYmhDhxW2lAptg33ugIK5nbnJLQ9OpWsCc40r4XaS/o/lq2TPBd3L9MmYP9X8UpcBmDy6k=
X-Received: by 2002:a05:6512:3188:b0:52e:932d:88ab with SMTP id
 2adb3069b0e04-5343884705cmr8992095e87.23.1724661821948; Mon, 26 Aug 2024
 01:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822223332.705560-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240822223332.705560-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:43:30 +0200
Message-ID: <CACRpkdYZSaONG6BMLv_j4Qe0x=8cka3rjMkf-uJ7WDtqc24HOw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: ixp4xx: Replace of_node_to_fwnode() with
 more suitable API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 12:33=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> of_node_to_fwnode() is a IRQ domain specific implementation of
> of_fwnode_handle(). Replace the former with more suitable API.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Neat, nice with the small cleanup as well.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

