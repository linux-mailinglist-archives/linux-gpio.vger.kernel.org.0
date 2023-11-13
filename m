Return-Path: <linux-gpio+bounces-70-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D947E9E44
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 15:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A0B4280DBB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDEC210E8;
	Mon, 13 Nov 2023 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPhazqou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B613208DC
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 14:11:56 +0000 (UTC)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A40D56
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 06:11:55 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-dafe04717baso235231276.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 06:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699884714; x=1700489514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJr1OXkuxnT03SCv+djqBRWs+VoPNnRqt/gpqMoKcS4=;
        b=dPhazqou+ayKP4zGXmB+bzWYXpFj2na6UysngAOocfO76BBDDfHgFB+8GVn/2Lry4k
         l0qmn+GxKZyYwtqjvecGw+Ji6JZ0bXN3uxrtoznmnRbVVcrSHHxfOaJ5mQa7dIvEX0KC
         NDnFpoDTBJQdKiXKOKDJsAs1zzTN0pTT5XY8Cz3KT/faS2rTKgKlDUH61ntJFT8XJv8n
         BPsZETaP6WEwiYNoVtOkqT8bvsuAJhbD/yAuKf47ZEQrL04tn1wiI7mtyTpVJ+Rf8du/
         0HcLl2ZGTe48CmWBa/e7lFjIipbFxLT1c99vqSeo8Q+rA/oNBwelIwpkeURr68QYfBKa
         Hq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699884714; x=1700489514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJr1OXkuxnT03SCv+djqBRWs+VoPNnRqt/gpqMoKcS4=;
        b=ZNWle1b3/ot/7jLAcsrlcRskvrcieKRG+Vud0q9x/S/TbXI5BLVkcYKo5BDKhz0gpW
         RiifUQqEr7AjMJErIlxmXwmnow5EvFdlL1Y0sjFQFfTeMuhGEV5zBvJWrCuke4MHJyHv
         CiSjztkd3IQaIqeQJCnkUANGE4qf7LnxxvQ7ZO5fS072FVOgE8ooKDVJSz8335KH1dvl
         o8fAJhcS9u4MVdbXUxbeXA2BqtS3hWwtAD+X50eRkydSHoaG7PdCOGI9GNh1ypzGmfMV
         Xq8U9hFs3K2XoAcH/2Ej++Keif6RKJnf7PYoPo5ngE8qNlBCbCkIvkPfR1X+rICgs47q
         ENsw==
X-Gm-Message-State: AOJu0Yx9TOOgBZUGBnfCu9tRbTFjIISsGGyToDqIzxFlb6aL6X1im87e
	e7Pv6mYwQ6/sJavIa2eFldFSuIlWCTnPHyU2vwXk7Q==
X-Google-Smtp-Source: AGHT+IHOnTJi2b1Q0iw6JudAumqU6ptqzEHKAsTPQMqY6ERd/tzWqcc2NMGHeiZAy1A323D3e8TLe3gaGaKgn7ddmRc=
X-Received: by 2002:a25:d196:0:b0:d9a:4bc3:226e with SMTP id
 i144-20020a25d196000000b00d9a4bc3226emr5511950ybg.37.1699884713789; Mon, 13
 Nov 2023 06:11:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20231031095014epcas2p2814fa2bb5f940ccb0d0951667df34f98@epcas2p2.samsung.com>
 <20231031094852.118677-1-jaewon02.kim@samsung.com>
In-Reply-To: <20231031094852.118677-1-jaewon02.kim@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 15:11:42 +0100
Message-ID: <CACRpkdZRMJgWkLwKstpN_9=VGutbE1wBv+X_a15RJ=7ddNtbHw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Introduce ExynosAutov920 SoC and SADK board
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jaewon,

thanks for your patches!

On Tue, Oct 31, 2023 at 10:50=E2=80=AFAM Jaewon Kim <jaewon02.kim@samsung.c=
om> wrote:

>   dt-bindings: pinctrl: samsung: add exynosautov920 pinctrl binding
>   pinctrl: samsung: add exynosautv920 pinctrl

It is best if I can apply these two separately once Krzysztof is happy
with them. I hope that would work? I don't see any specific dependencies.

Yours,
Linus Walleij

