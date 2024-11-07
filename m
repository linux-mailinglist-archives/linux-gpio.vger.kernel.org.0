Return-Path: <linux-gpio+bounces-12662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA359C026D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 11:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D11961C21362
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 10:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7254F1EABB4;
	Thu,  7 Nov 2024 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQTqBeA4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4641DF72F;
	Thu,  7 Nov 2024 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975627; cv=none; b=C/YgfXJuHkivg/mGpZVGldz8A40Rwq/64oNJNfqLptiqIQlVTAR9aGqmyMXe+d+I0i1VB1eGIlowonbrnRLRtQceaX1AOD06rDazJAWf1Rl8wAq60KdhwjQnc07eMV954j2XPjq1K3OBZQt83iIobO+oVWKcBvMkW44uT6+Phkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975627; c=relaxed/simple;
	bh=e7o9LlJzfoBPuKxtfb83WAlaH+j48IlEZOapk8Po72E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyFgC9niX4r2W+xDb+X5nLogzzglh04ccNDDPENr2s6pomL/XMGOEMTRLo0rDZA+mMN4zXJSsh/UNqRwGcaOx5PqJbwEzroNU2p3p0eYHhjTHLTYgdUC7ALeecficQQr5Eo7obpeg5tK+ImQKd+STNeGnJ0mOtkgUhKMBy++J9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQTqBeA4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCE9C4CECC;
	Thu,  7 Nov 2024 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730975626;
	bh=e7o9LlJzfoBPuKxtfb83WAlaH+j48IlEZOapk8Po72E=;
	h=From:To:Cc:Subject:Date:From;
	b=jQTqBeA4cVwWhKtSFSSXb2/WnP3E4cljfi7X2Y8A7EjcrU8MTGyThneeuaF+H/1kq
	 r2UehETa69jWBO6kC1M3SeIXoEFTmPoPBKBQCU7qCMU5sfIBAf/UXsmi/WvLEyriuh
	 2g24C6zodhhwdlqYmFfr8bNulixDAwWFXSfEDjZ4SSpKF5fFOHLmSpy9pkZF2JPIje
	 8BSMHzu+W29ykSWfh3D4PbW6p8ed+p41eiNIrgRbSKLjzkVauCeEQh1L1VP4Tsacr2
	 OafDrTg6UGpv4o/Jl3sctrU5IsGo/6PTA8xuF8fOkdoizo4pJ4m5w6z5F/3munZ2ng
	 Gi/WhF42BtXng==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] polarfire gpio driver follow-ups
Date: Thu,  7 Nov 2024 10:33:39 +0000
Message-ID: <20241107-avatar-clapper-93eb34ad0e0c@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=8vEb3ii1bsfqiTgrr1CV8vvF13UPNJWUFk+0ewZ++nw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOk605sPMHO1/u3/WlKhl3iL4fgakSet9vdfzTFNMfiVv iyNPfx2RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZyooPhv5OQgAuH+M1bd2+/ 9Dr1f/GeTeunuk9gEupYzbYhjYEr5BIjw+oP8x4wb9s/2f3r7b3KP2YveHny2hEB/YNFEjmar5W NzRkB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Yo,

I realised last week, while rebasing the interrupt portion of the
driver, that coregpio a compatible in the kernel as well as a dts user.
Given how long the driver has taken to even get partially accepted, I
waited to get it to gpio/for-next rather than showing up with last
minute additions to it.

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org

Conor Dooley (2):
  gpio: mpfs: add CoreGPIO support
  MAINTAINERS: add gpio driver to PolarFire entry

 MAINTAINERS              |  1 +
 drivers/gpio/gpio-mpfs.c | 38 +++++++++++++++++++++++++++++++++-----
 2 files changed, 34 insertions(+), 5 deletions(-)

-- 
2.45.2


