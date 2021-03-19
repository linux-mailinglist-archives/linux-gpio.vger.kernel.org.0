Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB153420C8
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 16:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhCSPWN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 11:22:13 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:13264 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbhCSPWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 11:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616167324; x=1647703324;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=EyrxdYGskd5nndv9DffBff17H/pW8ipDLECkcAeVTfk=;
  b=G5KdmoHOoZeZaCMxvWvsfDq+uHHTT16BIAun33Nn998wtdrzEgw9Ynpn
   NWcVqHXbeZ4VnTCQUKcVnc5A7OPRJ14gA3j8d2Qu19eWEuFDSRTxqRfNZ
   gCZV9e1/0dU71QBZfyHCODmSo1CICQ0ikzy2bjHvRPyu4lN2MnpDYvxce
   M=;
X-IronPort-AV: E=Sophos;i="5.81,262,1610409600"; 
   d="scan'208";a="121703728"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 19 Mar 2021 15:21:57 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS id A6DAFA1D50;
        Fri, 19 Mar 2021 15:21:55 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.161.244) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 19 Mar 2021 15:21:49 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <andy.shevchenko@gmail.com>, <tony@atomide.com>,
        <haojian.zhuang@linaro.org>, <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH v4 0/3] Fix pinctrl-single pcs_pin_dbg_show()
Date:   Fri, 19 Mar 2021 17:21:30 +0200
Message-ID: <20210319152133.28705-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.244]
X-ClientProxiedBy: EX13D37UWA004.ant.amazon.com (10.43.160.23) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches fix the pcs_pin_dbg_show() function for the scenario where
a single register controls multiple pins (i.e. bits_per_mux is not zero)
Additionally, the common formula is moved to a separate function to
allow reuse.

Changes since v3:
-----------------
- define and set variable 'mux_bytes' in one line
- update commit message

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

 drivers/pinctrl/pinctrl-single.c | 65 ++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 28 deletions(-)

-- 
2.17.1

