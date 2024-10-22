Return-Path: <linux-gpio+bounces-11755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD6B9AA28C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 14:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B97611C221B3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 12:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F7F19DF48;
	Tue, 22 Oct 2024 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/BqTwcU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC8619B3C5
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601756; cv=none; b=XevQhnOtkdc10j8zYDdsq+6+tLOc8Cqdt3n79gBQl+Q0JJxkSx8QNf/I4+IgsnlUzSGHJeTKD3Q8I4DPPn/JNdao69IzTdqY66ZB06+h4OpCbtoXgIGGvv//36Agz4HFVL5auhu+rF/uDAQtcaevBAe8vzglcU8OMDQnpp5s+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601756; c=relaxed/simple;
	bh=7fOT4Xjo1xMpe/0KKsIBBl8n9H1ikaNSOO20uuJA0HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JupzrZDWoHf80PxNgROVq7njBAPBMV09sJ/UPaGCUabK/nNoGqqWMb/1CknY9/q7nXB0KWxZLRhRkfD0oPwulyKwRJUBljv/5pgJZ9v9I6MKYq9iX15ZVWYdvukRw7T9jIima5CHSfwH8HuXrb8gtTz/6MUsx3KXBd5Tl8SrY9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/BqTwcU; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so6307494e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 05:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729601753; x=1730206553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fOT4Xjo1xMpe/0KKsIBBl8n9H1ikaNSOO20uuJA0HM=;
        b=w/BqTwcU1BugzWf/iOoeiivVrGg7FwQUJ6OJmJkXX1LObVlbYWUZQ7M2fnulc1W94O
         VdpVRN3t1c8P+V2oKhLd2Zw1+9Ly+XAAUs51uvIP1kYE72HijsvB/4pxX2OqQlLFLvbO
         PtOG9F+ncT2KEvVobtHrD0ikLunyVhi53ePhN2k17FE3O1YwnrBpjVuxKsRqhVy+rxSb
         6oHQnA2Yu6hdCk8iJofXBU9r7curVRKVgxWLxBQo7SIIiDYggn9TCtvFQqL9c2zouBO9
         rjeDvioLxMoGOxFrvwskk0q6/l5E45Zx1k0E6oNpIMEDzqWHTEJcLl/QQibvsmOpQqHt
         Neig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729601753; x=1730206553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fOT4Xjo1xMpe/0KKsIBBl8n9H1ikaNSOO20uuJA0HM=;
        b=aCh5HbZDtJ4pWsjiE9wJg4eps6W4WlIdVV/VPZVK8QFg2OSASqh2X3pSchHxreNN8j
         3VzeSus0kZab5fnSLvAyBjcSP+Xf2tMt2OmZqz8rSU0QRlN4FLAZG69rJpw7sJNRGyJ6
         Yja9s1lVw7FAOHsDlmjf2+id1jokyNOc87KYH/vWuoY+1ECK5FRCfBIsDnRqno7BMe93
         t38jz/k9FRv+PUs/4KIOmq0rXrBDj10siowIMPZ5LZWIpEmz/qc0Ue7j2cGL62p0+gmC
         g9eGmWN99fhRpRVNJ+XoTx5POkmSvovF5W6JAd0tM8LTNqHa+K2SD9UA8JkLEhzM/QLD
         4lTw==
X-Forwarded-Encrypted: i=1; AJvYcCWf7TMSe0B0hVEg8AYQXBFltxoBOjMtNHJ/oYSwwBTetl/PcCak7YHkpX14eaAEs1DigfRgVqS5GV9s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwx8TpB+y1U4jyvxYhnrY6Mb6ddXnp/6bYCaeLULx8Y5yfva5l
	cj9EeM0K/egj4Pzsw1GJLcl+m56aMTpas73ViOKbdEJ9TvVjc7Q4Dqpmtgt0q3nhcS5rak27OrS
	jMAX1uuXKYqE2aTQm/km0sqkRVQLilzWMocA+0g==
X-Google-Smtp-Source: AGHT+IEApsleJ++LyDXUKi77PnqAoKOGDzM+ehV1eZLJi+inAOZKg62iYgBKSaWzgGuDYSSU2dftJO0ptCxWO71V4Yw=
X-Received: by 2002:a05:6512:401a:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-53b12c36e60mr1673392e87.39.1729601753275; Tue, 22 Oct 2024
 05:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017211241.170861-1-marex@denx.de>
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Oct 2024 14:55:42 +0200
Message-ID: <CACRpkdYvMWABqw1tC5YSh+RXcHiCwUGsbOGAfkysThYQZTPWzg@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

thanks for your hard work on this!

On Thu, Oct 17, 2024 at 11:13=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs=
,
> except for the configuration bits which differ across SoCs. Rename the
> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
> strings for the other SoCs and fill in the various bits into desciption.
> This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
> Remove the old text DT bindings description.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>

Is this v5 patch 1/12 something I can just apply to the pinctrl
tree or do you want it on some immutable branch or so to be able
to pull it into the SoC tree for dependencies?

Yours,
Linus Walleij

