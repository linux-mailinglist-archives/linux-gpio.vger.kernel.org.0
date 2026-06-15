Return-Path: <linux-gpio+bounces-38500-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I5z9EpEJMGoYMQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38500-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 16:17:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B768708E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 16:17:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=rENLb8Dx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38500-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38500-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6DE530B50BD
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E363F8891;
	Mon, 15 Jun 2026 14:15:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F863F58F6
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 14:15:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532913; cv=pass; b=Fzpp2LjzxV0/Sm3x6vuF9hNu3eji8EtCTUuigBXkdGH4uLm6w6o6wVnUt4Wn7rZCsM+fevI46L47UVLl/maqO8MBzNdf1yNCBShUYtNRcASRzq7tzvxa5Bl0c/QuYV7NuhTkgz8pNHtdblpG8Z77LgFS5ofQ2ILy6LzXdhwXjLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532913; c=relaxed/simple;
	bh=xTYJTF9WX1tkILvQ4OfNPiOZwQsAyO+hC34NdNlz0q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tov865MUsyQCiSMlSbGOTxLGcnkAX4iz9LnJnNuC/ewxhmpCrWEsRGx1N/rVfIJQfS+OrrsMZT2tdpO/n7V90wYiptAccO1lYYH7hF0k6cz/IfrgzjZ9SOQy8c0nKEWXmDR+glw7FE6jF8EgmkB0G8lisx4S9VVYrfoTjfAnJEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rENLb8Dx; arc=pass smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bef47b1ac01so464960166b.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532911; cv=none;
        d=google.com; s=arc-20240605;
        b=h4o7QOy8CfubWivBE8EofUP217IA6RfO5W05ydVZeZNTCFP4R/YLpRzbazWnWkRjzk
         RkfYMz5Pp1/wrPYsUqbFrbdThthhQJB5aRki2Sk9mgxtdDNM/RBl/xkEajlGx5lqeapi
         I/mrgEXeYbe1j/zvDobSXgeXp7YfOf+e6LtVVImGec+0pS5fninbRfB1CqaKqwG7FQS4
         NyxsoeYnLQ1DWSrgCwVglQ9GWek1xycoeFM2u0JZXDC3uht2BSauVcTK9pPhH+RtmB18
         n+YuRm3O4HtmWmD+hDkqdYCJRF3YMNaqXkn9AB+VZi7sYKZUKG3gu08RjtmZ5aicZDP8
         4cgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nVryjK2DM4sA5w3mh6UPqm7isJZnfv1jNZ8fuuEu1pk=;
        fh=BCQp07yN0v9E5v7GIoaGr1j9vrLC9DzzoPv4zvHGiGg=;
        b=k2KXWykNu6YoedS/QSVdIPWhSm8wJz+lfzN8gcPIkjCjMDuNJoRQPKjQZ4gf7srhFS
         LvQ4hh0d+A9E0k4AEE2XunwXxC34FzAJBXN97QC067fFaGRN4f9CuEFDUIjk9WDJ9Qoj
         lMVOIFN/N8sybGasoHJpIQanixTrwn7gofFh3Klc8BqJ52E7Ftc4NGfUucKWxamg5CFz
         2PI58rS/bNlvWNGC4hrcwnvnEp9BohcbhC9GvMCXug5UrPCQziraHa1ft8qEpyhmNRzg
         P5kvgwFYIGmcko+vqxe7BDOuwKT01aWRRsTwC/fdLzwVuQ1/wYkbTAeg/qWilr8zbSv+
         P7lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781532911; x=1782137711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVryjK2DM4sA5w3mh6UPqm7isJZnfv1jNZ8fuuEu1pk=;
        b=rENLb8DxHg2dzAUvz70MPXSyXBkXXW6Sf13TbnWsNM8nXkt2iBxULOAU290i187Mxu
         B7G+0xJy7bgu4JMWJXdcp2qzInwd158sAog+xjFPHBYISoPyJIAEpTLeau0vN+VHOOWn
         x0enV73x89V2u4TPa5CgVA/T4o2fh0b28cWzB2T6p8kXdCZlGZnY1nfGdwVan40zF9Ww
         dF1CosTJQmUIzOTBoC7U4J1p+HrtXjIppibeo3eoJ2ByQwUEOOTOVvhmqI0VMUIU85+r
         myA4yCXosgJAIjLa4pVqqGYv36ymZhDpPr6nAr7S/i5zzx/ylLOrE2/9w5jH9Ph6io86
         klzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532911; x=1782137711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVryjK2DM4sA5w3mh6UPqm7isJZnfv1jNZ8fuuEu1pk=;
        b=aQKSERvuXJXqvFOO9KODiR7NqSFCcnLgl7iQcrllqDb581CWuAuQMIbTFpIuQdOZLT
         MRaP5TbB7kCTjFJNWbMWGPikr1ob+lN0AhpxTxQbUhWof66biFqsVfveELqozpDKg+ZX
         4Y9DiJB3YzJIXevGnH0qhpTCo0nIWA/nhwhyCU+Kh65igTfdZDFAzGcFAmpdIFO9TJlk
         uE03agyOo6VBMF2ltw/OTSH0zbLrofuHk8BsJWZNs+gLQ+7Lv08TN7V06RtYBV5NZMGv
         evtVFUoxd/mGqXxobqsxEVBJ9YLDC+AlxLuu/+gX1QBLEAjK9Wq//c6YgP/4tL7R0jre
         sP3g==
