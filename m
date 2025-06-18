Return-Path: <linux-gpio+bounces-21748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E6ADE8BE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80F971887C33
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EAD291C15;
	Wed, 18 Jun 2025 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CoUrotv/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099FD28FA84
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 10:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242145; cv=none; b=dmwBj32YTR+IlbwH/4VO6vVHnF4MleXD3xYYOf5i20jWQC2stBOPKkA4ff9LsDI6y7p/1X7RUYVxVChaWKfqv5PfLHnoPgbhgNnAAUS6ordsBhbpM4HhP8y6F97sSiSvtQvRwPDa/jQSNvY4D84K0W+ceMUp0/U/5TGFndMUbVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242145; c=relaxed/simple;
	bh=+qOQU17OoM8/KAmW2Xgq7JH5nbAjGTw3ExvQ9U5cu7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1REEO62sCEF0e07/FJcBY/t8qfV3pUSTQybSa5x9FzqhlTkqw26JkiBAOFKESd2y17ykP7voWNwgjvFgdhL4jTULpnXTt4WdMJn+YAhlcZVli0m+Ur8nVXVNZihCPcv5orUvy9iyaPw5AtexLhgjBZBdaz1a29qmPliGrzBdfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CoUrotv/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso60215605e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 03:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750242142; x=1750846942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcY0E63xRmQxwqQZ0aZVZsL1+UafBW6eRdmA8hP7p/o=;
        b=CoUrotv/z3TvglJKc4tf/X3/DHlMUI66sYQSzgfxbU02AFZUkZmoSee/nKHJgCvIzw
         d0I5q+9khi/TN1Z4gSQS0xWCekA8ynsY7kgZYyDm/Yrtho5i3njGJVbHUtIDQAWIkHZI
         xujqpCINLCSgKNQT9deB/wtCq6Qis0aqE+pa+N7fyYkg3kDI1Hw1mzHwlMCPR1F101+0
         nNelRJ3WzG+EFNxesNf/jmXo+VsNECFv+O3eRRYitGdoDMW6+aOEk1YXG9CnOm2v9Wwf
         LBYupTbXNPYuiq2D91uCga9L/qYQXF57+3DT6Sx818ejkLprDrj4iEfPqMylagKcWqNo
         l0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242142; x=1750846942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcY0E63xRmQxwqQZ0aZVZsL1+UafBW6eRdmA8hP7p/o=;
        b=b+P9qlK7mtYYDeXOfXTl5WnoXN2I1jvr0XoCyK/1b+Ebu5+PJJkd8piobd/k9gMfvy
         k7B61hMB1wRczMZKbV/OnHKKuk0NH34iVhuKmoJEBdglePVwEZHi5U88gFcPtfbATsym
         wVRJEWHNvucrDL+bZsaPZZcwGFw3wYye145kldR8w9yrdmseX2vQbvjOLZmOKIHi0hm7
         tT5UrkQwGZMMrO1Q51D38ozJWdfiMfQThpWWnnLWjw2Y2Y3XwK7R7YQfcUj2yl6IeYoJ
         ukTY/7csIK46MgWGpNXH3sbk+k7iILfVlK/gfxxjtaXCQA5xR0fkHUROHdmRISPqxmrf
         uirw==
X-Forwarded-Encrypted: i=1; AJvYcCXLBzf03SbQsiUHbG8ra1LfK2fhu3nTZ5FzU4N1KnYYYf1hIgDN/oa1aMSFYkyndpHOJl1ZPtlkgZ2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyymNGtAceCvsf0DtGBXJmQwNaBfQ5XwqC+fUrOTCBH4OY4Oqyl
	DVNAupOJhvaad9WGQqCjkBgxvqm5s1BT6IAWkylDi5vGcpGIL9gi+RmLsyiFZWgfdLsAarUDBdq
	OJFBJ+iA=
X-Gm-Gg: ASbGncsyY2R5bRcLqKhcq+ReP3sSnJacZF3XdGJW7/0x5QNMP/6QFTBkN9BwtxCALio
	U6fe4ratKeTDzNyPgQRNgqhpT9Pl0FsLFTwlHoFb9qt+AfTByT2BYfgb/Xye/Sl4cDbLx86VzkM
	XlS0qGMUv8fMnAfcB6nRD7W6o5rAk5uCJhw2VvvV9PD5t4yIUo/vevpdG5GdegObTK8VJnoh5Jr
	HQbBk/B7prkJ6YfN283KVjHr7lwN8qJfVbUCj94WOdqGNQMnoAREBqKQihP2kWBnD8AMf9788XI
	dR3Pdt7+gtcq3t58HLmdr0OKUvA+ff2fzPvoyMrAV2EHmHaEgsZBcBtdfl+aXg==
X-Google-Smtp-Source: AGHT+IHn0n3NmTaxbvzRw1SdIFvw3ZSwW9W0E1EQegpOOqY+iv4O0dkFwIU4AIp8rNLGr1+PEgFNrg==
X-Received: by 2002:a05:600c:3e19:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-4533cadf928mr161514965e9.30.1750242142318;
        Wed, 18 Jun 2025 03:22:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d014sm202946185e9.24.2025.06.18.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:22:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: arm,pl011: Drop interrupt properties as required
Date: Wed, 18 Jun 2025 12:22:20 +0200
Message-ID: <175024212201.53500.363665357985105443.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609220900.3035642-1-robh@kernel.org>
References: <20250609220900.3035642-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 09 Jun 2025 17:08:59 -0500, Rob Herring (Arm) wrote:
> It is possible that the PL011 doesn't have any interrupt connected and
> can't be an interrupt provider, so drop the interrupt properties as
> required.
> 
> The LG LG131x SoCs are one example of this.
> 
> 
> [...]

I changed pl011 to pl061 manually.

Applied, thanks!

[1/1] dt-bindings: gpio: arm,pl011: Drop interrupt properties as required
      https://git.kernel.org/brgl/linux/c/7b20980ffc11514d8849811857d915001236bcfa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

