Return-Path: <linux-gpio+bounces-27629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A0EC0C9F9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 10:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A398B4EE9E8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 09:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC48B2E88B3;
	Mon, 27 Oct 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2fzTP3Bf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24276E573
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556776; cv=none; b=YtWLsm6YGQC8jv2b4a6bg/FqrMtObY3KUqt7fUkaiZqHhde+B3KvMI7ec/z84a8alt0zsKjGT9OmqoGofZ1bp5oaYc7f/QJiu8uJ2WJRHLG0UiiZPUQ3PS0cPSiGlSxmoaKVEn2rRtaQcmeTn5hSdiF7s3BTOhzKBOhUacUjRV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556776; c=relaxed/simple;
	bh=bolzSwxyoeuw3xzSsGGpFrysawU+4VMK9wZj0OQ4h3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJM144VZUz+pCfwsNej5BTGy/x2DSw2gXuBp9wc2GhO6xTszEIDg3uwWqQwEL/l41pWy38ipVU1ETrzrWkMih0+1J1vQtQUcsRWyjcKJXWwMJ9vuegDy26+/aBBprDS0SB6+4KnVzT5f8nBjYpCaT2seu4RdvWo3x4OSeBxZo4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2fzTP3Bf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-475e01db75aso12446805e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761556773; x=1762161573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLwTNRC+QXM2wltZXmt1/Ig8frLjkwglkfeHmY2zBeU=;
        b=2fzTP3BfHTUZg4J7uwcGpZMk6fmiwuBCkG53GLOgKLFcZ3ncT3daOKrVbc/5Yuiym9
         GfBmmLoGHwvf0PogrPA34zHx7A7XVNqDC7b5ZEBv0q/f4hT2OA9Fn1IjqfO5llhnr5UB
         +2fspOVdj62SvLdq0ZPrhrRl6pqZAV2uD9Kv8D+Psn97p9XLm0cxxiHlOMIyZZMVOPgW
         yE800CHYcUaeDZ31oYepOqd26LIITOzDlp1L6LwuG1WHkeTClOzNRU19G9YvPi4UlDhb
         FsN9z1XxXAxhc6VF4pbrS1dWHF1gNgdRrMaeHSHJlO0iUE8Jnr9trivlrFAvAx3XHXVD
         +orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761556773; x=1762161573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLwTNRC+QXM2wltZXmt1/Ig8frLjkwglkfeHmY2zBeU=;
        b=qP7Gc58mAS6loHNCsGMBuTD7Ck6u24LZ2/NQXnVmDhQw32fKmF5VFY9c69PpAJOpjQ
         mPFZmCH66oR+LQT4sD48Z1E8v6+gU6wep1voVJHBj9KzCuRiGBB1FDaIUrjuLpV1KHvO
         db65GTh26sDMH8XjUiXc9ZjWJI+h7KgjiPtbfGLF61QcqB9PaWIt+fZUAba3enRF1NmS
         fN6BTOUda8zhk8MU9GbZwtcxS+FPO6GmPk4C/o8zavd503LfV43Rs9mQmpt8ekAf6d45
         6XXvkDnpc/wVG2UHyHES88Rh7W+40GnK54LBkOp9wFyjOnT18863dfAWS0vPIuG3WWvE
         CUEw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ebGPKFpDnVKAklE1MYLagaayRVh59cZhv171HeIm2pu5SQtVADpdOhZbt7iCEqTNflD4Rb+NH2dG@vger.kernel.org
X-Gm-Message-State: AOJu0YyvD4pPtC9+sY/qf0jJHsGvuEANQ+ChgtJKkz2yxfOo2ejmbJCe
	PgqvBs0onx/fYRfLvGT7FbAsfcNP8ljNE+A6h76024a5TRcCWA7mWbgaSyoJfKLhylI=
X-Gm-Gg: ASbGnctZJQwKs8LoZK9v+YVWx8ZFxNVO2wQ0mx4+lwDNnKA4KGFSWKeBRqpemwojqOi
	zYCJJl5ijRHIqNGACpVne9hL0vGl4ved1aSfGsNZsUZDiWCcQyfPuQdNCb9PSvFHhnWZiKkOei5
	kxIulcDH9772Mf9Yh1gYvd0cb5xK0enzIlOWaxNSUZWDyZ95XTcsDDL83tcbfNiomywmA61FMY6
	eeAlQkPCkAanegbxcbRiZXl0B18aV3tlNwosGIaykbghmnkrjSlq7j22BLE+kRK0jAVgTT/InPh
	6rEe4munrCqHLTY9iF70BkP0037T/1Ox1DhCb5WBYI1WxC2BSVIDddaUwx9jrGs08Km3u9DLDd8
	F72ajB3GgWfGaSQG9O9KF27K++6/MZ/1+ciKDKBOoFZxdkqXXScKkjtKajEbyVFywM8vnRHppQ5
	boeuh3oxMCt0I=
X-Google-Smtp-Source: AGHT+IFydLgSefUUU+8rU+5qeCjpWGOKuNGnYaoOgJsG9vuHDfisTUDla/4LWqckkid34Fks2szOHA==
X-Received: by 2002:a05:600c:190e:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-475dc5c3b70mr71837635e9.34.1761556773351;
        Mon, 27 Oct 2025 02:19:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd494d5csm126341835e9.9.2025.10.27.02.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:19:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Walle <mwalle@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] gpio: qixis-fpga: Fix a NULL vs IS_ERR() bug in probe()
Date: Mon, 27 Oct 2025 10:19:31 +0100
Message-ID: <176155676924.14205.13738702984732824686.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aPsaaf0h343Ba7c1@stanley.mountain>
References: <aPsaaf0h343Ba7c1@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 24 Oct 2025 09:19:21 +0300, Dan Carpenter wrote:
> The devm_platform_ioremap_resource() function doesn't return NULL, it
> returns error pointers.  Fix the checking to match.
> 
> 

Applied, thanks!

[1/1] gpio: qixis-fpga: Fix a NULL vs IS_ERR() bug in probe()
      https://git.kernel.org/brgl/linux/c/9452252dff94ff2cbcd33d3418c2b95ff74bdba5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

