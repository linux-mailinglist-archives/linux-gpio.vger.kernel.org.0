Return-Path: <linux-gpio+bounces-25292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A2B3DC33
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E1517CB39
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF1C2EDD6E;
	Mon,  1 Sep 2025 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f/CcCz6N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0935F23D2B2
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756714865; cv=none; b=hrsNTVFgREVpIvwu8/y1QVeaEug7JdhFdMeZxdDQocPVux/p8UNCnkxpD8HhG6ICHbkhNQNd0y3rhjLVDL1bkDwIq5hV7cevbUyBnIEGFF26Tr5I2HNnfS3YOYRoNQ4qk9OJblAI+CpX08t+h2zukk/qvfdNJbE1K0VmPzEMkQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756714865; c=relaxed/simple;
	bh=Ey5r5LzZ5mqJQFa5/hwzZOTkBASnqgBYv8P5zjbafME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j6yi3cJk2CrVk2mWsMQM54dxpwq6VbC2MNYjHSfaMKBlNGblk6xzbkiCLA5VRuV3+xWsdW41XulxyOqTlkkt8ijmydmRMFEaVvvcCERsO/4COIiuVMyD/LWxlCG5Bg3RGOjULPClj5oeli3f1Og6TmeydkNwaNaLIyrTo5+Vuk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f/CcCz6N; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b86157e18so8213665e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756714860; x=1757319660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDXy5RfngT3BXReqDhGp/CaxOwU22Ty4Zht0U5yrbxs=;
        b=f/CcCz6NIx8iSV6esOMPK1nz8CnQddf2Wi1Q0gtBUAVp/QJ9ZAiS5hi0IwQWeDS9iK
         VP6rtGEs033pEnlCozwntYiiCzRaq8lQrD4hm67MEg+Lk35Bm9EWi00QB5hLPYCMKwJb
         cuuHGUWsy2pNcj+/4MFKuhkqG8Y/JNcyz6JQF3vW8J3HOjMX6PN+V9CWIarquHLdn8bD
         Dcs6hVDV+jBeT0qgWaAsfDL9c6oeFTx9PW0px3feQ6H2EcAcS+8ZcU94KMIAVrNMecXe
         1YVBsomdGnB2LJKo0iZRcC7zZy+I8VSP395+xDLIU0BQ6Kx9bIiRvyk74EPKVf8YV8+W
         kjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714860; x=1757319660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDXy5RfngT3BXReqDhGp/CaxOwU22Ty4Zht0U5yrbxs=;
        b=THA6rWEe3bgp3VJCIat1CSG2KBMfXr/KIF1wdv/lpRvLxH9/e57tPUctrw7e4/zJa1
         46A8vGO3JEEbMtchcFOB1wT34v0dUczn8KoKnfbd+x5qd5onkTNKAeDfupFXk5uyruC0
         f06CXKsFgUKY7D+Zz7qHvK2XIGKw4GlObRLY7qmgmSSnnCuYw7d2/vsPnhYChiyfwMSR
         l7noqybmGt9PWxwXqWQ8yo7LtkANhFrGHQI8YzjJsrhcgHDd8Z4VtZbwTDC68iq6QHpt
         WwYN56jlHyXPTjjeaAfhW3O9psRHFQChEz+LXAqYIMBiMo9b1i9aVt6MspGS1T1qGBW5
         7+nA==
X-Forwarded-Encrypted: i=1; AJvYcCWnY7aUtpMk5HrNRV0rdqQb9YAI3gJK2FiC0ttYTV0KgAS2GzOBVrmelnJvpC1QIVmwoCwZSr9zWk4f@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRLnBLKQRDBh64dG5f+oG+uGuKLdikZQod3CTFH2r809IT6Eo
	e8dcvl4mMwR5ManITP1VZRiLaWbwO3pFo5fLm9dY35H050vsYsWLSSnC7ZA+6k3AEFA=
X-Gm-Gg: ASbGncuHJ0V/m9tzyfo1XsQreoeE1mgocjZ5rbP6jDk6xphN+6w8pW3wDbyf1aT/tCY
	6IWrF0+H9kQQO9EKfhcrmuwKa+d+mLuoeaJtBXQCVpEXV2Q0uIeSwuEZwgyAuFReGzCHmtoigXD
	iE71waLiyxZVBO2ZSYLbqhr6SwQlc9aH/DiGKXZWP0aTtsObLRUXzM3SomYGDH0f222+EIf/VGW
	pBD5SxeVbJx2k2PqMBgkytWUwqR3dsmDJkRPFq52zLsg4CmqI3BK0ZmP7O3CUd+FWPC5N/F+Hl0
	HYn1VzB359IgrPA6yl7sDRmjhjQWKh+SP7fDg2MwzEZ6Er73VIidFGfO+QpBkY+V21eXWTHspxR
	HlxVQheM+fJM0bZBumYHU2r0P++xsavoagg/dMGREl8UO
X-Google-Smtp-Source: AGHT+IGofJVjCphxVAkG9bd6t3NPeX+I5lacWK7xENnvALEAJUtz7D2qJ/sUSwpC4SDSpnSpZ8DDsw==
X-Received: by 2002:a05:600c:35ca:b0:45b:87a6:cdb with SMTP id 5b1f17b1804b1-45b87a60f9amr44731385e9.14.1756714860306;
        Mon, 01 Sep 2025 01:21:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fab9:fd92:e2cb:ddcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm145166475e9.12.2025.09.01.01.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:20:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra256 support
Date: Mon,  1 Sep 2025 10:20:58 +0200
Message-ID: <175671485425.37050.14912737741264685322.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250823055420.24664-1-pshete@nvidia.com>
References: <20250823055420.24664-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 23 Aug 2025 11:24:19 +0530, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controller found on Tegra256. The number of pins is
> slightly different, but the programming model remains the same
> 
> Add a new header, include/dt-bindings/gpio/tegra256-gpio.h,
> that defines port IDs as well as the TEGRA256_MAIN_GPIO() helper,
> both of which are used in conjunction to create a unique specifier
> for each pin. The OS can reconstruct the port ID and pin from
> these values to determine the register region for the corresponding
> GPIO. However, the OS does not use the macro definitions in this file.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add Tegra256 support
      https://git.kernel.org/brgl/linux/c/eef6dcbc52fa83c392a2f4a52845f347b233a584
[2/2] gpio: tegra186: Add support for Tegra256
      https://git.kernel.org/brgl/linux/c/db12ee08726e55c8a1a70c2308f98d121d96edc6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

