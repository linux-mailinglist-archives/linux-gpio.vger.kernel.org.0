Return-Path: <linux-gpio+bounces-12125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E57C9B0FA3
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 22:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDA261F23D03
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 20:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB69520BB48;
	Fri, 25 Oct 2024 20:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0zmDbAW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63692148FF3
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887365; cv=none; b=LBMC2omay0qQC2UXpo7DeW/b2CHTyaMRJTg3xVin1t8uJ4q3+CvjrqiWlIDI+ydNDG6llJ/YDEyLSKjex/E0uCd6xecIFTsTv9AVpg0OtQTIHnkK5Io+qIVyfnnkXlntTPQogbuX7r5NPWZpQik1lDOg5zf5oU/e0LkExthUZiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887365; c=relaxed/simple;
	bh=HXwNlsDX65qK5k66z7IA8yvdHHI0vAUZEoGmEzH1HZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RL1+qNEkuwtZYlxoD0b37+rPgbwDRzgvuRU32ZtJ7P2d5OnhutrlpjV9QWmn3gbo6xderh1wq26l1uk07nULAJ7qahb813R1iWbO8sOQHkC+0ZpI1xgEvCACrf/05YttrLaGT3THJ29IJdo4AI1wUhcemtO+1d+StfHcrdTzNjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b0zmDbAW; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f72c913aso3250319e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729887361; x=1730492161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrfKOY+CFQBFpuKjqQn+EovTIGUgf43WkJJ5IpUgMGA=;
        b=b0zmDbAWTCZoENFtPAIXDx19kkEjUiYrIzOTvABHQIYGBBu3pxEp2j0S4qfISGixYj
         ntC5jhZBiUBDoFkn3crgUlr31E0CF+RH6B19CR831E0x0wkFzf6JGKMrXEHBVfcqpwqY
         92C/Fd8CNuGe9jVVeDObcxE74SNzrA1IY5mCUNIX2ULTl3Vz7nD8tmu1n0RU6s4ZAHJb
         Ib5k4ZGVSGEQEziaFDA725NEJOlJlc/wEDXSnIR8C3RrKybipQmVrwYYzkwq+7B/IDvA
         h2ONgs9jeoSHaO18J1CVxmLAbLdob2bKotMTxwxEfQ5WsqQEIcWFFXP69vDmAyJ5/rwG
         aWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887361; x=1730492161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrfKOY+CFQBFpuKjqQn+EovTIGUgf43WkJJ5IpUgMGA=;
        b=J+JOA/6HGFUDTa73zpnaDkMMcRxFmt0uAR6UWvgwYEIBkVH47c6RKzXoDKaeqKr21C
         6iwTs7NwdRDB38WFttdbpD06E13MzvBXAnZVgiXYTf/nY6uKPEzBMc7zk+wkHECptp7O
         Ylb6rU0xdlYbHA4EXnmjMd7hPtDb0lYIE6pe9YZvWecah3nhSJ9vtiDneh/BW6gWGt+E
         sPO2LdPrz+7ufibYhkxrEW5UbZE9uSeriZY8LcjCGY5jE95q+9mumuxpCaE2v6/0a74r
         pjP2aftTWZQ1brk+duXPG4ZUNHO597DrEbHz+R+WnB/7vdgwjtYRCdb1q/4pxYVda8tq
         3QKg==
X-Forwarded-Encrypted: i=1; AJvYcCWsYbnbj1wJpJ5omsKNYKTPxHcj9MBCuUVBofAzIEqvD3XKBzKrOnS8kI9DHMtm/QFsaui8qdsE5SkF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5/K/IP2Ydrnu92nk4amf03kReGf2mEnNlaJ+ezlyHWP/ndFc
	PlTl5azoe8jqIHSPobkt4aNZvIaSzRQBIxWbESq2jc6KMJCgNaRzKAEKl1WV0z5VASfc5+Jj15b
	m7/pinuC/RyadSMrHFyMXphVh4P/ScXlVhTPW4w==
X-Google-Smtp-Source: AGHT+IFhpeik0nSV3W/KgV00KKhCd+MCqLZInlp9rhg6YetJwEu4kfb6FuXzMeDghjhw01tKCsjFDM0Iin7o1GFcDsY=
X-Received: by 2002:a05:6512:3e1b:b0:539:f4a6:ef40 with SMTP id
 2adb3069b0e04-53b34b395cfmr248111e87.54.1729887361373; Fri, 25 Oct 2024
 13:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025121622.1496-1-johan+linaro@kernel.org>
In-Reply-To: <20241025121622.1496-1-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 22:15:49 +0200
Message-ID: <CACRpkdYowN4gWohH+Qmp6GAmHUyXNCdA65Uwp_9ii4phrd_+Rg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi: fix debugfs drive strength
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anjelique Melendez <quic_amelende@quicinc.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 2:17=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:

> Commit 723e8462a4fe ("pinctrl: qcom: spmi-gpio: Fix the GPIO strength
> mapping") fixed a long-standing issue in the Qualcomm SPMI PMIC gpio
> driver which had the 'low' and 'high' drive strength settings switched
> but failed to update the debugfs interface which still gets this wrong.
>
> Fix the debugfs code so that the exported values match the hardware
> settings.
>
> Note that this probably means that most devicetrees that try to describe
> the firmware settings got this wrong if the settings were derived from
> debugfs. Before the above mentioned commit the settings would have
> actually matched the firmware settings even if they were described
> incorrectly, but now they are inverted.
>
> Fixes: 723e8462a4fe ("pinctrl: qcom: spmi-gpio: Fix the GPIO strength map=
ping")
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller dri=
ver")
> Cc: Anjelique Melendez <quic_amelende@quicinc.com>
> Cc: stable@vger.kernel.org      # 3.19
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Patch applied for fixes, thanks for digging into this Johan!

Yours,
Linus Walleij

