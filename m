Return-Path: <linux-gpio+bounces-18822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DDA896A8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053333B9954
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15995289353;
	Tue, 15 Apr 2025 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2Nxzd/d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388A2820D4
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705738; cv=none; b=DNJaVTY5jhQ2c1aePgqeG0M3+bCwQRg/nTrT7v3uzgSwsFS0mXSOEMQu08c9yNY5LUeVvyY8xED7hARLSmasv1OzfvVmuL5b5FZWLIv7Kt9LRnBdjRMM5xsP17Xskn9YpFNKa5qOs8W3qn/G3YRF7FiFe0WHWv965hdL4IuYTJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705738; c=relaxed/simple;
	bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0veRfuo9SsFbCLx2kIFzHYeFrsUZQQZLnkUae4JRD4NkoepnvM86I7cAFWYBTB7eSdO1b0Us3Gw665RZ5ip8KeGZAfIi0obd2Nqc3tkZIS+uMJO/XdOCZQxgYdBE1tRV4DWgI3QMg5wORbdAuGgvzZigNjqzgjl5GYv7F3aIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2Nxzd/d; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499614d3d2so6036346e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705735; x=1745310535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=l2Nxzd/doT8Rqhxa6oEYVZxmArAkE1Ihc/bsrDpV1OlOPMbDCkYxTj/Q82bHjMu+M2
         1ZRD/sOcbxOlDVFP+q2//Ez51ZI9VBtkCCM49gbherZHwCEGP6QjmGWgaaBmoCkC+bQH
         eXnAAHthvnZJYS+3i9SaJnqbbyO2YZwCFoR7mFxZW8DzUS3RxRF9SK0PzuAou68XV9A2
         IJeFW4K4vPOyXcbunAQA5u+fQKthtXS6A90JieFkSP2c+44DMc2r1LnSd06Of4pY8PuI
         Ag2pAQ895bDyfXn/41dstcjPKtBbkGAM7cN47kXYnnc1BA8FTmaW+dM5YmiYHo4BZYm9
         SIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705735; x=1745310535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=P69Rcf+L0J5hvjyxHZqkCm7mdPmK5hMcSFDJ3xlTjebLO+SM4fSMqiHHKpBhtE6dp/
         Y4n5D8fRJOt1z+nkCOUNg6YV2u4mtRVyZ3DJvWHUcSE+SYelQ6Eyyed+pRfiUeoVtjN+
         M0x7IgQE8HXzwet/9J+2Y6XqTXmT01o8vzR4BKv/mwVsY5UIAha7bWCxAx+loHvvWUYP
         Zn2IKnfpZJITJLjvrY5mihKfacUORsVbrJepvGqlmL9rGRtOOxMWLlFqXwqFz89ykPGk
         i8zfeLG9Yoma95UxO7ORDo0MllLISZ753H6wlrr0U38j/uHMhoCUxunx0hnbEDPx3S9q
         LfVA==
X-Forwarded-Encrypted: i=1; AJvYcCVI1/OtrLqICROyDRKekhcvbXq2UiqOtxCSphlepAbYdKvSWPy5uyEVTmntwnDmPoykm7AgtgarTTVU@vger.kernel.org
X-Gm-Message-State: AOJu0YyheMTJQ/VyqmjTk85jawFRcDzo8MyG81jzy8B4crLLG5Pg245X
	gNdSbEKhleT600/BiEk7YmOIO/C47ak6p/gXj3zLCTVySixJVwbqAlLp/O/ZBUOwIlS1UcQwjbX
	ttdsxpBOsEEc6em6YcfthrbLJnHVmX6OIWQNNUA==
X-Gm-Gg: ASbGncvtghR1XZj63Ho5FB6MVHSEmQtin/Xfuw+vxe6RKWNSCI2W4zH02WsedIq5iR7
	bFiA2Vse4HqacRZ1YpSUBWPxLvSfhwrTXiNMYYrTCypeaFYcJLzcDa+TOfJC614Ywyzxvug046g
	PDDtS/W3LqXRpghGX/V7kQYQ==
X-Google-Smtp-Source: AGHT+IEBR/Eqg1kLWWGKh12iJhnCpJzO1zCgcGoecoiMf/umaHeT6TJC5jiC6GTZwtMV/nPtynCgaCpBpVXSKQksMUI=
X-Received: by 2002:a05:6512:3f12:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d4528b940mr5354403e87.3.1744705735088; Tue, 15 Apr 2025
 01:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org> <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:28:43 +0200
X-Gm-Features: ATxdqUF6Upkgm7Rf-JBAXjYSrKlpy1hvmNwsxlcKu33EviWPUC1nvmMY22JHIys
Message-ID: <CACRpkdYbcbcbLz5K4H=dKdGfao68LgacASLnVF-bSYAsmhL6iw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: scoop/gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

