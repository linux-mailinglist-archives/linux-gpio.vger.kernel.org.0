Return-Path: <linux-gpio+bounces-12497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDAE9BADD3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBB2B1F214DB
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 08:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8A318C003;
	Mon,  4 Nov 2024 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ojCDsTPG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3AC14F9E9
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708156; cv=none; b=M2aviRMcXTlxg4pQ+Ig38/j19okqrMb8zzZ+zZDbwBtR8LIWCt6+cej4t5Yj0tqGchVpIOWmvDHzAH98M8JgA2QVpgghI7cFpVK7gBmbLWfXMnJgiuziCI5Y1VJDVIt+d6NzSCwLMRFJ5APaLRTC0kN0DrKe+659kth97ukPync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708156; c=relaxed/simple;
	bh=a4EMiUXgoVenzw1GK5Ky6jQqTFcXg2iRCJqQwmCryPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlEgYZnDRYvop5q4gr+7JU+owTPF4PVK0/+S7qb0V33Y3dGrIc9zm3JPfe4UUvXtbo6EofO65Cbj1tglsyvF/W/ilVGc7edmCZra7I7Grc7Ay8uKx8flMVCxdFuU299HaChKmOkm/gqv4Bh6Qgdx8RRqA1zz3SE8UFNwIQ9VV00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ojCDsTPG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43193678216so34076955e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2024 00:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730708153; x=1731312953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIeuAM5GJsoytHloglyBSVaHbZX6KID4/un87zATwOc=;
        b=ojCDsTPG02IOQCwEJV15LB/mTlymOxrfu1FXwyMQZHhJE/SLSlvXblYDfs8EKUGZyo
         KfhuJl9WCP6jtV7BF22Ae4qcpXl4QF63d62uJq3fMa9rhgNJjHD7fD31BxmAureUU2mm
         5RZlzVCK6HV0742MXX8FqdDBsM2Pcvcb0P3CMzn6zSLyQvzsXyHXtSUThKhPnem55hqe
         o3pu2N9JjXMOyyzdiHt334YIxlBLjiwYiReKFgk0MBpeV9aeW4RDggG3GT1bgOz4/79g
         fpq4plYlE2jXGwuGGFEFQWvN5KtL/gw/rf5ugmUQnDRM/kYR2KtbghgrMv+A9gv8fMum
         4HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730708153; x=1731312953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIeuAM5GJsoytHloglyBSVaHbZX6KID4/un87zATwOc=;
        b=tAW4Y2vqAprQkOV784w+1m1Lhl/O9j/z2NRpOYXvC2+YlI2UU0yRAew/zz7NcEB8Jz
         7+8mJa4M8NryKWnKtwoBZWpr/MroFNfP01+1C2QSJAUA3M+IVEnE3e3f3p+mZwwOxaln
         wbL5qVCYdsi72/cnK9crum3iKcnKxSO/Ay4TBfvvhw+98COA2KIC612nLljfp8LSCBAO
         NmrAlbSlQcqSAjNSRmSOCuWAraCDvR1Mo6YUvhuUikprDjYH4stxyVor9N3dTHS7ytF/
         ZJRt/PiyqiuDxwLmXDN+IMswtUVjDs6lBav6wgzDUhGNfQCyNhs2mw/96HzzttC3uQbn
         U+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMLDTnQ5lHdqlZSUyte6q9wWbCPJD5cxydc0nE3Mmq3JIcVoxivu/lL4KqDtYVW026wBZFhg6D7oJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YyET2B91KDl3AnOrLaOP/r/2imXUQ0xQE7UEwF8Rpg0cZmYGbSd
	PZK9GswTcdt4QzfdbfPw326a8S7ttN/ZpPxw0MwndzvTRS8ByKN7ER36LyD2qRM=
X-Google-Smtp-Source: AGHT+IEajS/InjMYYE7jd+ThlpM+g6VJvVw3N8PDF6JP88z4/XY+6wRBdCeIrZMVCeki4dDBp5Hdqw==
X-Received: by 2002:adf:fc8b:0:b0:37d:5026:f787 with SMTP id ffacd0b85a97d-380611e10f1mr20694357f8f.38.1730708153494;
        Mon, 04 Nov 2024 00:15:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2603:7936:7734:a187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c13sm12674140f8f.13.2024.11.04.00.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:15:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: Replace deprecated PCI functions in ACCES drivers
Date: Mon,  4 Nov 2024 09:15:51 +0100
Message-ID: <173070814804.11535.16592270962077876800.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101-pci_iomap_region_gpio_acces-v1-0-26eb1dc93e45@kernel.org>
References: <20241101-pci_iomap_region_gpio_acces-v1-0-26eb1dc93e45@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 01 Nov 2024 16:15:07 +0900, William Breathitt Gray wrote:
> pcim_iomap_regions() and pcim_iomap_table() have been deprecated in
> commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
> pcim_iomap_regions_request_all()").
> 
> Replace these functions with pcim_iomap_region() for the pci-idio-16 and
> pcie-idio-24 drivers.
> 
> [...]

Applied, thanks!

[1/2] gpio: pci-idio-16: Replace deprecated PCI functions
      commit: aeca17561dc32fcf8c105e2d6207fdf3356c7c94
[2/2] gpio: pcie-idio-24: Replace deprecated PCI functions
      commit: 09db69a84eca80374045063bdc8db6a21fddd7fe

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

