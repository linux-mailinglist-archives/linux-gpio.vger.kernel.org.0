Return-Path: <linux-gpio+bounces-1201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D917580BE43
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 00:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12EEF1C203B6
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 23:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC911DFCA;
	Sun, 10 Dec 2023 23:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZMt0DB1Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA58ED
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 15:37:37 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28a1625b503so3328404a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 15:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251456; x=1702856256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktrngxJslvgVofvGRW3XnDoVArwbSMEwYrvNDYxqRMM=;
        b=ZMt0DB1Q5u/VunX6/Rvk8gpBiwSPBrENgKzbmODOnncUGcdkh5DCbWUhre+jDkRakt
         CBjK8novtFlEmzpQJUQrMgiRZv5tBVPuWp4Zc3Hx9Wx70ftNBNw57ZdF5jOur/y6fNh1
         Zo0w+91EDn7mPuWQeqK+Li0SrCfwSeH43cnajwANU+X67meTrbmqIz88Yvsl5YUYdAfw
         wBhkGcMCqqr1y2PUoxD/qNiADxqTa3e0JSjXjfMNed/bQ/F6Tlq0hdzaoi12xiYwr1/x
         SOCLcL6TJ08o96zDB/XxpSm803FLIpa3GwqUm28YtfyWcwZaAXCU1CyztJbKtDNHPANS
         k4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251456; x=1702856256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktrngxJslvgVofvGRW3XnDoVArwbSMEwYrvNDYxqRMM=;
        b=qbmKFlpN9gXcvYG1YgbezXHceKImkVGDEx04cVz4HRsnDejsJeF7j5wmW+uaCaduQH
         7hTKoa7eTSLTPZppsUzRrJq7dDWwT6Ka47Ntfg+oqfVTMfhe+77gavd5ybo3cUNl7vsz
         1I+ZamHmonaYS3o+mYXyss054D7OcnQuoakzXE8LBM6TUdLVEW5Ms64GrNhk1piECuM/
         dZ1Yf8DI5GSnE5yEBV9MZogXgyTn50ZmNqZV4YuUZRLb4748Yf9kNp1JKwRasd9n729n
         sUa34Jz3mJfswSrsYT5vSP7wRj7lgfGN8N1aceEcKKHFz1ZtYBJgEVf/szp+xLc4MM9l
         ZVxQ==
X-Gm-Message-State: AOJu0YypfEd3+SLQQgKok6+MilmsbfBoq1Kpa033LAvLQvFdIu4mj0PN
	tmFmp1fuysEn7ka1+z8Oc9rXOSwu9M8KQ+qMiV3myQ==
X-Google-Smtp-Source: AGHT+IGLsgr8i/Ys8RGtN0SYISZJUKEzU9RuUMU3J9K3efZNFIaGcYANt6ADR27OrFr246GC+h9HKAnCTaXxkKGU5BA=
X-Received: by 2002:a17:90a:db08:b0:286:6cc1:7803 with SMTP id
 g8-20020a17090adb0800b002866cc17803mr2455327pjv.70.1702251456635; Sun, 10 Dec
 2023 15:37:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org> <20231209233106.147416-16-peter.griffin@linaro.org>
In-Reply-To: <20231209233106.147416-16-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:37:25 -0600
Message-ID: <CAPLW+4nUT8Nf9zC6UrAMJ_OpLNqe7JWxKy7xp1+_+emNgG4qkA@mail.gmail.com>
Subject: Re: [PATCH v6 15/20] watchdog: s3c2410_wdt: Update QUIRK macros to
 use BIT macro
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 5:31=E2=80=AFPM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> Update the remaining QUIRK macros to use the BIT macro.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 7ecb762a371d..b7a03668f743 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -107,11 +107,11 @@
>   * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debu=
g mode.
>   * Debug mode is determined by the DBGACK CPU signal.
>   */
> -#define QUIRK_HAS_WTCLRINT_REG                 (1 << 0)
> -#define QUIRK_HAS_PMU_MASK_RESET               (1 << 1)
> -#define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
> -#define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
> -#define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
> +#define QUIRK_HAS_WTCLRINT_REG                 BIT(0)
> +#define QUIRK_HAS_PMU_MASK_RESET               BIT(1)
> +#define QUIRK_HAS_PMU_RST_STAT                 BIT(2)
> +#define QUIRK_HAS_PMU_AUTO_DISABLE             BIT(3)
> +#define QUIRK_HAS_PMU_CNT_EN                   BIT(4)
>  #define QUIRK_HAS_DBGACK_BIT                   BIT(5)
>
>  /* These quirks require that we have a PMU register map */
> --
> 2.43.0.472.g3155946c3a-goog
>

