Return-Path: <linux-gpio+bounces-26526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E4B960DC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 15:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39BB718A6A2B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 13:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BA21DD0D4;
	Tue, 23 Sep 2025 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="lnHfjm3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5085386359;
	Tue, 23 Sep 2025 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635120; cv=none; b=II7wN3SVT37qLj1bWoHbOg09hZgkA2TPK5t3PwqJ/JsD6j/FCl15Gm4xYfFPXsHKqmxCMsJ+ijH/ID49LvA/jVXGrLwZqXBJ0ykVv+/+AUIpWz2bKxwBtZ465OYkTrrKjzAxLuawi2dlh7/Bk4ean2cnJiJv3yeDKrmLtWLHl48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635120; c=relaxed/simple;
	bh=TKWpkhJCJQtPeW+aEgfuNLX/ElYdPhbAdDt+m7t+0og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Og83fMAyMDSj2FnamkHOA0lVXbSxSVSGeNxppyaOFDunt1ljPMpHJLbtW4+ubpWafzCOkKFhy92wNVeiiUpNEpSGf2sLx6nPgFCNJBk92IJkjHCl7EwhtRLC2baM8RLNGlSRwMEfxph8fcpYdfo3tChS9JxvIBZZqH3K0jFIouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=lnHfjm3a; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 23FC140EA08B;
	Tue, 23 Sep 2025 09:35:29 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1758634522; x=1760448923; bh=TKWpkhJCJQtPeW+aEgfuNLX/ElYdPhbAdDt
	+m7t+0og=; b=lnHfjm3aBLknIcD/GsQdOaVg0Ua00v4MitQs4h67nNlNZZpX6nD
	U4XsgtDxDomobYLHLQPxm0d+e4OnUBtgQM/MetGtEBu8oRh9TPyRB71QK35pFZZa
	s/X2RdC7LSV4lM1LLU7n1n5MEiGisMjJfi+gslONVmIuCPWOaE15tALw=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LyvY7jcC6YN3; Tue, 23 Sep 2025 09:35:22 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id B3788457328D;
	Tue, 23 Sep 2025 09:35:22 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v2 0/3] gpio: mpsse: add support for bryx brik
Date: Tue, 23 Sep 2025 09:33:01 -0400
Message-ID: <20250923133304.273529-1-mstrodl@csh.rit.edu>
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

The RCU change probably should be backported even though the actual devic=
e
isn't hotpluggable. If this isn't the right avenue for introducing those
fixes and it should be sent as a separate patch first, let me know and it
can be structured that way instead.

Other than the RCU changes, this series also adds a generic "quirk" syste=
m
like I have seen in similar drivers for providing device-specific line
labels and direction restrictions. This should enable easier integration =
of
new devices in the future.

Lastly, I changed the device label format to expose useful device
information like the device serial number, vid, and pid to userspace. If
there is a better way to get this information (perhaps through udev?), I'=
m
all ears.

Changes since v1:
* Break out into separate patches
* Fix RCU/concurrency soundness mistakes I noticed (list add/del were not
  protected by a lock, so now there is a separate spin lock, which we can
  use in irq context)
* Use guards for rcu read locks

Let me know what you think!

Mary Strodl (3):
  gpio: mpsse: use rcu to ensure worker is torn down
  gpio: mpsse: add quirk support
  gpio: mpsse: support bryx radio interface kit

 drivers/gpio/gpio-mpsse.c | 239 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 227 insertions(+), 12 deletions(-)

--=20
2.47.0


