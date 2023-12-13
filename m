Return-Path: <linux-gpio+bounces-1375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B08114BE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2C4728282C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6F02EAF1;
	Wed, 13 Dec 2023 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sg+541+8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57EFE8
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 06:35:10 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-677fba00a49so54438466d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 06:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702478110; x=1703082910; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KTNi7dR+svtLHr9EuyRcDA6UpdWYvTWzjT4RYlMslAc=;
        b=sg+541+8zoRqfCoVuuIghcwZCGZAVzR+QvKWoNdUAkV3UR3j2Htv6zggzTw/6BtkZV
         D6Fz3VvD/wwNPs8TBpH4UCukTtp8g0V+kxNyWaZ79Al9+5szwuxdZsQ2dERr+l7SDXZE
         umAoyKWkAsuGmNpP7TAGrY7Mqw8hA0XHJRdb7WCjHSbWHWXngUVl0e0N1kfx/u9Sdn6q
         FL1bT5WFMUJwdjDYcC9+R3ao+LY6xUqMhLknyz9NUaRlNcXjfySly7DZZQRLKX5fCSUx
         mPwGsVHwFbAFSpNx8m6LRYCXd0ZRQhCVsIMLeUbhfb6BQTtJWlluzRTGfcBllr1rCAv+
         R+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702478110; x=1703082910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTNi7dR+svtLHr9EuyRcDA6UpdWYvTWzjT4RYlMslAc=;
        b=WpzjeUb2Glbkk6X5YFVR+SI25nmMIc0LIm0wI8t/wdc3QuLHAZcar+v5WFYEl0b65w
         UDdEPnGtYi0X2HiUTx3hjCEDBVle8aJChteXax3WLaFl490QfCmtC96XkkzJTgpfiCCp
         jNGEDVPrv4whbjRYxWgkZZu0nQ8OdfL2J0hAFG2kurPqRRUfaHjMqLRuajgwhf8iYPzE
         zO6lGDKIPafKQ7KdMUG49Er3CVc+H63Gkue71PRoRT2R/pCYXp1YlHd9oHgeuyJ9OuY9
         zUIu2DWgcRqBM6bmSjZIP9ltUGv/bgIRTx2kN6b8NIh30NCy34KFHnF6GLpJsZQXa1KX
         uTSg==
X-Gm-Message-State: AOJu0YzJcYWAlm3hXj6d4TrQoBqCAFo0PBBEStaqNwMXUkW5U58LpsOj
	6eEWjRlegzpvgy4fASFLct+yUkslgJIuJ7zhHeiWgA==
X-Google-Smtp-Source: AGHT+IH6ErSqj4HVtA2uJPaby1dJ9yyZlKr4jTaQrX7sGd+lhiiTWLXuE/j7czQuoLQh4Qis/8Wg8Qzn43NmjP/zrwU=
X-Received: by 2002:a0c:f992:0:b0:67a:d9f5:19fc with SMTP id
 t18-20020a0cf992000000b0067ad9f519fcmr11200900qvn.28.1702478109905; Wed, 13
 Dec 2023 06:35:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-3-peter.griffin@linaro.org> <170247795662.1093374.11352509671907840697.robh@kernel.org>
In-Reply-To: <170247795662.1093374.11352509671907840697.robh@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 13 Dec 2023 14:34:58 +0000
Message-ID: <CADrjBPqqTtimdR_twqqvvzyMAZ=Z4YoVKm80LT_utqcO6LAgOA@mail.gmail.com>
Subject: Re: [PATCH v7 02/16] dt-bindings: arm: google: Add bindings for
 Google ARM platforms
To: Rob Herring <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, 
	s.nawrocki@samsung.com, willmcvicker@google.com, gregkh@linuxfoundation.org, 
	linux@roeck-us.net, linux-arm-kernel@lists.infradead.org, 
	kernel-team@android.com, olof@lixom.net, linux-watchdog@vger.kernel.org, 
	linux-clk@vger.kernel.org, alim.akhtar@samsung.com, saravanak@google.com, 
	will@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org, 
	linus.walleij@linaro.org, mturquette@baylibre.com, soc@kernel.org, 
	conor+dt@kernel.org, wim@linux-watchdog.org, sboyd@kernel.org, 
	robh+dt@kernel.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	tomasz.figa@gmail.com, linux-gpio@vger.kernel.org, jirislaby@kernel.org, 
	semen.protsenko@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	andre.draszik@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Dec 2023 at 14:32, Rob Herring <robh@kernel.org> wrote:
>
>
> On Mon, 11 Dec 2023 16:23:17 +0000, Peter Griffin wrote:
> > This introduces bindings and dt-schema for the Google Tensor SoCs.
> > Currently just gs101 and pixel 6 are supported.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > @RobH I removed your 'Reviewed-by: Rob Herring <robh@kernel.org>' tag
> > as since you reviewed this I added the empty ect node. Can you please
> > do the review again?
> >
> > x# Please enter the commit message for your changes. Lines starting
> > ---
> >  .../devicetree/bindings/arm/google.yaml       | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob :)

