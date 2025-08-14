Return-Path: <linux-gpio+bounces-24392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9575B26654
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 15:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7B677B5B85
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 13:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70693019CB;
	Thu, 14 Aug 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl3ylAQt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690673019B4;
	Thu, 14 Aug 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176892; cv=none; b=lyS2w6nCFs1v2PP5NbRybwgdfS/2Kcm5Rj6GDrCh3nWtHujwVhrTtSvZJTdrZ8Zin+j6/OjLYm26CqVZ04Sqhsut2zkSq2rFO1RmNNdoG2VddzMoZpBFhXvX5X1XiF9pA1BVi9Aeif9Mx7vGWPkf73WBDWX6Kj2qBNoKScpnb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176892; c=relaxed/simple;
	bh=eeXOQDuIkC91qNmZOOxwnqrLxIkQOGin6epB2IqmH7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZybH4l+QBz7Off/vo5ttt1UCfFVhpXGnj0uTGy+/2o0sXUSgBsEWNEJiJm+4jiYB23ZTV0bo8B7UZJtdIVeN64ZZCvhvm1IX5IiFiC8BtW0lNktcCccPcfmTtIqczdbx2mn2R3hfEFaDAiCtnUxvb4gy8qy0E6CEV5kX84wOWvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl3ylAQt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E515C4CEED;
	Thu, 14 Aug 2025 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755176891;
	bh=eeXOQDuIkC91qNmZOOxwnqrLxIkQOGin6epB2IqmH7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sl3ylAQt6xcnwmBDX19BgFv3nCt8rKnq8FYXErHESwYo1LnnbgeZqNFzisMX2qABE
	 P7NIrS/eRk7a5aeVZQIVI0106gu3AQY9Y90BWN/N/ZXB7D0C8bq+PFgz/LBME+EXl+
	 XbYT5Q5YhxwB0eUnibeDmJNEIXpSdZVDG/Vi/usKedPVF96Cja8G6K7BZIIoyYVuEx
	 tDoA8M/2BOIM8YYQfRylnrFeN2JdwdwT6iLwbUaEwfXWRY+KyFX0W7z5YKQkZVJvNa
	 XrUSSwRkVZD0cwkFDSQBwObuzMxHA2w9g6/Oe9izkchy/VtHJ1cXqjcD1XbAbpTVyO
	 c22LP6ZldN4Dw==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v6 5/9] pinctrl: meson: Fix typo in device table macro
Date: Thu, 14 Aug 2025 15:07:13 +0200
Message-ID: <e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755170493.git.legion@kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The typo when using the MODULE_DEVICE_TABLE macro was not noticeable
because the macro was defined only if the module was built as a separate
module.

Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@intel.com/
Signed-off-by: Alexey Gladkov <legion@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index e34e984c2b38..6132710aff68 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -1093,7 +1093,7 @@ static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-s6", .data = &s6_priv_data, },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
+MODULE_DEVICE_TABLE(of, aml_pctl_of_match);
 
 static struct platform_driver aml_pctl_driver = {
 	.driver = {
-- 
2.50.1


