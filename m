Return-Path: <linux-gpio+bounces-17610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B9A60F1C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12C927A57CA
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A781F5413;
	Fri, 14 Mar 2025 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="omDiJGhD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA62B2F4A
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948563; cv=none; b=fW7g7T4cSXuU8sVXjgc7hyK+1MmW+dXDeMYN+57DJynRIf/xulScRYeHCdOSTYUCaKdmArlUVY0m91IyF1LAmZZi8t/CYI0UwCoPHMVauvDyaXTkUYZiqCMufON/EFFqHq7Uxmws0YOTNGyj7i/fyJce5CBPAy8Jnyn+dLOTEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948563; c=relaxed/simple;
	bh=oNB6/brWRYGDcdPEdCxCrOD4XLyJDxlEhSU5P3Fiuf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jw1qem2vUf04svg8DspkoDmg7sqmPcCT7JFtm4ETSuqzWtyHDLEGQrN2MGcXVuwuMFXC/LrMADC2V89H6pYuhFo4LJrOt9u++NhiwQBjVnOs6HISMYo5kzhwjHMePzB9TuL51ZxKl0UxOeKJwQuZZNE8G2+cxXHw00MeumOrFzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=omDiJGhD; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b159c84cso1929657e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948558; x=1742553358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBq11ylwu5R382gZxqzXZy+KZY3NpzkBPWG/tVivh9M=;
        b=omDiJGhDxS3+hUgKz1Y1jnh68d8j7Ok/WVf+jrxI8Ejn8Yip4r5u01KlomR63wMrOD
         pJT0cu5XpUWXcmotKerqrpMkYZwkjmD3nqb1tNPPasnPjTUmYKDMhtQ5Ov+Ay4ETGTEr
         cAHuDPoM3vwxx5nOC69sR8qf8fex88zpMk3765hQnpsjNqqI7FtYzuIk54SwWtOj+tAP
         fXGoulDMTPdlvoe6WCIwA1NWxgLjgXM8OQ86jdbGaAKiNrLvNI1iuxg0s19Vkrc54mQY
         vFT3Tag2hNGU2pKnt9jE8TbZbWpRu+LuXspJ1N1NNBK6In2S4uX3L9UbMYSiimQ7Hf8f
         ppXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948558; x=1742553358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBq11ylwu5R382gZxqzXZy+KZY3NpzkBPWG/tVivh9M=;
        b=WnD9/3bf6UScBNwSWMUnmwbQRaK0Fwrdow8+kbPp0FKX0yHCfI2dDDilF/FUlYhVUN
         FM9afBixPfyLqf+PP697iKtjKOBLaPS8wk9n5zh4Kt6jflRRx0A9CIaVFXW5poGcsXC9
         6q0poAP9awVqsOGf3ifo3NUHUDHayP6hZqWyTgUH4B+jDZ3XnWnqGIOMd9v4blq+ygVs
         gJoa8i0WbD1P6lkJzH6rB2mn62fkC1XHWyiVwrG4c73Ed3UwKRNsbs2wTEA5BGVKz7+F
         bbDxe04TkcKWPhDdnCG/ipWalSwG2it7DgTK4wNoOeqdEGjVOBpII5Q9FTGG03YZci9W
         uErQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkwZ6hdcBWL21sGDaJ2rQgYnCLBb3EaV7WAiCi4xCi0p2zhknWix5P31AWNW9W96asxR+oJmGgqRq0@vger.kernel.org
X-Gm-Message-State: AOJu0YwBKhI27mDQ8HUR35ZPZasWt2XqLNu7IjwqladmX7lrE7pw2QwW
	eJywxTK22H8xfhQ3Muut8FA4tKbBUG7zn7PqBzSMYSMKqptLIkL24TSmwT/O0LfVQtUckExqf0t
	JtO42QewOl8UFo2LLbSCajYiT7n6jn7anuHiwgA==
X-Gm-Gg: ASbGnctJVj8kqccjFzxviTL99m4a0FPr1Rqex5KGNwJXhnGh7TmhBijK7CyglMk5xnL
	lhTJfvOhAEj/bh9yhD4dtqIVUJCT2vrzYfNyvZV6KMaJYZHFtD5S+iN1uklPbd3uURyawv+DNFY
	eMA3WqDq4AF0kEBiXPb6qrPPQ=
X-Google-Smtp-Source: AGHT+IFo7a8aP8LrtXsMzS05IJF+N+ZjJx5DRyPZKzboYtcGh7BYc7nkwi3Kg4DoP3cYib1OWjtVARzILEhT3JyV8rs=
X-Received: by 2002:a05:6512:2350:b0:545:2b24:c714 with SMTP id
 2adb3069b0e04-549c3911e6bmr755718e87.18.1741948557930; Fri, 14 Mar 2025
 03:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
In-Reply-To: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:35:45 +0100
X-Gm-Features: AQ5f1JpewYNdVReOE7yOz7Jhb_-0BXB-6RAsfqpo9dfZwpZcAV2B4PUacGG94IY
Message-ID: <CACRpkdYkvTr9ijyEVSzevHdHFDb0iJTOzCS_3gQG0eNcpR7tcw@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: bcm281xx: Add missing assignment in bcm21664_pinctrl_lock_all()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:48=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The next line checks if this regmap_write() failed, but it doesn't
> work because the assignment was accidentally left out.  Add the
> assignment.
>
> Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij

