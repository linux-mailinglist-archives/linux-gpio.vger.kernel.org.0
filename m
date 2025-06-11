Return-Path: <linux-gpio+bounces-21320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C117DAD4C17
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E736A189D4F5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D529E22DFA2;
	Wed, 11 Jun 2025 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfiLb7qI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94949801;
	Wed, 11 Jun 2025 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749624808; cv=none; b=PU7mnG1IjtGaLypZLE8ayWG8DgDzyXgSv1RDkzaPWkEmdc9BBFaZlpr5NK30jidP/OXpVVrlVf0FCUpUx6tfIRLXTWuV642fpcDzInnOzqF7DB2MTmYVjU4Iaby1ibbiNp+BTOiXKvUFjoy0bPy/kEIwE1xTs1kho1DTT3O6XC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749624808; c=relaxed/simple;
	bh=ywZhPZNxguASeXsz+ZQIEFvgkFGtFrdTHQm4EVnLuig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W25KRli/H8aEk3z96/tDRI7CXvmKwpCIZLsgXoKkrfiIYvAFl07BN7PfvFIHUsA0Khap/eRiqK2fZouhTNIrwEMmWwAfNk50oVaay16l09wr9NsjBSfMaSaXdH7A124R+qQ0zPsaceMY1Kfd4ZoOw2Eq/Hrn42z1VAEqMl7k8rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfiLb7qI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747e41d5469so6729968b3a.3;
        Tue, 10 Jun 2025 23:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749624805; x=1750229605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uynCWGHOwgS7TJEhfsESrMpDq6SQHjOchuDKL6F0CQ=;
        b=WfiLb7qI6NTUeAJTQMctO33eyyDS/89rafyPh2vHmfLq8Gxucy7ZtY+LG7VTs1HeSg
         5PscoFZhfRrBu34m1Yj2eIvMPrzRkynKMK55+jjFWn7Hpao4kByhWH/TIZlNfVVYS0y7
         giylwruHDb2R8aJANQG5VwKpw8Ix6Fgt/GHp6PuPDec/bRbfW4lKf3G9Gj3r015IPSJq
         dd1JJsZTZBRaE5Mbp/uN46/RD7uz+e7Vq71Bv6rdqPufGwuO/KEcomYa7AIqSCPeNvTh
         vMVyarLMrtvALat+nY+w66fY74c67XURQHGO8T/AFMN3x4PgvYY3fEAloy5eGf6R1u7G
         2xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749624805; x=1750229605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uynCWGHOwgS7TJEhfsESrMpDq6SQHjOchuDKL6F0CQ=;
        b=VqNnV6tP76th9U8OjLpsbRaG8LpIo/y1rhKPjdgcrS8rHpDFu97tM5G9uRhMufeQZ5
         /4M3OL2wSozFoRu2M/HwD/26Hu9OD9rQ+LwroaY2hJTBNXE/QQRTBdPTlDa2qzoX4AOW
         Ns/qWlx3HAqRydEjzsd+b7THY6ggW7cENLI+mqqfqrsg/WC76klVb3bAiGcqOfKw0XL3
         51RbqKJntn8jWIt5vVtgosausl9jTLfd0VADD8rZflypgGOBGyevjR6d3/MOGzhtfdVy
         kE03RqaMyxN5dg1zekIGMjANtN7kIKTXWpC88Gp1ji3biBsICs1BywwlgcZFwOy7AgCL
         Pxkg==
