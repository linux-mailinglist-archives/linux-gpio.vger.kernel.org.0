Return-Path: <linux-gpio+bounces-3917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDC86C4E6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28DB71C2149C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9854759B6F;
	Thu, 29 Feb 2024 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvKH5Lc1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F659170
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198546; cv=none; b=h/cBtisdOOt82WzycF48VH0jVQW1XXrsMw417J6nG9wyBQ6W9iqF7W+HmnsRyQx4qxUF35EpR3Zj8UCvClwiiJt77tzJm010eJ8SnuJXGVP6TB5GphfeawN4jwjVV8Z5aGPeal9/BU/1kVpgtOpTYNRyOPskiLk6aNxiOtNWkfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198546; c=relaxed/simple;
	bh=bI1ZRftBK9BLam+u83rqGUmNXFCQs9MdpXovOd51pag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNXCluTxdMw0zORpqPUPHQRFAuorCcvQsnIP+0s4c22gWEfLM01gg68haSAE9PCgSb4PAKCcLTUtKxsRSvbXa5DmbEJ4DXMTYSufNHDf982aJr8NB3S5Q6Um7d5n6DCACY1Tn9lapoL9bKjZ5V52A+bdybSiOnFmC56sF07ea20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvKH5Lc1; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60978479651so139387b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198544; x=1709803344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emeJTyQGTBVkPHgEAJypkygeKWxGsM4PaU8Q964nc0I=;
        b=CvKH5Lc1vX0qYDfYqSvWkyYW5DEIJlOMAsA3J2WzJvkgFAutD7ojmpJTFAOe8Vn17E
         d5UzSOQxvpgUR224GSXFIckmtSMvJOkftr6XE0VJpnQhx78x7biSIvkBcMPLiP4tVv/J
         hUNZb76Dx7CG1IHzzSeTJ1kpZU9fVWDIENb3qNh1sGho5F5khEl5OsOxttQRo6wVdRkQ
         uuySgwKEY7SIFlNk3RanA0okRitO2LRFVz2On79VRAZCiQZfq0TzkD9mCBE8f06Vlr+z
         rqEqgu+HOKC53jNdYhHeVbnXTlGC8zh9AMJMR7lIn+TmhlITRXtpkK1xW9vuq4y95HqX
         Wl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198544; x=1709803344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emeJTyQGTBVkPHgEAJypkygeKWxGsM4PaU8Q964nc0I=;
        b=aCNgUtLwc/L8ARXFBNTxvafdDBu0eIkD2sHfBOaCGc4D54PHEcTkZx3dYR9A4kF2yw
         t5SXjs4Cq1H0Z6ZEAGtVVLoQJLFzp0sLiAiB9jNzgRr2JqZPGstk7jPDpAPhGELFdVcb
         I4cmDRPiqitkvCBa12M7haWOYUyk0e+LAEQa9L+TJDuAW74Zur5wAKz2gXUIKfvQ03/K
         1DRcDdErsCXG/yPu++p+tL/zf6PNUIcnPE9g5z6pWXzjbxlu6QwsWrbH7f6zBGFpkkNu
         Qdft6H4c/cxa5K69yq4AamvslYk+D32Nr4pc5FLLUNr5Ymdq/MSGD7JtgL6VfPbrYqt/
         b3xg==
X-Forwarded-Encrypted: i=1; AJvYcCU65J7bayULTmGvCz9f00e9K/FtZoCsP1uuLHCrghhltYUvAN5qtr8Tv052cxC6hDFXR/jv4BhQZs33PKpc7y9oruyIlCWwQN7vlg==
X-Gm-Message-State: AOJu0YweAVhnLde2PCxfyfa7EJv3Ke79ncf6GZRwlS1K1sV0Wnhvo+14
	8XxXNLyfDEocNwtgP5ZtLi/s8y7I0Zmg8+8tu5QEND2ra+PMfoqeU8ns0LcPfpoyPEZmXM7womF
	Izg2p2iijO67o/XMDUzPIIAySnnvUbFCrCU4ZIw==
X-Google-Smtp-Source: AGHT+IF4vd4P26YPLOjWgdDMNK6TfIr88e5uQxZ9spxEvgsormiXWmhR7RjoCr0tm/IoEzQpbKjiU0VxVwAf2Slk7RM=
X-Received: by 2002:a25:d055:0:b0:dcc:a61b:1a72 with SMTP id
 h82-20020a25d055000000b00dcca61b1a72mr1784068ybg.47.1709198543817; Thu, 29
 Feb 2024 01:22:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-5-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-5-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:22:12 +0100
Message-ID: <CACRpkdbfX=fOLgP+2b15up9Dt1=W4qFG0UrCCnOhkjUF5X+OLQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/30] gpio: nomadik: fix offset bug in nmk_pmx_set()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Previously, the statement looked like:
>
>     slpm[x] &=3D ~BIT(g->grp.pins[i]);
>
> Where:
>  - slpm is a unsigned int pointer;
>  - g->grp.pins[i] is a pin number. It can grow to more than 32.
>
> The expected shift amount is a pin bank offset.
>
> This bug does not occur on every group or pin: the altsetting must be
> NMK_GPIO_ALT_C and the pin must be 32 or above. It might have occured.
> For example, in pinctrl-nomadik-db8500.c, pin group i2c3_c_2 has the
> right altsetting and pins 229 and 230.
>
> Fixes: dbfe8ca259e1 ("pinctrl/nomadik: implement pin multiplexing")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Since the bug is not affecting the deployed UX500 systems I have merged
it with the rest as non-urgent fix, but it can be backported as a standalon=
e
patch if the stable maintainers want it after the release of v6.9-rc1.

Yours,
Linus Walleij

