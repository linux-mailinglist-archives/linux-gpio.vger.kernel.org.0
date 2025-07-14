Return-Path: <linux-gpio+bounces-23229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE318B044D8
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 17:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 057FC3A3EE5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 15:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A557F25A33E;
	Mon, 14 Jul 2025 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hNv4qoK3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13841F4615
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752508636; cv=none; b=qvE9+0v5wRgSrrJatVEZDXZTQaMUwj8Vc4Lm1B6fndaUcdr7n5bA5xrNqF4P3gR4vNtjN/YA5ubp838fKFtVYky+PCpBZ6drF6BFmzVSlRfqExX6pCYa4Plml3SsbZjzbfmS4U+xkjOjEFBYw2GoUppUpdZw3tLM/z9Wu6fOBrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752508636; c=relaxed/simple;
	bh=HTr83yDS2qxVEm+xglBXA04mlBk98mglOqjvKU7FOos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpV32t/JMnafYl6+/AdAziJz0GDrpf8k1Zt7WkoLfXALgixKWWxDkRnaAKY+bMWUfJj1b5ROxXd6zSp4Lx/vY1irHu22+6h/Edp3khYmJZHF7elJc8bg7fkPz8VEHILBG0bQGzwnXDawxrPmzTz0lUYKXRsCzulYDTU2oGSdkI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hNv4qoK3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-556fd896c99so3847750e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752508633; x=1753113433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTr83yDS2qxVEm+xglBXA04mlBk98mglOqjvKU7FOos=;
        b=hNv4qoK304LuUH4XpQguv07/c7azfWWqg7cy0Xdg+gWM1/EMUaX2HIgpGZLyKvvi+x
         N9KE0MxYSWJMTm4Ub93KMKEp2/L4oQONWawRknXjUGswgbN7jbm3dIQDeF8jxKWLwNXu
         okDijj78fRYnVgqw1/66v79jCafy4gDktaJ5s4PZmJPxhswEv0FzhG+VWJ+Dhxgk79bp
         Beywr+kltDEmqM35E4b6gPnkkBAQtdCny+h6FirWZlONUOX/Z8oD5U+A7niMRZis2FFR
         fwhypk9nRzm9UfyyMhWVVJONvP5H0iXnYetuiUBf9VosJr8EMQKBSEI0ealVQto8n/Vz
         5jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508633; x=1753113433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTr83yDS2qxVEm+xglBXA04mlBk98mglOqjvKU7FOos=;
        b=aZfl+PJRL9Y6DmMloGyAD8FdaqWGggGHkQxZiesVOsmEJR3VR98hgeeaKJKlIaExyK
         x+dGfKguW58WEGB6NZuD4e0UuHFcpMGPBIPtS0WfXHkxxdcdvvDs2qCODS/eAAzAN8rW
         z4Ej4opdPZmotUs6B0NxUF+3d1ZRjm4HEI7whMQ3mdkf48rQuGCn05qAEinVhDW/wFhD
         v4Ozh2QrKChWbWo9pdpGl0mOGGuzRKas/ZC+LLTduJepWmbEPohUO4RXO5tlsMXFNhLc
         qt5qf0vNuWFG7jdQ6yjXW42wn/Vz+QwaeXHLFO0whGpz1OesFck0Y5nYhpc/bS7kR/uu
         Zh3Q==
X-Gm-Message-State: AOJu0YzOoLPJMlYUnd0n5DO8/91VzKaxLtiflrTkEG40lmZLWnnwmTzy
	HE215mxGl6DrhbdVrQuBs7cKtdEzJVLBWCwT/GJdqZCgtBUoXyc0PrY+J57nKhjQds7OKfjXRgy
	iuiMzrbBKNx0czKCMIB0k6yFApMC2ssjcpJTFwZqh3w==
X-Gm-Gg: ASbGncuj5A/uaI8LzocOXcFNR1ugmVBJjoVnu6BoOoUDk8KOsgXV6aLZALGX5oxMKBp
	xNQ7Uf8nlAs5Ik4rJcqz3tuldnG+71P6we/+ZUm66ksxoc1afmi+nru2Mrcx0Zpe3S+vQ40Cwcx
	8YmO3UZF8ausEFLA2I41TXKBzqHs9IlJA8D91ESgXlq+z94eyRXbVjyfUPzWli/LXKWnCZ/wEq6
	0Kb+Nw=
X-Google-Smtp-Source: AGHT+IEC4V8k2cMQdu5bnkN/tA6INLv5zdJPYSAZ0P1yxTy/XCQ3o/PpcZyuiZTWHyrg+h6qM6nboM9yMSBeH/27EcM=
X-Received: by 2002:ac2:4bc5:0:b0:554:f79d:ce4e with SMTP id
 2adb3069b0e04-55a0461bb49mr3884846e87.38.1752508632562; Mon, 14 Jul 2025
 08:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aHS_VEcokVeCde2g@black.fi.intel.com>
In-Reply-To: <aHS_VEcokVeCde2g@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Jul 2025 17:57:01 +0200
X-Gm-Features: Ac12FXyhYb5Tm2oNrVf-e83zqAjUV_lOcHYfv1w5RYGxtB_aIEO_MpQdy-LqPko
Message-ID: <CACRpkdZZ6Q7NR+7MNKOFgkEHRuWiuvtxqK6z1K-ja1sz-tw7tw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.17-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 10:27=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Quite small PR for Intel pin control related drivers. May be applied as
> v6.16-rcX or v6.17-rc1 material (up to you). It has been in Linux Next
> for a few weeks without any regression reports. Please, pull.

Pulled in!

Thanks Andy, nice work as always.

Yours,
Linus Walleij

