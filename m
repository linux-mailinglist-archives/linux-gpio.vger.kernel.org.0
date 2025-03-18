Return-Path: <linux-gpio+bounces-17741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B919A67647
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 15:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCAD43A494D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 14:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A8420E308;
	Tue, 18 Mar 2025 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhxkeC9s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767120CCDE
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742307884; cv=none; b=o10ZeXO9lO5EWX1mqR+wIoBwayThV9IgD7TgHsiN/7ZS0Eaes2GM1AfyYvPymnuOzGxmW8muVmog6bMgF1Da+iu8AN87/CeR1Ad0AHMq0MaKl7I0Xt7LpMyZZH/gRHYR7R8t+COlwP24bE8sN+qyiVq458vuNRgUpguERx26WF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742307884; c=relaxed/simple;
	bh=TN/g0dNpgyiWZW2NVZZ9bktD6tyqWPxBAJYvmhVdUAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEck/2FOWPJ2TcqbaEMqiJhxIKAB++Q2YmtlR6Ar+X6otLI0rede49yoegC8H4KllRfCUNKHIlM4Z+ClPuE5KZu4j2pkkKHNrKLDmXDqGRx6oz8gk39dJ6OHQBTirg2LE3v2dR/2i5mw9W9xujCzGtEYli+1q57j5b1Slar+k/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhxkeC9s; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54298ec925bso8368981e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 07:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742307877; x=1742912677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZSOxfNpsuHJ2r8f2irDmxZoea8ixqgNXdHmJ1iC78E=;
        b=rhxkeC9s4TjuP/hWdIvZ4OTIqlpRxmHQjBBV+PnSNUtwgsdnJbvmGFFlxE0jxyAu0z
         ikHJwc7Ul/LBxgnpeGLDeB2z0yk/TqAM9+1+NfmfMJ2Dv8xyuyhfS+c7iFzM937kb4ct
         qEnLfrzIgLk9zpedUKJcw1q73icCR1zQZQRuVtf6ua4psEw5P2JrVXZa8uoKEPquCr3J
         voImRJD/hLPdJUCyTMPYgz5GYCgVfBFXPxJIvHK6Q0WljxslBlYaPLjFX3cjWth6gmGy
         JZ8ExLw+vG3LMipng1MTMbHf9llMu1c2qvRX8YCyiWoZAY0Cfy6tjbntYEdQO46jbP3N
         atCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742307877; x=1742912677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZSOxfNpsuHJ2r8f2irDmxZoea8ixqgNXdHmJ1iC78E=;
        b=ZlLiOzvYTSFsVjfTW5LdJTNzv52Zkom6HYyAYImFOHN7/HppVFUiqjYaOia4fQK1Zb
         qx4KStFTYncYiDNdZJM1PS190eT9Jlln02zQ5A/GmQBzbZ3TcOkHspB3bCRu1qjYL51X
         k4i2aznv4O2hFVKFdgMCl4FjEg7odJAfyAnoyWjR5TbpEGu0806VNHqaetNLemJ4WG05
         02nJp9wMyRRNa2DvksF75v8TzeSGBTYKOuHQJT1jdgVjfpy+wjMrPnQf5tRKlMLhUkcr
         Vz5aanWrDuMbUwV9uRcO7/8QW4qhJYye8RqQKHnLhpJp4TbURwbWQ38PjSJ/Cro3v7R7
         XBag==
X-Forwarded-Encrypted: i=1; AJvYcCWzXhcWdhzQ0W5EjmJ9I57i6YLTJvKEVn1lAdv8+a1jlYIZMzaf7z5ZRD2k+l6SYQ7asNvBmkfWNLUZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0F8LZxiBs+LuIYxetv5D6b2T4Ys6EGsf56NzNo0Mj3s/TL1WZ
	DD0DBHimSPETaXoYbkhhP8kWxMsbcztDsUY21nG3dqGtlCR6xbt4ymR2e9Df42RoLfQgIhgSAz/
	YUAiw5XA3UElK6B7NiWIRdndPI0jhFtPzshCNBA==
X-Gm-Gg: ASbGnctGpTLtF23Iz9uJqhZMQTpXbxaej1dqe4bJac2PZlZfQSJU1F9iTTuht2KvueO
	L3WKQmpb0xOv+gpGf5UgG4RnQBJtrMz+RX2/ZbuEdkTCescKjUmnW67psOBEd2EJIwvYaHz75ul
	8X5eemoHP6kK7RWGZq2Ra0ioEmOw==
X-Google-Smtp-Source: AGHT+IG9CQGaGXwj83/CaWY1G56V+6jdIV2m+4yH9D/kfodrFtIHnTXnxFGbiTsYYiGMbs+jAqjCMmoxKtCUTvuxFTY=
X-Received: by 2002:a05:6512:3ba4:b0:549:4416:df02 with SMTP id
 2adb3069b0e04-549c396e65amr9771645e87.41.1742307877094; Tue, 18 Mar 2025
 07:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3685561e8e3cd1d94bce220eeb6001d659da615c.1742306024.git.geert+renesas@glider.be>
In-Reply-To: <3685561e8e3cd1d94bce220eeb6001d659da615c.1742306024.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Mar 2025 15:24:25 +0100
X-Gm-Features: AQ5f1Jpc7dAEv3PciQ-6RFgHdOpEl7a3cOhURtVt1riqmVcpakV2QbZsA1JHrvw
Message-ID: <CACRpkdZXc1uEXspd0EYRE4zBJ-sJGV7H6hPh59ROsh8w_CSa+g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: PINCTRL_AMDISP should depend on DRM_AMD_ISP
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, Benjamin Chan <benjamin.chan@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 2:58=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The AMD Image Signal Processor GPIO pin control functionality is only
> present on AMD platforms with ISP support, and its platform device is
> instantiated by the AMD ISP driver.  Hence add a dependency on
> DRM_AMD_ISP, to prevent asking the user about this driver when
> configuring a kernel that does not support the AMD ISP.
>
> Fixes: e97435ab09f3ad7b ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied as obviously correct.

Yours,
Linus Walleij