X-Forwarded-Encrypted: i=1; AJvYcCUaE1GwH6j/lNJnlQEy1KamrS/lZhvS7pmKPyUN3xp7SAhBTJ9Y2HDiNpJLqivl/E+fm3rPyzjFBTxv@vger.kernel.org, AJvYcCUrcHSiMNYdP2dyX7fmkflETk/VbYCXJzC10viqI6vfuxej/jNrVtcvlqodtRRuLDbYKjYdHMzL/VM=@vger.kernel.org, AJvYcCV7y4Z4xUbstVeLJTwlfh+h3RV80AZD1ZV5cjavTt5kN3qzxmkSl9fdjlPTgWiZalg/KE5oT+3+BN7c@vger.kernel.org, AJvYcCW6Y+WR+JDGdh0A1UDrd8TC16nQuCbTRluIvf44F42YNibmyOo06YELFkQtRTzpIn9HL9qZaRUk@vger.kernel.org, AJvYcCWWaXX59ZHYe31Y9cdnVTTpM7IjGfkiUzU+X/HwUMWogtgT793g7yDeZJXZ7KEk4R6p3vfAKtbECuI0pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuySAt3XBZ2DBN9fBFTGIyfb/Sf2EenCDUfg6LPz6nxGoUSBBq
	WhYgUv7SWb1i/V8NWEIF7O9aXmTEbwFzcU2rLXm1159KF8aTos/bpbgt
X-Gm-Gg: ASbGncsDznjjD9axUIEx1CTht9zSCw3BiUylxfOkKDT/25acqm/MU9x8fsu0v9LYflZ
	TzUKaYBeXcOOD7HfYgcbut2zcV9FJ7ftOnQFurBAyPp0ub+6sa2pWlKD3xTrrwM1rlNir5/GU0i
	uJDAsvm6i0/uejjdEaLbYgWS62Z95ooCUsj8MaIfsPIQJnZP6tq8f1x2Dj7SonNbZyuW+MdXS9G
	X70LXAEFQDNKiyO2irOr230V3reR4lwtMhBQi7Fzo5oZebHWgx4cFRQQW31nz+1J52wPSs4vWCH
	3Yw9qs4uM8boZslYnKta0VbPJB10Q6NfaPLOmpGk418TGXnt326AUNKY5Uwx+Ki7Ez/L8LMB
X-Google-Smtp-Source: AGHT+IHxP3vqYfSgJDfm/i4vg8P4K4JE3gMEHlJimyHW5aWR28HDA/MdfXXnCEmNEdnkpHVvNiNxmw==
X-Received: by 2002:a05:6a00:88b:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-7486ca942afmr2988582b3a.0.1749624804632;
        Tue, 10 Jun 2025 23:53:24 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482f4aea59sm8146085b3a.81.2025.06.10.23.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:53:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7FF5C420AA82; Wed, 11 Jun 2025 13:53:17 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux GPIO <linux-gpio@vger.kernel.org>,
	Linux MTD <linux-mtd@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Felipe Balbi <balbi@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: treewide: Replace remaining spinics links with lore
Date: Wed, 11 Jun 2025 13:52:55 +0700
Message-ID: <20250611065254.36608-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4260; i=bagasdotme@gmail.com; h=from:subject; bh=ywZhPZNxguASeXsz+ZQIEFvgkFGtFrdTHQm4EVnLuig=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBmear2blOVZfh2o9nz19OwMu1rOn3/5Z8w17D6iw3Em2 tXc0vtFRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZS+YqRYekHr48HS9QE9XfJ XJkU2CZy7lnb8oq73SE/psyP6I+++oGR4fWWiv8MOULcQhw7Qxnv87X3rJl98/lSzUWfQ9oLC87 7sQAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Long before introduction of lore.kernel.org, people would link
to LKML threads on third-party archives (here spinics.net), which
in some cases can be unreliable (as these were outside of
kernel.org control). Replace links to them with lore counterparts
(if any).

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/driver-api/gpio/driver.rst                    | 2 +-
 Documentation/filesystems/ubifs-authentication.rst          | 2 +-
 .../networking/device_drivers/ethernet/ti/cpsw.rst          | 6 +++---
 Documentation/usb/gadget-testing.rst                        | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index ae433261e11a06..85d86f92c41ba7 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -750,7 +750,7 @@ compliance:
 - Test your driver with the appropriate in-kernel real-time test cases for both
   level and edge IRQs
 
