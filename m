Return-Path: <linux-gpio+bounces-9510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D8967F4E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88BFC28238C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 06:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6B415574F;
	Mon,  2 Sep 2024 06:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BPih2Hqo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66820154C00
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 06:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258261; cv=none; b=HGAz5SD0jeFoLCSrK7cZvd7L2mdxqV9W17V1mplK7L25pHEbHv/6ElAqdnI7Ed64A2FACXmaFlKUSz8ODWyfyATRIBz1DsNh8EHA7RQ5/9Al4lvRlk8yW0WumZTfWtMR7gV3HSnhogeX9UwJq73P/HWGopMltNuWKhzk+Ag6gW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258261; c=relaxed/simple;
	bh=T1yqAXM+3xtKVMn8RRidXoz4nHOE8Ci3eZ4JabVPDqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u2cq1yDkL9mYDkSpMqcgXzx7Sgcqqr4yhZ5WaS38GkgMqEHxfQD5ZxPCcYCsJGfKWIDptWHEHye0gVoPpO+Fd/FozPp26Zf+7TzWwIBssLCDvob0+pYERHG9WcHsPfqdvjz9PXPr97Q6W+C2BcWwC/y/dNz4vub6zFfWVfw1XBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BPih2Hqo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725258258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N92PkDzVG2acNWBWqEKftR5u8lrNIs7d1Jmmcz1T5Sc=;
	b=BPih2Hqozva99MUHtFoNUoWK7mNDLMKW+QlUr1sHNmKyhJPdzwC3km7g9sVBkyAh568UVl
	oTffXqD7DHTXerxbmW+stMunGLpF9i+A1VdPqx5q5NrijcVexluyGw1a5Iou5YFk1DreV0
	l9tX7KyrQRgiZ1EJjDYJFogkpLMOueM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-rxHI7CXVM-evKC7ottYBIg-1; Mon, 02 Sep 2024 02:24:17 -0400
X-MC-Unique: rxHI7CXVM-evKC7ottYBIg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a8084eb116so549353785a.1
        for <linux-gpio@vger.kernel.org>; Sun, 01 Sep 2024 23:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725258256; x=1725863056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N92PkDzVG2acNWBWqEKftR5u8lrNIs7d1Jmmcz1T5Sc=;
        b=CMTy3DHl1EmezDMkWqDUaqiPV18k5AIJX9bM7ybqXYqJ+r01/JA/eiNuz0HmFHJ7Pj
         GgCijVF/OMUEQffoaadGu1vvedCw6CO0rYeuiULmOImleHOVQYXWBx+KxFpeZ19etbGj
         bYDehFIu0gub41EusipQvJnQcy/P9ULoX6yXuyVNkodw9DEiELADCtJayQ7G/WzJAeqR
         nN7hUeQCkTHSz7dfYewzcEcnAjc9wvDi0TG6gWkjyAWxTG87wYjqYd43nmE7qe3Z1qvT
         g66YIK0Z0inMPEmAbhnGlKJ0S/7eu2HAVo1jSNiyGU+v3yFhEYEerK/ilBQCUq+sTakY
         CMlg==
X-Forwarded-Encrypted: i=1; AJvYcCVgBBX9xFkcEgGqhV04pmBjVtt0SH4MVIOndAmXPcQVG/8swvTcfHJFi5WjFIuqf896zc8gJpwonH2D@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWVCND+S/7VdQZx7YvjFGVbkmqYvOHaLklohsVP4rou6ggkUO
	/+TNRVPVq3el5jhRBJQkR6OoBEtYLwH1ef5Jlj28Y1AChg4kFplwG64HtdK6zgdEEi0e1hDRsne
	dhVD2DVnTaJ25n5ySzK2B29Jmpu7wLCc9dAZWyeJrwdrL8hrDrT+6zjikg4A=
X-Received: by 2002:a05:620a:470b:b0:79f:37f:9c40 with SMTP id af79cd13be357-7a8f6b757f6mr930477185a.12.1725258256489;
        Sun, 01 Sep 2024 23:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvWCwRx+ZDkAone/w4iYXXg0Gj5I6KQVMwBq/TysV8VXpC3ipaLBge9Ly4O8CWfgnEOFEcRw==
X-Received: by 2002:a05:620a:470b:b0:79f:37f:9c40 with SMTP id af79cd13be357-7a8f6b757f6mr930474585a.12.1725258256145;
        Sun, 01 Sep 2024 23:24:16 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3a34asm389211385a.84.2024.09.01.23.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:24:15 -0700 (PDT)
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
	John Garry <john.g.garry@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Philipp Stanner <pstanner@redhat.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v6 0/5] PCI: Remove most pcim_iounmap_regions() users
Date: Mon,  2 Sep 2024 08:23:37 +0200
Message-ID: <20240902062342.10446-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Philipp Stanner (5):
  PCI: Deprecate pcim_iounmap_regions()
  fpga/dfl-pci.c: Replace deprecated PCI functions
  block: mtip32xx: Replace deprecated PCI functions
  gpio: Replace deprecated PCI functions
  ethernet: cavium: Replace deprecated PCI functions

 drivers/block/mtip32xx/mtip32xx.c              | 18 ++++++++----------
 drivers/fpga/dfl-pci.c                         | 16 ++++------------
 drivers/gpio/gpio-merrifield.c                 | 14 +++++++-------
 .../net/ethernet/cavium/common/cavium_ptp.c    |  7 +++----
 drivers/pci/devres.c                           |  8 ++++++--
 include/linux/pci.h                            |  1 +
 6 files changed, 29 insertions(+), 35 deletions(-)

-- 
2.46.0


