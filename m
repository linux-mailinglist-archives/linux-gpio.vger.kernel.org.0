Return-Path: <linux-gpio+bounces-20301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E04ABC7EC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 21:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 298E51B62BE2
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 19:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308DC21019C;
	Mon, 19 May 2025 19:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i3ze4j3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE6A1FBE8B;
	Mon, 19 May 2025 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683546; cv=none; b=Gruk5TR/1cftsKloJ4f692nfSBAe8xhU+56TNDY5OOby0zuDnUtJPqpwboeNMJATAOuWzYat/gLhzDVsraYvFoy/R7rzldyGAzsLhkfmGHlPkPls6zeD2yHFXoKhELXvFF8PQzOtB+vjsLR73jYVrxENS+dvf5Y0gwoSo/Omr30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683546; c=relaxed/simple;
	bh=RDFDL2i0kJEyKl2DZibODtURBIL+Rqiwg37OKOw/+0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uuxZLgyPdXEvNDNcCzEVc8kzqh+unit2zm3vx1KjOBKjQz4oxA1mNVeAaFQTEa8taYgqPI/TQnDy/6x5UQyr16MbjumW8oR7Vh4y8YYRAI10IDicnOU+0SIk/fdsEUeHjBwJFSqaNfPxPsCEObgOVrW7v4aRZ3Tn8OvcG+TcnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i3ze4j3a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747683542;
	bh=RDFDL2i0kJEyKl2DZibODtURBIL+Rqiwg37OKOw/+0w=;
	h=From:Date:Subject:To:Cc:From;
	b=i3ze4j3agZ1xjBgnSk6c7ECM4RhhtfqzdH3/fPyVCVYjxD4eaj/kaR16wTemAZApA
	 XB46m3/FnQy/h++UhZBi2sK/dVaq76RlkP4kZEiw9MkuIzr7xSpozmKdoj4cjtBHCV
	 4HbZsJ2a9Do/x5PsOlLQDcfq6ljQsiv1p/48jFsMuTtULrZlqXLl9kdME3SpnAFdl8
	 PrWArGfcPJjY/Czx3/dyU78lHTf5+HFZR9oIxOEuKXNbGAgJxnl2lwC1DdYyM4bCp2
	 MWB4iEMqSZcYuRA5W76XG4f6F14yGoCEal01ZeWmu75v+W4yJqTer+erB4qP+QeQ/L
	 4rxRHgIRZr7XQ==
Received: from [192.168.222.61] (unknown [IPv6:2607:fb91:213a:cf4c:3184:eb31:ee5b:b501])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B5C917E0FC4;
	Mon, 19 May 2025 21:38:58 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 19 May 2025 15:38:42 -0400
Subject: [PATCH] pinctrl: mediatek: eint: Fix invalid pointer dereference
 for v1 platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMGIK2gC/x2NwQqDMBAFf0X23AeJNkX9leJhaVa7IKskKoL47
 w09DgMzF2VJKpn66qIkh2ZdrIB/VPT5sk0CjYWpdnVwwXeYxHRBExxEbYPt84x1S4iSZMSoJzz
 7V8PccWyfVDprEXr+H+/hvn+MPAFlcwAAAA==
X-Change-ID: 20250519-genio-350-eint-null-ptr-deref-fix-1a163aa9ad84
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hao Chang <ot_chhao.chang@mediatek.com>, 
 Qingliang Li <qingliang.li@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
addresses") introduced an access to the 'soc' field of struct
mtk_pinctrl in mtk_eint_do_init() and for that an include of
pinctrl-mtk-common-v2.h.

However, pinctrl drivers relying on the v1 common driver include
pinctrl-mtk-common.h instead, which provides another definition of
struct mtk_pinctrl that does not contain an 'soc' field.

Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
will now try to dereference an invalid pointer when called on v1
platforms. This has been observed on Genio 350 EVK (MT8365), which
crashes very early in boot (the kernel trace can only be seen with
earlycon).

In order to fix this, given that this if code block is only relevant for
platforms with multiple EINT bases, and the previous if block already
handles the single base case, add an else statement so this if condition
will never even be evaluated on platforms with a single EINT base, which
covers all v1 platforms following commit fe412e3a6c97 ("pinctrl:
mediatek: common-v1: Fix EINT breakage on older controllers").

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 16af6a47028e67bb53db4041a37ebbbb8b9a1e43..9114e0cd9def1bc65558c67317abe67ba63ef1f6 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -531,9 +531,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 			eint->pins[i].index = i;
 			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
 		}
-	}
-
-	if (hw && hw->soc && hw->soc->eint_pin) {
+	} else if (hw && hw->soc && hw->soc->eint_pin) {
 		eint->pins = hw->soc->eint_pin;
 		for (i = 0; i < eint->hw->ap_num; i++) {
 			inst = eint->pins[i].instance;

---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250519-genio-350-eint-null-ptr-deref-fix-1a163aa9ad84

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


