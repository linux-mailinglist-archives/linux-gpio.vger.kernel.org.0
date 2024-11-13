Return-Path: <linux-gpio+bounces-12936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E739C70A6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1054B22FCB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F571E0E09;
	Wed, 13 Nov 2024 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzI4YI4v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749461E1310
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504270; cv=none; b=IMPl4qZLu1c01Aai9Np9H5eHwByRd61IwrWCipLYuJ8SHfNJsB5rbO38S1VUCSvabldvQ0pKCylzA9FHll4xqfu1y9M8RcngEF3RpooO7OKrDDhE0yLgit+Uoz82sn9F9GDKVc9pxfCikP+3BQ3c0CrICnqxy7ViibIncRbgbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504270; c=relaxed/simple;
	bh=Ns9y689y8f6zmCcg+0fPw1Yh+V6fP1NKoYCbI8gIu3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvftvQ6aalgyhTDUuNdTKlFVbBcWd1QkjJlVHAy0UI8fMpjD2aauQffi2kALA74Z6Efr8S6IJzoyN8CsecKKAn8QkFOPdha6PXyo9+M2v64YdS1QFiXBK0KLv3e6mA+Hynr8zOUs5s5h65uLD+OPu8bX1TzgPCFWAjXk+h1r/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzI4YI4v; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb3110b964so59521831fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504266; x=1732109066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns9y689y8f6zmCcg+0fPw1Yh+V6fP1NKoYCbI8gIu3E=;
        b=jzI4YI4vRrchcCpqqIDVSBq1D1o5hBrhiSY/m8sD3PC8VlfePt8m6NKapRXBt9YGEQ
         0edayQZcY7Jgr3c2YHavIuHBA/k4qPeP4Z10md8AOBR2wubl5XZIDQ+vlpAOIBTOXelA
         Unr00QLI/7q68/bm12a5KMD3S6pBSxpnMQ0lfUoJHRqEopFscf+ulw6pTZz0Ug8gIfk5
         +LZH2XyIFw600itK2wlde5AIzEJSZbqN3B2WOVyBySgDphql/Lnuv5lbYcwRZDFGDEBV
         kNjHpITYedRYyrHBV0edEG+vQUQEWnbVf7RcKRPLO+1QGsGNOCzyPtidFc+M9meuEtqM
         pvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504266; x=1732109066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ns9y689y8f6zmCcg+0fPw1Yh+V6fP1NKoYCbI8gIu3E=;
        b=jojf+pyDY/E4dxonY99TKLMf+lc67zTFi39VdJKJzPqByei1kbCf7QpL7myTGWi1YG
         TnVnHxVvn/Wocx+aZAU9RaC1UYfasljAsXPb0CEudpon3GfPeMnTna1BbhrJHOx3vp0S
         xniAFRz5sGn/JMYvP4HPuOQj7NTGDR2I30oAdJ1nTC1NHlQRERk5jU/xKWMTUvaWQQJK
         X+Pz67lyGJHYglNslXYC6UtYt82I00VRDFp4ADqftPfYgxpwAsEBUN68IRFOU8PWe3t9
         7be5ajZA7aDlDlXkSEa7slYID6DlQxGOWjbE0XMsN9Oe6Trymui9vcARa1zxESWgrqmO
         1Ttw==
X-Forwarded-Encrypted: i=1; AJvYcCXQr6Vu4ywWR6/n3MTqRNSGQGuAtZ4i19qhxDMGoJaeR6A4ueSNqV2f9QtAq3XPHxTa2jkxotpX3htv@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvWFgKg5AiUZvdTlVjSVjKm4B13toEzQ7M93oLHRfPetKTkQu
	Z2NhrLoSnTH+4y3wKNng1W5+SGNwA721WNPmglPFYKRLckwHMotPL70EHUwC5q2ZuECneIWxq6+
	KJ+EBSr/N8XP2fwNnsV+mK043em+MRkK43ZKN2w==
X-Google-Smtp-Source: AGHT+IElutiwbB0GChUIk6s9+3Hj1zTtPyYMVahc4j+aIc1M11PmzAL7ureY4EqXBaAJRrLw6NSOMokzms+jMIpiufg=
X-Received: by 2002:a2e:bd02:0:b0:2fb:3bef:6233 with SMTP id
 38308e7fff4ca-2ff202ac4f8mr110018711fa.33.1731504266571; Wed, 13 Nov 2024
 05:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com> <20241111023412.3466161-4-ye.zhang@rock-chips.com>
In-Reply-To: <20241111023412.3466161-4-ye.zhang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:24:15 +0100
Message-ID: <CACRpkdZxO--q29BdAv9OLu4tBWx1rAkXM8qaXNYEQSta9zjPOw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: rockchip: support new version GPIO
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 3:34=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> Support the next version GPIO controller on SoCs like rk3576.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

