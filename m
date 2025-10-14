Return-Path: <linux-gpio+bounces-27087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11DBD9CE0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBC3A4E75B8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131992D248E;
	Tue, 14 Oct 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="m7C3ouxH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C521E0BB;
	Tue, 14 Oct 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449699; cv=none; b=TSDwoRvqa1wNdwutPJ6qoMTLIV5teAnEpXEiNhabcc19UM5TybGIibhsFlJNTFgLDsTGHxWRIW30Titjz6UdD2gm3VCbDembTvjZXDW2HtRsXFKzh90uEgbTrZyh6faeWNI87kWvO9TyP2zPUBmc2PtnEZrTswjAfirXkzSyFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449699; c=relaxed/simple;
	bh=kKMHc9fhQOefpK92tuGFzHHBaODYcCQ7jI6gHccpTHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKFXOn/LOpQoBcWykren0d4f7ATXzKfurXHlO/kmhyHWGk7QvDi+S7Hh7HO8SrQEK3MH+xrCc3YNz9bw0RQLJa8/+1FDWBO7C1Ats8goEe39o/R7JcMwWtU1IDlBKkiJIfePfW7W3JyEA/mc+xm3up3ZCZU1LBr1OpbojXOm1Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=m7C3ouxH; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id EA95C4063919;
	Tue, 14 Oct 2025 09:41:00 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1760449256; x=1762263657; bh=kKMHc9fhQOefpK92tuGFzHHBaODYcCQ7jI6
	gHccpTHs=; b=m7C3ouxHWIkVlfC4x8h3eXRUxK3vjoVkxas8TgX8luB7tu+CmVo
	7kLOc6Gon8CZIsNfV1bBkiDBWTWHm4jicAD278QomSn8D25qeFD2eEjxiOGaKdjo
	NbFGFQLKORvmEa2LhkL/+8AWLWZSo3CtviFQu+kW3qTEQMcu7zNFOhw4=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KmUT8b1dRWM7; Tue, 14 Oct 2025 09:40:56 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 3538B400A7CC;
	Tue, 14 Oct 2025 09:40:56 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v5 0/4] gpio: mpsse: add support for bryx brik
Date: Tue, 14 Oct 2025 09:35:26 -0400
Message-ID: <20251014133530.3592716-1-mstrodl@csh.rit.edu>
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

Changes since v4:
* Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
* Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

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


