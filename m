Return-Path: <linux-gpio+bounces-26766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8AEBB4D9D
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 20:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D6E319C689D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 18:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E11F2750F6;
	Thu,  2 Oct 2025 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="Ed9is0um"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCBD26E709;
	Thu,  2 Oct 2025 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759428727; cv=none; b=N12G0tQirOcHSxya78V1G72WEjVTD7n8rPGjVWD+5Ur8fnhbpGVlxXk3TkJJ5hRAFNhuIaWV3wd+NAIdTwPPhEqz0DR/dhrypHnAe0Yu+aS+7ZvTb3tmBALGGj9f6xzfE2BR4b7emjLhSUSRDTArqO6AJS6S4GzIxVYLU8G5o3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759428727; c=relaxed/simple;
	bh=OHKQGPzrgFJG67aVXNe1LPQLjin3sT2XAVeH9mttQUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQsNrAeFG5WaOUFZs/R5rn2G+nKrmZAYB2xZrmOQrGLIPhexHyQ9+b89pmNM4h2Iy7p+t8j18e2VwI0mZFYiJqu7yx9ZF/8Y3skayqyu86Sjb6jB2NYXVmk2CD8/wSXOGrprO9B5QwEuTQnTqnsYzGW59zc+nNZTk9LHT0Rdxj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=Ed9is0um; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id B4283413383C;
	Thu,  2 Oct 2025 14:11:58 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1759428712; x=1761243113; bh=OHKQGPzrgFJG67aVXNe1LPQLjin3sT2XAVe
	H9mttQUc=; b=Ed9is0umbJjgQJ4br3p6guyoSlfttRcD0loxM436p8ucAzjp6Ji
	n+TLEPJuczxVdHdbBqJGNx2vFCQ/BcwN9IdxaBRm7JnLoiKPzfBC6OLAawdcbF+I
	860b/ukb7/PMiBp04zL7VHkVeg3Gox3mrgq36b/Fa7G22BnlsIV9JYQg=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9ozz9tVIncF3; Thu,  2 Oct 2025 14:11:52 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 44BBB401CF12;
	Thu,  2 Oct 2025 14:11:52 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v3 0/4] gpio: mpsse: add support for bryx brik
Date: Thu,  2 Oct 2025 14:11:32 -0400
Message-ID: <20251002181136.3546798-1-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey all,

This series adds support for the Bryx Radio Interface Kit to the gpio-mps=
se
driver

Here are some of the major differences compared to the sealevel device th=
is
driver currently supports:
* Uses an FT232HL chip instead of FT2232HL (this is easy, just populates =
as
  only one interface rather than two)
* There are only two exposed GPIO lines, and each is hardware restricted =
to
  a particular direction.
* This is an external device, therefore hotpluggable. This caused me to
  discover the race condition in the polling worker teradown, which
  accounts for the bulk of the changes.

The locking changes probably should be backported even though the actual
device isn't hotpluggable. If this isn't the right avenue for introducing
those fixes and it should be sent as a separate patch first, let me know
and it can be structured that way instead.

Other than the locking changes, this series also adds a generic "quirk"
system like I have seen in similar drivers for providing device-specific
line labels and direction restrictions. This should enable easier
integration of new devices in the future.

Lastly, I changed the device label format to expose useful device
information like the device serial number, vid, and pid to userspace. If
there is a better way to get this information (perhaps through udev?), I'=
m
all ears.

I also noticed a little bug where gpio_mpsse_direction_input wasn't
actually propagating errors, so I have a quick fix for that too.

Changes since v2:
* No more RCU, just use a spinlock to protect the stuff that matters
* Now using _safe variants of list iteration helpers where appropriate
* Use GFP_NOWAIT kmalloc flag
* Move repeated code into new gpio_mpsse_stop_all_except method
* Move little bugfix for direction_input error propagation into its own
  patch

Changes since v1:
* Break out into separate patches
* Fix RCU/concurrency soundness mistakes I noticed (list add/del were not
  protected by a lock, so now there is a separate spin lock, which we can
  use in irq context)
* Use guards for rcu read locks

Let me know what you think!

Mary Strodl (4):
  gpio: mpsse: propagate error from direction_input
  gpio: mpsse: ensure worker is torn down
  gpio: mpsse: add quirk support
  gpio: mpsse: support bryx radio interface kit

 drivers/gpio/gpio-mpsse.c | 229 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 217 insertions(+), 12 deletions(-)

--=20
2.47.0


