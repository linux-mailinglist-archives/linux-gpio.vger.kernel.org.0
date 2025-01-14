Return-Path: <linux-gpio+bounces-14782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D317AA108F3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 15:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBD8C165635
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 14:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F8813C3D5;
	Tue, 14 Jan 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYTwnVyx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9A5130E58
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864270; cv=none; b=W0asyepne5gG7rCFg5VXAsDE+0T5TA82LZIcEoSKJWYwRKEXkKpnPb7miCoeQ+UD7ywhWM4/Jh/sS2vuvnoqbRnbzf/B2euKc0YJZPJjdFnUq1eX37+XYmSiqfC4XlA3NQgf5s3KM0Kv/RL9FY+Yvh4HC767Rrd2BV8pIeX9Fvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864270; c=relaxed/simple;
	bh=O/WRM1ywqimJ2aPAr2Tip0blUkgzcD//gX/qp+tJeTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQZtc4fQoz+mru+1UMTwj7JInOJjHRHkv9TG1zqsNS+P02mp56lhzEjp9wC5nQJ4nAkTg1TCSDKBHgu15qtcr3dreOJz/bs+yl/HwD7hoSQbrCOqQZ2LnnCLAXEktmLkY76WnZ4dUcrYsJH5xvlr35XhpEhKHb0426WeLKjtrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYTwnVyx; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-303489e8775so49201691fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 06:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736864266; x=1737469066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/WRM1ywqimJ2aPAr2Tip0blUkgzcD//gX/qp+tJeTM=;
        b=jYTwnVyxr54/9zvIEYInoB/PszQ9wT9atZLhsMWKS3w+qWIppwB5nwN6v95Y4cYlcI
         CPkoOnDs8q7ZZI9FmBpn/hCb39hknH9oSP6w4+qiMaZmI9Iv9hf+lWAaUEvX9FeJt6im
         BhyOZ6TiVZSO4HUUFSyZY415Bfn/pRHz9RKfVXhqZCu5N0rqYLMVlOyIxdUXGEU40jni
         wrj0ozRiWKMUiQ9VdR1skkrDWbDfu2vZFXYJDmwOuvcCs3nm8qVJXXhkAzkTb6FF5H5V
         FQn6IG98aurAponCo44wldB2K7y70ImdNFIYYrtx1s6im/FLgm5TgnTu/mEZJL3uynF4
         fu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864266; x=1737469066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/WRM1ywqimJ2aPAr2Tip0blUkgzcD//gX/qp+tJeTM=;
        b=Y2XjtUjoVsnjY0RIgCXQbPq5m0UqW9+8iWXLHipUUYpzEK0LF7bsP9hjtNyoohCBmZ
         F76rHPCRtS24hDM4TObP7iZ613CqKT0m3INqTuiyXjsPKCBlVgoSTje5vTIkjGDYmh5y
         WuLWH3Vhjakv5xLrByD4DNYfZI5ls8SouApaVeehmaZFG48RKk8d1s2ipjpoB0r9JuRs
         xU9JjCKJ9z5bhFCxfVl+isUONNvrcWid/Jhbsa5A8yUic9mD2iZD4HYekaacwyX2ZvDn
         HpvjSwJX+hWE13JnBt+WqOclpguXIO49GtA1ZYgZYN5bWQkNHwbvhsqqVfbPv43jZEbs
         i/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcFIhhVuFOvViAimtIu3NE9MEiF8Kp0ardjEX+6BIhO22xsUC8y22CzMDa2v9+G4Ny/pJsMKRFBKdu@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvDfojpWY0aQDln3U47WT8S0OCL6LtyA/XFdwMlwPSk+elvb8
	Km7J6zL075qxtFLdcVvllRgClUkyg8sFm5fq+96Tp9asv3EZ+vQdJu6KMrAbDQCY8IXbPNkGO4K
	bZscadoSRbtscByX7IBL1AFqdbxm+uANPiFZjWQ==
X-Gm-Gg: ASbGncsGNFoTZsb9U2h6rF8I3iCaxUa6z69VhhaNb0TeakVw1LN+IlDv2tpgpwTehYe
	uAOVKvDtNc6/zvd/mAkDCsbWczdhaJbTH6bE4
X-Google-Smtp-Source: AGHT+IFPFJTmNosakpUt5JU8cN5nBrvR7+LTD4fCMkRrHXEcHL6oNl6Fgp0ggW/W8QtR1cS9S/mGb7h5l9NZcPFPlko=
X-Received: by 2002:a2e:bc1c:0:b0:300:33b1:f0e7 with SMTP id
 38308e7fff4ca-305f45478f1mr79313431fa.10.1736864266081; Tue, 14 Jan 2025
 06:17:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 15:17:35 +0100
X-Gm-Features: AbW1kvbukVMqrBajLgYQt1hKpFELkNSEFH3GzkQaHu95dam2b6lvaqOS79Rlmww
Message-ID: <CACRpkdbJziJ0kKqZLrBuZ4G5HmnJbL5+j8zJLQ1H+q8NE9P3oA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Michal Simek <michal.simek@amd.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	TY Chang <tychang@realtek.com>, Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof, patch applied!

Yours,
Linus Walleij

