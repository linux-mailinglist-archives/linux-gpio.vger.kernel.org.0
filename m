Return-Path: <linux-gpio+bounces-27199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2280DBE2A58
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 12:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 18FA734E15E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 10:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E21231A81B;
	Thu, 16 Oct 2025 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oDSP6PkF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384217A2EC
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608756; cv=none; b=lS0qcg0hUegTikepVFjmyH8HcPlvelQpJ4bmYBfNyXtSowy3Iayt4DS4QvzhLK1XowPukHj/GE9y0hvbyeljNKS40BsVx0zMIp0gyVxzYFlMmAkFyfVGbcl8pl/7Yt/rBk3LyhXfnVjh7YJYO1V3U+wAZ3rrwzCR1ofImApUMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608756; c=relaxed/simple;
	bh=VFAiGQJPqKboPo94EhJ0/7mKVlQFc2hTIDTrYUmRE1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eV9OIspqNFqYL1X2beg+vk5kDf5ZteG7WL1fKUR3fEvPEDcToVMOoBDtq3QYSCMIyeOZ1P+3WAMED2SoOPUluycQtVfkBH30k+UcaNUPPkLXB8amlEdsOValekAp6mgIjr2jG+7W/kArCGBjPn4ZWPCUIWNnZ8CkSMo5tOFgjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oDSP6PkF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591c74fd958so719575e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760608753; x=1761213553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vu9z05PojAySjuSCHEJIz8974laOBmhnnWHve0OaPVc=;
        b=oDSP6PkFGX8uQZ5VQEwcwjtoN8oO49u6w72RhUlF49FIsP3eapJtzYCLOFAQepG96S
         XT719O8olxKOtejJg1AEZvgJdkifdOBPqRsSoimp4gDe0sFpAmJaNfBT2Ma+NUap056C
         OG2Da6HucME1ZaT64lFC3Y+nTx9SHP29+poJrvmKqd7pNkEJy7goh0sOTeDyVjmikwqV
         niYk/t2/mOFOchl5ZhEGF/hon8J538Vb5t0pKrHAUjJwjvxQes0cRMPv6X3ghpuLZjby
         DGzrXW1jBjCxBhebzL2mKe8hD7f6dnblvLo93VnLBvtIyYcyIAufdE9rEz8sNeXoHJrP
         fQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760608753; x=1761213553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu9z05PojAySjuSCHEJIz8974laOBmhnnWHve0OaPVc=;
        b=tVfxA0jvKeFfqQmmLrWy9kShwDbxzkLR4T84TNDbRB9uEMQDktG6l/63djZal58OhX
         dKI7ChvVfK2HWoYsBzGI6MDDZEBdr6ejRZ83FmKaCFfXsEWCdb/C22gj5tB/nKKPB4oR
         /RraLJRpwX+O5x6NVJv6XZqInQpZJt2c1qGZgOeEPqNajthgxHJm40Nxr07wjxlaJQFV
         Q6dmXP7bVTArBxpFFU/DmZxiEDj81kl5j4zHztaYEHDMOv/OyV9GFsrLzjaqXPfoQbNO
         In3Jib5Wd3r2A0rWa794aR/nQoxv++ziHEXYTaReM58k3EVhhKHNhB93z6tRltPzZJwT
         sKKA==
X-Forwarded-Encrypted: i=1; AJvYcCWskgge/hpvos3888jmFawaF14OkpW8FgaheKJhmM7cfYGZyyXboTU35m11Ynr7ullW+siB4SgcQx8n@vger.kernel.org
X-Gm-Message-State: AOJu0YwSoyLfv6DmQfC9OnTsdpw8AvYqgpMeeMZDfrxub3Dltkoxwv/W
	7V8bmN6KsHKgrEvaPVRV3EIA4VYFWrxoiCk5oZPwjM81rTrktGmEQpxvioaLxSLUoJ2ZUginbIg
	dwVUjkvvNIePfr+XqAtpCXUiuakXrACZ7Ln7fA0IErA==
X-Gm-Gg: ASbGncvtHTfNTtaazdZhaju5iko55JbGTJg2PRDt3zTXgBfgjsKPyY1nwiMYdgVtQGf
	pY/sxNUuaWVuS2qg/wJDB9Lmx/etNUbYXEGnh98S+QWBAyEEKyi08Jx6Iq8wI9UdAiB1RQUtIK9
	tDkw77RCzCo02KfJxqMggPqkx5F1f9NA2ZYVSzocNUJ2BdbRsITRTFfBAYI8L5dIRBRsVn1zyYS
	aVvpwktukY0lvOZWeuviqruTDl+GF8RMaBA2hhjdOrGQxjG/srkEGBl5cSlcI8YB+0pfc9nQY4M
	BJPxZnYxouSBJzhl
X-Google-Smtp-Source: AGHT+IE44Pe/lNFjVwo5dvfl5OexZywAB5coMkbyKb7gQx6NnwL7+kNNAtUDNiJeEwtWT2LMbH90I1pPilstPuxVwAU=
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr9529664e87.50.1760608752524; Thu, 16 Oct 2025
 02:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016003631.3912523-1-samuel.holland@sifive.com>
In-Reply-To: <20251016003631.3912523-1-samuel.holland@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 16 Oct 2025 11:59:00 +0200
X-Gm-Features: AS18NWAtcYEK6c9DgJvJzyhAb88b9a1Ukmn-vsoKJrJZwtHDLluVjdni2Gu7gpw
Message-ID: <CAMRc=MdUrm8fNRHcpAgNubJ+AM=iyThMe0hLLRd1vni8xbf2=Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: Support module autoloading
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <pjw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 2:36=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Add MODULE_DEVICE_TABLE() so the driver module can be loaded
> automatically based on a compatible string alias.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  drivers/gpio/gpio-sifive.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 94ef2efbd14f..e9a992cd4b9c 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -260,6 +260,7 @@ static const struct of_device_id sifive_gpio_match[] =
=3D {
>         { .compatible =3D "sifive,fu540-c000-gpio" },
>         { },
>  };
> +MODULE_DEVICE_TABLE(of, sifive_gpio_match);
>
>  static struct platform_driver sifive_gpio_driver =3D {
>         .probe          =3D sifive_gpio_probe,
> --
> 2.47.2

It looks like it should have been part of commit 6b4c76ded358 ("gpio:
sifive: Allow building the driver as a module") in the first place. If
that's the case, would you mind resending with a Fixes: and Cc: stable
tags?

Bart

