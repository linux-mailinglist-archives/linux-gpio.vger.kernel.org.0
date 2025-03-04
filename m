Return-Path: <linux-gpio+bounces-16982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93EA4CF9B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 01:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A219D3A1EAF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 00:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CF4522A;
	Tue,  4 Mar 2025 00:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EqdAS/SX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DCE2111
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 00:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046636; cv=none; b=KW165y/pjhJxGf085frCD3YNwbdueN+pK+v2s7WUt/Wz4C0EV6P+3oki2yo2slxeKvyNxDZqUPL2X7QS1eh3zBde1pikMD7CNrsYaTfHNrQjC4bEo8I1XzxGql/gFiXoUzbJSOz1dO+0lREzwi+dAFr6DFAV4MqF/OhravcAWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046636; c=relaxed/simple;
	bh=C/LfSpekGkcQBqzcVBoT+8ef+/NIGmgDTXMdDSp2KH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZEybC0fujh8I1zmTJxOFi28aNp2DVrJrMJkY3L4OrEVYxmOrxvvws3oztYh8Zuj4wXoXHW5kHmHx6WawNIyDoqQuujMdfJL4k7a2d2qoIlLGyBJBmrTMBGqSRk/Vqy2A/EZe7wyyl72yWt7skEDSgDWDfHAccdbFGHx1bPfDgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EqdAS/SX; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a59so57721561fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 16:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741046633; x=1741651433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/LfSpekGkcQBqzcVBoT+8ef+/NIGmgDTXMdDSp2KH0=;
        b=EqdAS/SX1cNZTPEopGRn/ftTbaYzlpkYYur946VDRWoj00RW3RDDO8j/ft3yZdOdth
         fwKkbezcExtBYnOFIGVBOnMpIdFg6pvId4WvJpni43+cy/ieXkBk7HZ7mUO/GKJzeacV
         3ilD14W0in27CViA/3KtXcrWyRxCa3IJ3CnWQ7z8Ln+HPa/UUxlXT4iU0ldPZ9gqdzE4
         kBdvGA5OkZcNmK77gZFYzyrSu8KDlMuX0Y0PZPdDG295qR4uS9LTPIUOjlO1jDVJO/4t
         2nHIv/3zuQjN1hLi/I6VDIte/+82buQbCgfGEofT4f6F8nOE1zw4pZOIAU4W9Or4i/kL
         Aw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741046633; x=1741651433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/LfSpekGkcQBqzcVBoT+8ef+/NIGmgDTXMdDSp2KH0=;
        b=QwscudYpFfDSqwXt4gQOkM+Yg/bnyArpQP3HK7oNdzgAS03ivyJM1eY03+VY15JJA7
         VkaBnfrE8KYtkaz1viH8En5LJea4v2HlX+iuymRuvTvTJ4k1YKVqTt7qPgPqW/DgF6Xb
         z5pStnVQMkuwqP8tvbl8ThK3PYGAIw0iA4wlG/A+hU9DAlthHzq05XcZaV3gjhj/01kI
         rjIX4TbLWuXfVjDATfQn8npnhpAaQUZST2EtvTzpTFsNLLZ8twMwqkNl0MkstOwRfZ92
         HldiKvDB6g79z8RDDU3VoNw2XNd161Bwo5nqeFsROuPfUURtLpjX0rvs+McZb4IdADvR
         TlpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMjOmbDuc5pfOikLv5tT0rBq4tGQBLav1S6WGEqP/zMpulfE7/FWAZOPwQcUENPoFHkgrNYZjvErYE@vger.kernel.org
X-Gm-Message-State: AOJu0YyvaYntLvBX1Vg6fnwkKAQv1Th9ckBgKEqAOz05GGdFwdfzJhaE
	PSUMxHqmVdP/gbUv55hzYW7vsq2C9SFTpNa44X7ddPjq26RmRQNjpG6X4H1Z8s52/6/78OVGP40
	+DRUsxPhkYZeJZoQtOQGVasOeTqA+px5q/Vmg/A==
X-Gm-Gg: ASbGnctwASY/kMj4NJsWeI3oNUQKz8hKH6kBAesZ+FUT3OjHT5UDYRD1gFGgYFvPjTb
	mgzH6MlKhwSy2607QBuS4ltyHLEzNbDRREJc4gLSTh5yMCPTqWMbx2OTxrlj6jTwyuRpSrGobOe
	RYcSoXMF5Bs1lGyZRm4DYpsc6ygA==
X-Google-Smtp-Source: AGHT+IGrydCSg/lI1uzAKwGHugbQGvBBzjG9s3mdXfZC6EYIplaWRQ795GqrXmFtWsW5Su7ME7vIhfLoaVp40Qd8SR4=
X-Received: by 2002:a2e:be03:0:b0:309:1d7b:f027 with SMTP id
 38308e7fff4ca-30b9320f37bmr66066201fa.9.1741046632848; Mon, 03 Mar 2025
 16:03:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
 <20250303164928.1466246-4-andriy.shevchenko@linux.intel.com>
 <CACRpkdbCfhqRGOGrCgP-e3AnK_tmHX+eUpZKjitbfemzAXCcWg@mail.gmail.com> <Z8YThNku95-oPPNB@surfacebook.localdomain>
In-Reply-To: <Z8YThNku95-oPPNB@surfacebook.localdomain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 01:03:41 +0100
X-Gm-Features: AQ5f1Jpd0GEUB6MlVioV71j1v6rfMl3pu_k3_4FUFebcVwfwl0boXwZuTwUA1vQ
Message-ID: <CACRpkdbqYoY1vYGii1SyPL1mkULGXYX7vFwu+U9u2w9--EYAsQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] ieee802154: ca8210: Switch to using gpiod API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, 
	Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 9:39=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> > Maybe add a comment in the code that this is wrong and the
> > driver and DTS files should be fixed.
>
> Or maybe fix in the driver and schema and add a quirk to gpiolib-of.c?

Even better!

Yours,
Linus Walleij

