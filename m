Return-Path: <linux-gpio+bounces-22886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C032BAFB594
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256EB1AA00BF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 14:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A84F2BE03F;
	Mon,  7 Jul 2025 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CcVHe1eB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD52BDC23
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897416; cv=none; b=M1r4mwnyd0AW8O9q3X8RlVFVBnyVr6kUD32j1FWdlpSSOS+TT4pg/m3Y0nvrmAaJWvIsUwgOd/cphO32j65hJDWq1PUdzxOzesEQ9yHN2+Qi44zStQo7bCmVCUV36CfON0Gf3FaxIb96BN7gni9wt/2uvoxSB4xp+pAlJlRIoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897416; c=relaxed/simple;
	bh=1EKy8OWDu/kk+IOdCEHz6JvP1bsl9DXmz3k8KmwtSUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htZMCyLsPU3+G6un4kXAIjicCGZI6iEuBVsJS9HiPCsJOl+7ezbcQQzR6pZMbmmHGYeYfBeoA2poZQnJPDCowhJNC+bOTgRJDwEjm485nEU+09XkbibUtvajC6ydj6OwyP531wUId4t1ItLRsBYjKkkLgKsCdjAbkc101f+dR5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CcVHe1eB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55516abe02cso3252449e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751897413; x=1752502213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EKy8OWDu/kk+IOdCEHz6JvP1bsl9DXmz3k8KmwtSUM=;
        b=CcVHe1eBW5Il8shyKuCnU53TYwm6HDy6ZCTzRUEqtqPm8/twsFfpMHOyq1zJkghian
         IfmVkwShz4vXJIzw5qc0ApSdTJ7mfAK3Om+00d5/l+vFGUDcoEeERXOFfvUjSUMU/Wje
         8ubSCeM4YYOI+VtBUG2eN6o9BKWhq7C7hpkjLAyABbbIqG3EL5SR88fJg4d+IStNCjtL
         s03o9TZIpZkMgXlM+Vc7H697uPvP7X4GNXoL1klbPW6uydL3hEbEsP2AW51/F3anNgrg
         ms7dFUjHu6fvjkEsMOdzLFvqI3r/Rv6zfVJfvqcU58mLTBKL0I//5wpLGcWD1Gf9ilW+
         Qg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897413; x=1752502213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EKy8OWDu/kk+IOdCEHz6JvP1bsl9DXmz3k8KmwtSUM=;
        b=si6ZK61n8m3+kDfk+Yl0PJyAIEzGqPsuQ0ggqdlnxu5ikKy/rNRyiq9d7d0O+PWU4C
         7A2bS45Sx2wcLHhVB0D/0nNSWlK7ktto941Em5K/4ZDoHZNOxDcrRZ/focW98XXcgXPR
         +eXJyqeeH7xii2A8Yv9fY8GuZX1ZMNZuk7w5KI66PcRg2nknKfn9OcFKX8veRePamUID
         zjNW4tdeQQi7LsBYvsbJGr1BNoOHSMmNwex4ZFtuCZ1RyElo2jHlIoWYGqfpoag3V+0m
         vPOG1jZ+oic4EZMmD5AQAfdc2EDgjr1q7acp5PQy/JbGo7/1dis+4BOPXvAsAIS9UQSK
         oPGw==
X-Forwarded-Encrypted: i=1; AJvYcCXUONEeRs8BGQeTSD40C69BcssqTAD6YORtic+U5H9K1Da98VSyXH/ssd+ENwchVZWzKVTUR35jriE6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx7GTZ0HD4kL+NikB2Yew129T5n91iFaJOlg/MN8KSBHkCqW39
	7Rhkm3rxneoMPTY+3SoRwtIy4q5PVJaZqwTW1RJPOyS4lSlUV3rE+FAV8PHseEJSP8oHTsPleQc
	VegtVJtLzYnKN22p+hZCWvql2I7NmBNUPcyYL61zHZL6aMA57X0fpUCA=
X-Gm-Gg: ASbGnctgrPaMS9vFkqU0jRva52PsHoECgiaQfXX1Q2Abz9MBAHSkHOMmDWbLp3KqDp+
	0dt8O9Sxtv/HvJlLq7IBo5SjAgLJfL9ffkhML3a+93xsuO9LgW9/1zjev8WB8I81Rg2yPtdsR5R
	1eeiF9xBu05pis1eRZvx53qwUTy/earlvJJGON1lhpLbeTy1bzxXF08NBgTtQHSRcuOinKu8w9P
	nA=
X-Google-Smtp-Source: AGHT+IEudkGxYOWe2+f4vh68RbqDeQkBlljYbLjupYNIzGdcIQYbR/jo96k/DRi2F+evajGdeiOeNW2un8mzxkixgxE=
X-Received: by 2002:a05:6512:2528:b0:552:20e1:5b97 with SMTP id
 2adb3069b0e04-5565baa766bmr4193592e87.18.1751897411791; Mon, 07 Jul 2025
 07:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707132154.771758-1-marcos@orca.pet>
In-Reply-To: <20250707132154.771758-1-marcos@orca.pet>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Jul 2025 16:10:00 +0200
X-Gm-Features: Ac12FXzeP8dFecAIWuU6N_w7j5kVAxaP-9W4N40Z12Ew1XkhPS-e-xEDK7nwJhE
Message-ID: <CAMRc=Me5dfNFLS1qF0AWgg8sb_vk9J=d-JV3-C5xWv7pZM+sFg@mail.gmail.com>
Subject: Re: [PATCH] gpio: vortex86: add new GPIO device driver
To: Marcos Del Sol Vives <marcos@orca.pet>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:22=E2=80=AFPM Marcos Del Sol Vives <marcos@orca.pe=
t> wrote:
>
> Add a new simple GPIO device driver for Vortex86 lines of SoCs,
> implemented according to their programming reference manual [1].
>
> This is required for detecting the status of the poweroff button and
> performing the poweroff sequence on ICOP eBox computers.
>
> IRQs are not implemented as they are available for less than half the
> GPIO pins, and they are not the ones required for the poweroff stuff, so
> polling will be required anyway.
>
> [1]: http://www.dmp.com.tw/tech/DMP_Vortex86_Series_Software_Programming_=
Reference_091216.pdf
>
> Signed-off-by: Marcos Del Sol Vives <marcos@orca.pet>
> ---

Hi!

This patch immediately rings alarm bells in my head because the chip
is not registered with the driver model. It's not 2005 anymore so I'd
need some more explanation. IMO there's nothing that makes it
impossible to implement this as a platform device. Could you elaborate
more on why you chose to implement it this way?

Bart

