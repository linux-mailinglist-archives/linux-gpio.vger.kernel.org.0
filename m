Return-Path: <linux-gpio+bounces-23902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74225B161D3
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 15:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 838E618C8463
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 13:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12F42D839A;
	Wed, 30 Jul 2025 13:50:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C04C2C3261;
	Wed, 30 Jul 2025 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883445; cv=none; b=jkiqUOjmly0x9gDBhEu0QH1aeBZsy9Pkn4ZcLGuLewC+BHGn2dUv9g5zbLCshWbE4hw0b6ghDs+j4/brbC/UQ1S9XfRWpL9MGowZl0v0jc9P5P/TP9ZEk7PZil3LWqoJSwsmQbHePHeamFXdT8PcLrFvG7vJXWfZIVcQ5Xpz5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883445; c=relaxed/simple;
	bh=jj/L/VuxfOUnU6mseAdQQe6yRTUBqobeU21hBqEmVTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XgXdY1lPCyqSOuMwSpfjHGqkNqj+euorEAndob0qdOsw0zNJeqd5yy8XjRbb2fwq/Aqg61aFMRddo9yhTYerKKxfajA3YgCp8tj4ymWcwG6Q3VJDUEF/DGDGNu2q8J8gu28jqg2hLx5p23+WMJ4yUUusx5YZKDJCAVZvouxn8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsY9h1rxmz9v53;
	Wed, 30 Jul 2025 15:35:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MxTpDkr189x; Wed, 30 Jul 2025 15:35:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsY9C2Symz9t5l;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F1908B76E;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id B3TTTuOPHS02; Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32F008B763;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 56UDYXEm271745
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 15:34:33 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 56UDYXMb271743;
	Wed, 30 Jul 2025 15:34:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
Date: Wed, 30 Jul 2025 15:34:22 +0200
Message-ID: <175388235172.270971.7957080828511695950.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753882464; l=407; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/o4cDiVkyPr0JbwYVaNEzFDJY8Bq/G7J5zt/xxb12Qo=; b=T8m3DHSjY8I3U43L/rEU2ojmXAySZGPQXNqoopT4g+PYQNfxMX5El9+y8GY8hGY8L71TgIJwE TRZuWcHBtxgDaNODgHwZ2PPCnKlCVyMagmq7d9dn3uva5+yc1VmKmGa
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit


On Tue, 10 Jun 2025 14:38:50 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/2] soc: fsl: qe: use new GPIO line value setter callbacks
      (no commit info)

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

