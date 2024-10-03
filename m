Return-Path: <linux-gpio+bounces-10796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D598F11B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 16:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9390A1C21F76
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 14:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B7219D063;
	Thu,  3 Oct 2024 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ajAxLzXc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F8113D245
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964527; cv=none; b=VJtPSPyCsoPJHJv4LL8GKX6h4Et8rClgAts5BGDGVeOAvzzJINWr6HCdj/Vk4tPcw4zRkAvKlkGk1tGxl9Kv292JiHQol6/T6DOLIxZTz064c7EW5HBmJ/L8LG+A0j/sa9dkcWH413xw2c7x4K4PMurraQg7A5oNUoSTnigNwqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964527; c=relaxed/simple;
	bh=dmBAw90LcE/efXuNJODHttzykTK2TqESk97mzA79OYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzLG3AZkGPLU5eSNTtuchuIVZkJWJeJgQUW17xILlD1iTGR6qn2IqDWCwv4UwWwZxReVjOAN5o78extEBVk2AVp8XBa5GB4wjwGEtBPAdCDDfUtWOKNT2nRShsX/8FhHZ8vUaI6cVYu0ER/UD5hvmu4PZ4rRHY+AmfgzP7hMM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ajAxLzXc; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso15954471fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727964524; x=1728569324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmBAw90LcE/efXuNJODHttzykTK2TqESk97mzA79OYI=;
        b=ajAxLzXcavnVgSFbv3OKIlAwT8uBZs4aohPnCN4VrDKmRlphmCT4OgVyVw8nrSvpBH
         VnAvyl2DJBhqWbdhwuniWUQdGkCbOZRVkjtZzlt5RXMypuemrpkY3sw0aBSgL1zExFyi
         mK9ImBrwPXvNu9qqRC9T8zic+C2NUCzmd2+HV0+c/HhDfJRVybFbo9gFS3vUP5NvQc6U
         F9dTNagVasGQHXkN8HkRIeN0Gf8BaqQ57fSoRgpYVqI0E7IBCNqgEJs2qlZpncxmm9SC
         f9/rv0yoUeAYxx26EfIeGW439U2JJTnFOsSRp/Gy+2enkAMQmi+BTNR8EebPlEjk24sN
         xtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727964524; x=1728569324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmBAw90LcE/efXuNJODHttzykTK2TqESk97mzA79OYI=;
        b=viDhwIYA9Oss6BHZ1Clsm9c2XGRHr4R65CTpWfXeowjY/omFJv6KoEcS8kxwcc6S71
         ViqdryoEceQQdzfrE3kKurM2pP91V4rsuv/h2tnw3lpmSHzV9uG2KLK8/qfwqGs1W62M
         1atxdwvWmoVvks2L7iYHazIfkWmfYkG4EhVNmo/QvUj4Xl+pOnrxOmDS68SjzV/TzcsU
         tIWH+juuFRtoTGudAUwzF4f0A8R0l7m4DkXJp7LmlXE16qIwrLywm1CdRLqzLBGZZeVg
         30o90ZhKphhxTpGdrriqDhLjfgTkQbOLGSRfr2lWmvyRPcUhsTQAOm7QP9+TumgjhrQN
         PKkw==
X-Forwarded-Encrypted: i=1; AJvYcCXHo2Q37L1ExXcxPVuIGxd6+bk8GcV7PsmwI/GYUqKl/i0oOAkYqycxBMFGFIhMTN8WromKY3wITmG0@vger.kernel.org
X-Gm-Message-State: AOJu0YwnjSJdupgw9OI1gylSJ/CnjT2TGhI/pK8egz3SSWXglk19JhME
	NNw+tzrl1clrZjJuUJZHLpNCzWqBB/su2fVTXmnI7AAyZBDqJ+NLIUIyatL3u193JfveeucrVIS
	HjToQV4Zuwol9DdwnrWfgCuRw7BQoKToCXawOVA==
X-Google-Smtp-Source: AGHT+IE4Yzk+gQd7NYEAkgJXljIayhLrOVUv/EmJ0SEtev6CljYTU6L1jsmlcpNqMNvW7F73TN7QNRiYQA7SGD6cUZQ=
X-Received: by 2002:a2e:9907:0:b0:2fa:bd56:98c5 with SMTP id
 38308e7fff4ca-2fae10a628cmr53731641fa.33.1727964524094; Thu, 03 Oct 2024
 07:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003023307.2138695-1-clf700383@gmail.com>
In-Reply-To: <20241003023307.2138695-1-clf700383@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Oct 2024 16:08:31 +0200
Message-ID: <CACRpkdb2LE1qTe8jrY=pBt2JKxMvQu-b=znjLUAMWv56jkuhSw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix Null pointer dereference
To: clingfei <clf700383@gmail.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 4:33=E2=80=AFAM clingfei <clf700383@gmail.com> wrote=
:

> pinmux_generic_get_function may returns NULL, and its retval is
> dereferenced without check, which will cause a null pointer dereference.
>
> Signed-off-by: clingfei <clf700383@gmail.com>

Fixed up topic, added Drew's tag and applied, thanks!

Yours,
Linus Walleij

