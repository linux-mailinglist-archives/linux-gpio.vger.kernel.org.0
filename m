Return-Path: <linux-gpio+bounces-20374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F65ABE6C7
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 00:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD26A7A80D0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 22:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694AE25E836;
	Tue, 20 May 2025 22:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oa/mr1tt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D33A25C827
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 22:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779262; cv=none; b=QBUOwstJu2YQjXdatGKOR53lYTjc5g/nbAobk5pEMV66atmlshyk+Ajkt+IoNThubszeAQcfbERKtLnYuWdJ7mpQxuzwHKMcg+dG8GQw1cbujJsMVvEdQ5qqX/zirQoQMiIDPgEqy5/AbZ2xrENZ5y6EW/t6OWnmPnFsVxADfGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779262; c=relaxed/simple;
	bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bof+6ieClUXN0LM6SMpgT20YnL5ELQbdxNB8GjAqrU9mE4hPswXNi5PqDigxKx0guZmGurFZrnKeQ9ijSvNXk0ExMyJ65cbA72agrfBzDsIR8uICQh8nHmoWn7NAKxemMyXS2md1DbW0JassKFK4tueASrmmWKG7d/SlsaWG/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oa/mr1tt; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso66847601fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747779257; x=1748384057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
        b=oa/mr1ttNxpHiJVbOLzJSzaxUGjB5Ou2lgam79kh0wuUvalfFufsQGRB8QzHlTl6Gt
         unlS9073PNdQa4PPnoLOHbpmYK6NlJ9vozyJ0M4IGniOhkqN9v/Q8Q9MJIymP9VxxFMB
         Ho6GwNkYL6xh1XJstC60XlFhd1Fgj7S9UqGiApGXpC8CYHU0qEQ8jONJMW5DI0JUiVI9
         D5rQxZPD0GY2OLFgG3QMo4RTPwLY3ZZZ3zfwSRUw2guLIoxTMsY8/RpaivI+R3z6fgwt
         eN3RzpocGgOse6JuwOqjojnlkX/K1WycZGz+hfRMmqTXfRL8+Us3mZNRvCyI3s8/6z83
         /GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779257; x=1748384057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
        b=mV/qX4JRM9J+LcIt+anq6E5ZHU/161p/ukqweyVN83jwxhOIUMCuU8hTt7OcqW3Y1i
         GfOhT559ZK0QN2+pfVBMy0IbwgQn1iCJvr1s6CEtQKU+qb/VbgbiMpHgW5kA5FOWDB+d
         NPpv6z3oN1SbetB76e4TFj0fbpSfD6gkViZN+Hn388hmVTuW6xuJZ52zPF3euMijpQHU
         mGykX+KqrjVZ0GurwXZwgjEe7zg5tbHR2m5YAyRPxedPTloEpKPCRKuuKuyvm9CiZ8ln
         yVtxflxR9tbmen9m87aybe3B1Azz2gNXN9fOju7CtoSfcIxxASUQ69IS4xpYCNva3MGM
         Arfw==
X-Forwarded-Encrypted: i=1; AJvYcCV6ikx8o9vkT1DbgXHTcm+cH3AMqlyxCHfckmM6/OQ4ov2NyElMcuTMF6a1UQh4h0c5PNPSb7xcnosM@vger.kernel.org
X-Gm-Message-State: AOJu0YypHsF2bBZu+q0Efglz+g15R7gA7wXF8EwN/dvUpA2DF0/+L/gX
	RMNYZwoDiJk+2xWv3SzgPokNGi9F+zwiWBQszjReuybtft3eDwj/q7AfUBIDcoSsylQlUos5j2a
	1YSt/g3qnwwcwJvpKUEGiJ6FD7+dI91WKQ/6jPYT5hQ==
X-Gm-Gg: ASbGnctpBjeONGXHlsqKtcI+NfNNrQU2PzTqQxS8h0BFr/MV3sdsHNsZMWLxkFBxi14
	r8PN4NZSWLyLYuxk0EcUrFR+PESgf7gi9Mk+h08Y5QQQfYYJLBJmAYNmyg+sCmMR+PyPoAoLWtA
	KssTpGZGwNiN8L57t0DCR6jloTxO9AbVbZ
X-Google-Smtp-Source: AGHT+IE2I9dkpHJtUzuV3F55HIcCy4H/0xE0bIT2P9EiCFLTqHbK469GeJi8kQXTq+VvjFFqjzVGAT63GH/fgS+P2nQ=
X-Received: by 2002:a2e:bc1a:0:b0:318:7f36:da6f with SMTP id
 38308e7fff4ca-3280974b19dmr60101281fa.26.1747779257574; Tue, 20 May 2025
 15:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com> <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
 <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
In-Reply-To: <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:14:06 +0200
X-Gm-Features: AX0GCFujWmK7RjwxHirjq3655UF2TsXAVvYT5SDx5SrWKMcU6UcS_lP2iMrNx4c
Message-ID: <CACRpkda1OKXnma11wKTrBsO_AAXrifVK8RDCKmufdHXBMmtMbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio controllers
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Haibo Chen <haibo.chen@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, peng.fan@nxp.com, 
	conor@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:54=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> w=
rote:

> sorry for asking this dumb question: why do we need the redundant ngpio
> property in case there is already gpio-ranges defined? AFAIU the last
> cell already contains the necessary information. Or do I missed something=
?

Not all GPIOs on a gpio controller have to be present in
a range.

The ranges can be multiple and have holes in them.

The ranges are also optional.

The fact that this DTS file, for this SoC and on this controller
happens to have a range mapped right over all of the pins
is merely a coinicidence and not a general rule of any kind,
it just apophenia playing games on us.

Yours,
Linus Walleij

