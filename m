Return-Path: <linux-gpio+bounces-26797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E45EFBB800F
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 21:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 883DF3B8A3F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 19:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2DB2343C0;
	Fri,  3 Oct 2025 19:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="R04bB4p6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4F1F4190;
	Fri,  3 Oct 2025 19:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759521059; cv=none; b=K3s5uWPbAMpu71fitgaIsig1i5dzbMB6UOu1EcX7uHc0OGAvluG86lCdbmCmHRUO4E+wDOtwX2I9i6AuvzCaGYDQvwrFJn3lkVHug0PXkFct3J+2WRdte6K0kfq9zLh3C9w04G7Di6pfM7HDP6Hi7k/yiJZU5XovU6PSo+7txwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759521059; c=relaxed/simple;
	bh=ZfWJAQ2LaXhU+emQOg/72pPgfztipt82RhZjDgAxYzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H1IYY1lkrQk5po32vFmuBi7mwWRy9VO2iVccflzy8jXhPkK8pQVEuNdJtD/WJEjhPllhwLF4SS0FAwymQTgmw1jyxZG7o4qop1zU8PBZQHNW5ZoUGreYdxAHMht82+RCepjnZIqOyS7T28kqPInCWexEO0gcPHYcCgOh0oXfsoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=R04bB4p6; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 8A2F740DFF4C;
	Fri,  3 Oct 2025 15:50:50 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1759521044; x=1761335445; bh=ZfWJAQ2LaXhU+emQOg/72pPgfztipt82RhZ
	jDgAxYzM=; b=R04bB4p6+zXNtvs2EkJ1ZjRES/2RV5xTumxSHc4pA3d3VHcvDDt
	QvwpA7o/r/OALUxLKhrqLfL819BCDs2n1ofEpSRRaCGGmrm4quw0IC8F1tlzCweV
	zllACiGayFuWiE/DG7Q5Fs7zjXOL+i1bXiTXKcI3lHmGZUDMq2UXLWlU=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JsvpTYE_Yp6S; Fri,  3 Oct 2025 15:50:44 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 1627945735E9;
	Fri,  3 Oct 2025 15:50:44 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v4 0/4] gpio: mpsse: add support for bryx brik
Date: Fri,  3 Oct 2025 15:50:32 -0400
Message-ID: <20251003195036.3935245-1-mstrodl@csh.rit.edu>
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

Changes since v3:
* Refactor supported line quirk logic (1 is supported now)

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


