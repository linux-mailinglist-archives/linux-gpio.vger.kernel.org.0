Return-Path: <linux-gpio+bounces-11386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134599FAB6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 00:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDF51C219EF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 22:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4041B0F08;
	Tue, 15 Oct 2024 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kY21KKNb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642C21E3CB
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729029621; cv=none; b=OAprjeLrjHDY+J9Pr/ZVfoUYuhkghcqoJ/NWiN2zYMLCoh4ZBgo1hEF5LI1PeLZ8/d2lnk/Cy1UDdTEZqqTKlKGplNGwqq3rhLRAhtX3gH7R35gGtmP8pa+KbiE+92BB0qXmhTHaRndLrkCvS2NU1NV1Fs/Y8Gcs3jO1ChF7lHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729029621; c=relaxed/simple;
	bh=vLWf0D7wDX3F8KmMm8Myxd3KoSf2WYvVTKP/ROinZXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PumGa4PrsTeYL3IV3HNbhlUMLwm/n9EPoe+8qlaKGKMDSHsm785rs0edxC6zF5XnU5nA6OCqhfH9njDgSCHODd3AASRirhXxL7o31rFBfJHKI0VrF1M/TVKSjhGEdY42FJwxw73aVQqNnfDhxDTbbQaY0m8xTrPYe/kUo23oAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kY21KKNb; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb58980711so21363961fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729029617; x=1729634417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFQe1/6mmg06r1QqY/JM8KquahTGgY5kWW/nlAm6l8k=;
        b=kY21KKNbxJIJ3OWzpaAfLwpc5zobBu0oUzY7ZAfIOH7gIhEfBkgdTJdoOq3WkhgVBA
         9Z7JNbLhjrtWa+PEX+hWzhZHJO+YJiTdIhBPG1HrUgm+VKVykCkqTcgn0K/eXt9dS2P9
         oIVRBne2K1L98T5xLenBHEndrYjrMKwTZ6rbUTxlUZYM7mpK5VbOYwa5MmqBYuxx0P/i
         YCAgEGeOQNfhzG+e/WZGmPE49m35WqlVSfTrviqinD36HKYlHpJPDA+MrKhRTKDM/fdH
         6BrAzbcQDmZ/k0zjv9/oB6cyGvxOCSiwVOJoOWvVP2WxwfRiIch5r9ABjbgKpWln83zf
         0/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029617; x=1729634417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFQe1/6mmg06r1QqY/JM8KquahTGgY5kWW/nlAm6l8k=;
        b=TpGJlZWpNYs8rLMi2pVgNwATj+TxScIfwkbrKUiOBrULF7IOKutRViHs9DUxbDAp60
         Bd5sxdGhfuUZ5bQBVqL0xWTdM8+C/1M6F2D5xAvcF6Pcy0n3lauZm42VGGQ0RRGMxePi
         8ZKM6y64jEgv9dY7aUegz/DgmNCbVz7YGbQkmKKxFUilTwuHZzbqYp9AQQOkMpiTV3vv
         VTdc2OzHm3XL0zQbrnTsSy/K9nEs6bUQ61Nw01fPQdvCfenc5ljuDppVwfxZG5xD+ugp
         aROnTE8/JpKk6UdTs2lN7t+dn5+7LD4BLfvA5K9qZk1/FUvcTMbveqQ9Nret93DQNSg8
         gYhA==
X-Forwarded-Encrypted: i=1; AJvYcCVaxDeVE54gxl6Npj4bfuFC4nr2PXmTJ/aOhoJn5SJjIbGlbi7EvJjy7VOoqJJPFxHGN6VM1be6gYS3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb6MgRyzDbi4hxvk2Zg3qWOgHORay8TNCDQAxv4/JSCJekgWRf
	mZvSoY0b3CMDVqZK4KdiGfwGGT38H9WqJcQPuAsJCs1WSdSc4nPlJDdKTYoDVNLEgmXWfy7DB97
	n7MmaOYYKdZrZaSD4AsCxoMlGJN2G/tcf9qFa+Q==
X-Google-Smtp-Source: AGHT+IFA5e+8W0I4XC3ND0jck3qGbPfwaP9OJrWNVw2k8hktVJWi4PdQidpV4qdQOTx0ZmaLmqNzmLRifYI5r8s30ro=
X-Received: by 2002:a2e:b8c1:0:b0:2fb:4428:e0fa with SMTP id
 38308e7fff4ca-2fb61bbdf56mr12291791fa.36.1729029617273; Tue, 15 Oct 2024
 15:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d70279ba02a67250203744b38314f4475b3c5671.1728986052.git.geert+renesas@glider.be>
In-Reply-To: <d70279ba02a67250203744b38314f4475b3c5671.1728986052.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 00:00:06 +0200
Message-ID: <CACRpkdYBi8fSf9QEahcu-WhSkkUK+_TF6Vi-jvG6CN6KNAX+RA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: PINCTRL_K230 should depend on ARCH_CANAAN
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ze Huang <18771902331@163.com>, Conor Dooley <conor@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 11:56=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The Canaan Kendryte K230 pin controller is only present on Canaan
> Kendryte K230 SoCs.  Hence add a dependency on ARCH_CANAAN, to prevent
> asking the user about this driver when configuring a kernel without
> Canaan Kendryte series SoC platform support.
>
> Fixes: 545887eab6f6776a ("pinctrl: canaan: Add support for k230 SoC")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

