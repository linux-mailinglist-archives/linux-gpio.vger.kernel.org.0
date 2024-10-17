Return-Path: <linux-gpio+bounces-11496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 120619A1B25
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBD4C289E71
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 06:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8321C1739;
	Thu, 17 Oct 2024 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w0pDHzmL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B911917E5
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 06:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148281; cv=none; b=nrclKXdqt2NxNWanGdVzcaofyFLM3w1L1TSMIhtxyxjC97yehbgKEJJWu3F78sljoZadvoZ+onNYcb3kkexB0bP5psfGVIbYXW+NFwmwFOU5ikGZ/tpXSukeOCaglwEWj9iU3cgk7wv1JxXws8aN0BPEe95Z6lOXUkW3UUTgjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148281; c=relaxed/simple;
	bh=r8HBRYigN/+XvbW+oTD8AXO0DQD1lVTQq5dKYuD+x6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I87lxVROelHDkDPWzGJOVG7MmSL251W6ctzI0FDiCVpfmAWyoSUSBVLdOuvOSXSSkqlSTER1wpnKxgdIw+tfDDkk5gYhhr6yOZXReGMztErmQ+g/yj20sho/2yHp0bQ/lLAAcDy772p962i8xvxIn+X/SZGyEkh6EFRTHZqFPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w0pDHzmL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d5689eea8so392757f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729148276; x=1729753076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckFKos3k1VltrSwOBak8XGHIDoRaTtfm66p0HKqbknM=;
        b=w0pDHzmLtASL72aoQrXmSDbofOQScT5C+9d6nUL+PNQYbUTDfWknsHaSZhicjtd60Y
         N+JGiEPlU9/0RIskBheWFfU1DFAb7CKZYZvR8ggfEtpQK7QJR5lapFn0Ikw9tFz9OUQx
         iU4bDhK8aKO2mL5/6OxcS+CH0zOSmilLEbPNNnOENjGH7/pME+3vI4WrXhXMY4ZqOcEs
         aoO1+D5q7Kq/+QoKV/QOWGfJONTpgPEPtw/NXZ0bSwRX8uM0/hYWg5GA9wcAoxPSo8Oh
         q3f3BJM91O2OgH8MXhJ9ObsLleegSH4lQ/Z01nB5ZUNbxsA0Z4Rb9dl58qNmy6Ek4fo2
         KmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148276; x=1729753076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckFKos3k1VltrSwOBak8XGHIDoRaTtfm66p0HKqbknM=;
        b=rXFySYwV9Bf6UX9XCxkNKcAYEaQt7f4jMEKMr+2eivD3neYD3gTpp8AeMaLispM0lg
         3SCtluTxvd071Qm6iRYp0Xz3zrNWsTwTGAUFvZu+MmNdYBA3qjYbOPBCUGzvgvqryeF5
         b41xFXCQIkOZa40oUDd2G18tciIXIulZe2BBOlr8W5nC2z07D+nE1NPdSEr2syEDX5Eb
         KHBy2UnzvSMmcStkUIwQUeQSZimKniv2vWcFrpZTwkBFeV0fngHz9jLAHrxQcZwkein5
         qNS/inFaVkAzHW0LZ9MvQSuxupVPsX2PqiKhPeBZzAo8qXjzKFKuVj6+RGyNXMHYZs8z
         /Wkg==
X-Forwarded-Encrypted: i=1; AJvYcCX6W/2HUx+rtaGyNICrRMY3IlwKkpl50isaYqQholeu4vfUWFvexuo3PyEHfwLRTfDGh+iKeL92TKTr@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuk5tb0UFR/oqxOZvfmiC9W9mf2KN+Ntj18HCtu5ATS+CkY3P
	dBclKumq49rS1/bSEy1S584Kgnjm8c+Jcs7cld4B6lplqiZPyMLHX6JsGndOrpA=
X-Google-Smtp-Source: AGHT+IF5smZC8b0wY4inas9AaPOtU7Yrj9ZRKnkfn7nVxxAqqq11LfJ7fYy7cHx8Px/CGhevjvbWTQ==
X-Received: by 2002:a5d:4947:0:b0:37d:4afe:8c9b with SMTP id ffacd0b85a97d-37d86d5fec1mr3741945f8f.54.1729148276457;
        Wed, 16 Oct 2024 23:57:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa87adasm6260026f8f.29.2024.10.16.23.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:57:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: amdpt: remove remove()
Date: Thu, 17 Oct 2024 08:57:49 +0200
Message-ID: <172914826142.5858.17899543810767806657.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014092909.90607-1-brgl@bgdev.pl>
References: <20241014092909.90607-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Oct 2024 11:29:09 +0200, Bartosz Golaszewski wrote:
> Use the managed variant of gpiochip_add_data() and remove the remove()
> callback.
> 
> 

Applied, thanks!

[1/1] gpio: amdpt: remove remove()
      commit: 9a94580120bff8040e84e2d500f8f462f8704dc5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

