Return-Path: <linux-gpio+bounces-6724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4E8D19CF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 13:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06DCD1C20EE8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 11:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A07E16D9B4;
	Tue, 28 May 2024 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKBOir1Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E016D4E9
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896293; cv=none; b=a3iGn4JX7eyaaci6lwTqtflBn78mGo6FyB9+HzePKK9Yje/ZBUH0o2usJTmt5cymTvl32ig8qqiwH8kihiNQ2fZ5nYogictphpAxXnvuZdec0/EmuGYJij2wuZgRhld7w37bObpCZ7URZbKdLm2n1VVYowuhrpGlZ6ZqqF9JMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896293; c=relaxed/simple;
	bh=MzKOsHfMqcEbAgbro03BEkIexxY7ioREoSPx82+mCkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzuA5DWEHJj+xIYGxTLBmq8sAyZAbnT6/L1h2BgUMtgLxYT05gAxpwGVfXHWET7eGRQi2Gs17QnKYnccO0l8q4V23xCiaVXpR9jhQYJA3EkDu2CnL5e7l6TvEQ64IenMVvi3fzcvnVDMQ1GuW7rqAZCX2EPMiLiLlXF1/N7ESc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKBOir1Z; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df7722171bcso782380276.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716896290; x=1717501090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzKOsHfMqcEbAgbro03BEkIexxY7ioREoSPx82+mCkI=;
        b=gKBOir1Zie8eqOyMucZIlB80d/TU2BbtXB1S56vAhaZvADzkvSZt8MkAiZc4M3bbiN
         gpAzbo/4JQEeN2K7imve4y02j6jceLfp81qPyfvxFEleiMG+oEnSXBSUrvbnwedT0aFM
         FwaDdti6twq5ZWDFUkwniMFvLugZnYMQ7aZizQSCiuOZ8TWMYC+k87ACQhg6vX532xB+
         R/It1vqx1lkQySLV3RxmrYmMddSs2NVOUEy0RwK++OjXVrpcBhwl+UkXALk289a3Be0/
         OnszAkbh+Hpzp6mGy1AEMW7Yutc9kt7Wq4JVtHzmb4HZ5EzXVJcfHNHb5uYLwORk5Yzb
         QWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896290; x=1717501090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzKOsHfMqcEbAgbro03BEkIexxY7ioREoSPx82+mCkI=;
        b=aEjig1icCeaLE4Di3n3neOd3kjumtsKiXVBsSMgnRR8GWYu4QEg8K3/z9meaIrFJPH
         WqNNX4iQlxXcyoFwfkYW1ZdJsEyUk43PEJx0mJSBxWeOKwZHEvwIGsy0uhx1w8POpT1T
         jMYpW3DSOYMWJGGlyIyMqzyxRjocy1Rzu8B+sSrOK9+CExcKfaUjxVF2HP8d6K7Hu37b
         /YHZJiKn3Z2CpiVfazyTS8xwiRMDGbaZdcEuyNWaWkGNo9uzoP639eJkH4xnWiu/47Or
         6wxchcAu6GmOVPwrgFlyiSSUJEDIDlR92D71l+wa2iG9V1tg1cU10pfvLRcxP32ca2Au
         1tZw==
X-Forwarded-Encrypted: i=1; AJvYcCWh16A9kxG0osh/0a0ysnWcHILLGGbjYuxPYMZqvHt7MO3k2Z0XnUiOT/bROe1g9Jle6BS2ESSP0rgTOJBOra1t2kiygsvChxB5vw==
X-Gm-Message-State: AOJu0Ywx1J2bvJxHYvPC+agG41cw9pR9NgxbuadxxxXCWLMGI9wcrcWS
	bA2upQCCj372raCPm57oMp4YyXfIDjRdvHiaeSm3CBLZfggmVl1dgtobLVqQC4ctH5PI/1NHMnB
	5hiW/DvwZDKyXwa3uRy2Hnz+igLPx+mfk+0Cxwg==
X-Google-Smtp-Source: AGHT+IFdWOfI1NoIMu23ncdyzrqayVvCIbtSBXzmT1072SkezYLbTQ/Wy7WEifX1vSkdblVpJ0/GFf7VJPh29VPnHM4=
X-Received: by 2002:a25:b101:0:b0:de6:197b:ff89 with SMTP id
 3f1490d57ef6-df772269eb6mr9776298276.64.1716896290645; Tue, 28 May 2024
 04:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0109018f85002ae1-6fb831b2-74c2-4559-98f1-a3ef25e72558-000000@ap-south-1.amazonses.com>
In-Reply-To: <0109018f85002ae1-6fb831b2-74c2-4559-98f1-a3ef25e72558-000000@ap-south-1.amazonses.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:37:59 +0200
Message-ID: <CACRpkdb6kKrO=-a84NVwmQ=DdSE9KmaO5SdWaHRYi4EDxAEv9A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-tps6594: make tps65224_muxval_remap and
 tps6594_muxval_remap as static to fix sparse warning
To: Nirmala devi Mal Nadar <m.nirmaladevi@ltts.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lee@kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 7:22=E2=80=AFAM Nirmala devi Mal Nadar
<m.nirmaladevi@ltts.com> wrote:

> From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
>
> pinctrl: tps6594: Fix sparse warning.
>
> warning: symbol 'tps65224_muxval_remap' was not declared. Should it be st=
atic?
> warning: symbol 'tps6594_muxval_remap' was not declared. Should it be sta=
tic?
>
> Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405111523.9yt759uX-lkp@i=
ntel.com/

Patch applied!

Yours,
Linus Walleij

