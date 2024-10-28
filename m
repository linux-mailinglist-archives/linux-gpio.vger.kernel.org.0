Return-Path: <linux-gpio+bounces-12234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2359B312F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFC0B1C20889
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 12:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D524E1DACAA;
	Mon, 28 Oct 2024 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnCfI7vX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDEB1DACB1
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730120360; cv=none; b=mGzEpwSYbkYpdlvYHOWKH5IPAvjCZz4aEkZzpclzfRnj7SeEIWFPJCkpdJRH7XIfwQ5qbw0InLjpvBUcvepP8RGBOXI54thPlyvbk+8BZMjmTTFgIlVzX3K9aAs2aVzQIIAwYeKYj84xScqp7Apa4IlvSq+cyUeUhizjNvao8A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730120360; c=relaxed/simple;
	bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UthHaXuywwXU5F8q4SE1lqtJDJr9wn06SNwmB+wxf4rOSWFerUi8F1r7sRSjlGKYkj7xLhVzWziuNJpzOQVtLrvJEwguh0dTdyvVgnmbxDrvd4f2B4n3etMyzHkZSwHcYrnT1c6pXctTsIjsUP7pmlF0A45cZbt8tgpItqgAdIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnCfI7vX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539ee1acb86so4266592e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 05:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730120357; x=1730725157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=;
        b=SnCfI7vXHl6HHE7GwLtS7AXDj2CHgM0IAmvoPLalA66p8Na07OBG7mmbD9xBVYfAqs
         iRzJdHy/hbUFeGXSD/x1iy+GZZj0Xu4vmjCPYWHtH9uYIU6H+JggvMFG84oOBzKXdxz1
         PDIZBJTGJ3pt4vnRo5taMz6RV5CLooDi9P7PO5Sl9wT1wZBTv4BYw6ZmeiBBTVJyp3Bd
         N9OpLSDh2ulq3z3Ocp4sLuZerqXW5+NYhqOP3UUxlzCvKYHHSc7nvi8ay+4Vo0NjcAYM
         8SgLJyfYAOHurMJXqZGGEcLeqoy59/EhN1knvTLScDi/2+RW/Ohv+KXPssUCd0eRR8Fd
         9qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120357; x=1730725157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=;
        b=RGpmFYLcECTlLS1IVilE45FUAxHA7wCGv6TylCVUQpjg4ne3bRj17SHk7G5GAEw/2H
         jVQnmPwg44BPsU1uE82epbq4p+VmQtKAWdc9d74hOOxZwepctyM3bSAGebXwRGVJTwAO
         HZStW5Ck1izE/WrwkAsAK/wogW42b1L6AGbTETApzU24KVAee0g5NEi/pcYDmUKE2UI4
         G5FD2yKauE/yMOLkfbABy3gw22PdL6lx6kyak5IzGqcqWihFn+8Ryyl3X8SsVW4VADJV
         GgDGp9vzU9xAtNWuWqexT+NEHASbCYSmrfPdwfS1gdOBFhjuMMzuq5F9X/wWs6xaKeNl
         y0mA==
X-Forwarded-Encrypted: i=1; AJvYcCXpGe2wpfAIPAtY3S1iGebxz61liW0PfJY7MfP8Xo2BqEAc4wNOXPpJgZgVL5ha0jDd1sU5OAEUiAfP@vger.kernel.org
X-Gm-Message-State: AOJu0YxlRPErUTP2y0+BSGJaZjl3ijuZKmYKtiWhaRmMV5/yncgyFJEq
	LwsovDuhKCZ4hLv647XOXpnUN0tzs4fXMCdCs34f/2jZy9MI5K42xvGUhHkQke/lCNRATQ2ZoOh
	TAajvYYxBQPU0Ec36UTwicgj6hruBBHfy6xPM6sLZKDc9huEK
X-Google-Smtp-Source: AGHT+IGx7tfNH0mZRuKTFpu/Lt1lVaJ5wzth2GIk/zrU6MEJ3/k+kc+DMdfavO6Q5ppLTlt1sP5ACchOTuFdcWBszp8=
X-Received: by 2002:a05:6512:3e11:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53b34a1b681mr3290500e87.48.1730120356663; Mon, 28 Oct 2024
 05:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 13:59:05 +0100
Message-ID: <CACRpkdYEbczXUFD-CFpE6SYiqhwTdxS+w5+dDtLF=2BmeiJeVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 12:44=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> Add drive strength configuration support for GPIO F and G groups.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied.

Yours,
Linus Walleij

