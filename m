Return-Path: <linux-gpio+bounces-9230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A493961756
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 20:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B385FB21650
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3663F1D175F;
	Tue, 27 Aug 2024 18:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="clicWE08"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1B41D0DE4
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784985; cv=none; b=jxXdcYvvATavKEJIfHl8eamSHSansIyWKs5zzfCHR3B96jc+RW9x4Zphy7i7k1GlQ0Y9IiL51Ef/VEskLS5K17uNg4n51/hY1W+KLCz2vcAtrjwQfLSaG5lwFNriOVRNt319ztgZCSENey7uXxxnTkLyP1alxFRWZGlIzXxD+rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784985; c=relaxed/simple;
	bh=LrbzScSKoeO/OuSMvPnyas9t8iaLv9wwkOs1i5Fx+6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UC0V0Nem9aOK4gYhKcobRjG3ZG7mUBjf304Dp/f+Uvv/Fqjx5p7ZrdfgWHM/Ie7RmmYt4t5P35zrOsXf65o4LOLVFy/yo+ZnCOQ3AeDpPVRstJx/NxjzhOHI41gMAsEWLT9d6RgSAiM/Oy1YMRs6CvF2NNsE+hG7yxG9MsPO1go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=clicWE08; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724784983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+guXcsQCtHK0Zw9q0IVqiyr7tZDLCnkq56MSYQg4xFc=;
	b=clicWE08N9pyMy0B2N/30mXc3a1KXY9hGpWOJh8babnhmhHfbKn9e5NZA9XR65radrBYLB
	8o8V9U9hSu1Gfg9i2U+4/zru72JlJSMxTcLyJQGk/8EskJBwDPQaT8qIPlWrvZBjgX6a+H
	YmBYJERmzwuC+sZh4sy+WtJiFwMyHXM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-s0Dfj66RMEqS5m5nNNwG1w-1; Tue, 27 Aug 2024 14:56:22 -0400
X-MC-Unique: s0Dfj66RMEqS5m5nNNwG1w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a86f0c0affaso72832366b.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 11:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724784981; x=1725389781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+guXcsQCtHK0Zw9q0IVqiyr7tZDLCnkq56MSYQg4xFc=;
        b=iCIKlkm0aBKh7CcZoIFTpT+s0HhiMQ/FZGhoWZGLNzKRlpMiMC6wbeAaV1RZUy3cB4
         VeB7ndgYnimdOAwmT8rEs+mXf669SiS7NOizfLymsC3EtEVwSLRReo0PjvHKs0t+WEhu
         BAVTiVZFLI4kMghWdFSPv5CsLiWF6O01a9ji/OGUJkgL11NvQwA2Nv675vYvptxW+Qn7
         hhiC3BqKHGOg7QcyN7fhY/KCwXX/T43AjIxY2+5R/fu7er8BzawF/R5z3dI60Cpxb2YN
         8cV9Azah+Ak0CMbELD3gpzzV2NSpkyS2uf78nXn7Qf4xViowVk4Qoypby1tfvN6/wEuY
         zwcA==
X-Forwarded-Encrypted: i=1; AJvYcCUVozINoCAntJ3DFtTSOcheLtcF2IMIInl71EdeFpNraw8Eue3pktYwADcsr+Adwc37TdDZegNCk2ea@vger.kernel.org
X-Gm-Message-State: AOJu0YyY9TugMXFGabJEh04jmBJZoa72RHqes2IU6GYWiCtK37NVriIX
	U42PL2rlL/RbHb2yL8NiQd5fGj/aPVapzRbdRMbCGrVH5FjdahaFl3onbLrkDNwrVGSqW7iiIvB
	DbrV5RtWtuqXK+YUV7dKhU9LwS4m4cOMUL7s2iEZFQMm0vJBCASOMHAxirc8=
X-Received: by 2002:a17:907:7ea1:b0:a86:9ba1:63ac with SMTP id a640c23a62f3a-a86e3988e14mr297766566b.14.1724784980666;
        Tue, 27 Aug 2024 11:56:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSbDGP3VLJBbRBOwu9OD/wZex1BvcaPqE7Ybh9WpNR4VoxlhFHT2FFoNIIJFNO/012/OwV3Q==
