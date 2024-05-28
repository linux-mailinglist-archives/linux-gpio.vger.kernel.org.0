Return-Path: <linux-gpio+bounces-6725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E7B8D19F1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 13:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26DAE1C21E16
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 11:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985C516C6BA;
	Tue, 28 May 2024 11:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLVLPC4F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB82616C69D
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896642; cv=none; b=Sx6DGeZVcvir00BjDpEurjPeeMQnev8cjJc33RxrugEufflTCR8Sv4Up4ojZ7iJC8exim/GPQ2OjYVQHZ5tXTGUsIO2BtsiAXPXXSqYR1nLbrXZHDAKRahLp+NzWqqh6UqWNK9licjg6qv+S8X0yRxEqgY3ke4OgW7roKYetFNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896642; c=relaxed/simple;
	bh=yOEmwDlZd2rxD+/L1uaF/14KWl2R7msUoWWl9sQJuMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=fM/ueuCXLyue/2OBHOgNaFK22BEwiTSWqvhrPePvK8PyTkO6MuJrk71mWP53lTHJs33TzHjOt4Eb9SHAaUsKCUnf22QKlebW8rtrkA1tytJssuXgsI/0G4hR1zLtfpc+TLuM2Fzn7mYlUtyoIEXBXc9zuUoleHVWI9b6scNnPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLVLPC4F; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df4e40a3cb6so739482276.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 04:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716896640; x=1717501440; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDCC8CEGZqZAB2Msg7Dc9A4feCAIq5W2zp1AC6fm/sY=;
        b=pLVLPC4Fhu25amY65NRpnDSircVt3aVW7uz5g4EfjbJdsgOBiYSsn+W/REZHto1lDe
         nVBnyFiYUGMKyhq6Kte5sIrUegMkDf1Dpcyp1hoyVE8GjbbikHXkTeCkZXP483ZRj1xU
         VK77wqXKG4z9a9tTQ4bQzS1QTWHxM/ZY+amuPNR0/Hv+/pJKWuakGpi/Ub2J/dl8UVxT
         68wuMO7ikCC86BKfq9YsglwDRT4R34StAwE85B4aoxIvJPuFXCJy9TZLgMvaJa6GJWvH
         LieOOcXXH4Q1woLFZEmjmRLhrJsCvxwF+tjRz7Ouzp9PaBtzfCrGPO+VXwgpNSQTbz0M
         6F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896640; x=1717501440;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDCC8CEGZqZAB2Msg7Dc9A4feCAIq5W2zp1AC6fm/sY=;
        b=A6Vx/BOG7zNskhccUiqeU4FtAZtinEtDga+hgaz8ASQQ1sDO3b0MHyynmmr3WzuE8g
         TAzxNEBdVYMO52/IfY2mZZOeqA4T1Px13rRJd4S6hS4n5eXYz6DCoBqubt4V85hjo307
         sGQmB+VNbGD+FhPvjm2h5+WpS5foOXO490DponA2zWM3SpmyS4mD1j87SolJCFw2KD9T
         RvogbcTPSlKdjnSR4ruhs5DrI+paRHFtRjd2qOWICEeZnGXyhaWlBS1otMAzbff+L/7y
         L/IVaJAoD9PUP+2LcvkdKjhC+sljSeutl4CEc5Tw2TAOCm3UYsYDNbIZNpfK4VIm/Hb/
         6FAA==
X-Forwarded-Encrypted: i=1; AJvYcCU8RyA1iVbPW7rw4fgvZzYc3iTO56n+Se40BrGIZ1BktWJ+KGakTtVJd+QHT62zCZXDu+1eo0v0qJDoAVYmipBl9Mi3XV/6hhObeQ==
X-Gm-Message-State: AOJu0Yx4NzdSlssKBE5X/NX8V4GcDLFVACGWbO7PhIHE4GU7M6uRidaK
	LYz5V1BzJHeKIp9iSLy9INY0zpyI0YMXg2P2tQZuTf8V0hE9skU8vZySKcNU5hUGMWYMhLqv2Pj
	LuM0RdkdMe4RrNH1c2gaLbCWEYs93qPeQrQ7cag==
X-Google-Smtp-Source: AGHT+IGAlEjh+hwoEoU8O0CZzP7G3ESAVthO5rQ3B4MUj+UE7U4isFNhiJtbVLHDWwHzyej5tQV+REwk0Y5mZnpxIBg=
X-Received: by 2002:a5b:d0d:0:b0:deb:9e3f:8c7b with SMTP id
 3f1490d57ef6-df77223c93emr10443794276.60.1716896639907; Tue, 28 May 2024
 04:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zktwd4Y8zu6XSGaE@Z926fQmE5jqhFMgp6>
In-Reply-To: <Zktwd4Y8zu6XSGaE@Z926fQmE5jqhFMgp6>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:43:48 +0200
Message-ID: <CACRpkdZd_aXy5Dv_pZw5ue+T=1i8_ERP1Anc5Y_mu=cyd_hbxA@mail.gmail.com>
Subject: Re: [PATCH] gpio-syscon: do not report bogus error
To: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, etienne.buira@free.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 5:48=E2=80=AFPM Etienne Buira <etienne.buira@free.f=
r> wrote:

> Do not issue "can't read the data register offset!" when gpio,syscon-dev
> is not set albeit unneeded.  gpio-syscon is used with rk3328 chip, but
> this iomem region is documented in
> Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml and
> does not require gpio,syscon-dev setting.
>
> v3:
>   - moved from flag to parent regmap detection
>
> Signed-off-by: Etienne Buira <etienne.buira@free.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

