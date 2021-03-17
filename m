Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B085A33FA90
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 22:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhCQVmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 17:42:31 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:17787 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbhCQVmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 17:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616017343; x=1647553343;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ryYbmSSSIni1SGHu36pR/awB6W0nYNB7Y0ksDQHqxeQ=;
  b=ZWlP7IrXU2SzF3glt38opp02pEA2JDV/OWEYOTbMFJLdKpWoQoe9kOlo
   llbRSM33WXc5O1O9uaz1ntMOtmvXezka1i9QFD1jUSgZvmuBLWpY9NhQp
   ICWz5c1RsdQXdYQKMAnuYogTBkv8rRy3/KPGjbPnkCgOeGKivh26F42xM
   w=;
X-IronPort-AV: E=Sophos;i="5.81,257,1610409600"; 
   d="scan'208";a="121282078"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2c-76e0922c.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 17 Mar 2021 21:42:14 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2c-76e0922c.us-west-2.amazon.com (Postfix) with ESMTPS id 0B330A1C4C;
        Wed, 17 Mar 2021 21:42:12 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.161.86) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 17 Mar 2021 21:42:05 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <andy.shevchenko@gmail.com>, <tony@atomide.com>,
        <haojian.zhuang@linaro.org>, <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH v2 0/3] Fix pinctrl-single pcs_pin_dbg_show()
Date:   Wed, 17 Mar 2021 23:41:46 +0200
Message-ID: <20210317214149.20833-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.86]
X-ClientProxiedBy: EX13D48UWB004.ant.amazon.com (10.43.163.74) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches fix the pcs_pin_dbg_show() function for the scenario where
a single register controls multiple pins (i.e. bits_per_mux is not zero)
Additionally, the common formula is moved to a separate function to
allow reuse.

Changes since v2:
-----------------
- move read() register to be outside of if condition (as it common
  read()).
- Remove extra parentheses
- replace offset variable by direct return statements

Changes since v1:
-----------------
- remove unused variable in In function 'pcs_allocate_pin_table'
  (Reported-by: kernel test robot <lkp@intel.com>)

Hanna Hawa (3):
  pinctrl: pinctrl-single: remove unused variable
  pinctrl: pinctrl-single: remove unused parameter
  pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when bits_per_mux is
    not zero

 drivers/pinctrl/pinctrl-single.c | 67 +++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 28 deletions(-)

-- 
2.17.1

