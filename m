Return-Path: <linux-gpio+bounces-7043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE78E8D7D39
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24824B22B03
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 08:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9661559B4A;
	Mon,  3 Jun 2024 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EssOUEOl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ECE5EE80
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402980; cv=none; b=vDy1PV1ZSO2FKkD3TMamnPBeYCunl2+Bv1XU1I1ujvT/bxfL2+2hNIO0XG5NHl4cbl10jeFH6FkSBuBx6CVck6A+P4tH2PH3RjpsUCoBHMpl6DI+ZkOgIVm5SS4ZHSw52lDCxyFf+v9UmigxYlq1qMvn8vid+fC1acqANGSAw/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402980; c=relaxed/simple;
	bh=5TmUo93oyC3+9iXo3/Sa/czVGNwc4D1J8jA2mGio+7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pdsttI6nAEOe9jDsee5Z0zRP5Xea5y151df2upr6axZm0Dp9bDrDuvinni/FDZoP1vyhhA7B7yBsCICtZrLo0EVi7XMM16jjGHVGgYLGoBR6cAuDTUU21QkoP1ereBkFTJi4MM973ysR5oAr2T4yX4SNMOklOjHkRNOGEpsg7CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EssOUEOl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b950aa47bso1709440e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717402977; x=1718007777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V23ToOPtriLmuBIE6vEf0wOOURxTZ8OOI45GzHXOxMc=;
        b=EssOUEOlMm3o8wumrzCFmKS/Rx/D3aPYMOZDHuU2aSz3a90XeftE6tS23yLcTlMZGg
         vH2eQsO4Vtuex71XMe10g503y1Qa4/pZFdKCgJYk5bt4lRxbrnUkpTt5iwAijwlbl85z
         PZcTA7YcCdQwA0dElQsu1Ewc1CzyIfReRNE6Xyt1tT/MUVdFnk4B5lFCklDorjF3jfTj
         /bllpKA5ApmZSV6rTOSOzMap2EFLbjYTm1DAJ12a12qU39lNyCaLWYa792716gHpezAi
         1Kx4s3SxL2hBahuR/dJmVeVSkc+RKgJduSdjeET1H0YKwoyyvQ2SQYtD5x8GlqZp4xtw
         8wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717402977; x=1718007777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V23ToOPtriLmuBIE6vEf0wOOURxTZ8OOI45GzHXOxMc=;
        b=Fdg92t514NVHUE2Vv1dqEOwovq9tpXVYE1MiA83oN7azTGjTJjakh7PONXMlO2Nzq5
         0tF3NXOIZFAZ74/5/Gm9WGi0DbtwezntHKqPm9ec3uPVo8j9HBAIH3SRyHxIe6qeNo1A
         7xjs3qo3h+qvvfDg4fB7eRdYgE7E7DDAH7k/VFXgLqaVNlx7SijAVMNogafdcqNTVLn3
         SDDfblufJNt9kVRHNyi2xXXvDZAFfp0frYg77aLJKtAKE/AUu4385h/4JtfyasGeGtfY
         S1LyqNm+zljG89FhA1U0eEzyVJO52zAIZGjFarjNGKVVucDSn/BVbzSfBCiAbRjb2Bhl
         IZng==
X-Forwarded-Encrypted: i=1; AJvYcCWsGarHlhR7Hij8miRD2j5N8B3wh4zHsM2zg76ZTUTzYwqlheKYDMVXkgOR1XrTAGc10e0vM/UtBTM9VELVPagt3FGrg3LGx0JAag==
X-Gm-Message-State: AOJu0YxoPCkbiTtk08PNDEyyV5voX2vywJKNdYdtcUPkQIKdwp7ankMJ
	QNC1nqVnwHBn8xL6cy63/hLdiavpNcZRYDsCovXED26j2XhbhMqPGHTgNsOYDk7DyXVIaGCsOQC
	4
X-Google-Smtp-Source: AGHT+IH6fyhRP0uUNvSHwtEX0xg97rrGsIJCHIOAvbM0KmDQjlqppkhVzkgN180N3d4h5VEUrTnYBQ==
X-Received: by 2002:a19:6a09:0:b0:52b:86d7:5c67 with SMTP id 2adb3069b0e04-52b896af23amr4695197e87.26.1717402976836;
        Mon, 03 Jun 2024 01:22:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213411b25dsm85063515e9.40.2024.06.03.01.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 01:22:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: brcmstb: Allow building driver for ARCH_BCM2835
Date: Mon,  3 Jun 2024 10:22:54 +0200
Message-ID: <171740296569.11000.17572807996742705741.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240530181737.1261450-1-pbrobinson@gmail.com>
References: <20240530181737.1261450-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 30 May 2024 19:17:31 +0100, Peter Robinson wrote:
> The GPIO_BRCMSTB hardware IP is also included in the bcm2712
> SoC so enable the driver to also be built for ARCH_BCM2835.
> 
> 

Applied, thanks!

[1/1] gpio: brcmstb: Allow building driver for ARCH_BCM2835
      commit: e7ba9d11e9fd97fbfb4ebbade04d09c23f90e3d2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

