Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEC833BF4A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 16:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbhCOPAb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 11:00:31 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:43129 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbhCOPAR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 11:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615820418; x=1647356418;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=FcaTmFg+qW3hY4NrmRQtEj4VEdriTa7K4B7OzIG6SJQ=;
  b=nDcJIiHUS7c/JhPWTBqJSHsKNS1d/CtzVXGyCe8tzA/yBFazYfeiSIDo
   VAEtqe4ZZBpA0Ho77HJlOnoMuE3oxL9rfwyvZC/kAEYpIlUcnXtOok4oK
   teugA/1tdYoEntR/+HiAmSxvvhtWS87mP5UnJdNLf6M2uq5jlA6aaswtD
   Q=;
IronPort-HdrOrdr: A9a23:+lwUlqkM9HscKOdb9tJEfUm4BWLpDfLD3DAbvn1ZSRFFG/Gwve
 rGppsm/DXzjyscX2xlpMCYNMC7MBbh3LN8/IV5B9afdSb8vm/AFuxfxK/D5xGlJCHk7O5a0s
 5bAspDIfn9F0Jzg8q/wCTQKbYd6eKK+qypmuvSpk0FJWoBV4hb8wx7BgyHe3cZeCB6A/MCeK
 a0145sojqtfmkvdcKrBnUJdPirnaytqLvWJToPBxsq82C1/FCVwY+/NQOZ0BcYWy5Oxrln0V
 GtqX2c2pme
X-IronPort-AV: E=Sophos;i="5.81,249,1610409600"; 
   d="scan'208";a="97431197"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 15 Mar 2021 15:00:08 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS id EA365A1FC3;
        Mon, 15 Mar 2021 15:00:06 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.160.180) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 15 Mar 2021 15:00:00 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <tony@atomide.com>, <haojian.zhuang@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH 0/2] Fix pinctrl-single pcs_pin_dbg_show()
Date:   Mon, 15 Mar 2021 16:59:42 +0200
Message-ID: <20210315145944.20412-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.180]
X-ClientProxiedBy: EX13D32UWB002.ant.amazon.com (10.43.161.139) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches fix the pcs_pin_dbg_show() function for the scenario where
a single register controls multiple pins (i.e. bits_per_mux != 0).
Additionally, the common formula is moved to a separate function to
allow reuse.

Hanna Hawa (2):
  pinctrl: pinctrl-single: remove unused parameter
  pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when bits_per_mux != 0

 drivers/pinctrl/pinctrl-single.c | 74 ++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 27 deletions(-)

-- 
2.17.1

