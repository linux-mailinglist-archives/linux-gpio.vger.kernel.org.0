Return-Path: <linux-gpio+bounces-8459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A63CD94108B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 13:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B9428288A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 11:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB97719DFBB;
	Tue, 30 Jul 2024 11:33:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BBE199223;
	Tue, 30 Jul 2024 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722339228; cv=none; b=jWURTNvCZqdnEiyRYRZrXUQ4lEMZvfevUf56VfxlqvKB9m5OMkS5h5CeX2bawOZccC34PpgTAIcSRjsmipSFu2N1zlk1CmE8k92LzSuHTwkvZSmPScxwKIVYnCzOyO0QLGpOElrX5zQZOTOCv5lb6RNkYox1gI8dn3RGpC6utaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722339228; c=relaxed/simple;
	bh=jreJikrD50z/MsfiEtCcf4z8wcJkXKTDq/80kkn76Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nT3I8HzPxKPIMj37kRmR5yf3Rt/cAG/2LkJbotis434y9KDZTl6z0W1ykW8T8ko9PAwX6H0GQ/AoDBMTM8eoMFMZbgEv8u6clPNwyXYCFCUJTRFWeq816eEi36Mm+jOD8JBFmDOgVKhTlKpmN+L2O2dQoIzLEfcjl4r20IR/nic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-66599ca3470so30400957b3.2;
        Tue, 30 Jul 2024 04:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722339225; x=1722944025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iu/0Gl/ovPvi/QUyUkK6QwbKoB2ipspmsxhrwXiqkYw=;
        b=ic0hTlA3UK9Ro60RO0Ax6js8DVo7RO0RmsD3BRC2fxg/wN/6fuF6h+hu7D82jXpDin
         MlC87uYL0t/E0TNinirVupFsklg3tV08Wmf7pIcC3cOVRVFHM9fYxbH8/CIY7j2eX8DH
         UawXIug9YKSLqrvK1GO2MqQImSRlu/HLvuXdrU72u+x+/FSu1IbsJWOy/ti8NdQUh8QY
         SDUoncFZv2Uc+6+DWsbm/EiGOaToF3IB0cB77mu8WyArxOO1hvlrlFPwy+9Ja5Elx6jd
         KEDZxftX50ppuERKHlajidv7gFzERI0IYyWi+FrF9hHGAxaVUnr9yGkW0Dt7VGtPavfg
         2zyg==
X-Forwarded-Encrypted: i=1; AJvYcCWeBi4+acJNvx8BE5vZwThYC6SAZideLBCuJDsdh9rYGINUQkzRjWHaCO5uDvrKqGhwfGa4NnEJVA7dypLePcIIoFyPh5SBx+Y/Ve2+3PWc8qtO77v169palY6WubAmJqGAbrMCNa55mrJGzr5VITO906K13ZdaKgnyDMnikOQYuaJDsCnRlJKSopC1WZ7f7MJPniDzkDdTfLsdAaB6tfgFbo+8xHGHvg==
X-Gm-Message-State: AOJu0YwuL8pKEwTxIqJK8sRnSS5JVkzoUda139hGY2QUsTAtOjoR+5yB
	jIVd55XdTuBXRsSRRO8+yBco/4IJHxPcNq5NRjflipba0VnKUfA8/aI2ksE3
X-Google-Smtp-Source: AGHT+IFlyDYKgquLBP/4RknrDD3fRIW2rWfI9Ebj23wJ/BPXn4oeMh//SKFIZu0NrOLAWmfCVYPdlw==
X-Received: by 2002:a0d:c1c5:0:b0:63b:d242:4fa0 with SMTP id 00721157ae682-67a07b756edmr127437507b3.21.1722339225149;
        Tue, 30 Jul 2024 04:33:45 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b02477dsm24629607b3.103.2024.07.30.04.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 04:33:44 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-67b709024bfso33659827b3.3;
        Tue, 30 Jul 2024 04:33:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9MK1jPi9myi9TNhKR1uM6IMxHWYqDtTZP/t2yiL50n36ZBpao8c7bEpTG+ZsN34Jj1jHwvXcIzu7Xzysr4AVCek5JCsPr1xdv8tFt3VctJyGgnTlemrk9vWNa470uCz7JP78PVZpYf3cqJWBjYdod7kKoR9aAzqEoeT7LdSuMAERHyKXRHV86XP6iEB/rNdgMTK7/GzdfZ1+mrn+1NeBeeuRfiEkXBQ==
X-Received: by 2002:a05:6902:1883:b0:e0b:128e:d86e with SMTP id
 3f1490d57ef6-e0b54615aabmr13170000276.48.1722339224669; Tue, 30 Jul 2024
 04:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jul 2024 13:33:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURWfM-TMrxVaCq3kWKtF2tYEnkE+QZXPYMhjFKxW-qyQ@mail.gmail.com>
Message-ID: <CAMuHMdURWfM-TMrxVaCq3kWKtF2tYEnkE+QZXPYMhjFKxW-qyQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Configure GbEth for RGMII on RZ/G2L family
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 10:03=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> For devices in the RZ/G2L family, we have so far relied on U-Boot
> correctly configuring the Ethernet interfaces in RGMII mode with
> PVDD=3D1.8V before the kernel is booted. Instead, the required
> configuration should be described in the device tree and activated
> within the pinctrl driver.

> Paul Barker (9):
>   arm64: dts: renesas: rzg2l: Enable Ethernet TXC output
>   arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
>   arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
>   arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
>   arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
>   arm64: dts: renesas: rzg2ul: Set Ethernet PVDD to 1.8V

Now commit 2453e858e945e5e2 ("pinctrl: renesas: rzg2l: Support output
enable on RZ/G2L")  is in v6.11-rc1, I will queue the DTS patches
in renesas-devel for v6.12.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

