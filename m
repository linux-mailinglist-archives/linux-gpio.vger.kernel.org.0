Return-Path: <linux-gpio+bounces-17613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7073A60F59
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 409803BAE28
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C241FA272;
	Fri, 14 Mar 2025 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ts5UoW2Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFD41FCFD4
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949639; cv=none; b=XxGj7lw+gpdRjZ88ITM6M8IjLH6cUn8UYOgDExu+3GNvnUTreFGfZ0735lztj4EmIvCKeGbe3Y2/RHmtbnYIfDEU0Hhbatsl9VPUE2wb605KNMr9CpdxgSMejMtwZsAVy/R274Pc2o/lq4IgRULiPyxBxoPfQbLzzPH9z0yMvG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949639; c=relaxed/simple;
	bh=TdjrUj2ENKDpO8QMmgpWcHwmqWwffwTY4fDD4PrBuM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEI7XLc3x5+wW5FJDAyHDBgi3/3xm9YRnasztFPvd30kVdYytny8R199+fZP4WrGhrFUXO/ykcluPTY+FtVRlwE7ZiCg28Yy/dvCzFQViwJXYtB5YqfNb2SddDpSb0S04JtlCUjf0ViqUdEE2sng/oFMF9KmA/KUIdrMOCWnQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ts5UoW2Q; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso18890601fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741949634; x=1742554434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdjrUj2ENKDpO8QMmgpWcHwmqWwffwTY4fDD4PrBuM8=;
        b=ts5UoW2QyXh5vBfN5rcptPygxva1UOMQcvJJl3YF7SN3js9KkNVcC5CSs2I4yR5WEC
         nkWFW6y354+sOI5aep1y+kapzuDq1dPCA3Vp/Rt1kd9ckl62vom5aWk8c1J9yvxHvPo6
         /+6M1EgwyUiDAQhDFGBW7tDzrrJVPmuky6/4T1ecyG9tmk4MGyzuUgYr6S+urcCBLny5
         Umh60qOF0XoRFlEtUjaMY1MFLsaT5BEbeuuQlF4zmzpkCaSNKFKFdUENhS/woA27wdPb
         zKyquqR4IZwQh2Xwglpa8p3SX52ZHbk5x9+nz3JIpRtmL9TDVo/JU8hIPpkEsoRmtHsb
         r6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949634; x=1742554434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdjrUj2ENKDpO8QMmgpWcHwmqWwffwTY4fDD4PrBuM8=;
        b=uIHO6+Il3cLtyd6/jkh5Pv7JkDBIoNwfDHnvYDyRn/lUnUr4BKO+IXiSVjlGnCSuv8
         cPySrhcy4TJPdkIJ43jTQ1hghytFLbf7FrNynvlFcGNs271yBRWTiTZdF6qzModeuWGV
         E188Bp+Lw4+z8HaDSSG74keksgHJ6fVU+ifxfGxao9vnVyW0nc/zyCiE1sX9ZFKQP/vK
         N5LjIEIpE5ss9OUgAMTHq9GzIuIfNmoyNExIK55ETwJVDbYyegxND2yokedGIqjDSjnO
         CqWLt/PcpnIH0MDxftLOh5z7wWqssihhIJ088aBTEjPflhzolADgM769JOB0z7xm7yRY
         M1Lw==
X-Gm-Message-State: AOJu0Yw/zVh4rWQ3EOonxbR6ZDWFSoJ38QSoG882HqGmOBPcHjCtHC9D
	Gagwkg59mhPdNieioeFhaOdMbX5Xn+nPAI0DABPIiVGWZxM84qUu6pRK3nuj/nZsepDroh9olBV
	tUPSMaC2VDgDtV7bkf/3aq837d9OFI125+r+lsg==
X-Gm-Gg: ASbGnctI46w7lTstduVoIHRadHzGmRKKGv870zNmizHFYM+Z9eE8Rc2LJ/Qaxlv7da0
	tcQOxMV/Kwi9H0PlQo/OiGkEf++srVg8JuV+hDcekQgPHjNptw8ktKDeGAXIiB17r7B2RCNwDRK
	MXXTx3rpemBEhsDPJ4hw8WJCoIkxmDUoksow==
X-Google-Smtp-Source: AGHT+IGyZcjGQVRXdmPf+HFRkYlkCyfk9cxA0ikymLJVaBdq4csHhKzWdrWNXA3EtIAdbabIZKVRbXn3G++rpQeYfIs=
X-Received: by 2002:a05:6512:2350:b0:545:2b24:c714 with SMTP id
 2adb3069b0e04-549c3911e6bmr776230e87.18.1741949634058; Fri, 14 Mar 2025
 03:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-dev-adp5589-fw-v1-0-20e80d4bd4ea@analog.com> <20250313-dev-adp5589-fw-v1-7-20e80d4bd4ea@analog.com>
In-Reply-To: <20250313-dev-adp5589-fw-v1-7-20e80d4bd4ea@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:53:42 +0100
X-Gm-Features: AQ5f1Jos35lQGGapvP68CdJghmgF62TRmPj48uDq9_6LrGBWABanTI3P7iIbNwU
Message-ID: <CACRpkdZd1b-D76n2oYMwg79BewV70FGaNcxbYfq1GDGOHm_BDQ@mail.gmail.com>
Subject: Re: [PATCH 07/18] gpio: adp5585: add support for the ad5589 expander
To: nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 3:19=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> Support the adp5589 I/O expander which supports up to 19 pins. We need
> to add a chip_info based struct since accessing register "banks"
> and "bits" differs between devices.
>
> Also some register addresses are different.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

