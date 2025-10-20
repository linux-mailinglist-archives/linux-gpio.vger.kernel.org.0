Return-Path: <linux-gpio+bounces-27294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F326DBEFE7D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F0D3E6556
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B457D2EB86E;
	Mon, 20 Oct 2025 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y15tKSXK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA89D178372
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948690; cv=none; b=Me21g0dreXdPYkJ1tbBIwopCzfsRSfbHclLUeN/9oKlzlagixn6UcCUwhshzgMq1Kcfw7RA+GnVTT0ptSkhGyagKE/lnJm2G/L+H/1spI0kD+9EY6hisEYj5bkS/NyHDkaJLGrsyBIh8/mVief5MXe/mr1SJ+mFTj/A9nMjpSO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948690; c=relaxed/simple;
	bh=9zlHdu1C0OX3LQKq/csViY4KOIK1A0RLur/kX4QaQsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CMCtTZmnyk5fvpA9Oee6FrXnSd2p8MaZuxF8GwkTdCKhELoQDVVuCd0LjGxAShB2Y3Aabk5Hd4bLgIV8WRRXW7DRvCrCV3YGkJ2PjPl0U3yK/1NEwaJyGFjT2kMPb9lk/bolmguVtXOSJFKHNUKjKHxpFbc4rz382drnu0vA5RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y15tKSXK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso36840385e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 01:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760948687; x=1761553487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW/AkTk8WlPjo3na4ACa1EYleQcJKdyDIWqp1NdXgKU=;
        b=Y15tKSXKDmQyX3VZJFUu8f1iVTx6lnd0y0zmsso2ucoAZu6OMaP2ixqT/IZC8e1Kpn
         tTOSdqS0l797ygAn6hUa9/VO27AXNTYZE+dH8458B5QOvykC8OYtE/FCPhKOP9qcyeLC
         ZUrhI/fkVY04tErNeJ1+bk/XomgWvE+HY2+4UBPrAVHNdbrYxSjLhEk7KAQYaWuSpoH5
         7v44T9vXbs+RRQqVMwH0qc8J+aJ3lXVSEuMOkCW1LN5Z+5PvPxNmrvAuVDLM2sQVBoIn
         UiyyP0cCYmYkciyOLx1jL6QlJuoS8+8KyyzGDkamE7aV7H2MFwcoty+2r8miH+CrRb0u
         xFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948687; x=1761553487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vW/AkTk8WlPjo3na4ACa1EYleQcJKdyDIWqp1NdXgKU=;
        b=mplmgXpZxk5qyD2PGgGgJnw/fsv+Eu0f47cOBqR1Y32crVFkhaKMOFPWQwcgIT/wN2
         wFvpn0yO3mLGoF7uqooVv7sS0pJ6lkYBowfh/pvvs4BgxIjrt2kXDSp6G2b8IGtD+d0s
         byykIYu7hUGIjJrB2qJvz/c/xyHGJylb4xTB3AO5k6e6GPVTfRvJIMk1NJtSuDAJhcyK
         +6CUrPE93SyO3WVBOYJ5weSX4XecY35nAjik6LFkLpLMs1mP4ltsn+Fmj0MK4ZdePmyq
         yiM3aRWGsJ/uY9W57lQNFnZ04Blfp4+4X2iaK3A/OmXnAppoqtZMdR5IFqn1mSFMrEG/
         jrjw==
X-Forwarded-Encrypted: i=1; AJvYcCVkVjq/IifZxBIs78oKrLtY/E/DHg3Rk83FezlIJV79O0Z2YeCeIR2ZaZnycbh5xvbvfRLQz9H7c+9X@vger.kernel.org
X-Gm-Message-State: AOJu0YyieHh5hbsCxVpkmUGyFTque98F9ZK68xWWZiY3l8g3JCNlsZck
	n39PqBzWApZeMi4Tlhu/ZQmoATHcnPiFdHAoJbsQMbQa/VFIcqMOBFLdelPtzPVsHXs=
X-Gm-Gg: ASbGncvdVhHaLvR/yWUi/PtG9MwGGcDmNeifLY4SVOy5iUXlYSp+zqvFRVBhvvsxwQg
	IE9nPUY0jfQan5fwZ1qt1IiJaCY4fltIxHVvj1qswxXIKsylFwVVYp9nUDpWOILM5pldlOc/PCU
	n2awuY5+yFFfNTpCyTBo/HAhfaVJncttDbK8pGtqL0pPowrV4pw1UWBMWGJvcTRlGf0RlIpAk5k
	f61ccqe9bV4PxKHy0o1pFWp7M8Q2BPUyJufZNMHkuLWdHl6PImw2ERZ296rLqmjszs7SlsJv6oP
	02IeRAvrjQZzMzfLtzvRv0l8LEzde2Gfu7uK/MbIAt6ujjmS1Y3R8nyh+WcHGBHpkWusBAZRnWX
	tMNwtEz6P8NF23WUloR2/YrWXsZVWFcQMmCOn0RTDW8YNs/jww5okzt88W1+tkCYG6cqoKwZyka
	vZ
X-Google-Smtp-Source: AGHT+IElbGLyhlp/1ybVdhj0rXNPZOg5gvo0dz1RPUfJES3/ZAsbvfhG1ocMD7SptwzEZ+DrjQdnHg==
X-Received: by 2002:a05:600c:3512:b0:46e:5b74:4858 with SMTP id 5b1f17b1804b1-47117877122mr69462225e9.13.1760948686986;
        Mon, 20 Oct 2025 01:24:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5b13:a549:df98:9c00])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c29sm220299395e9.12.2025.10.20.01.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:24:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mvebu: Slightly optimize mvebu_gpio_irq_handler()
Date: Mon, 20 Oct 2025 10:24:45 +0200
Message-ID: <176094868222.39929.1582779339210420040.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <7190f5def0489ed3f40435449c86cd7c710e6dd4.1760862679.git.christophe.jaillet@wanadoo.fr>
References: <7190f5def0489ed3f40435449c86cd7c710e6dd4.1760862679.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 19 Oct 2025 10:31:38 +0200, Christophe JAILLET wrote:
> In the main loop of mvebu_gpio_irq_handler() some calls to
> irq_find_mapping() can be saved.
> 
> There is no point to find an irq number before checking if this something
> has to be done.
> By testing first, some calls can be saved.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: Slightly optimize mvebu_gpio_irq_handler()
      https://git.kernel.org/brgl/linux/c/eb7f1c8415bbbb81f8674a490a5da7c22599a012

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

