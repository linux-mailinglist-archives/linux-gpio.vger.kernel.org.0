Return-Path: <linux-gpio+bounces-29959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFD0CE4B3D
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 12:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4562B3004D21
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 11:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0414829992B;
	Sun, 28 Dec 2025 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sAz1e72G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC95024167F;
	Sun, 28 Dec 2025 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766922041; cv=none; b=BcjAG0tiLjp6wsvYlwfvLvDPDJXMiXS9q0jJ+vD/5dQv9Dhcm+vlsPywAgHiJ6RZIYO7ZJPJbcCcwp4/yp4ikGUma/ll5XkwmM7D3YBv2kJhym4+XtyQzfHYhjKeWMXH3MAGjTsTugy5YL44AkpzBXk2R8tP0auW3Eeg33a2TYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766922041; c=relaxed/simple;
	bh=O5FNx60UISry1GdS5eSCmVKiOVgJg94gN3CIEiLRb1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YC4gjKZx18T83HsBLni71M2ODGTH+QoBvuvQjmzNUYSGR21Mujb4jxRGYnzwxM3smIa0LsawlyFwzoMbmcEqJzFFGLyuixxROhYi7Qvbxf4vAAQdHq+ZArfmuyJGpSyOV7WOvgrSakx7NlyWifiu9fu5vUSi+in2QFuZShCzJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sAz1e72G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2627CC4CEFB;
	Sun, 28 Dec 2025 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766922041;
	bh=O5FNx60UISry1GdS5eSCmVKiOVgJg94gN3CIEiLRb1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sAz1e72GYrgH9qAlCG2GfxCs4hPab+sgLzc2iJlYlKvThXI4oHuas63S99iCoaDgI
	 Qe5pM31MIElWBtHGlT+tAVHX1eFCkcr4ebRSis2nbv/ENJV0jRUFrY1v+HYrnbo0U0
	 JO/8/mts5riNY4HEDqKn74WZPTEbrO17KHCYEOKvz80eW8cKeviXTGc0j/JTdmgKsP
	 WL9m3UNke2N2LN/595Hsgtv3Xzdk7qRqFiCdHgQEjc4Np0UE/yyGJuQbKmCScZ8qDW
	 NVkYnUZEPoLOAwRewD1KvsU1GGEJW/hJNvDMq5jxzf9e+Pms8NRPiYc8Xn0CynQRP6
	 0oTsWGLRw7Brg==
Message-ID: <8b97f7a0-5d43-41ed-85a7-e48488c49264@kernel.org>
Date: Sun, 28 Dec 2025 12:40:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] pinctrl: samsung: Consolidate pin-bank macros
 under EXYNOS9_* and pass bank_type explicitly
To: Youngmin Nam <youngmin.nam@samsung.com>, s.nawrocki@samsung.com,
 alim.akhtar@samsung.com, linus.walleij@linaro.org, peter.griffin@linaro.org,
 semen.protsenko@linaro.org, ivo.ivanov.ivanov1@gmail.com
Cc: ryu.real@samsung.com, d7271.choe@samsung.com, shin.son@samsung.com,
 jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
 <CGME20251202093026epcas2p28ddfd32305695df996841fd73b231b6b@epcas2p2.samsung.com>
 <20251202093613.852109-2-youngmin.nam@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251202093613.852109-2-youngmin.nam@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2025 10:36, Youngmin Nam wrote:
> Modern Exynos platforms have several near-duplicate pin-bank macro
> families (EXYNOS850_*, EXYNOS8895_*, EXYNOS7870_*), which makes
> tables verbose and harder to share across SoCs that differ only by
> bank_type (alive/off) layout.

I do not see at all how you reduced duplication, reduced verbosity or
made here anything easier to read.

Previous explicit EXYNOS850_PIN_BANK_EINTW() - so having one information
about SoC - is now containing more verbose two informations:

EXYNOS9_PIN_BANK_EINTW + exynos9_bank_type_alive,


> 
> This patch unifies them into one EXYNOS9_* macro family and makes the
> bank_type an explicit argument. The common 850-era bank types are also
> renamed to 'exynos9_bank_type_{alive,off}' to reflect their reuse on
> later Exynos 9xxx-generation parts.
> 
> Naming rationale:
> - Use of the EXYNOS9_* prefix indicates that these macros target
>   current Exynos generations sharing the same register layout and
>   EINT wiring model. Compared to SoC-specific prefixes

There is no exynos9 chip. There is also no need to rename Exynos850 to
Exynos9, because old name is correct, accurate and probably even older,
thus more suitable choice.


>   (EXYNOS850_*, EXYNOS8895_*),
>   EXYNOS9_* is clearer and more future-proof for modern parts.
> 
> Key changes:
> - Introduce:
>   - 'EXYNOS9_PIN_BANK_EINTN(bank_type, pins, reg, id)'
>   - 'EXYNOS9_PIN_BANK_EINTG(bank_type, pins, reg, id, offs)'
>   - 'EXYNOS9_PIN_BANK_EINTW(bank_type, pins, reg, id, offs)'
> - Rename:
>   - 'exynos850_bank_type_alive'-> 'exynos9_bank_type_alive'
>   - 'exynos850_bank_type_off'  -> 'exynos9_bank_type_off'
> - Convert pin-bank tables for:
>   - Exynos2200, 7870, 7885, 850, 990, 9810, 8890, 8895,
>     AutoV9, AutoV920, FSD
> - Update GS101/EXYNOSV920 helpers to reference 'exynos9_bank_type_*'
>   instead of the old exynos850 names.
> - Standardize on EXYNOS9_* macros while keeping SoC-specific
>   '*_bank_type_*' when layouts differ (e.g., 7870/8895).
> 
> No functional change intended.
> 
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 785 +++++++++---------
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  49 +-
>  2 files changed, 402 insertions(+), 432 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index 627dca504d7a..d11b2d4ca913 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -53,7 +53,7 @@ static const struct samsung_pin_bank_type exynos7870_bank_type_alive = {
>   * Bank type for non-alive type. Bit fields:
>   * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
>   */
> -static const struct samsung_pin_bank_type exynos850_bank_type_off  = {
> +static const struct samsung_pin_bank_type exynos9_bank_type_off = {

This is completely pointless.

>  	.fld_width = { 4, 1, 4, 4, 2, 4, },
>  	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
>  };
> @@ -62,7 +62,7 @@ static const struct samsung_pin_bank_type exynos850_bank_type_off  = {
>   * Bank type for alive type. Bit fields:
>   * CON: 4, DAT: 1, PUD: 4, DRV: 4
>   */
> -static const struct samsung_pin_bank_type exynos850_bank_type_alive = {
> +static const struct samsung_pin_bank_type exynos9_bank_type_alive = {
>  	.fld_width = { 4, 1, 4, 4, },
>  	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
>  };
> @@ -90,11 +90,11 @@ static atomic_t exynos_shared_retention_refcnt;
>  
>  /* pin banks of exynos2200 pin-controller - ALIVE */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst = {
> -	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
> -	EXYNOS850_PIN_BANK_EINTW(8, 0x20, "gpa1", 0x04),
> -	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa2", 0x08),
> -	EXYNOS850_PIN_BANK_EINTW(8, 0x60, "gpa3", 0x0c),
> -	EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpa4", 0x10),
> +	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00),

And this is less readable.

Best regards,
Krzysztof

