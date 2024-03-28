Return-Path: <linux-gpio+bounces-4742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 565DB88FA30
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B9021F28E80
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 08:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9216845944;
	Thu, 28 Mar 2024 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ez+anNIh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB65338396
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711615445; cv=none; b=l2Fnoetx7hxj/rAu2608VUuGqNXwv8DXMH6XCndNaY8SREq5uVtmAVrgTdfN1EoEw8FDyJAHTBbbTBZEcdNxkteuSIogR1EP5CuODzHDt7Stdnao099Ku4nAg3VYUT1GeISdeEvrLH1uotXrxQ7r874T9aFHV1Lse4QC9RQ9Oyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711615445; c=relaxed/simple;
	bh=0KnspxPmptjPtiiN1MB84viWFXsln01PUyXMSzLvDdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kr8If0CGX7xO2R7EPw47M65y9dFFUjy9ofsnulqHYZOZ/fNUhnh9YxUfa4g0jdQr0VGU45mPKVdthYYqM6uAF77cPrkZhxvu8sWmSRuhhBUtYMiK3zdX+JCcYDKQJ3ow5F1gXn0GQaKXqlFXWfQRVSe7G2w6TsZLqSI/0MBSkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ez+anNIh; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so629283276.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711615443; x=1712220243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KnspxPmptjPtiiN1MB84viWFXsln01PUyXMSzLvDdA=;
        b=ez+anNIhSS6evbdGqVbD1fVckKaGe6AjKPixCJnjjb2HvVV1M0d7c/1w4S7cadfk7S
         FxYuuuffqqhMkyQFohr1QFQSkog+uuuL7IEo9r6oCCJ/yiqZNgmi56qwfmklkwSEE3nz
         YF/38aiHwUAHA993DHkYgdl8yl+tDN3YENpCV/AAp1cFgtiXnYzo1t09yh+rMJ4tkUkL
         v4HwXcuVYqLR6nW8DFsNSgkzSCYvsoT2knYUtHMwfvQv9wUyR7OThjMHonyuJ1YbcF1K
         UQbtCXQxbDMmb0WAqofH871vS5sNgNugrRNaqPh4PKV5N/zmhZGg/L2G9uT1m07T/sZZ
         4rZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711615443; x=1712220243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KnspxPmptjPtiiN1MB84viWFXsln01PUyXMSzLvDdA=;
        b=Wlq5Wz/zWcn2wGP8kIVZIYJyHjHH4wmvI+YEjiKdMu0paLRfMt/hFq2CyeNqV5ne/J
         lAqdWfvZibA6cdnR4G8NhcMpOBA0b0U/IwiVZS68y2qzGQCqbl2FcNqKz2fMSo7dpOMq
         nJ1v+NBLg7tMlPjCRPuW01AbhJ2cxfllbVm1skzuE+7kJQwsMr2nyTuZOnXRsWeUKLUH
         Di/XOE3g3zywat3Xrn3lWZrGNap8dL8Go42vlXCHaOkVJ/T/E4wAJ4YwkYG5/eYOWEot
         9Vb1xJilawPunklE3U8dikt1KIsdvZ6sDsJum+40Oli33bIxmVoEnnVKHGbQ0Dvg7NGF
         aNIg==
X-Forwarded-Encrypted: i=1; AJvYcCV74w5FHzR+Do8CLLGzdLrKr/rB+yHJ4wqevCYl3/yMNVUXInzh/Ru/dxehY2/BOeEjkiltpG7Hl1fR9S+B0X2e0hoRp+fwGpkd4A==
X-Gm-Message-State: AOJu0Yyz2AAxL6Ih1EexiXh4Qk60xu9KOMF6uQNfLU/4hwv4YgG9wMhd
	6EoLeDFpbhPWRDGDbBDwsQzZaRoi6Tx4SZuFqYorfxpFfiujOdZojOwm1J5u3iPPve0yTwKJ8C/
	c6vZLZRMILjUcUVO68pAp5JZwY1khoa0wl6KoElXFrront5cM
X-Google-Smtp-Source: AGHT+IGb5H3R35IP1tIxYsq+Y1oXbGf8VvXryqoK/O1YCOgUhtar2l/ojXonUW+2fConiLoBCwqhN8exb2+m2cKEBjE=
X-Received: by 2002:a25:9389:0:b0:dcc:d3ab:2fc0 with SMTP id
 a9-20020a259389000000b00dccd3ab2fc0mr2146095ybm.23.1711615442841; Thu, 28 Mar
 2024 01:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311140833.1168742-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240311140833.1168742-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:43:51 +0100
Message-ID: <CACRpkda4y8RJdPgoZrBYYH=QGEcTWaWKRtd5i_YspRisaUgPqQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: pxa2xx: Make use of struct pinfunction
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 3:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since pin control provides a generic data type for the pin function,
> use it in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

