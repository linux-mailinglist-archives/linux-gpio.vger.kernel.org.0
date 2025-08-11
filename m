Return-Path: <linux-gpio+bounces-24185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29BB20B69
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 598AE3A4C06
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45C120F098;
	Mon, 11 Aug 2025 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RPomDGHs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E691DF252
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921452; cv=none; b=GjZmOKdOQ3m+eeHuM4InVNhxYZj2OJ+htSHApzr+6jKCCfP3N486L0T21LT+0ctpLMdxyIVl9z15jd541W8sO7wIsAHV/XyElB5x/Cq6Os2NXYw1SQVmEdeCLGZdFp6XEDmL5qqvDDzazDduK1b84piit8qg8RIZ2p9nvDCxEWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921452; c=relaxed/simple;
	bh=H6l53B4wZkFz+nYR8PTiIJtmbUzH50h27nGG3cRI8Sc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WdE9W4UQSZHNiytZkUrd2+i9o4shDISXww/tuvz2N8jg/3mQ+aGJI3qqizRQR/KGGr73AmTzgitGE1Vu98BeVpR7wPMa2dG5tbeQGG1vEOCGpJqqpFq6Hd2u4WcuFSBP9172Zy+9CCrknIfKMYW/0ChMb83OPd9qTFb3F23OFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RPomDGHs; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af96fba3b37so824963266b.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754921448; x=1755526248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohexk0G5qQQ/U7tEXowxhsg85cDA9yyayQBpZFpm+6I=;
        b=RPomDGHspqrOA99cpDwb5F73hsjuzh3Ibdr+JNVUwjiWOgn+kJGmAMEzJQc41jXwyP
         rD68hgO+XCuL7INKK+L6bWexxcHiNE1zQwtKyJiLEprc4I9taRgh3HKlUpBnS8Bj5qmM
         kjiJ5B4gpBJ14eJPSuyYF6jIpnOaSL5w/0mW37PKRWdfBrNKu441QnK40cr5AMU0siXK
         xSq0X1FoWiX1lF8+xzi8vrGMuZFOuq54WNWifxwDpf0My0xIt7CzPkbmS8EBcRjrxSDz
         MGXfLVBBliWkYw8dQxVyZPV5rUBv1ZYkdWXj0mi7BVlSSBl3Pv893cMtn/VldPtWQliT
         DO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921448; x=1755526248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohexk0G5qQQ/U7tEXowxhsg85cDA9yyayQBpZFpm+6I=;
        b=GI14mHm1CQiiddqQaztkhhP9LPPGM3aXF8cCwt0s0ylbxvarweeVvZi9mmkDfqG213
         eT8sjWe/VOeJj+yIDnrA1PCzUUJoDqON/xSFtY4vEn8ZqsiUcioaNlYdsWz2RZUoJaJJ
         j+aloj1M8ICoXW9AClS+pI5RxWohKjADzoIsc8C4YS826/b3QjxI75wJfzP0RTCzHYkY
         Pb2tIIueO2g9oGvMEScclN6KCUZQmu+0GrKCaCqbtfhzQXmXklbIZMN209JQ4lvuPI7C
         2rSJmI9HhRpQiVxP6qt1wqf1Wvgpj2paPRtOofdigDOyMeZZrzNo51EmSGZtPy/cAPJB
         zx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMt3gGTWmK3K0VvjEAz6K5CM7/Nmy0vbtiFnhgrybDeG2UU8ejH7LcbXZTgbylF81yxw+g5vGJZXQe@vger.kernel.org
X-Gm-Message-State: AOJu0YyKne2wUvpEqzrkHbcImKw4pyFp03aAcugbdCArWzDVNlNGnyNM
	mA6UiB8aZPByVi6MwN1NXJ9INHXqYgyFRPZ/ll74804wa7O3g3fDZQcCUKVb+wM4nPM=
X-Gm-Gg: ASbGncvFb/qauT0jbyQ3L6iRYzfc2KXItl6GU57U1D7/CwQhZ+NldvxTExCiM9lEEtz
	An0iFRU47B36vdEpbucfPBt2eh5wreRM5bY/cEfEaYxr5fYv8Llm2NMHjh1qoJluPj7TTUnPGfG
	iDIPmeGeh0egopL/GtI8rxzsKw6/b7ARsrmx97WOxfJpLtgXSjtepFQzhei4D/xrhohavydwoYj
	57vM+hNkpIUiccgDxZRuKcF5e4JKq3gCjacnKvTOF3mbxf+yJ1Vp7tdYp7qFYFspZnZI4408UzU
	hG6Mh61p7bzTfINUcjpAmt9KIvx6MzUEw6yDsAhppYU0GTuEogSR++DOqVChFaSFSewtsNVEaFV
	K5fnmvlTSH5vZGU6f49mzJL6jNJyZF2KpUujLm5bh0LiJYapU5jwCiFs4nTh77vx2LQ==
X-Google-Smtp-Source: AGHT+IHdBKFk8Hdz0O5Qrkqv+q1AVcT+ToZrNVbbDng2NMf7Xf+fMHPhcyvkBGiKagZpBw13o0Tyeg==
X-Received: by 2002:a17:907:c1c:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-af9c647bce8mr1317574966b.35.1754921448512;
        Mon, 11 Aug 2025 07:10:48 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23bedcsm2030552266b.120.2025.08.11.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:10:48 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>,
	iivanov@suse.de,
	svarbanov@suse.de
Subject: [PATCH 0/2] Establish the roles of board DTSes for Raspberry Pi5
Date: Mon, 11 Aug 2025 16:12:33 +0200
Message-ID: <cover.1754914766.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this patchset is composed of the following:

- patch 1: just a cleanup to get rid of duplicated declarations in the
  board DTS for BCM2712.

- patch 2: explicitly states what BCM2712 board DTS will host the
  customized nodes that refer to RP1 internal peripherals. This is
  important so that followup patches add the nodes to the correct
  DTS file. For more information about why it has to be done, please
  take a look to the patch comment.

Andrea della Porta (2):
  arm64: dts: broadcom: delete redundant pcie enablement nodes
  arm64: dts: broadcom: amend the comment about the role of BCM2712
    board DTS

 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts      | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.35.3


