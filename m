Return-Path: <linux-gpio+bounces-6809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56778D3265
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 10:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F2A0B23AEE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 08:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619D816C6AE;
	Wed, 29 May 2024 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCAVZySJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AF716B75D
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716972977; cv=none; b=DrS5sy3XJbu7luf9A4Mw5vCRjX65jRX/t6Asmbh/oGKsUXKZrbhwKx5g64Joj0lHAKdf0FVmVQfHwVZG5LOyGj0k4R9MCuueA6HbByx8nriCNSripii+bRzi5afZOmXb/YDLjJY+egUSfB9JEltLqIkmKaByOr0wCgrGidhMf/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716972977; c=relaxed/simple;
	bh=DtXP8XIgulfp/10cegI2AvN9bdkVmyBIDSaD2r0yo3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKR3QEaqdjMCHwDF5EUPWgFoQcH3e3SB4GFYJ8Pr/9S1kLheimxFqWbmMb8drKuwNsM+xLcd0vtVoqnm3fiW4hkYWXzqtDMBleUIZEfwhkwfq+YNcCgoNXz/FSQQlAogDm5z+Mnl9WVzaXX8kDYR7FOImh0PvbtWmXA1vfWyjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCAVZySJ; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfa4ad7f6dfso345765276.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716972974; x=1717577774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtXP8XIgulfp/10cegI2AvN9bdkVmyBIDSaD2r0yo3o=;
        b=oCAVZySJn0LabkbubZoOkFm9noihVvMTq+14qPkPJfvqDkAbEzcsQsuCZuUAA1rVwO
         jNLs3J7jt2GAMl7h/p22b7yHiThMCfcT3/Tnp2dbRVC+/6Kmlah1+GbJwvdpe/h2X0EZ
         wRJKl/2uQL6ypA1omSn8/L6s3s7Uz8ZJ78nlRkcRJDdV2hWKlFUEkVI5soMwKUahjcSa
         BbHah58uGKLyQFhUh2ZNz0BQewR6p3GPpJflqQ0fsQqBrRvtprQXlCjSAz6f1M7fGz12
         7qaq7e5c4v5ei76/q2AoZi7vACxg5JTmlZvYemImMTUrFlfaUyRqp9nBdQKj9jaLENnn
         9Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716972974; x=1717577774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtXP8XIgulfp/10cegI2AvN9bdkVmyBIDSaD2r0yo3o=;
        b=UrTochTiUkr580GL0q2fSVhM63/OLkfwXmT170W0sfIBCjgY5QLZdd4cnhVm67kdrc
         BiUkjf/0E2UMHRPGtpj/fryRCAN/cqF2/vQfBWaxj0crPoGh7iaUoXIMd9ICMpiZZRQU
         axTIvFB9qzxP5cZVyXlsXdrypXH81GtijLlS5Ks6nmZneU9aIdoGn3K+G37o8S4MmJAg
         KoTUhRJZYahSXsgRoDAKZysO7sgKs/s+yrh5LoPIZItQoQol2XKZYOyRXc1qWDMufZw4
         Rx1Av4pRTxxZPGyP7g/oYIsBQVnCWkTv1UqiX7cBWt1q/5IKu2YXFMA9TU3mRRJe6mkN
         3xNw==
X-Forwarded-Encrypted: i=1; AJvYcCXkAapzYpEylHdU7wXrmT5UwMS+PZnx0vrBKFSsz4QC/kkOhx0E6C2+6Z5v6bReMsC4d1KPEhSVck/B5fjYFOOq+sz+BM8zWuNEvw==
X-Gm-Message-State: AOJu0Yzbr5zOINSLhumuFored/yR6G3a4zBlcPYuB6pbE6ZhZqjhWoKh
	Oke/3+pLmy+heYG+JJm8GA8yktPYZW6KzSD/qR9It7xh/oDuHlfWE66XJCpRP5S4sUel840W1A1
	J9fdHP5SZDn8Dw+MQy9Vt+Y3T94slnV1hIBMZQA==
X-Google-Smtp-Source: AGHT+IH4NQ4depklJARq4QXOQPL6SbQbymroEMtHHxC8aWGwiK8gNUj59IY6hl8YJF+EVgh8d/hNerEfUYlfaT+IpDw=
X-Received: by 2002:a25:241:0:b0:dfa:528d:e8f4 with SMTP id
 3f1490d57ef6-dfa528df61bmr104636276.33.1716972974547; Wed, 29 May 2024
 01:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240515121634.23945-1-dmt.yashin@gmail.com> <20240515121634.23945-2-dmt.yashin@gmail.com>
In-Reply-To: <20240515121634.23945-2-dmt.yashin@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2024 10:56:03 +0200
Message-ID: <CACRpkdYbYS4bdzF8oN3JGsfius+_WKJLvZ06m5T-Z+Xb5EEbbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: rockchip: update rk3308 iomux routes
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Jianqun Xu <jay.xu@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 2:17=E2=80=AFPM Dmitry Yashin <dmt.yashin@gmail.com=
> wrote:

> Some of the rk3308 iomux routes in rk3308_mux_route_data belong to
> the rk3308b SoC. Remove them and correct i2c3 routes.
>
> Fixes: 7825aeb7b208 ("pinctrl: rockchip: add rk3308 SoC support")
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>

This patch applied!

Yours,
Linus Walleij

