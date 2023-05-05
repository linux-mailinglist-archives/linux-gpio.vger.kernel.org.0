Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECA56F7DD5
	for <lists+linux-gpio@lfdr.de>; Fri,  5 May 2023 09:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjEEHaL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 May 2023 03:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjEEHaJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 May 2023 03:30:09 -0400
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643BA11B4C
        for <linux-gpio@vger.kernel.org>; Fri,  5 May 2023 00:30:05 -0700 (PDT)
X-QQ-mid: bizesmtp75t1683271741twofd6ve
Received: from wxdbg.localdomain.com ( [36.24.99.3])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Fri, 05 May 2023 15:28:22 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: zT6n3Y95oi2qGGm8CNxQoikUHI8a3j1SyoOwR/FQKJkU3jwhVKNerdDr17/s/
        rrh7Wg4FSQley/BvrW8EKukRPPQPxBDDsNFvQUJEXsz2EaTn3JTSeL1utGq9Gc/oPWkKHd2
        g6dKeCrHhPAKk3JAi5cUEQcZQQItUyIa2A97Skw5QHKed5BPSl/JdNuRbCzdtupDncQiak5
        hIq59b369SkaF3pPJuBnufka9b8569dLww+STn8WSNwqwp3Inc0LOw2TDZI5s3uLGu6eWIV
        mtd/WonHLSFaU3UFdHOslkrv+CrlxseBX//WBVPfumBE5TaSg/n2DcdN7VZ/dA67SEpGiM4
        4uHmvSFBjlbVpq8Xjiasxez7gosPOkrPUHPaHT2pWf6SCPi/M4=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 17579024077979230374
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [RFC PATCH net-next v6 0/9] TXGBE PHYLINK support
Date:   Fri,  5 May 2023 15:42:19 +0800
Message-Id: <20230505074228.84679-1-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement I2C, SFP, GPIO and PHYLINK to setup TXGBE link.

Because our I2C and PCS are based on Synopsys Designware IP-core, extend
the i2c-designware and pcs-xpcs driver to realize our functions.

v5 -> v6:
- fix to set error code if pointer of txgbe is NULL
- change "if" to "switch" for *_i2c_dw_xfer_quirk()
- rename property for I2C device flag
- use regmap to access I2C mem region
- use DEFINE_RES_IRQ()
- use phylink_mii_c45_pcs_get_state() for DW_XPCS_10GBASER

v4 -> v5:
- add clock register
- delete i2c-dw.h with platform data
- introduce property "i2c-dw-flags" to match device flags
- get resource from platform info to do ioremap
- rename quirk functions in i2c-designware-*.c
- fix calling txgbe_phylink_init()

v3 -> v4:
- modify I2C transfer to be generic implementation
- avoid to read DW_IC_COMP_PARAM_1
- remove redundant "if" statement
- add specific labels to handle error in txgbe_init_phy(), and remove
  "if" conditions in txgbe_remove_phy()

v2 -> v3:
- delete own I2C bus master driver, support it in i2c-designware
- delete own PCS functions, remove pma configuration and 1000BASE-X mode
- add basic function for 10GBASE-R interface in pcs-xpcs
- add helper to get txgbe pointer from netdev

v1 -> v2:
- add comments to indicate GPIO lines
- add I2C write operation support
- modify GPIO direction functions
- rename functions related to PHY interface
- add condition on interface changing to re-config PCS
- add to set advertise and fix to get status for 1000BASE-X mode
- other redundant codes remove

Jiawen Wu (9):
  net: txgbe: Add software nodes to support phylink
  i2c: designware: Add driver support for Wangxun 10Gb NIC
  net: txgbe: Register fixed rate clock
  net: txgbe: Register I2C platform device
  net: txgbe: Add SFP module identify
  net: txgbe: Support GPIO to SFP socket
  net: pcs: Add 10GBASE-R mode for Synopsys Designware XPCS
  net: txgbe: Implement phylink pcs
  net: txgbe: Support phylink MAC layer

 drivers/i2c/busses/i2c-designware-common.c    |   8 +
 drivers/i2c/busses/i2c-designware-core.h      |   1 +
 drivers/i2c/busses/i2c-designware-master.c    |  89 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c   |  16 +
 drivers/net/ethernet/wangxun/Kconfig          |   8 +
 drivers/net/ethernet/wangxun/libwx/wx_lib.c   |   3 +-
 drivers/net/ethernet/wangxun/libwx/wx_type.h  |   3 +
 drivers/net/ethernet/wangxun/txgbe/Makefile   |   1 +
 .../ethernet/wangxun/txgbe/txgbe_ethtool.c    |  28 +
 .../net/ethernet/wangxun/txgbe/txgbe_main.c   |  65 +-
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 651 ++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_phy.h    |  10 +
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  94 +++
 drivers/net/pcs/pcs-xpcs.c                    |  30 +
 include/linux/pcs/pcs-xpcs.h                  |   1 +
 15 files changed, 970 insertions(+), 38 deletions(-)
 create mode 100644 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
 create mode 100644 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.h

-- 
2.27.0

