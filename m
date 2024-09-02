Return-Path: <linux-gpio+bounces-9520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D97968165
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7389282914
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C882317F4F2;
	Mon,  2 Sep 2024 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+i0/ZK+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43581552FC
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264651; cv=none; b=prfYm5M4jxvrq40MAtTmSE+EZ4SMh4wIsvfTeuV317jJV9jfDfxiyqWHV+/qAOj1DDnrklgGqO1PeAaYcKtQ0s7AU/bgsLwBv6QvVo1yoTCmv/ckSzovKKqmRihDl7xKc/pl466FrBslb6o8hUBPJMHf+cTLFayjBl5bdBnA9mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264651; c=relaxed/simple;
	bh=AdsGMr7gxqPB4h3d+Dvjk+7Zml3v1WnZHyQAGbwqVVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6WCZwb8xBwinns2LuT4Op18Wc5j2lxHKuWTYSDho/5KwX7dbnBDzbaLTHNdrHi6GY8d2vCxcCqVKn/7BaNfsgpUYrm2uvOZy7eYBvJIdO5ZnnoRVQGDcqNbZHEwJM1X2NAdRN9Qpvb+RjLS3MFHzWix6tqCHXEfIF9iff6tLVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+i0/ZK+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f4f8742138so42814891fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725264648; x=1725869448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdsGMr7gxqPB4h3d+Dvjk+7Zml3v1WnZHyQAGbwqVVo=;
        b=d+i0/ZK+WkyyHU9yrrkbqK+Sn1sCmkkgKZn4+qr0dY+AC6lJq3sKEpkItEmL0Z99+h
         SqY7QNHzgP7uK/4pGPmtL3zyK7U8h3BS5dS/hN38IxZoGCpiokUQydNbIVVrmXxk1bnQ
         YRrNfI4tQ6b6p+BOmY0HkG99NJT1SLLMpeVzW6qwcahOzligZd/OMV0qOitlWh3jGRs3
         BukSTUS3a0CYNZV8gyUf+utOuKHV9vGxCGWvHyXbsXPkA6q7CxoQe75jd2Mv3D1uv8k+
         htjlM3SNxixrwZAjoq7zb3tLbGnofmZMQt/kTg1x6bsVnc27O2utChlQ/71QFSgegMOH
         wIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725264648; x=1725869448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdsGMr7gxqPB4h3d+Dvjk+7Zml3v1WnZHyQAGbwqVVo=;
        b=saE8L9VSM0FjN0CoU1X1IHnXev9nAg7Qyh9bN1V8j+Ht4l3MwOI+zwFXwbOaF7/U/r
         omAaAJyJXCg6zmyB0QQ2OLyRxT5qlFbCvDq8p8gbE61tyGrqTeL7MqBLZMTODp38LT6T
         JJ1Y/Vs2WKNqHMW//wY5TicPdZtZe/B8jasOuDni3m5OPPrb/LD7Q33Foi35Ytnhbrjc
         CDqBn0n9M4vR1iQvnP0E53zBKuPchtXEba9m8Rvvm2pQtbFQgPla8UZo3cG592A50HIx
         r5RtLnT8uMKUAH0CNBjTgJM2P6H2iQPnRTTXsJuI2LwDyzYFXelfmu5WDb2R2DJjeOxs
         Jxig==
X-Forwarded-Encrypted: i=1; AJvYcCWpA156a0cNrUyDehSdKpb1CuJmAstcWp79RO0RuMEma6NhesodS4Ihrsy4Mx9wQRfHZQBvo6kLZdeW@vger.kernel.org
X-Gm-Message-State: AOJu0Yywb/fev5/skxz26IH5zaNLFJ46KqYtfMjZ18zXRSHVT2fkSUkN
	KmpU8MKpGGhgeH8EHe6xIdbKW2b9BZYB6IDoYzN+F64zfe5R8OwuCAhUVvN7QaxvQ/4/0gJOZGs
	uJk2UCModsgeTNmmKiBdpt49dIPQQ2uaKewKSZw==
X-Google-Smtp-Source: AGHT+IHFRswwBMRfpnSBGjnL8qraQNOUMmO123dAIdL8GyErVz0HZLjtXlarmVP+fTTg0i2Hc4w+tCUT7lTtDEx5+pA=
X-Received: by 2002:a2e:b8c4:0:b0:2f0:1d51:a8fa with SMTP id
 38308e7fff4ca-2f610891549mr93093651fa.30.1725264647333; Mon, 02 Sep 2024
 01:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829064823.19808-1-wangjianzheng@vivo.com>
In-Reply-To: <20240829064823.19808-1-wangjianzheng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:10:35 +0200
Message-ID: <CACRpkdah_8UAFiyz_CtoQgFKmxvJVb3tr+O3si1g4o0Mpfj6gw@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: mvebu: Fix devinit_dove_pinctrl_probe function
To: Wang Jianzheng <wangjianzheng@vivo.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 8:48=E2=80=AFAM Wang Jianzheng <wangjianzheng@vivo.=
com> wrote:

> When an eroor occurs during the execution of the function
> __devinit_dove_pinctrl_probe, the clk is not properly disabled.
>
> Fix this by calling clk_disable_unprepare before return.
>
> Fixes: ba607b6238a1 ("pinctrl: mvebu: make pdma clock on dove mandatory")
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>

Fixed the spelling error in the commit message and applied.

The remaining three patches didn't make it through to the
mailing list! (3,4,5)

Can you resend these three? I bet they are good patches too.

Yours,
Linus Walleij

