Return-Path: <linux-gpio+bounces-11838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58849AC2DA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 11:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D603B270AE
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 09:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B62194ACC;
	Wed, 23 Oct 2024 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bf8WlTYY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786F168488
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674326; cv=none; b=HHbxC5MisGbCApmy956RwtpIEV6GWzSAZjRvzNp0I3BRXQqLJTG/BYjSDFsyxeyeV35VCc7GHpgD4UZOO1T3XwQnITbZ26COacmAn0JjZhl2Gqq5Jr5DmIsrsmclUqR1Nh41Xg8twLF9sXUxkLNwwDDVsrfoYbGQnpMp0Nm8bpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674326; c=relaxed/simple;
	bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=di6qqPZ8tNdr4uJ6LVJviaQz0AMAX4jnCJxld5qbiBdH6RzRe4DQANc6m8Yt0qhWGsyP/Vlry/UIUiJZfwrhwHBa8RrMtTDpA0yP0mMHBQp2ey6KTIlXstcgvSIWAkcHQrfu859Q/mBx/zayzqGMqw+awNLBHedxe/PWT8ej8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bf8WlTYY; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f6e1f756so7634215e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729674323; x=1730279123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
        b=Bf8WlTYYkazelvOtD4+8fKPxplJyMy/MFUXpwj/wtxRdiA/9k4ANP89QOrXqvKte/r
         VKeoW/ZKUh1Aak3JYBP+PyFsT8nBxeIPCjO8cIiZi8LXjHeu05bDq89k08EMQoSfTzXn
         Gq3cwjaGVuZ7qTp5o3/UWU4vMcm/hSCQupbCQwzYM+nN03VWU+tNNkoNu3xNVg1agQP+
         FoTMO3Pk3xEjhyfJRSsEiEvlQ9FOjPGPF1YhRrpTCHZykO5Qj+By1MwLPds4R5790n/L
         hehWQQTPCFi6YqPR9Hww4hiDuUreSsv4d+kNbmyNWPaSYLdXggrcb46HLZBVCGGUtaeC
         sjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674323; x=1730279123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
        b=oKy70CkoRUXo7yotE13uKYhylJFHxeJAiOvQ+HOJg2WG5ja7fw6H98IEyLZCFuFuNz
         V9m3/fXNsk3vuctZQvbL4NsuUMtrRAS1HE8iyV2Ygf2BWIeqlfA4QKKrYESeumG+dtbK
         AXght8eqja7x5jt/RHm7k3trLJMn9k/jcMgkZQ4gfdkURqhha38wSUb0CZAyoeHJSyk5
         OfBAkpj61qD4FOJ6PEGQIgzdGbiGwKnIM5kNWb2ucqApW3sIy1sZQc90p7Ql03inNI0S
         V0GxcFVjOdwk1EENVRXONxYpfEHuNiAnbUIfMjr40yvPsbN5pkZAfx87UfFINMoL6igF
         wQSA==
X-Forwarded-Encrypted: i=1; AJvYcCWr64OME/UQoH2XRs8fQN3EE04Q/HgaMVNh+eS76osg49Dz3pyoSOqgpsoR8cDlAfjEWF1VFcZv4Gyi@vger.kernel.org
X-Gm-Message-State: AOJu0YxJOfLxGgaZs11nWslXllu0G0GVuPGsGulk5RpCkEuzDCc1yzBv
	S6LB6x+TT+hUtUmgCfv16VR9lFZB5kAfw11opdmX3kupkg5SaXWzaZeH45ZNyWyAPcUwkc6CcLi
	oxbLvdXTHOBFjKyA31PKPqUtEdwWSRp3sHthxQQ==
X-Google-Smtp-Source: AGHT+IH1+v9bDoKekaMKgbzEkbrdYTS5dXGjA0/CBdqgcdFe8CjG21FHGf37DjwlkgqMpl892dYOQgZjGQaLo7ZGFiE=
X-Received: by 2002:a05:6512:3e0a:b0:539:f37f:bed9 with SMTP id
 2adb3069b0e04-53b1a2f42ffmr857364e87.8.1729674322600; Wed, 23 Oct 2024
 02:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com>
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:05:10 +0200
Message-ID: <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 6:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> w=
rote:

> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> iPod touches and Apple TVs.

This is a good and important series. FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Are patches not getting applied since you resend them?

Yours,
Linus Walleij

