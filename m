Return-Path: <linux-gpio+bounces-20185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA4AB790F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 912DA1BA34C7
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B13221FBD;
	Wed, 14 May 2025 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVSWe5Ok"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA61EA7D6
	for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 22:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261724; cv=none; b=FeDOAfJnKkMxzKnkMXFF5J6W1hbCgmARTCRDFIi2UjgSbr2K7MJCBOgJdi9x1xi+9AGtDXYoxzLGH0WHp2nED5pxCPbinlAswq6upHnmsew1Xw/8n05K2C1trOr08DB70kyi3zKs2qconDrALojBtyZmAOhtlLpPOCg707av0Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261724; c=relaxed/simple;
	bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLdtBm0v6S1NfZoo47OWcoFJAqBlpaRDHO6UagnKPuH1JP4TqyfumttaInK8m/eIivQIX4IdVmRGApkAqjRov/xZL6r7f2zsUp0HKm9HyqhPaUc3TUoXYCDKzsoC1aH80gOqxMmhHqp2SiUcEVmgmB8iXdCFIbr67iX3pcsMR1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVSWe5Ok; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54fbd1ba65dso263940e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 15:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747261721; x=1747866521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=;
        b=lVSWe5OkMpmjEy0mhYsTTltJfu0oaUtd//WBacEWg7ZSevmG1HqR+FdcNn9YT9vPPP
         5BOQetKQV+LeMQyoORqCJLjIDoBhtLFxdkpRtvP6xuq/keEFldb/aNQSDSQarbtL20oA
         9dxkgEIkGIs7oz4WTcdcE+EIWN6n5FVzOztRQDX1NtiShFJqDH/QHP/K9v+3sYM3HLvA
         O/qrQoBcK3YMD+2Rom5Bn32xjkSG8UNQ4CVXaPPzh6EzrdL6WoTY2p1jtmoRe/gu4B92
         y1+EI5RcIydRYBiulEyJJL9tkHHrNjv+sYHTwG4Th9rf/GG7zGWo0Y9boJoH1zQr8mUV
         yZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261721; x=1747866521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=;
        b=Uc6N8bBPFYFIuooN0irndMqP67gR/kuxVeftkQvWwj2hWISYbGcUFeeJKQGd/BESy8
         sbYOv3oZ3VNR+7qZYrUIpQnsrTN/13hqIN8+xoVzRalgH7Y8cU8C3koZwLGJ6ErLmzHB
         XBCjcJ6Hyr+rzeOcc9/qI4rOPFu3qNGYbr5k9PDVtbiDWelzt6xX4MNBIxMHfw1A2Lpm
         3yg7wSlnvdIGH0NEiZJ9YUo1bZF9N4EkF2DqN0i2/krnqEe0JxBzQfKxvAzZE1gHX01i
         wzFNQ6HoeLHMW0gIA25X5iiLIUrML1OmCD4PN7nw2s+ocSDvsM4QgG/mHlIn0y8SJpHA
         sT8w==
X-Forwarded-Encrypted: i=1; AJvYcCUmrQ09N8r4MjcVe5i6WS4J4l8n+IF3ZXXeT/ZyErzxOWRJ6JeCo11VdtLjw2J4DE3zmdgbAMvZmEQF@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0C/8d/gX4p0yqQ6Z80Sz4ijqq5dFNr0aGndeXlLjxwmuUl0B
	4fPsAlADtxsV3a49eZCJhVnZqNptx+3NROVw5ZLsn1+jIp+0CX34uXla3oe+ndtwsYQIhIc48hE
	R3ro4uLOmsgEuGJGGradiXf5ZqmNXLXsGd7lCqw==
X-Gm-Gg: ASbGncu4O76WtK6On3uNJx7Tc411ZRbrsHV1kffJMrk5uaIWPGLkbK3EQ12TwiBrzls
	KIowhmxcQk51XRNPV/NJzKpsnA4eJZx2K0rUtv5O6vEHOswUZUAmPoVWnDv31koMNxQyuuqKV8d
	HbPvcAizXVJs6m1RyU8Cqg6WMf934wxrstt9/10a56LF8=
X-Google-Smtp-Source: AGHT+IE1Vp4rlvI75qMKlDEVkN1t9zzD3BxyByO5SW27Vl1zUjiPYHzMEgLHLW0x21yYIa1dbtvC8PDJZuRwP2Kenrw=
X-Received: by 2002:a05:6512:450c:b0:550:d534:2b10 with SMTP id
 2adb3069b0e04-550dd12aeeemr60274e87.35.1747261720610; Wed, 14 May 2025
 15:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 May 2025 00:28:29 +0200
X-Gm-Features: AX0GCFsW1KstBI2jcV_icDkbitXFWIRxmcRnuAcWr-VFZ0eu8OVxn2v41gFG6Ok
Message-ID: <CACRpkdb2Njam8GGuN5yeR+DYvi0xe11xbARaoDepoGk=gAK6GA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] pinctrl: armada-37xx: a couple of small fixes
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 9:18=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> The series contains several small patches to fix various
> issues in the pinctrl driver for Armada 3700.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Patches applied by applying to a separate immutable branch
and merging into my "devel" branch: we were clashing a bit
with Bartosz rewrites so I had to help git a bit.

Pushed to the autobuilders, check the result!

Yours,
Linus Walleij

