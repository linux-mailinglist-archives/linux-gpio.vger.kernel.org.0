Return-Path: <linux-gpio+bounces-11421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D89A05EC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6781528219E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A644205E34;
	Wed, 16 Oct 2024 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Thz9a3qJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F941AF0DF
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072163; cv=none; b=t7BLo/EFo/kMOD9R0C36tFOhJyTlzoYbtDaotlexfEuIVO5hLKK0PlV/NC2oi17FqqnlSf/nJl0u4A/DvhhCHW8YLVLsyKOjKAcxWYrnyv8f9NwxRe8eIBsuAsuQG5CPS9z/b/w59nDmdswoDJIfiIlhVUpfnVpXjuBmlAdPTns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072163; c=relaxed/simple;
	bh=qU40uDWAXxj3oH037Z58Iia9dcS55Em7zzZb741ZWMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QPJi5+wCbGkRI9/8GhQvp/rtADlhPC38U8wavz+CjqevjyrRdfE0c+j94rlmW1Dh4hSw2uPQTwXgyO6kEyWfEkRQBW5pU7D772luMqCaJwCAsnNtm4OBzOQF+3gEiD92kZnZjR+y3tBVdF8LVpE0KWRtJ1lfCuHZxRqDbD2jH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Thz9a3qJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729072160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8WNVMc8LDTYNGH+SAKpTHVIymq5YjMjs8ZEPHmIVyE0=;
	b=Thz9a3qJmmKxZdOFlX2Ro+W/J2m6YiRClxpf4d5u6mMOpswWVJaF4h2yBkHusteRdAqTSm
	fvzzpwj1ZRn8bj08T2Tu723IlgoGUaGnfGyg8aHP3N6ZgwN6B4Jc74WuwTpnbT89qThROn
	vpTr8jsjidzUX1401jt5o2Up69WGzMY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-UbauqJbdOxqIHD8RKsk7nQ-1; Wed, 16 Oct 2024 05:49:19 -0400
X-MC-Unique: UbauqJbdOxqIHD8RKsk7nQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4312731c7bfso22757715e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 02:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072158; x=1729676958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WNVMc8LDTYNGH+SAKpTHVIymq5YjMjs8ZEPHmIVyE0=;
        b=gRNONOdSfAmA6c3o7uOIl/FQyBNudbs0+FwDouAhaCbQuRDX0LIT8uXlL7bxSJU5S0
         YeeHX8PRo53gh7r52znmywsupRu7uenyk6N9Wq+JODaPp427UVn68pd0N6LG5Py5a49Y
         E00tDiVjacz5ZWayBydTv4/qTNpv0eEh6zaxhUN+tEXDpkD2Rtk3U8Ko9pEr23F9EAXl
         Kd5YhcXNLMQWtPS2eNA0dQLXldQCJ+66p3T2NMb6MFSuhPxh4P37MyMBNFnrRYStSky4
         br6MRWEjlrm2Acdk7F8UmUx47XMcp6aF5tkYvqErNV2HAV/kHvgqrLe4W4sEfLZesBOJ
         VBNw==
X-Forwarded-Encrypted: i=1; AJvYcCV+9+ep/PfwznRYOdKaZCmh2StSjV8JK4f4JbGWx6wGajSLslKzN8xcdVSuu7/AdXj5GPjobUAbJpcb@vger.kernel.org
X-Gm-Message-State: AOJu0YymTjPiSftCRSqna5Zpjk3VToGgQMwnfv8ixf8PbGB1kYT73OIa
	6L5pNdrgDV9ap6YbUIZq8bb6z7Mz2Yw+c93jTuyFHbLPKjcbbb5JV8uWzhvIuMujxmWi/7gWy4r
	Kt97eBbu8jpvNjfp+lxqFmVjPGU+a58q+5xjXdjHo6DWLumpa/Cu2MqYFXAM=
X-Received: by 2002:a05:600c:4688:b0:42f:80f4:ab31 with SMTP id 5b1f17b1804b1-4314a2ff46amr26025635e9.18.1729072158272;
        Wed, 16 Oct 2024 02:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKUDE9oBG3DV9ivNP2q5cTc+CFmH4d6PSgSwWQMyk1ILj67QUdUX0ghs5JR6pQgtk/njtCOw==
X-Received: by 2002:a05:600c:4688:b0:42f:80f4:ab31 with SMTP id 5b1f17b1804b1-4314a2ff46amr26025305e9.18.1729072157791;
        Wed, 16 Oct 2024 02:49:17 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4314b32e487sm28190235e9.25.2024.10.16.02.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:49:17 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
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
	Richard Cochran <richardcochran@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Philipp Stanner <pstanner@redhat.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Li Zetao <lizetao1@huawei.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v8 0/6] PCI: Remove most pcim_iounmap_regions() users
Date: Wed, 16 Oct 2024 11:49:03 +0200
Message-ID: <20241016094911.24818-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Merge plan for this is the PCI-Tree.

After this series, only two users (net/ethernet/stmicro and
vdpa/solidrun) will remain to be ported in the subsequent merge window.
Doing them right now proved very difficult because of various conflicts
as they are currently also being reworked.

Changes in v8:
  - Patch "gpio: ..": Fix a bug: don't print the wrong error code. (Simon)
  - Split patch 1 into two patches to make adding of the new public API
    obvious (Bartosz)
  - Patch "ethernet: cavium: ...": Remove outdated sentences from the
    commit message.

Changes in v7:
  - Add Paolo's Acked-by.
  - Rebase on current master; drop patch No.1 which made
    pcim_request_region() public.

Changes in v6:
  - Remove the patches for "vdpa: solidrun" since the maintainer seems
    unwilling to review and discuss, not to mention approve, anything
    that is part of a wider patch series across other subsystems.
  - Change series's name to highlight that not all callers are removed
    by it.

Changes in v5:
  - Patch "ethernet: cavium": Re-add accidentally removed
    pcim_iounmap_region(). (Me)
  - Add Jens's Reviewed-by to patch "block: mtip32xx". (Jens)

Changes in v4:
  - Drop the "ethernet: stmicro: [...] patch since it doesn't apply to
    net-next, and making it apply to that prevents it from being
    applyable to PCI ._. (Serge, me)
  - Instead, deprecate pcim_iounmap_regions() and keep "ethernet:
    stimicro" as the last user for now.
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

Regards,
P.

[1] https://lore.kernel.org/all/20240729093625.17561-4-pstanner@redhat.com/
[2] https://lore.kernel.org/all/20240807083018.8734-2-pstanner@redhat.com/

Philipp Stanner (6):
  PCI: Make pcim_iounmap_region() a public function
  PCI: Deprecate pcim_iounmap_regions()
  fpga/dfl-pci.c: Replace deprecated PCI functions
  block: mtip32xx: Replace deprecated PCI functions
  gpio: Replace deprecated PCI functions
  ethernet: cavium: Replace deprecated PCI functions

 drivers/block/mtip32xx/mtip32xx.c              | 18 ++++++++----------
 drivers/fpga/dfl-pci.c                         | 16 ++++------------
 drivers/gpio/gpio-merrifield.c                 | 15 ++++++++-------
 .../net/ethernet/cavium/common/cavium_ptp.c    |  7 +++----
 drivers/pci/devres.c                           |  8 ++++++--
 include/linux/pci.h                            |  1 +
 6 files changed, 30 insertions(+), 35 deletions(-)

-- 
2.47.0