X-Forwarded-Encrypted: i=1; AFNElJ/BHNd2nPsw3sbtHz3xcC90hTTjH+ESN5CFVob3JR/JE0s9Z5TomTB86MEsPhR5TlisKa+NSx6kcOjD@vger.kernel.org
X-Gm-Message-State: AOJu0YwZP6WNvKRjOB+vOu0j9ALoEKi/tM/VJaKrzb8VbmHv86Ddq36E
	iViUupxjl6qmzSjxuhsoqj4AWUOqzeVI+w5pXPVA/pJtD4TFYohGMQdwtsQir5DWx+w1vOspe9v
	nFOZmLNDeBZT8La8+8p8IFo0tmm+1CpnZGKhsJIAuHg==
X-Gm-Gg: Acq92OEZu4xgWIcswkeW6iOlStiQ3ZuWY7vTmQjb20+bUeaSDFZjb/Dn2clT1J0nk0Q
	KYmkC6PfYJ7rmnLNwOpn0nRf1Asbm0VSCHNw9tzLjyT7qY/kV5wZQiLIxxcpiLbylEny3DMSXZi
	xZ7Hu50LRaiogQNg4Pb/2xwu8gP1RfVECioiN6h6rklVU37o0dJAf7a/9qWc+QE1AdJiKxEFdff
	9gQEkxYV5uasoOrvDQK+sawa5CwZrBu03R49vOAq8B3UzTCNHeS/MqDxkYowjJnkZAx4Uhi1uKF
	/gAfdiVIdpmjSi0LbbddHtii/xKaC98qqfKSPeTXIA==
X-Received: by 2002:a17:906:6312:b0:beb:a412:4597 with SMTP id
 a640c23a62f3a-bfe289041e9mr675217466b.16.1781532910299; Mon, 15 Jun 2026
 07:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a@epcas5p3.samsung.com>
 <20260615085252.1964423-1-alim.akhtar@samsung.com> <20260615085252.1964423-4-alim.akhtar@samsung.com>
In-Reply-To: <20260615085252.1964423-4-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 15 Jun 2026 15:14:58 +0100
X-Gm-Features: AVVi8CegUODrx3rDKzc3HaHPFo8dt4vcr6ypuvp0i1NB7YLXJyBmVm30dPPOny0
Message-ID: <CADrjBPpyNymPXtYgdeOGtp1KDkdp9gTrBAEcJR89B+wwF8uUXw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: samsung: Add Exynos8855 pinctrl configuration
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38500-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:from_mime,mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E24B768708E

Hi Alim,

Thanks for your patch. It's great to see more Exynos SoCs being supported!

On Mon, 15 Jun 2026 at 09:34, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add pinctrl configuration for Exynos8855. The bank type
> macros are reused from Exynos850 SoC.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 123 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  3 files changed, 126 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index fe9f92cb037e..db120ae4d847 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -943,6 +943,129 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
>         .num_ctrl       = ARRAY_SIZE(exynos850_pin_ctrl),
>  };
>

Are you sure you want to use E850 pinctrl macros and not the GS101
ones? The GS101 macros allow the fltcon offset to be specified, which
I think is required for all Exynos9 (including e850 SoC). Youngmin
sent a series previously
https://lore.kernel.org/lkml/20251202093613.852109-1-youngmin.nam@samsung.com/
fixing up some of this but it hasn't been re-spun in a while. In
particular this patch
https://lore.kernel.org/lkml/20251202093613.852109-4-youngmin.nam@samsung.com/.

