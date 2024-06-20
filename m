Return-Path: <linux-gpio+bounces-7571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57390FAE2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 03:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCE571F22DFD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 01:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBC9171A5;
	Thu, 20 Jun 2024 01:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GARnwyZN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71116171A1;
	Thu, 20 Jun 2024 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718846845; cv=none; b=agNAblGo7j7YCBzWrw0Agqsbm2g+8vPT+ujM2aeF6tJ/UbeksCvbEeUidFQtv4Uz7zD9F2lwfunNZND4q11cA5lBjCClynDEDnLQlZ58uK5cwb6eka9mez/qmdctL7ZyE8mdb1eQf+ZRFkSF7VFydJyG1Qmzc1uvXcwgYNsMU0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718846845; c=relaxed/simple;
	bh=4VxnDOU51vZLU7+fD7euvlW3mF3H/s9qJqw1xtfeUHE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SXDNcDRirsGEB/3jHG1Z4UCnhcPlyN6Y7Rw9nvhCcXy/u0Hgd32MFAhuXIXDpDDrruoNSfDNL57HMsCo1mqVpB/F2Lfz15gH8r5ePoPS3fsPspl18musZU0WjEnTQNb10E4M4abLGmebzKKMPWZKUZbjVW3KbZbxtKAnvF/RITk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GARnwyZN; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-70a365a4532so346710a12.1;
        Wed, 19 Jun 2024 18:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718846844; x=1719451644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXfqQxN1NZBOse/QmDM+IrCyohO6K/sbaRySddUPK6w=;
        b=GARnwyZNyyodT3KHad/LCfS7FDPleU8DNrFMQC5meJov28DAlUdqurYBDYBjGlbt0w
         HlNWPjHjqcmMSo2MzGDdOfatkvQA3IrkElUM4mBFk14tKky4V2rXxv90AQoqYm1ms30N
         9Ws0NK5PtmYxLBN23Ciq1CtQBHH0r0G8aggsVTzgjWO9lgMpmoA4J77DXwRNZW3MHWXJ
         l1qkKHOt3mv4WXkHuVbDFbIRh7kkm6CqBsu1lHEoo1RWWBUlr0XPwEhZBkq0kCLkwtKa
         X//AFLZqhIf2hQL/6qKlUdU3u+gR+IE6rRBGFaHkW9iKTFz7b9KdHB+r85/y7ZgM9Wft
         uQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718846844; x=1719451644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXfqQxN1NZBOse/QmDM+IrCyohO6K/sbaRySddUPK6w=;
        b=rQpL+0Z3w74gGsUMNG8hw2Gu0DIAeVR4efV3sj1kFiwOg/vv56dVvH0svwKZ73Q528
         O4Bnw5fXVZDXRSFzGadhlBMh37R/tjqx/NLcvZeDytkljMwd2FWtg97a/NQv3jOD5Cpa
         MFBxTsxQpTN85jScyKOFoRBZqdgkc7DHnaKDPAt3qd+qnctuHe7lkTXSJsia8HDjYuJd
         rIa3Z6ljRHvOD25ZSeV0dlEInT/OY8eSUDh3kT2lwn09xb+K7AkV3uXDCckatzvqlDQK
         TTAk7EySurhXU6lwVMTAT62BRV6KlHdP96qvqNXxLWuKPEAEbLoP6zzlj4BkG0X3VcJE
         AL5w==
X-Forwarded-Encrypted: i=1; AJvYcCWB9tG5gA/vO+LnIHB+wJxITh1zM5Y/1b0Z3C1YfhDdDDKe51+pMNT+GKTCPYUPzh9BU5Wyy01R33pfKoDe4KH+5SvGk+xJohCdBftPd+57pkVgsYd73kbi+rmdkUcWglpX/BXs6gVfXkSKNaeVs3JkWMF747bSPm0uah0CKOtA/bE69G8=
X-Gm-Message-State: AOJu0YxQs5mQ8zCctceiPe7gTprCZZZ+z04rFR1ySgsiDEEoQYuBBUzJ
	Fe9xVeS9eqalZwtlKk/0BZx4zR69fkgi31ijmiz0EAwjhYQae6Uc1dGcm0x6
X-Google-Smtp-Source: AGHT+IHtfUD5B+zKdHWT+iwIIrUKH41s2geArXIdro84BxWzTplbCRW+myV6oeXLWPV6UNJ7T1Qfag==
X-Received: by 2002:a17:903:11cc:b0:1f6:ea71:34ee with SMTP id d9443c01a7336-1f9aa3ce954mr49436905ad.16.1718846843524;
        Wed, 19 Jun 2024 18:27:23 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9d021b98fsm105855ad.33.2024.06.19.18.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 18:27:23 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Williams <patrick@stwcx.xyz>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 0/2] add ast2600 NCSI pin group
Date: Thu, 20 Jun 2024 09:25:10 +0800
Message-Id: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

LINK: [v1] https://lore.kernel.org/all/20240613080725.2531580-1-potin.lai.pt@gmail.com/

changes v1 --> v2:
- add NCSI pin group in dt-bindings document

Potin Lai (2):
  pinctrl: aspeed-g6: Add NCSI pin group config
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI group

 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  2 ++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c             | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.31.1


