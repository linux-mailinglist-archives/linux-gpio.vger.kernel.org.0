Return-Path: <linux-gpio+bounces-15985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969FA359A4
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C6527A04ED
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC8022C328;
	Fri, 14 Feb 2025 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJst4X3S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025B229B36
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523804; cv=none; b=BOX7LqG9gFP1qdXYQcGhgcY0sxIFSu55cmEbyFYWq0x7Fs9R3in2fpHhHLLkBbj9FG8YmP5rb/kdg7rRTzOIn3wLk1tX+1ikj21HaQJtMAKngm1DWgQxbnqU3Nfv69URPMHooKR6iCvy08gvsPC/KHT+NMzx5TzILmiIafYS1nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523804; c=relaxed/simple;
	bh=iTJc0cMLK8/kUGnVlLkEpjMd1IDc2KhUACzQgpu9b34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7Yk5D2JE0zKx6fPIeRW/rkQ8mJ/81hcDMT7+L0BPeaSV4M48JZWpDcz3BXlzjWI4IZ/jfK06U94S6GmSpjCx2nzNYI8JJ9C9VARVpx0FKrosE3IdGzNhllWHiWyg92ZrA30KbkQ4lmHfj+KUPRL8MjavCtY4WwsnQm6UQkF1D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NJst4X3S; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-308eebd4938so17559441fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 01:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739523800; x=1740128600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTJc0cMLK8/kUGnVlLkEpjMd1IDc2KhUACzQgpu9b34=;
        b=NJst4X3ShKfYilNvdBaAeZUSsNND0v2If27aHRsb398vytgj3Mv6zvMZv/ElAHtpAd
         gEi16QAbNvI3UrPJTZxa/3Nf26mrJhW7hS5aDIZxPB6dH3tJwSl3LaZGQlIFv6sX5YN/
         uTEJlU6hbBbDAfkK01+kD57zdhE3+3h3ipqeEh85BMtvW53mFuZGjhNEn8Rp77g94DQt
         N7IDS8voyAohHxca/hnh3RypNejTYYyyFGd76f82LbuPfZV0Rp1VSi845s9GCykNLV90
         5bZNXCQt3QkKGIiVSjsqT4q+NC9GwlR2CTT+Osqb+8YLtL1gnS+q3zde+7v66GAOm1wS
         NUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523800; x=1740128600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTJc0cMLK8/kUGnVlLkEpjMd1IDc2KhUACzQgpu9b34=;
        b=flEH8qOcyH6iUvcdytTGFoCXtdygTrn2ToxXTIY3KV39L0WDo6RBw199UbivKFZp1d
         Y5ghNQLJautGmGJ414cdqTtwxYaDS3DsXQKhLGdn9SZDtfyYoa5J27/ZDOm8+0DyJb3i
         8wDyBwXJy6OyXgAmcsAip2VLHrccf5qXGORmBv1uENXc+Rcuxh5WT3Pv8xuFmYp/TdOG
         jXaDh9pos+EwYNIKLPV+fHyrrtv1/oy7ccCubkPZ/X1MujqPdMYsUeKF4kEzCnOR5/jr
         O8blMP+Dn9DZhJHw6VAym4371CAMda+AJpGTOCVFPtw25hYEBDrVMUOELw9BJwYXZHcV
         y7vw==
X-Forwarded-Encrypted: i=1; AJvYcCXb15TyIbiDtfHVNelELPG1rVznc3G86YoQaFl70wFIsr65nLeqyOY4UadoJsfxTb6JwH3sTIAiQoy4@vger.kernel.org
X-Gm-Message-State: AOJu0YwPgMO4cvK/b3Yv0i/ny8pAsaWc3EILVZ5DA91+dOg19sJ51YnJ
	xU9PfahE1FkkrOaaXpm/NOTJbqMqyG1W0EyTLP3GamAWtoy/Z+ozhVLPYMxWYLcSrdwtaA9YBDI
	aixWS+JrPPgitVG/NoiBzEevCoS40WceiYDdVJA==
X-Gm-Gg: ASbGncu6CBbC8NaH9rLnZvKdyjSMAEU50qw27eG9C+Y/LGTNoSdVG2wmG8IVsskLcpN
	uP/0tPN/pKiQOvOYYxwNG989IlbZEKuABpSz5YsZcaipYR1RXHFQruSXmNC/JB3l++2qd6S0j
X-Google-Smtp-Source: AGHT+IF3HDdrnSW3BLW3bq9cqh3LStu3LTvk4uCfYArhbMCiGtiuvWWNtxSZE4wwSFlSY9sTduBuIBS2XR5LiRCWzdc=
X-Received: by 2002:a05:651c:221d:b0:300:3a15:8f1f with SMTP id
 38308e7fff4ca-30903927410mr38426071fa.32.1739523799914; Fri, 14 Feb 2025
 01:03:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com> <20250207-bcm21664-pinctrl-v1-2-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-2-e7cfac9b2d3b@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 10:03:08 +0100
X-Gm-Features: AWEUYZn7NND4I1Mgn5Kpd46GvIrBPpNFG6Ldn40L_YZFFLWpE1zhxOGmLe4jdWE
Message-ID: <CACRpkdbwVdEa_xgR=wRfkPN2_tpYGnbdpQkTtvgDMRSKPT-GEQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: bcm281xx: Fix incorrect regmap max_registers value
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Christian Daudt <bcm@fixthebug.org>, 
	Sherman Yin <syin@broadcom.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Stanislav Jakubek <stano.jakubek@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:02=E2=80=AFPM Artur Weber <aweber.kernel@gmail.com=
> wrote:

> The max_registers value does not take into consideration the stride;
> currently, it's set to the number of the last pin, but this does not
> accurately represent the final register.
>
> Fix this by multiplying the current value by 4.
>
> Fixes: 54b1aa5a5b16 ("ARM: pinctrl: Add Broadcom Capri pinctrl driver")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

This looks like it could be causing regressions so I pulled this patch out
and applied it for fixes.

Yours,
Linus Walleij

