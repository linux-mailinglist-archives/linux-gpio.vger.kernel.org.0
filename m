Return-Path: <linux-gpio+bounces-8887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 921AE958F5B
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 22:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F41D285683
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 20:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B061C3F14;
	Tue, 20 Aug 2024 20:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHHWY/ic"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47449651
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187053; cv=none; b=WRRq9EWCIxxfh3DR+p6R/5oJCHkWIrGaAwFKsH3CGax2Kn0Srg/868LGN8v4cdSbbjPqiLtcZoTjyX4dsu/0hOnVZQaOyHoMCasFWmaNRvnGa2DQ2zgY1dkcQGzim+qU8Mh8KCkPBrNNrzD0lHWhqs+jbccWpwTitrDjVXHe0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187053; c=relaxed/simple;
	bh=k11OP5u/elxZ0IA3f/1NYT9goIr7RV2h6enL68n0g1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnkC4XaM8IowjRLSRXDYMudt8t8crVKpZZxQLLYzL5ip9bWP+ALeKBM8xs/UuXDt64KSQpxSLAxvqF3yH1LRQGYTABWHpYp5Sanb1xfPDgVcRs6ic/yZ/IpJmgYX9AfF7p0iBrxNBp3ru8SyH6CAdCPy611edeC1EdvXW8gQAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHHWY/ic; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f3ea86377aso12304161fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 13:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724187050; x=1724791850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HVhwr7mEFbHuc5+PITNpHPRJTBdthKzTVoQ68u4vyc=;
        b=gHHWY/icG5j3LkTcEN52TYDb+qkcJArkmb3tGhl6aH9p6WdhbLBJ6BwQLe/yYB327e
         /pRhcFshe6LOLxJs24JtoMnT6NOfu+ZSSIcuBHuq6ij8X2OzpiDLPBi55sK1mFMgd2HV
         HB1EqINVr0/ztur4XZHjumAPfyPoRP7WwgXMMQRTBqEyGARoDxvlSuYvbzDxE8qJJrQL
         gPwPNqHCA7xIHLJtYeMuHvCaCWlXf7wUX3+Bf5K3cmSv+t40PdR82dYZuRjJw0X64LPV
         3SvPamQAk6YY0hnWmkCFKTpm59UBuCz5njrtinC1fiPwkpwxSW2XpsDWYxpnzU/3kEwD
         Tc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724187050; x=1724791850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HVhwr7mEFbHuc5+PITNpHPRJTBdthKzTVoQ68u4vyc=;
        b=re102TKHCOBRtB06U2hShCTqaOR+TvpZa35GXjNS7JXQMBoTFpLPp2uXS15To45/12
         rjGS6rZ8wWC7EUJE9zHD1ewxoVTC7uq/cmMDs39Ykd0pI3U6FKz40gyV3b1iSNpcSZYd
         HN4/dIP/mrImTWr+81U73GqF7rwf4ALnifVBUCSZkzFxd94kGmj6IN+8J2JiuXSE0cmI
         5zNdrHwNP3F3GihXNIidAHTgaWhTmKlvNzN536XzwR0fIfSEtl2yq6YGhK0AaGVMh7Gk
         q7pUv2ywriXpFTq3Qnf90dSCyTPV0FO47Tv4UMDFXP3dXfH1e9Y1/hcUdbAmKd89sj1h
         OvMg==
X-Forwarded-Encrypted: i=1; AJvYcCXTxbgYfd1sw+qtjfUaxc9N25B4V5aKL8GrbbV1n6ksza48MJpfDLtRnpibCJoOmLeUtGxC8m0Ya2jq@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdfZENQamwNV2zCMmQVqevVI35yMViubzW+vdYeET82r/Fc4K
	QG5L3VeZ2gHwAeHlLKw4f5BRwBr/PVNFXiUiPWWOsiIqfCXHN/bTIS32ysfh6zHE7hPKPkR1eVd
	/kRJMbz4VTRFd5TkpLnHY8CqwKNk=
X-Google-Smtp-Source: AGHT+IFEkjOZu/qF/T/2rC55OfZS3WzP2xPs8K0kbhclW4En4T8f/b9hZP+U7XobhMMbhofRmQSFL+XoxCX4mbEp7DU=
X-Received: by 2002:a2e:a4d8:0:b0:2f3:aac3:c29b with SMTP id
 38308e7fff4ca-2f3f881cf68mr949901fa.14.1724187050081; Tue, 20 Aug 2024
 13:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <ZsUAc/7jtfQyNU6m@lizhi-Precision-Tower-5810>
In-Reply-To: <ZsUAc/7jtfQyNU6m@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 17:50:38 -0300
Message-ID: <CAOMZO5DLBUwbXukzVJBZx4iOTAR3seX8m6Wdj+a8u_ixvBwkDA@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 5:45=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> what cause probe failure? I think it should be defer probe if some resour=
ce
> are not ready yet.

The failure happens because i2c-2 is probed after the pca953x driver:

[    1.898258] pca953x 2-0020: probe with driver pca953x failed with error =
-11
[    1.905575] i2c i2c-2: IMX I2C adapter registered

PCA953x tries to write to a register, but the I2C bus is not ready yet.

At which point in the driver I should check for the I2C controller
presence and return -EPROBE_DEFER if it is not ready?

Thanks

