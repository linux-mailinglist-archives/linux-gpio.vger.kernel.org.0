Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F77B33DE9D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 21:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhCPUZe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 16:25:34 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:4863 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhCPUZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 16:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615926306; x=1647462306;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ofrf9Zc8AZw06urF/eFU5kkSyWWDSEJNxkl1iNmVrPY=;
  b=hJcgcZMg7gLsq8tvZlnbqqS/rOAohuFkZP7Ymq1g99Zn3ZPngJVHnneb
   iwz/isFMy8YLIR/vKaj9Gt1qdYnml9oK3k5U1N8yjpb52wDdiSg1S/BJ0
   sx6qt7cAKgnV0WneVoOuw3pfGKJSDNu48vO9+1YfrOnPtGHQmzY7H9620
   8=;
X-IronPort-AV: E=Sophos;i="5.81,254,1610409600"; 
   d="scan'208";a="93586867"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 16 Mar 2021 20:24:58 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS id 9590AA188C;
        Tue, 16 Mar 2021 20:24:56 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.160.48) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 16 Mar 2021 20:24:49 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <tony@atomide.com>, <haojian.zhuang@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH v2 0/3] Fix pinctrl-single pcs_pin_dbg_show()
Date:   Tue, 16 Mar 2021 22:24:31 +0200
Message-ID: <20210316202434.27555-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.48]
X-ClientProxiedBy: EX13D02UWB003.ant.amazon.com (10.43.161.48) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches fix the pcs_pin_dbg_show() function for the scenario where
a single register controls multiple pins (i.e. bits_per_mux != 0).
Additionally, the common formula is moved to a separate function to
allow reuse.

Changes since v1:
-----------------
- remove unused variable in In function 'pcs_allocate_pin_table'
  (Reported-by: kernel test robot <lkp@intel.com>)

Hanna Hawa (3):
  pinctrl: pinctrl-single: remove unused variable
  pinctrl: pinctrl-single: remove unused parameter
  pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when bits_per_mux != 0

 drivers/pinctrl/pinctrl-single.c | 76 ++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 29 deletions(-)

-- 
2.17.1

