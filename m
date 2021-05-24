Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90F938E347
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 11:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbhEXJ1n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 05:27:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:49308 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232548AbhEXJ1k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 May 2021 05:27:40 -0400
IronPort-SDR: vfHYABMaJiKY/8n5Uh/arEV7s9kBRCEpXgjjqLkWRs+FOY3AK5guQYCgdgzNaHGd+62HTmWcWu
 bSTQ2tWFArxw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="263104317"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="263104317"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 02:26:09 -0700
IronPort-SDR: X+efpgdwqaKUq/WVx/SPf1xYzyRG0b/eo4Wc+8Af9sN8ZAQPNYS9JuEb+l8Tr+64UbQn4/ym+f
 VRj7bH6K2+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="478450444"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga002.fm.intel.com with ESMTP; 24 May 2021 02:26:06 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        lakshmi.bai.raja.subramanian@intel.com, tamal.saha@intel.com,
        lakshmi.sowjanya.d@intel.com
Subject: [PATCH 0/2] Add pinctrl support for Intel Keem Bay SoC
Date:   Mon, 24 May 2021 14:56:03 +0530
Message-Id: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>

Hi,

This patch set enables the support for the integrated pin controller in
the Intel Keem Bay SoC.

Patch 1 holds the implementation of pinctrl driver.
Patch 2 holds the relevant Device Tree bindings documentation and an
entry in MAINTAINERS file

Please help to review this patch set.

Thanks in advance,
Sowjanya

D, Lakshmi Sowjanya (2):
  dt-bindings: pinctrl: Add bindings for Intel Keembay pinctrl driver
  pinctrl: Add Intel Keem Bay pinctrl driver

 .../pinctrl/intel,pinctrl-keembay.yaml        |  135 ++
 MAINTAINERS                                   |    5 +
 drivers/pinctrl/Kconfig                       |   19 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-keembay.c             | 1732 +++++++++++++++++
 5 files changed, 1892 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
 create mode 100644 drivers/pinctrl/pinctrl-keembay.c

-- 
2.17.1

