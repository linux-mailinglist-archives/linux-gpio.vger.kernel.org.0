Return-Path: <linux-gpio+bounces-7485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E590A89E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 10:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C2922841C3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 08:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEDF190493;
	Mon, 17 Jun 2024 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oc9LBP4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FF8F50F
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613490; cv=none; b=gri8DtPBekWhqNoR7LTad/7dOxFczmBVIrx6KRpvaU8PGh39KoCnb7eHgByLS+zx+TQjjCI/MwnUYbQQ7Wnx1UxXZILMrzTZpNqhBgcybFSCSu9O/LNiJtKA/mY2Br/QQ1yK87S3vdnfOUu8YuKJRWLxdt4MRX90bz7ctPmREXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613490; c=relaxed/simple;
	bh=Ad+DEAJ96q3Mb3dlvrA9VWDHz1PLJ9uuY9NHcvPv2lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpihvtDcEOKDDkfyS6GzLoekv7Bg+mgnKBLz3fLbws/KuMy64dv6vEq1KP6/v7aHCDTUvp7sseW6CDRQjSTF4LbNwPlIkzQObDln9q7jAC+tZItI3YGcHdO5YGMsRkG4ME5EVTe1fLXJi80cW4jX1Z42/5IpSA++FYjH+T016sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oc9LBP4f; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cc129c78fso62464e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 01:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718613487; x=1719218287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad+DEAJ96q3Mb3dlvrA9VWDHz1PLJ9uuY9NHcvPv2lQ=;
        b=Oc9LBP4f3MrrZ2v2Q4OBaiPp4mjevzAlyGTLP4X4mtfpSv509//To8fNPMPuULQEqu
         3buGaLszW1BSx19Y8QKs/+k03hyaMZ89tlhkzBPhwr2MHRZF60XSw7g+REB7cVyNhDFh
         adYLwwZTY7ag3p/TBzc0SZb6Gt0ci3Twv3JbQLyiHE2OkGhxkwm2Ui+Sn1kJho417gpf
         Dg8NoWyiVUI+1XgqMdXofX3BjngiQ5AE4Qu2JvR29YKYnOzyUouBz69c/FdRSKdDFyAU
         hIzw82w2h2TZwNnqss/E1AfKmlgMlIUtNmZhOKs4Ds6G/eUTjKFme4iRQNrxlKlBXEaM
         fb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718613487; x=1719218287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad+DEAJ96q3Mb3dlvrA9VWDHz1PLJ9uuY9NHcvPv2lQ=;
        b=Vd8UMj0Woz3QhqNVfEntXaH+Zzk+GLK8Rwlt6s8WhcSbLuS5S605Mgy70WoXiomTx1
         Z7xocgErgztDF2jTjJmLRTnKH1Ay/gbXJuHX8+PENb6kT4+QZF8PNkwNVF6ilNcBWeUo
         kosd4d2hFql7FM3mzF4godd2ENoRzefDMjDcu9ct8sjQOUsYwaREOp3WGMdpxBAk4iA9
         wC7cARzXZ4DaHhgHuBxiGIY6/1PHtp78kavPO40Y/WlK+JhEBMtoKiwniynhLFKZ797q
         klGnbjfDF3p0kXHkJgHBj0jqALgBMJln3vgKp7kdQ7x4LSxGvl8l4iwPGDeSrcJeKGB8
         6nxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDk8KT1NXC42y8brYvyEwDPdZysj+ZWRfduxpj1v333mS0PlYyxLzBRK3ju8Ec8bKoylLrrW4yTdIP0/iTjmxAfhLS0zknPoYVxQ==
X-Gm-Message-State: AOJu0YzDgTIMruJBqBomapNsZHTRWFXdranQuZavv7QXur8hjcaAC22N
	JBQwUlVejSQlwkinqllOMjwjfaLiZ1mGMO4sa22b6ZmR6wWOIzkVHXFInXEsVFyAfDvFDQnJGjf
	+TO/ht+ZmxDp+I6zUI7muxL0yFeBaKOfAnL1bMA==
X-Google-Smtp-Source: AGHT+IFutrW6UzBgAviJa/d7uO/iq8C5wSF7SgFGox1gHdBAGL1yUWbpxRacXxzbupfXHiyhG6WNRXED7ADEqQ0l7ZA=
X-Received: by 2002:a19:c515:0:b0:52c:8479:21fb with SMTP id
 2adb3069b0e04-52ca6e64c25mr6506284e87.27.1718613486857; Mon, 17 Jun 2024
 01:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606125755.53778-1-i@eh5.me> <20240606125755.53778-2-i@eh5.me>
In-Reply-To: <20240606125755.53778-2-i@eh5.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 10:37:56 +0200
Message-ID: <CACRpkdYv3DTqJD1dtgLO7rxn-34ZpyfXCygwvgeJpEFWhyKQrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: rockchip: fix pinmux bits for RK3328
 GPIO2-B pins
To: Huang-Huang Bao <i@eh5.me>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Huang-Huang, Heiko,

all four patches applied for fixes!

Yours,
Linus Walleij

