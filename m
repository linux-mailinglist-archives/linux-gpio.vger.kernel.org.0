Return-Path: <linux-gpio+bounces-949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899F802F3F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 892841C209AD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739441DA23;
	Mon,  4 Dec 2023 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KAWOwoTR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F69BC4
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:50:56 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5c08c47c055so46302247b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683456; x=1702288256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGU1eO3+rKPmkCGDfE8WNlc7ZD+3bMubQESl5Z40WnA=;
        b=KAWOwoTRh6vqykF0xTnLmhXbEa0rPdSXsF9MeCSGHnfMZDqvKDZ+PH/8nVVVvMGJkz
         Xik+8DAwhiGtXeFarfQFOWpydANr5YShWeTusW98RlhXA6X2CY+jFcSWoZp/+yLaYp6w
         waTT69wWr9luwhVzKBdjXzo0curvAng00S8uHDaWFLARVNFnGAQtnNYTjsJWJ5bBhQw2
         Hitxw7Gkau1jEvzYcNWJZ/SYPWZGqvwT87sB5Gj9CBTspamSpBgecOe0RYqGrxv4BE9o
         dMpClcs/QYT4tk9ld4S78bPP+iccB3KNAg9Jb57Ta7S+1PXmHyhHmQPCf05JxOlwH4y6
         bciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683456; x=1702288256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGU1eO3+rKPmkCGDfE8WNlc7ZD+3bMubQESl5Z40WnA=;
        b=SJHbDU0tDAXixdOK0HkHdPG3+PrS3xbpEkzRpOY+2doYF7isOtIFuKnSqoU+SurLuN
         6v2Da+eze6SRRx/R8db7Lx1Y8gZVANRKA+RzKVEVsacuaj+1wZxtEzo/KlnHtzh4/Ip8
         Mgq+U16kOg1abhDUVjIr5b8xq3gq2L2GYNl01JLzimwQ3rXnYSbGyQJBQ+hQxvOFuBDJ
         jGp0DhHxB2irp4pwWdIc4dPU0FjN5oAPcmFGw6y+8dEUDTXLTKcGxEHwt5yuhbXJ3dBm
         kQRca8ZXjwDZskm9TnteE4PNKY7UP9m/NvHX4pJdxeoQf7Y1Qub1Lr8By8VmPT+smkOU
         /XQQ==
X-Gm-Message-State: AOJu0Yxcj4fns+WWTO9lm7c4Fr8cHEXTk/LXTzwNVS5cKwqxIIe37EA3
	6XimIpID9LZc8sni01L3gZjZ9yD2DoiqRCRXjJBZBA==
X-Google-Smtp-Source: AGHT+IFr0tZGPNA0XSTLBc8DStzul9bB95RE9/GVcI/qQQrjj8ZGLEf+VAFXGKT5oyarUp1D9/rCaSsOqpWBDjIgwkI=
X-Received: by 2002:a05:690c:d94:b0:5d7:ca4a:b1e1 with SMTP id
 da20-20020a05690c0d9400b005d7ca4ab1e1mr2034497ywb.73.1701683455874; Mon, 04
 Dec 2023 01:50:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128020202.728156-3-mailingradian@gmail.com>
In-Reply-To: <20231128020202.728156-3-mailingradian@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 10:50:44 +0100
Message-ID: <CACRpkdb0wKxnFmgDND7YNRvg6yo53R52ctpPAsuTuUqnPK0gNw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: fail to retrieve configuration from
 invalid pin groups
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 3:03=E2=80=AFAM Richard Acayan <mailingradian@gmail=
.com> wrote:

> The pinconf-groups debugfs file dumps each valid configuration item of
> all pin groups. Some platforms and devices may have pin groups which
> cannot be accessed, according to commit 691bf5d5a7bf ("pinctrl: qcom:
> Don't allow protected pins to be requested"). Fail for each
> configuration item of an invalid pin group by checking the GPIO chip's
> valid mask.
>
> The validity of the pin group cannot be checked in the generic pinconf
> dump (function "pinconf_generic_dump_one"), as it does not directly
> interact with the gpiochip or the pinmux callbacks (which would give it
> access to the request callback). Instead, an entry contains the ID and
> name of the pingroup with no properties when all items fail.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Looks reasonable so patch applied.

Yours,
Linus Walleij

