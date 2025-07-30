Return-Path: <linux-gpio+bounces-23901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AE2B161D0
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 15:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E5BE565763
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 13:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004582D8771;
	Wed, 30 Jul 2025 13:50:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18BF2D839A;
	Wed, 30 Jul 2025 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883441; cv=none; b=pohwBqu32XAN4cnMjVSsPeb41+JdQG6c01EuU4x7IQbMXWU9vz2W2z9PlOC/x2oW9UPXYmD8JaqpA2No563HjCutvfqCzxf//++T4xwrz/AvPM2kWL+rHnPSbafujiu7IZH1+vvSJ1H7qDpfXkZ5BxMup8lKCRwQWSzL8ZAVniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883441; c=relaxed/simple;
	bh=srH4zJ77EKxALpSyEKIoSUAMlFR8wOt/FTVzeWUi1Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rfqF68g83IEw8h42m4YJBQXX0nUSqaR01LwusIptflYr7zGv0Z+ZZ7GV5IGhK1ESYvNT1qpTUpsW5NXEI8/yqHkrQONRzOq6p9H4oDaNx+uxTnNBniIIDsK7sCwPvPCNO2i4yBc9ldMdhdGCGb9lZv7ZEQI8zYzwOs2qP1KX5uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsY9j1CV8z9t5l;
	Wed, 30 Jul 2025 15:35:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ImwirM9pu7i; Wed, 30 Jul 2025 15:35:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsY9G3wCmz9t9W;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 80A968B76E;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QWsmRx-KqxQF; Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 663D88B763;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 56UDYYp8271754
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 15:34:34 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 56UDYXEC271753;
	Wed, 30 Jul 2025 15:34:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] soc: fsl: qe: convert set_multiple() to returning an integer
Date: Wed, 30 Jul 2025 15:34:23 +0200
Message-ID: <175388225169.270550.11152208847309594157.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721131511.75316-1-brgl@bgdev.pl>
References: <20250721131511.75316-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753882464; l=399; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=HnFftf19nbxbzRIzCXYRHL3Xne0RgZpbO7Z5YU6Gs8k=; b=jgrphHn/SaT3HhwtKAqT2ZOMETfLzyu0+6ajFuPkjx8YrmtBNGsTYaWFXkKiMYa6rt0KPIVXT vpYgu7zuB3tDrpXXojgB7IzPMrUz+7j3w4Jpp/m7ofw9yl+biDU2ER6
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit


On Mon, 21 Jul 2025 15:15:11 +0200, Bartosz Golaszewski wrote:
> The conversion to using the new GPIO line setter callbacks missed the
> set_multiple() in this file. Convert it to using the new callback.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: convert set_multiple() to returning an integer
      (no commit info)

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

