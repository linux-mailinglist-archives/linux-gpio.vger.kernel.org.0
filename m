Return-Path: <linux-gpio+bounces-9813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26196CBE1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 02:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 522E9B20B2E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 00:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E7F440C;
	Thu,  5 Sep 2024 00:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxHAodEk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC038C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 00:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725496842; cv=none; b=Yec2d1glcfqA2LpcrIRZ1VbuCPyFYOZP0RnqDApityIf2ASFatZzZD2Y5GFWnk2wCj+rnBH6D0XZMAQ57kOpnhMnIbrSxv4g+aYKrf6wHwkDAI2faAazLWG2/dkexzV2HPVl7tKcdTmZxbUcg51sE1v86UhIKlrgTVb9DIIbACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725496842; c=relaxed/simple;
	bh=FVysMeyY5spx1TFwKXCAd+YRLTELmrOLQ+sRwiAEW5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdhbCQwEUzfRhZEP9x64T4at3HaLUQJcoYP3xBBoJnX3R8sl0HLJcQQU6gfoRjwRZ1txzs+SiGpOzCjyninwZYJmxmrlylrtmycaailIGLYXdGgBc5dXRsM1uzS5LkDfzLmJmD7xTT3nz0BkkCTA/QTUG6SZOS0vApZMdoC+dug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxHAodEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEAFC4CEC2;
	Thu,  5 Sep 2024 00:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725496842;
	bh=FVysMeyY5spx1TFwKXCAd+YRLTELmrOLQ+sRwiAEW5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dxHAodEkLxtE5mwo6bG9hiGDxi9mrqwXbmBCI+QmYLmPlNASWYzAD7mX5Qzam7c01
	 pNJ8dFSjrq8i1hAuDgXvPvqTbWBNY1lWr5F7DtfwAnBhavtgIeUdnVUwGOA4sDKSbc
	 UbPj1j617IbaHO9txHBrEhMr0G0AVsxHt2Uus5iTAqWAvTuhGOkVamKtI2LyaYqTis
	 47cIHg+7oTB2VCmIEGg5Bq1fvcMV5mKbiEPcXz1t60JN38GpaiuMoA+RpmDWVg1ywP
	 5ohLHA0bVU6/zytbiFRBVgnRZz+nSgurBucux68+jnzGNjouZv2ej3FzqHDrIkDs64
	 bGHpF/ZjU37wg==
Message-ID: <e60cf1e7-3fb8-45c7-9876-0945e3fda9cc@kernel.org>
Date: Thu, 5 Sep 2024 09:40:39 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: k210: Make (p)clk local to k210_fpioa_probe()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org
References: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/09/04 18:08, Geert Uytterhoeven wrote:
> There were never any users of k210_fpioa_data.clk and
> k210_fpioa_data.pclk outside k210_fpioa_probe().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


