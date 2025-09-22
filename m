Return-Path: <linux-gpio+bounces-26484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FAEB91E1E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09AC13B1087
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019DC2E03E4;
	Mon, 22 Sep 2025 15:20:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4272820D1;
	Mon, 22 Sep 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758554436; cv=none; b=J1P7Kakya7WeCBrQfw1NKmDKqb1YwMW7qLGluhb+qwpCrE6q7+i0FaYadNFbfT2E2DmOTqIz4rugUD1ggQIa5Bgjkqym3R+sFZ45AVp6BINJJd3TLIqg3eUz4W17NxNzfF6H9R551xE29mylpgyN7kiNU01I//9WQytdw3hMTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758554436; c=relaxed/simple;
	bh=BIRlhnru7mi+BVhU3LEk/WLKr5hIoCbLwnTLdLeM4+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HATDMp1yMzSnKWngI+XpplUYs5gDp2e5X1G7RQCB/5H/WUpQPUJygBt9bvgZsutQfLRMnehNUmbIAwcTxKQfMATd3RlshpGOkMzJ1Iw5irVR58Sf98DjG5WHklkOYD1xGBYc5ZoYn9kFdQy+/jVyOy134aW7ZUp6EX7bAWGrLMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cVmQ46hrnz9sSS;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAj35bzrK7Eo; Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cVmQ45vFpz9sSN;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B53D88B768;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Wc8vrIHa2uK1; Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A1E68B763;
	Mon, 22 Sep 2025 16:55:55 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/7] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon, 22 Sep 2025 16:55:46 +0200
Message-ID: <175855270809.96300.15498969212421871816.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758552948; l=721; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=aYbrvM60FKtWFyNikef1uJvt0soMLPkWIUod5zKQIfE=; b=o2vh0AbkgZRDTZfD+sDgtiYH+hiDvCfPGLBCRbBvfV9mgwoWZUllSFmykcseyTH9sUcVFu429 IYzJdwjwgF9CXkzFUSH2+wxK1i3QMoVm1UnTnl//mmS0VCVqqVvVmhE
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit


On Thu, 18 Sep 2025 18:23:20 +0200, Christophe Leroy wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for those IRQs then add change
> notification capability to the QUICC ENGINE GPIOs.
> 
> [...]

Applied, thanks!

[2/7] soc: fsl: qe: Change GPIO driver to a proper platform driver
      commit: 156460811def1ae699eebe40d9678e4ce3d1d9bc
[3/7] soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
      commit: e9713655b29a47d23cbf07aacf50b0ce8ee0a850

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