-* [1] http://www.spinics.net/lists/linux-omap/msg120425.html
+* [1] https://lore.kernel.org/r/1437496011-11486-1-git-send-email-bigeasy@linutronix.de/
 * [2] https://lore.kernel.org/r/1443209283-20781-2-git-send-email-grygorii.strashko@ti.com
 * [3] https://lore.kernel.org/r/1443209283-20781-3-git-send-email-grygorii.strashko@ti.com
 
diff --git a/Documentation/filesystems/ubifs-authentication.rst b/Documentation/filesystems/ubifs-authentication.rst
index 3d85ee88719a6c..106bb9c056f611 100644
--- a/Documentation/filesystems/ubifs-authentication.rst
+++ b/Documentation/filesystems/ubifs-authentication.rst
@@ -443,6 +443,6 @@ References
 
 [DM-VERITY]          https://www.kernel.org/doc/Documentation/device-mapper/verity.rst
 
-[FSCRYPT-POLICY2]    https://www.spinics.net/lists/linux-ext4/msg58710.html
+[FSCRYPT-POLICY2]    https://lore.kernel.org/r/20171023214058.128121-1-ebiggers3@gmail.com/
 
 [UBIFS-WP]           http://www.linux-mtd.infradead.org/doc/ubifs_whitepaper.pdf
diff --git a/Documentation/networking/device_drivers/ethernet/ti/cpsw.rst b/Documentation/networking/device_drivers/ethernet/ti/cpsw.rst
index a88946bd188bae..d3e1304550439d 100644
--- a/Documentation/networking/device_drivers/ethernet/ti/cpsw.rst
+++ b/Documentation/networking/device_drivers/ethernet/ti/cpsw.rst
@@ -268,14 +268,14 @@ Example 1: One port tx AVB configuration scheme for target board
 
 	// Run your appropriate tools with socket option "SO_PRIORITY"
 	// to 3 for class A and/or to 2 for class B
-	// (I took at https://www.spinics.net/lists/netdev/msg460869.html)
+	// (I took at https://lore.kernel.org/r/20171017010128.22141-1-vinicius.gomes@intel.com/)
 	./tsn_talker -d 18:03:73:66:87:42 -i eth0.100 -p3 -s 1500&
 	./tsn_talker -d 18:03:73:66:87:42 -i eth0.100 -p2 -s 1500&
 
 13) ::
 
 	// run your listener on workstation (should be in same vlan)
-	// (I took at https://www.spinics.net/lists/netdev/msg460869.html)
+	// (I took at https://lore.kernel.org/r/20171017010128.22141-1-vinicius.gomes@intel.com/)
 	./tsn_listener -d 18:03:73:66:87:42 -i enp5s0 -s 1500
 	Receiving data rate: 39012 kbps
 	Receiving data rate: 39012 kbps
@@ -555,7 +555,7 @@ Example 2: Two port tx AVB configuration scheme for target board
 20) ::
 
 	// run your listener on workstation (should be in same vlan)
-	// (I took at https://www.spinics.net/lists/netdev/msg460869.html)
+	// (I took at https://lore.kernel.org/r/20171017010128.22141-1-vinicius.gomes@intel.com/)
 	./tsn_listener -d 18:03:73:66:87:42 -i enp5s0 -s 1500
 	Receiving data rate: 39012 kbps
 	Receiving data rate: 39012 kbps
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 1998dc146c56fd..5f90af1fb57321 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -874,7 +874,7 @@ where uvc-gadget is this program:
 
 with these patches:
 
-	http://www.spinics.net/lists/linux-usb/msg99220.html
+	https://lore.kernel.org/r/1386675637-18243-1-git-send-email-r.baldyga@samsung.com/
 
 host::
 

base-commit: d3f825032091fc14c7d5e34bcd54317ae4246903
-- 
An old man doll... just what I always wanted! - Clara