> +/* pin banks of exynos8855 pin-controller 0 (ALIVE) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks0[] __initconst = {
> +       /* Must start with EINTG banks, ordered by EINT group number. */
> +       EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> +       EXYNOS850_PIN_BANK_EINTW(4, 0x020, "gpa1", 0x04),
> +       EXYNOS850_PIN_BANK_EINTN(3, 0x040, "gpq0"),
> +       EXYNOS850_PIN_BANK_EINTN(2, 0x060, "gpq1"),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpc0", 0x10),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x0a0, "gpc1", 0x14),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x0c0, "gpc2", 0x18),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x0e0, "gpc3", 0x1c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpc4", 0x20),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpc5", 0x24),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpc6", 0x28),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpc7", 0x2c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpc8", 0x30),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1a0, "gpc9", 0x34),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpc10", 0x38),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpc11", 0x3c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpc12", 0x40),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpc13", 0x44),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpc14", 0x48),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpj0", 0x4c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpj1", 0x50),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpj2", 0x54),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 1 (CMGP) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks1[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x00,  "gpm0",  0x00),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x20,  "gpm1",  0x04),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x40,  "gpm2",  0x08),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x60,  "gpm3",  0x0c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x80,  "gpm4",  0x10),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0xa0,  "gpm5",  0x14),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0xc0,  "gpm6",  0x18),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0xe0,  "gpm7",  0x1c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm8",  0x20),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm9",  0x24),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x28),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x2c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x30),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1a0, "gpm13", 0x34),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x48),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x4c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x50),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpm21", 0x54),
> +};
> +
> +
> +/* pin banks of exynos8855 pin-controller 2 (HSI UFS) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks2[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gpf3", 0x00),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 3 (PERIC) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks3[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTG(8, 0x0,   "gpp0", 0x00),
> +       EXYNOS850_PIN_BANK_EINTG(8, 0x20,  "gpp1", 0x04),
> +       EXYNOS850_PIN_BANK_EINTG(6, 0x40,  "gpp2", 0x08),
> +       EXYNOS850_PIN_BANK_EINTG(4, 0x60,  "gpg0", 0x0c),
> +       EXYNOS850_PIN_BANK_EINTG(3, 0x80,  "gpg1", 0x10),
> +       EXYNOS850_PIN_BANK_EINTG(6, 0xa0,  "gpb0", 0x14),
> +       EXYNOS850_PIN_BANK_EINTG(4, 0xc0,  "gpb1", 0x18),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 4 (PERICMMC) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks4[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpf2", 0x00),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 5 (USI) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks5[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTG(8, 0x00, "gpp3", 0x00),
> +       EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gpp4", 0x04),
> +       EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpg2", 0x08),
> +       EXYNOS850_PIN_BANK_EINTG(1, 0x60, "gpg3", 0x0c),
> +};
> +
> +static const struct samsung_pin_ctrl exynos8855_pin_ctrl[] __initconst = {
> +       {
> +               /* pin-controller instance 0 ALIVE data */
> +               .pin_banks      = exynos8855_pin_banks0,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks0),
> +               .eint_wkup_init = exynos_eint_wkup_init,
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {

With fltcon_offset specified, you could then use
gs101_pinctrl_suspend/gs101_pinctrl_resume callbacks here.

regards,

Peter.


> +               /* pin-controller instance 1 CMGP data */
> +               .pin_banks      = exynos8855_pin_banks1,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks1),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 2 HSI UFS data */
> +               .pin_banks      = exynos8855_pin_banks2,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks2),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 3 PERIC data */
> +               .pin_banks      = exynos8855_pin_banks3,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks3),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 4 PERICMMC data */
> +               .pin_banks      = exynos8855_pin_banks4,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks4),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 5 USI data */
> +               .pin_banks      = exynos8855_pin_banks5,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks5),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       },
> +};
> +
> +const struct samsung_pinctrl_of_match_data exynos8855_of_data __initconst = {
> +       .ctrl           = exynos8855_pin_ctrl,
> +       .num_ctrl       = ARRAY_SIZE(exynos8855_pin_ctrl),
> +};
> +
>  /* pin banks of exynos990 pin-controller 0 (ALIVE) */
>  static struct samsung_pin_bank_data exynos990_pin_banks0[] = {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 5ac6f6b02327..5ecc9ed4c44d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1500,6 +1500,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
>                 .data = &exynos7885_of_data },
>         { .compatible = "samsung,exynos850-pinctrl",
>                 .data = &exynos850_of_data },
> +       { .compatible = "samsung,exynos8855-pinctrl",
> +               .data = &exynos8855_of_data },
>         { .compatible = "samsung,exynos8890-pinctrl",
>                 .data = &exynos8890_of_data },
>         { .compatible = "samsung,exynos8895-pinctrl",
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index 937600430a6e..bb02fb49b2af 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -396,6 +396,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7870_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
> +extern const struct samsung_pinctrl_of_match_data exynos8855_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos8890_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos9610_of_data;
> --
> 2.34.1
>

