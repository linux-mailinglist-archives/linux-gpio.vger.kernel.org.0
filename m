Return-Path: <linux-gpio+bounces-7484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E95490A898
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 10:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82AB3283C1A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 08:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D79190493;
	Mon, 17 Jun 2024 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsnQaA0Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514CC190479
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613265; cv=none; b=lf/MrxqdC1ydd9JyrWc/nKw+dhue25REGGf2laNvq5yl2+QrZfrOux3T52jDQwQsukIB0IrHyv4vpnucrf+GG0N50A/buaT3qbBl7pT8rZFFlSwxRWAOCh3WKkWoWCudx3A/lgz4VfybVyAXSXMW8aW0glS7BGl43D7Q0o8iQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613265; c=relaxed/simple;
	bh=xVZH5Eh10Go0f2JC6/AsgGwYv2L51fNuP/vXYqA6JAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQ75K5TchrP3PxN+VDPj24NaBy4zGaq5gWHRPLY997XV57uy7wAiI/pFFX4LB8x4ko1Hco2Iqa8L28QIT23WGKkxS785ze8RwEe8hzb6dxypHnsg5Vb6oieYc/8v1LhOaSP2mwqDYLPMpLDNjDO22jpwQ6OIZoS0pUo4uYV5Hk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsnQaA0Q; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52c525257feso5303036e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718613261; x=1719218061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c178G+2yIMhCGNtyLylfXoxRy4wlWsuGAL4Sadl3KIs=;
        b=HsnQaA0QK400ef9k5CtFYGzE6jFBiKH9cd1LUaD7HysqVUw5KYbCwSY2Ed5Dx1bsio
         TniimF+k0VBU5DexSLX70qmSE2rwsNq/jTKjwAzEFTjvOSRjx53xqiVrnYUpm1wgCK4N
         9EDm8aPWUZmTIo9IKt4LN6aFmcFzsjnLGBGs5HOnp+TF04AtYbOo1NUw+/1orEjrGgw1
         mVFjn0TyhlFHL6i2toc9v6wP08PhAGEkctD4Smh+lWKFa23sULQHQZ8nASfQBD+hACmb
         PfipAJVvvpfFmQ4Ilc0A4zy3T0OHyIIg1e2YAcfIkb/KHXTY+/kmEq0SqIf5J0oz3UJE
         HbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718613261; x=1719218061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c178G+2yIMhCGNtyLylfXoxRy4wlWsuGAL4Sadl3KIs=;
        b=tt24hiSXyIrqvkjjo9fRA8hH0MZ2ewcAuxEzV7+sMLYro6XAPfa1I331J+kC3US1bF
         H2mOYj8yPQSG7s2EzP2auxOBiAoYODV/0fFsY9Z2NcIU+Edd/etGo3s1IYXt0sxUmp9z
         2KVX2x9Z3NgOxdSRqbu3oE7KzlsgRAYMtLPVOhjlzYv82JrZDhG5bCyCSXVpa1khHUHn
         qlzEkkG5feQlW7ionQHpw05YCMwtPt/7zY9Mkhavx5tlYnJkhJDgj7gtmYJOMcZ8shf0
         3Juoq6mUVF0e+zwnHm4zSUx33+5NTMdWluokvpoUlIAvemIaZkTMM35Tpf5wGysvHMi5
         Ml+Q==
X-Gm-Message-State: AOJu0Yyja9hIRn2wYTRDOdZjG33wbn3jDSmrutExGQaVDxemp+fSPz9i
	H8devJswA1sRkw0cJL5upYgoFsxQYdo80RE64gHgOQyJuKdsbW8tp498DEygbXhMSn0OpgyywCf
	vLSTAJ5i+/ACxApxd+EFVhirQZpdqTxJx+8OHRA==
X-Google-Smtp-Source: AGHT+IHNjTY0R0nFxHz24s0m9BH1OmkyoC4La+Ff7uBEcN/RW72VC+To09uvm761ewNBAGnkB5ImAQRSY2d7rVi1Uw0=
X-Received: by 2002:a05:6512:ad2:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-52ca6e55dfbmr6138858e87.14.1718613261526; Mon, 17 Jun 2024
 01:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606023704.3931561-1-yangyingliang@huawei.com>
In-Reply-To: <20240606023704.3931561-1-yangyingliang@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 10:34:10 +0200
Message-ID: <CACRpkdYAhm4cU6GgR7PXJqLg54d6BsiMBMgnZqB3AoS+4KdjJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: fix possible memory leak when
 pinctrl_enable() fails
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-gpio@vger.kernel.org, dan.carpenter@linaro.org, tony@atomide.com, 
	haojian.zhuang@linaro.org, liwei391@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 4:39=E2=80=AFAM Yang Yingliang <yangyingliang@huawei=
.com> wrote:

> In devm_pinctrl_register(), if pinctrl_enable() fails in pinctrl_register=
(),
> the "pctldev" has not been added to dev resources, so devm_pinctrl_dev_re=
lease()
> can not be called, it leads memory leak.
>
> And some driver calls pinctrl_register_and_init() which is not devm_ mana=
ged,
> it also leads memory leak if pinctrl_enable() fails.
>
> To fix this, introduce pinctrl_uninit_controller(), call it in the error =
path to
> free memory and replace pinctrl_register_and_init with devm_pinctrl_regis=
ter_and_init.
>
> v1 -> v2:
>   Check pinctrl_enable() return value in pcs_probe() in patch #2

Patches applied as nonurgent fixes.

Thanks Yang!

Yours,
Linus Walleij

