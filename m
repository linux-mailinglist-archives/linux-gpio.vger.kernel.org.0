Return-Path: <linux-gpio+bounces-12902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DB9C6945
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 07:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E45A21F239E5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 06:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8686F176251;
	Wed, 13 Nov 2024 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5KMiboH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407EC2594;
	Wed, 13 Nov 2024 06:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731479439; cv=none; b=f0lpd6ku4D+HweMjwTcjMI6WvHJLDD+BWjx5/CZQKvKOaN1NkpIFOShkduf12gHImHpx9Xm56d6XZAGxbEMv9ON3MtQUO2ug4kov2tPSXvOz9jYd/CPX9DwpBJpq5iEypzGlSk2CrXM/S4cVGDCc2N3aqbpobeDfK8dqs/QTVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731479439; c=relaxed/simple;
	bh=hjBKF175D52aKk9ytGRzqV2rOfPcAzfyNpexBN7GjPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtrTdrGnso5kB0NJIaxY4N6cHHQxdAFkQ1JnyPe5H/7701dOHB3fZPjTNfgVCHpxiv5NmQdu3FQ/fvTv6Z33R8a5hKuYTpDV0dgX7YVE7n59X9FGg80Re5QC4TrltSt8NOZTYc45irsX/VvR0yTwVYqvcrc3XL7sfBGGnQk2rWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5KMiboH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06826C4CECD;
	Wed, 13 Nov 2024 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731479438;
	bh=hjBKF175D52aKk9ytGRzqV2rOfPcAzfyNpexBN7GjPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i5KMiboHxysWri9LAaFlP3XArThrmaoI/MwHm3NtdsduOllcQ1IAZUGnxMKYXOOKC
	 OqYW4r5aVURO+TOrzfpW4wJwGVAQ9jZlTezTuzNEVcIuZcIhY3UZ4qIuOrYyVoxZWc
	 veNnPP7Tu0lQk+H/z94BsAmX73cwW7CLOWcxZQYQSsy6jQ7Wk5ND1i8rQ79O3ygKfF
	 tCC+jjkAv/nR4EnSvW+CeY++wpjrMfzW9m2wcm15Nqb59bE455V51igT8f7mShwPuP
	 Qny+sL46xA2aHZ2qgcirJtvtU4nWGCgtBdnmWg6GN2yOCJ0odVtga5M9HYaRxh+2oX
	 CywbdIQTn063g==
Message-ID: <cad32ff9-fcb0-477e-8a8b-a7d4bb80fdfe@kernel.org>
Date: Wed, 13 Nov 2024 15:30:36 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: k210: Undef K210_PC_DEFAULT
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241113060950.5247-1-zhangjiao2@cmss.chinamobile.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20241113060950.5247-1-zhangjiao2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/24 15:09, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> When the temporary macro K210_PC_DEFAULT is no need anymore,

s/no need/not needed

> better use its name in the #undef statement instead of

s/better use/use

> the incorrect "DEFAULT" name.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>

With the typos fixed,

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

