Return-Path: <linux-gpio+bounces-15419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB0CA2A344
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 340137A3E4B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 08:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D195222576F;
	Thu,  6 Feb 2025 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESxHOkSG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D488D224890
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830981; cv=none; b=kVIF9KqutvMhsDPdFqd4671aoAa9qExdYFptt9FISCJENffAC0Mq73OFB+TSvkAetSUUj/LobsDrGYVg4GNBM4Zba1PkS1q/UeMsJLaBCAs8gUxsDxU1avLHYtSHwBVd2oqyxbYbnyWw0f8I5J17Gw87HcixkCqu5Ymes+6xt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830981; c=relaxed/simple;
	bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ey3mH/iigndX0P2iusQlt+6lDL6E9TKarVVHR2IFoI7LU7Oi6GgPyOwffBU8kzqUBo1Xx6j43XMrQHUVqKM9fmD0ytoid56MpWarAAjk85DqxXX1WPdj7L4v6bhKIKJ2iDEXgcVLTp8D78uBiELwGyta/XahGi+gXyVM/4S1Ik4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESxHOkSG; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3061513d353so6533121fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 00:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738830977; x=1739435777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
        b=ESxHOkSGySg5sK09YWrv5F0oKSehfafxzb4DFzMYWEdyaO2bGzoF2PJtht7rE31Nrx
         k4FLpro3aamDq1NX+yykrdx3T+BIlhXev28062M7lSBNWbi+UOqKCgSDN8LO3Ub88aOB
         0z4Bw4iHsBIBF6CCjr0dCpXufFG5rq+ilrHGdgznmsnsHEdaw/VHB2lCx0uWwCGSc58R
         s/ea9hmGs5STlH1RhiePofMTb1m/hJUV1AGyw8nv2KPYBferksmgqJeCxOM7cKHz5BJj
         qLKv+F/cW6UEuBtfEkM0XKGkbCnMfwPQB80rmmOMSaGFinIFYinQXse9b5WqrsEKCD4R
         ALow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830977; x=1739435777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
        b=QQ+INGASnEyhYnRtX7NMNraMPbr2bylhViXbKJtBJTLZrYA8owHtOzBFAkq6Zd4yYk
         2lr3qhyPkyU90YUnc/fxuf9Uz3P3m6MFeyYxEo30NoNSc3gp0Tzjwigwg8LGDdGCsIaa
         kTbbu/8TQxzBIRu/kU+qRxb185ir5yFfnvD/M179r2Nhqgp9XAn52KwjQPMPG59r0+jw
         ANs+RthvET/k/4pdMYC8mEmKhdB0kqPss4z5odTH9k0mIBzi2bWBriqwgYpSoZq0Jswk
         Kq2A2TFgoqefb+/4Y+8fVRSveN2YCfLWgPsr8N9c3J3UHgWdnnXiRTnJ4uNvdOGtKKg5
         Mbxg==
X-Forwarded-Encrypted: i=1; AJvYcCX745zgXNBXWpq5gFo1CB+L0pFhM9BQzSgiaQ0bXWuR3rSJQghMHumd9ypP951LZ8RiMtKMg32U7Z7z@vger.kernel.org
X-Gm-Message-State: AOJu0YwirzOdJ3WF+Pw4JOK4IZMdvM9v3FfgdMeX3bydHmVt2L9sQIGF
	43MH7PW3MBQKtgW1fsimv2+VGx1j43WhQGqoiH3yT/xm+2noCQp8K89pWYn+rsyUNJImFd2Zq+9
	Gr3qzrX5kZtr/JvkbJO52rCaoBZaWSrKdKs1x6g==
X-Gm-Gg: ASbGnct4QSDMtOmJkjW1bEWMR3ObiGQE2Wg13e54J3RC+6o4o90rqXwEYGU57msJMEe
	eEfIb9WrkcDoLVY03+CxGC1idKiX1g1yc1zp+CF8ASsm9EmQbTpy156iKPs+pJTpcuem37Nc=
X-Google-Smtp-Source: AGHT+IGqiKXm4L+YeLeVQFHSImQCXh+mD3hItVntIkXUihVI1KeHuhPJBTqcl5axbPLpaaqFc/QuLj084XF3Ho3zDXk=
X-Received: by 2002:a2e:a909:0:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-307cf314370mr25665811fa.17.1738830976947; Thu, 06 Feb 2025
 00:36:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118031334.243324-1-yuehaibing@huawei.com>
In-Reply-To: <20250118031334.243324-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 09:36:06 +0100
X-Gm-Features: AWEUYZkX2cnuZf9rPQW-0wMag-z22j76Wt6UnyFkyZ9657h7xwcCtMF7wIeVba8
Message-ID: <CACRpkdbDXYRi-CvWGU-3y3mrVLSTj6EBUtya8X=eruaLBydyYA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: nuvoton: npcm8xx: Fix error handling in npcm8xx_gpio_fw()
To: Yue Haibing <yuehaibing@huawei.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 4:00=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:

> fwnode_irq_get() was changed to not return 0, fix this by checking
> for negative error, also update the error log.
>
> Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driv=
er")
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Patch applied!

Yours
Linus Walleij