X-Received: by 2002:a17:907:7ea1:b0:a86:9ba1:63ac with SMTP id a640c23a62f3a-a86e3988e14mr297764166b.14.1724784980100;
        Tue, 27 Aug 2024 11:56:20 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dbc:3c00:460c:db7e:8195:ddb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549c4e9sm141473066b.47.2024.08.27.11.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:56:19 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: ens Axboe <axboe@kernel.dk>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH v4 0/7] PCI: Remove pcim_iounmap_regions()
Date: Tue, 27 Aug 2024 20:56:05 +0200
Message-ID: <20240827185616.45094-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

OK, so unfortunately it seems very challenging to reconcile the merge
conflict pointed up by Serge between net-next and pci-devres regarding
"ethernet: stmicro": A patch that applies to the net-next tree does not
apply anymore to pci-devres (and vice versa).

So I actually think that it would be best if we just drop the portation
of "ethernet: stmicro" for now and port it as the last user in v6.13.

That should then be trivial.

Changes in v4:
  - Drop the "ethernet: stmicro: [...] patch since it doesn't apply to
    net-next, and making it apply to that prevents it from being
    applyable to PCI ._. (Serge, me)
  - Instead, deprecate pcim_iounmap_regions() and keep "ethernet:
    stimicro" as the last user for now. Perform the deprecation in the
    series' first patch. Remove the Reviewed-by's givin so far to that
    patch.
  - ethernet: cavium: Use PTR_ERR_OR_ZERO(). (Andy)
  - vdpa: solidrun (Bugfix) Correct wrong printf string (was "psnet" instead of
    "snet"). (Christophe)
  - vdpa: solidrun (Bugfix): Add missing blank line. (Andy)
  - vdpa: solidrun (Portation): Use PTR_ERR_OR_ZERO(). (Andy)
  - Apply Reviewed-by's from Andy and Xu Yilun.

Changes in v3:
  - fpga/dfl-pci.c: remove now surplus wrapper around
    pcim_iomap_region(). (Andy)
  - block: mtip32xx: remove now surplus label. (Andy)
  - vdpa: solidrun: Bugfix: Include forgotten place where stack UB
    occurs. (Andy, Christophe)
  - Some minor wording improvements in commit messages. (Me)

Changes in v2:
  - Add a fix for the UB stack usage bug in vdap/solidrun. Separate
    patch, put stable kernel on CC. (Christophe, Andy).
  - Drop unnecessary pcim_release_region() in mtip32xx (Andy)
  - Consequently, drop patch "PCI: Make pcim_release_region() a public
    function", since there's no user anymore. (obsoletes the squash
    requested by Damien).
  - vdap/solidrun:
    • make 'i' an 'unsigned short' (Andy, me)
    • Use 'continue' to simplify loop (Andy)
    • Remove leftover blank line
  - Apply given Reviewed- / acked-bys (Andy, Damien, Bartosz)


Important things first:
This series is based on [1] and [2] which Bjorn Helgaas has currently
queued for v6.12 in the PCI tree.

This series shall remove pcim_iounmap_regions() in order to make way to
remove its brother, pcim_iomap_regions().

@Bjorn: Feel free to squash the PCI commits.

Regards,
P.

[1] https://lore.kernel.org/all/20240729093625.17561-4-pstanner@redhat.com/
[2] https://lore.kernel.org/all/20240807083018.8734-2-pstanner@redhat.com/

Philipp Stanner (7):
  PCI: Deprecate pcim_iounmap_regions()
  fpga/dfl-pci.c: Replace deprecated PCI functions
  block: mtip32xx: Replace deprecated PCI functions
  gpio: Replace deprecated PCI functions
  ethernet: cavium: Replace deprecated PCI functions
  vdpa: solidrun: Fix UB bug with devres
  vdap: solidrun: Replace deprecated PCI functions

 drivers/block/mtip32xx/mtip32xx.c             | 16 +++--
 drivers/fpga/dfl-pci.c                        | 16 ++---
 drivers/gpio/gpio-merrifield.c                | 14 ++---
 .../net/ethernet/cavium/common/cavium_ptp.c   |  6 +-
 drivers/pci/devres.c                          |  8 ++-
 drivers/vdpa/solidrun/snet_main.c             | 59 ++++++++-----------
 include/linux/pci.h                           |  1 +
 7 files changed, 51 insertions(+), 69 deletions(-)

-- 
2.46.0


