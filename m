Return-Path: <linux-gpio+bounces-29963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E6DCE529A
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 17:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79A1A3002966
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 16:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9887214A9B;
	Sun, 28 Dec 2025 16:05:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEFC381AF;
	Sun, 28 Dec 2025 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766937911; cv=none; b=FrVYYPInxK5raNIAMDsu5gr7pi0LwN51WUyI0CeGNAlyCDp/GFfxDoNWhqyOnyeAkodwtioda3QdYnps85q8y2lblfZkqbfLAEyjw5XRuqB7q75S3QQUonHpvvdIEdBrvnhOTYzvRQSa6G/KKp971o9L6A2jBeY0wMs3WaEb+Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766937911; c=relaxed/simple;
	bh=LfREattO08P03w6ks03fpRoDmSZkDeORE7WdE3soWo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avm43qvA8zUYBBgl08esxEtkju4IZ5vDZkcSfh/zdoWHjOiT7Xn0BEyO4g60So7TCyx9iL55BbjbT6zkARYJKPxla1RqGb7KTJGIfyoSdlxFsNOMHu9F7vF0m3xYLEthWsM9n2PGAYtKoyOUUZepBw64L0xA7vEk3UkNjH9I+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.221.253])
	by APP-03 (Coremail) with SMTP id rQCowAC3vcQaVVFpqqlXAg--.17060S2;
	Mon, 29 Dec 2025 00:04:44 +0800 (CST)
Date: Mon, 29 Dec 2025 00:04:42 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: linusw@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH 1/1] pinctrl: canaan: k230: Fix NULL pointer dereference
 in device tree parsing
Message-ID: <aVFVGnU7g6xst7Wo@duge-virtual-machine>
References: <20251228085005.155760-1-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228085005.155760-1-jiayu.riscv@isrc.iscas.ac.cn>
X-CM-TRANSID:rQCowAC3vcQaVVFpqqlXAg--.17060S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF43Kryfur13Ar1fCr4rZrb_yoWkJFb_uF
	1Fkw1kCw4UGr1DGw17Cr1fArnxAay29rW0qa4UWrZYq39rJw17trWFgrW3uw47uw1UX34D
	Ga47uF9Iqr1jgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVWUJVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjxU7UDGUUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Sun, Dec 28, 2025 at 04:50:05PM +0800, Jiayu Du wrote:
> When probing the k230 pinctrl driver, the kernel triggers a NULL pointer
> dereference. The crash trace showed:
> [    0.732084] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000068
> [    0.740737] ...
> [    0.776296] epc : k230_pinctrl_probe+0x1be/0x4fc
> 
> In k230_pinctrl_parse_functions(), we attempt to retrieve
> the device pointer via info->pctl_dev->dev, but info->pctl_dev is only
> initialized after k230_pinctrl_parse_dt() completes.
> At the time of DT parsing, info->pctl_dev is still NULL, leading to the invalid
> dereference of info->pctl_dev->dev.
> 
> Use the already available device pointer from platform_device
> instead of accessing through uninitialized pctl_dev.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Please ignore this patch. I'm sorry, I forgot to add the "fixes" tag.

I have resubmitted this patch. The link is provided here[1].

[1]: https://lore.kernel.org/all/20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn/


