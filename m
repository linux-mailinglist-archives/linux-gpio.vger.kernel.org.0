Return-Path: <linux-gpio+bounces-26480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7831B91C17
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D2E3B9691
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F3727F747;
	Mon, 22 Sep 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="upE/o04j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8827B357
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551972; cv=none; b=NcJiMubOq7iCVuGkehXVvhzJsG+5V5d9y/DzAmUWoEFe9W/JUFRGxLNzmlyPB6jKxPyfAVGjMc7ULRka84pUyxjAocPAzBHS/Toa76PI1JdLC5DOVgZAOPXgTUeuT6M3mJilAKu8QUqSIZuFKw3zWHvL7CYbHG2DSB62+rxj6NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551972; c=relaxed/simple;
	bh=SY5ndTouHYO85TYMtS3rItkA6PmFt4sAaFql6bGHo+U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDW07zZskMR5la6LNCUr/KdYT1aOe0RZtra1HY7USOa0zfBhO0CurXHFIB1LU++XNp+LrCqdGDluxKm1OztgM+hCZw5oCr/4+MUkx7Uuv0v37DU1aaWfl/LJ4epxYzuomVFAW7zXFD67JsljhR1JrwU8vlAVHz/amYH1q26KF38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=upE/o04j; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-579e9fd5474so3832598e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758551969; x=1759156769; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuMIE2ms3QVxnv90ClTm3T6Kclf/LBg+/ECjxaxeKT8=;
        b=upE/o04jt1TTSO9bOez0ZjGh6VcyyLwJHfGO991SCMEej8W9xIOBOQ79LVHHKLO8Yy
         woZcDeJ0PRUdJtTcvAk0ZefWPw+qz3QfdctJheWtymbnP526f4yq2ax3vf6b2qxPEanv
         9m7Hhv5hvQ/jE+FdAYtuFzNVeNqYk+wnoP/GCFUf0K/lBPdhM4DwKqRaafZccW6bWClY
         za/vY+RTieRBSmrUIvfXrJI3MCgjJ7OX/imNrzztIAL4GuODwem/UwyzcGa+WGeYTfWt
         G8eWDDBK+EbX8hZ/l7/HB+UdboW6qWGowzsswkBoKgf8tv48zhTDrzwb20bSFbrkz7ro
         +bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551969; x=1759156769;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuMIE2ms3QVxnv90ClTm3T6Kclf/LBg+/ECjxaxeKT8=;
        b=aP3t9qdkmp6xrKpg/UDNORJrHD07bOad/ifmyR3qo0m0lnzh/CyAoIYtibDdlbXalj
         cISa2TEz3DQ+DO3VPhmFkOa+UcQ3zIlFrKe2LlhjR7UQVVCjX+tCty2mD0s6rSKyJM1Z
         +14UrESqLNfr8lfHho8opo/kF3Eoi3r5zlOOqgsDyNQ8zhdNf+uFaWFZzGjOX/FPLscd
         +v9tf4FH4SWuYsLLI6oD7733/z3nZRZ9qis9NSyPlN73OIHkbsePzuMUI9p0WSr3fYl9
         zktlj2xMubgs/M5zZSdF4pG+uukWxE9sQIYGVr0cvFgjWYfUODBzX6HnHhwd5mca1F2a
         3d3A==
X-Forwarded-Encrypted: i=1; AJvYcCUX/6kZjmhbZRB2VeUlUBzTBXI7fqAXE7L9bG1onLu7+zdPHDsVsLEvuvQnIWe3wverWQf9VHmkMxqB@vger.kernel.org
X-Gm-Message-State: AOJu0Yywnfwyl93A+hkW0dGS0tV73CfOHD2g/kpLiq32XWnkCSX+lvKV
	319en2S0SdZPFQLlB8GUllvxwHtOfMoNQC2zg2QXpPJTGBHgDbZq4FXOh8/35r2Kw03osUsPd6w
	BAq//u4p8eTyqsZjhOWw1Cu4kGHltdMjA9pHYtJuQgw==
X-Gm-Gg: ASbGncuxe3DCC98HS+YPU3xM8nOxfkWftdyvyPFywxjodf2PF35ltTXaK6Dqo0pn04b
	1ygy05bJUsnTZcS/Rq5vqVDASFaVRRgo7gqMkYyXw+nTCSfqBGQ8gPPnz4O7ZSXfl2FRgeUIjMN
	aQV8gmAb7moLRkUW0BoTCZ2BJkTkV80kb9Ao1OTTHYqhih5/SwFXEIyBpzG0FiUhgTzV17mNhcv
	s/xd6ZxclReriyFup5IG5Au6E3gQH0Z3cORYA==
X-Google-Smtp-Source: AGHT+IFetXs4JLYGng9hUFS318r2+WbXRwnBXKx7i5GJo2mWOtosdjS52NY45eVVFh4iHreFPdQli6jjBbS48ijUnps=
X-Received: by 2002:a05:6512:39c2:b0:577:1168:5e86 with SMTP id
 2adb3069b0e04-578958698d4mr5576291e87.14.1758551969238; Mon, 22 Sep 2025
 07:39:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:39:27 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:39:27 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922142427.3310221-8-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com> <20250922142427.3310221-8-ioana.ciornei@nxp.com>
Date: Mon, 22 Sep 2025 07:39:27 -0700
X-Gm-Features: AS18NWCEsotQxP7f2iDqTw9Qc1FBx3uXQqI8WXRMpxdCrqI2ocsPHGGN08v5SlU
Message-ID: <CAMRc=MenTm-HVzpi3H3uiMUDD58Y0GSXvo0Ng464PSQTdye2tQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] gpio: regmap: add the .fixed_direction_output
 configuration parameter
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sep 2025 16:24:22 +0200, Ioana Ciornei <ioana.ciornei@nxp.com> said:
> There are GPIO controllers such as the one present in the LX2160ARDB
> QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
> together in a single register. This cannot be modeled using the
> gpio-regmap as-is since there is no way to present the true direction of
> a GPIO line.
>
> In order to make this use case possible, add a new configuration
> parameter - fixed_direction_output - into the gpio_regmap_config
> structure. This will enable user drivers to provide a bitmap that
> represents the fixed direction of the GPIO lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - Add the fixed_direction_output bitmap to the gpio_regmap_config
> Changes in v3:
> - Make a deep copy of the new bitmap.
> - Remove the offset check against the ngpio.
> - Added documentation for the new config field.
> Changes in v4:
> - Replace devres bitmap allocation with bitmap_alloc() and
>   bitmap_free().
> Changes in v5:
> - Rebased on top of latest linux-next, change the extra goto statement.
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

