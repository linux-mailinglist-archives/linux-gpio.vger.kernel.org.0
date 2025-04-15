Return-Path: <linux-gpio+bounces-18858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DFA89F86
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 15:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03175189188C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C79E450EE;
	Tue, 15 Apr 2025 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUJM4pyE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5925771
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724081; cv=none; b=Cv+m/ucNp3x5AU9SGo6Co5xfcx83iMqcVmedQi7CuHmEzXUhcfx3fcAtFrUmaOUOxqQz0HMPb7nb0MhdXzseOzjsFodFteouxuApVuw2/MIyQDrvTAlTTvqAH3cOuiCz5ZMa9RNUlJ2o0aFKDvExlZraIzMHRbnb5sjv2MgFqHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724081; c=relaxed/simple;
	bh=OjK0XJ46y3jXAILf9s+jwpNgMQ658DzTtoQ7CdC3VPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W510rG/Kp/9F2b8Gj/iNNLZuA221bk9QTZGKm1zC1jsM1NAzmjH66f+dCoNMDK3bRsEPNn4Na/hgWLa7+jL3Z+MgLQh3gh45Ul0Qzfp0WlSwrm2Pomu776zUpOFCHqKhmAk58oQH0K79+6b1eB2F3y/PZ2iGsaTmiiRzsrznafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUJM4pyE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549b116321aso6509844e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724077; x=1745328877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRbWLe8uR6+Ruh67h/yoUWYHHmofvLoQK7bKV1fiz0s=;
        b=SUJM4pyEPzwHkAaUe8NOhwuoxMyJpfQ2ftc2ecJVQCWkVGXrozPU4vyeNkG7tdI1e0
         PlPRYs/VWnvxBa4Nh3SjpEZVxNUbGXZgzXszpL8BRv1jesfjJW+MJVg5e2Iau9EbsoDZ
         dFH+v+fNWSDE51GEsQjCpwSa2mplJnMXty06NRIUwO5Q53v+WHqXaH+Rtk71HzXplW68
         LcfgL70P4QdenulPlY+MPpYSqNsHkennGIEoYOMn5qL24SnPpA/YbUCiwSjAhfYPz6kn
         c/2pSW+eYmxOwm6OsCVTaJ3azB2jZRqDGTkY1fMTcSulEPPczfFAWjgGT0Q08fplb4wr
         8gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724077; x=1745328877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRbWLe8uR6+Ruh67h/yoUWYHHmofvLoQK7bKV1fiz0s=;
        b=bav12+nJ6AFGp4b4H5uXHUY9dp77pc/WEDJAFP1lcFXGU9eJQS6psInUnYTRRs/gPo
         Q7BOFzNCZGEujtVt0ks+mbKvbG7MTVYIUkRUaOuySBvJTgNPaE1rIbEHm8R3GnK5Jxks
         rBSUTkPUe3g7nzr9H0OkkXfSrZqXND5AilOHkMFAPV4boTdvXizWpFOOEU3ha9YnUbot
         AElS4o53rSp4hFmPA0hxkT37t617Txz9vMy81sJZLEDUBHeGHatVFMRw2x1Ka2wErQPa
         bm1LaPB6UAaUoDEvhM6OpRoa99S8UzfsiJERneNyXW10j7K5OKLT8YVk3Y2GScd7A2+4
         jcAg==
X-Forwarded-Encrypted: i=1; AJvYcCVb05Tk+yce/RT5NrWIy1vUrK/SV9kUFZnSZQNukPcWY1oW+eFkgJFAzUW3o6YMaG4usVo7gqyFJ1ZC@vger.kernel.org
X-Gm-Message-State: AOJu0YxyA0JtzVpLZRtkQRtmzPpXRfyDfXXV2DB4/Vw1ahkxNGHFpRI7
	pM+Ix5r5qk2EP03cFnZKaoG1BpNLuULXouH17rbm1p/RZxHTgZq4vDs5eGFr01Iuv1SOGzce2Ec
	o5MRGUVB3spJcMmuaYXe3Mxk6kIIM8cAmHxT4lQ==
X-Gm-Gg: ASbGncuV9PrGivUc1uMXepk/ajXFftP0tQD6bWmY4cybMz2iZCD9AIRCQToNmEb1/1g
	63w9IlXhfcA5WoOID9c7feFn7oXHfsP5F+ctgvzJgPRDPU5TNKa9SRqQazfuRqPcgL6nJOqeUIy
	GqSiQoN40dVW49/Qf37jD/1Q==
X-Google-Smtp-Source: AGHT+IEqPbPcf25mevdtkKDV6Fu+XRejh24WiH4D40O8WO7gYV8t0TQe0MF4yA5cyBf8Yjg2SvmSG81yhNrMiWcs3lg=
X-Received: by 2002:a05:6512:1106:b0:545:2f97:f6e9 with SMTP id
 2adb3069b0e04-54d452ca7bcmr4104272e87.42.1744724077079; Tue, 15 Apr 2025
 06:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414203551.779320-1-superm1@kernel.org>
In-Reply-To: <20250414203551.779320-1-superm1@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 15:34:25 +0200
X-Gm-Features: ATxdqUGANNzFO3svuoLX47zpuOlc5Ol6z4O2iG_JyD2ta49DsLYE47fIs0OLH-k
Message-ID: <CACRpkdaHru55wo5MdVsRKRbfPS9Hv3vGxgXNi8eXGvAOQzyDww@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Fix use of undeclared identifier 'pinctrl_amd_s2idle_dev_ops'
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-acpi@vger.kernel.org, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:35=E2=80=AFPM Mario Limonciello <superm1@kernel.=
org> wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> `pinctrl_amd_s2idle_dev_ops` is hidden under both `CONFIG_ACPI` and
> `CONFIG_PM_SLEEP` so the functions that use it need the same scope.
>
> Adjust checks to look for both, and while updating make it CONFIG_SUSPEND
> instead as that's what the acpi header uses.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504100420.88UPkUTU-lkp@i=
ntel.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2:
>  Use CONFIG_SUSPEND instead of CONFIG_PM_SLEEP

This seems to be based on the previous fixes merged by Rafael?

Do I need to rebase on -rc2 or something to merge this patch?

Or can Rafael queue this too?
In that case:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

