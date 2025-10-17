Return-Path: <linux-gpio+bounces-27229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E6DBE5FFF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 02:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9EC61A6197C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 00:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCD921D58B;
	Fri, 17 Oct 2025 00:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTEYIlkg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D2121858D;
	Fri, 17 Oct 2025 00:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760662701; cv=none; b=SX9eILPodV4h7ziNmbKJuNL6191Pmq7PGcbwgJ7tX0b23KblVVrqNztWRmHzWtllhsdBV8IXNiezej+GL5NNaBy1T//w04ytp/SSCh36A9bUoAmSNWvnVMWJzczaMmImVtGxVLb2JSCltTtCwKUSyYcpEumdAlb/lBgeWFAnjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760662701; c=relaxed/simple;
	bh=BDNixxoWGksRHJgYcJGp0gWs/tFZSH1PF5gbg/6inVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mlrwt1SrkAaDdkr/GoEs7VYj9KQcclbjkWlG76Ww2QolknJ9npzkTSpv3eEwKjJ1famIvuEfwwtPX9Jif2G6JYQ/RcpknBYD8LCes5he9bdRWIrxLmZBZhXf5nwY85Q3mznmLID+7wdaODNZswOpUusTG7zSX2WuzuMKMjNqn70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTEYIlkg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF928C4CEFB;
	Fri, 17 Oct 2025 00:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760662700;
	bh=BDNixxoWGksRHJgYcJGp0gWs/tFZSH1PF5gbg/6inVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZTEYIlkgPjr1AWipTUimpHw9r4EThCvKvuPUelv+sXOe3qF1GN/Xlu27iC9xfk8f3
	 XfQYgv+tWhcnGkwq7tCy1TVod5Tkh/ulOfhVFP8T+fagmDQqg8rBTrf099f5C/FLhJ
	 grNcrk3YF1HPG6NiQS1bLF2TkieqhGwUlqPpgplVxxKnD8I20Ir2793/HdV7MAqBes
	 2QjOUgRW3KaYmlQpaz0Ov3wHZL9E8r/jKg88riug2H0rSxkaLQnuPgMr7UNy5H5JxY
	 YD4OcF0Z5EeWrYYgfkxmaXrMlIYaLli+WI6BQLWuV1/8IKv4AVLeT5hMVDkhPE16Rl
	 qLhXacGOvNBJA==
From: William Breathitt Gray <wbg@kernel.org>
Date: Fri, 17 Oct 2025 09:58:02 +0900
Subject: [PATCH 2/3] gpio: pci-idio-16: Define maximum valid register
 address offset
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-fix-gpio-idio-16-regmap-v1-2-a7c71080f740@kernel.org>
References: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
In-Reply-To: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=wbg@kernel.org;
 h=from:subject:message-id; bh=BDNixxoWGksRHJgYcJGp0gWs/tFZSH1PF5gbg/6inVA=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBkfp6xc9mNfEn/UJbVI08eprmXKzHdlDhvNfHqs48eKW
 VnWbwvXd5SyMIhxMciKKbL0mp+9++CSqsaPF/O3wcxhZQIZwsDFKQATmW/FyPDb+Xeq1875d44s
 yF4RkrTzxubj8/6UyFvK/NN7G/h570Yrhl/Ms7P8/GrjauRuuSv7e/ucDng/ufz0tAMrBBL8jJs
 a3jEAAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

Attempting to load the pci-idio-16 module fails during regmap
initialization with a return error -EINVAL. This is a result of the
regmap cache failing initialization. Set the idio_16_regmap_config
max_register member to fix this failure.

Fixes: 73d8f3efc5c2 ("gpio: pci-idio-16: Migrate to the regmap API")
Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
Suggested-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: stable@vger.kernel.org
Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 drivers/gpio/gpio-pci-idio-16.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 476cea1b5ed774d18511aaf71d8ca2d71bcc9ff0..9d28ca8e1d6fac4bdc105b850583607b5e5a87ea 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -41,6 +41,7 @@ static const struct regmap_config idio_16_regmap_config = {
 	.reg_stride = 1,
 	.val_bits = 8,
 	.io_port = true,
+	.max_register = 0x7,
 	.wr_table = &idio_16_wr_table,
 	.rd_table = &idio_16_rd_table,
 	.volatile_table = &idio_16_rd_table,

-- 
2.51.0


