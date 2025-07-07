Return-Path: <linux-gpio+bounces-22858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55DAFAE43
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 10:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5B094233AF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 08:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB76C28B7FD;
	Mon,  7 Jul 2025 08:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r2YA0I7N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7928A3F7
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875744; cv=none; b=eW0meezvpnya4FK17UGNvmwrkwGIgprkAOwG+o1q7PJ0M5DTtcBpHjKs3azfmVdX/ZQ0piefpyKm33LqErOUWKd/3yR5e0GqxskM8nydAmQi141Ch6+cp/MAcunpBifd1k7ybGTVbVDo1OH0jqxgsS0rrSxi2I07pDpPNNdqvYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875744; c=relaxed/simple;
	bh=WSm47YcCchWeKGlgq2UddpuspkqMTR+iSyXd6RnhhpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QB7ksGEiwy5+fl02jehxVQDiGolC0I+qhZUwNbdJhVbzcl07dHx16JkUlEsbs2EQxssjUcyURLxpG/OcgvUKNhkMKK/+MwKDv0J7s7vYRDn0qduv7CqWDl3gtIJJDkYnGPj5fLqsfRAkS2BZjX3KY/R6VGXp73DnBhiua13JbGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r2YA0I7N; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453608ed113so30965195e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751875740; x=1752480540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFAboXfiLA0FVMTr+TL/V0gKAaepQ8a/OFLOFGrBygs=;
        b=r2YA0I7NdTczfX2llfm3IZXFP35fBThIZH5xpU8/driwxhJSdoDa4CZpGd2qL5S7ol
         z8uTLCUCP+PAB8iZPDbZCakbge8flnJRJX68ZPIF0VaxcLcmiurgil1Q83PSFvN3ixjM
         xr/wR0ytIDS6+yHtVKnxZPEFQ0TKnyMEv6ipyvE47WTwuD4WShp9w0hY0RoeNsFn5+fe
         7Sz0E2wEqEES8cHDVxyIbEGvFMNbVZyMHev64oCzM7eSvWtFOX4+5uGTELaJ30Kl30ec
         n96zBQSjMxzrNN2B2O59Rqm5+IUu1MRu+cCkaq7w8SG1saNjw+SrUe+4rJBB1M0BqZtM
         oa4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875740; x=1752480540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFAboXfiLA0FVMTr+TL/V0gKAaepQ8a/OFLOFGrBygs=;
        b=dzjeiElfQtKJnRSfSwrL6mSUc6oR3Hys+IEnAdlIngoCgVqbMB9/50LFgipuQHxuuL
         KK3YTd9rrs0bwFbO5Jyr/Wp+qX0CC60W17kZvGlRM0gEEZFIcwaU+roZPQd4qv6PdjBi
         c+yZtQl95hHIpj8L7kUVXlCyREq9rYFBp9X9FQ/AAR/xrD3rsxKKPi2i3RUo/wN+PEnl
         Ymf8IMAUMJQOeNFgSH2FIogZNg4PAcGGy0h9h8szluDdQ6a0Kt7HrrPzYUpKTzHkESIk
         uz3tC5exo4DMSMCVhXMuxnPFwI+wRfB9M4GPbbpJ+F6+YBBRXANTQ6Z830E3vJ9ozx6E
         s/RA==
X-Gm-Message-State: AOJu0YxS64ci+DmkNxKDEfAicTV/S4BZQCTA5weurWP+RK+j797bP9Ct
	8GX1N6vuNQYK1Fov08vl+vPxLalC++4nlwE5G5xw3oVM862+cDneH7imid0KxpeQyNGZdwQjhlu
	8OX0mkg0=
X-Gm-Gg: ASbGnctousTI/hhMfYiRDlPTm8vc4RUANvKqKSRClb4lN5yLVXISjJiucoNP9OGccu6
	EnNxG+I8plJwbiEJfXo0OY3ayrg11JAQfU4Psh2aom+i4/cwOh3e+5vkBZzunKbbefO15hJJmZF
	b2gcpwk2t67iEkWSxIpdwW+GYOnEW1oMI6wwqCYrhPgX3WyZP9zD4yVgGypwt/qf7x+HlnFpfp6
	0wokx8nBt2jrCwtbmFlfB7soxDdHQOClCoxWm7B2RmxoPETxxaZQPOghC+Mf0rV5xuWfLVlrUzF
	gZ/OJu01CMK6kT5eDeqzpLdGlijik7ljA9RHaESMchNIS7G5EDGlJ9AJaquGHqk=
X-Google-Smtp-Source: AGHT+IEKfIkjGLcMB9V/pRGCJ2/g6v2IgOD5q1MoSjKN3jTgw9ek/0VEXkiz2KUdVlkaJ0frvKGjEQ==
X-Received: by 2002:a05:600c:4ed1:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-454b30d915bmr86571355e9.22.1751875740556;
        Mon, 07 Jul 2025 01:09:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161fb78sm104386275e9.1.2025.07.07.01.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:09:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maria Garcia <mariagarcia7293@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mgarcia@qblox.com>
Subject: Re: [PATCH v4 0/2] *** Add support for TI TCA6418 GPIO chip ***
Date: Mon,  7 Jul 2025 10:08:58 +0200
Message-ID: <175187573641.15653.14317168480317813793.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703205740.45385-1-mariagarcia7293@gmail.com>
References: <20250703205740.45385-1-mariagarcia7293@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 03 Jul 2025 22:57:38 +0200, Maria Garcia wrote:
> This series introduces support for the Texas Instruments TCA6418
> GPIO expander chip, added to the gpio-pca953x driver. It also includes the
> necessary device tree binding definition.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: pca95xx: add TI TCA6418
      https://git.kernel.org/brgl/linux/c/c488da2228bdcbacbbe1f898225d28f58b84fcb4
[2/2] gpio: pca953x: Add support for TI TCA6418
      https://git.kernel.org/brgl/linux/c/cc85b9f83304e9d68af4b5f3b6efed026e615642

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

