Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C667F723D2A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 11:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237440AbjFFJX7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 05:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjFFJX7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 05:23:59 -0400
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BEE100;
        Tue,  6 Jun 2023 02:23:51 -0700 (PDT)
X-QQ-mid: bizesmtp69t1686043391tz9jdmvy
Received: from wxdbg.localdomain.com ( [122.235.137.64])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 06 Jun 2023 17:23:02 +0800 (CST)
X-QQ-SSF: 01400000000000J0Z000000A0000000
X-QQ-FEAT: XBN7tc9DADKlwMYnxiwIIQSyflZ305poPhZlfJvauYEwbNpRMyObJonRNRs4X
        ylNb0qjJFA9xvwES8KEt+BHv12kMVThfp9z2brAx3GLkPOFdhNep06ULtdgKBuSbxVsVOG3
        49l9g/Qf3kADvr50CnAmgR5FaUhbFm4nDyYzipLJRKIymRxd6L+BqtD/NYtoJ+UjQW1NDaw
        YmopcLfD8tOjGrPCIYs0eHDjxGGKXbeJNUGDoPNjW5y9ebxeH2HP4Eam9k7ivuOigbQFkEF
        2WyY5awbTs0+CVdUe6lLwfILFX/c657f6GP+Ay2SSYPKM9UUQT4Lsbtt18JGgd+oaLhEtDW
        2ftToX11aXPcRZglkC7FAbsdEptbswMRguIXUO+VCMsJQRANqMfIXzmtTp9bg==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 5152631644380312422
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk
Cc:     linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com,
        Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v12 0/8] TXGBE PHYLINK support
Date:   Tue,  6 Jun 2023 17:20:59 +0800
Message-Id: <20230606092107.764621-1-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement I2C, SFP, GPIO and PHYLINK to setup TXGBE link.

Because our I2C and PCS are based on Synopsys Designware IP-core, extend
the i2c-designware and pcs-xpcs driver to realize our functions.

v11 -> v12:
- split I2C designware patch (2/9) to I2C tree, repost remaining 8
  patches

v10 -> v11:
- add gc->label NULL check
- rebase on merging of wangxun patches

v9 -> v10:
- clear I2C device model flags
- change the order of header files
- use xpcs_create_mdiodev()
- fix Kconfig warning

v8 -> v9:
- rename swnode property for specific I2C platform device
- add ".fast_io = true" for I2C regmap
- use raw_spinlock_t for GPIO reg lock and adjust its position
- remove redundant txgbe->mdiodev
- keep reverse x-mass tree order
- other minor style changes

v7 -> v8:
- use macro defined I2C FIFO depth instead of magic number
- fix return code of clock create failure
- add spinlock for writing GPIO registers
- implement triggering GPIO interrupts for both-edge type
- remove the condition that enables interrupts
- add mii bus check for PCS device
- other minor style changes

v6 -> v7:
- change swnode property of I2C platform to be boolean
- use device_property_present() to match I2C device data

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

Jiawen Wu (8):
  net: txgbe: Add software nodes to support phylink
  net: txgbe: Register fixed rate clock
  net: txgbe: Register I2C platform device
  net: txgbe: Add SFP module identify
  net: txgbe: Support GPIO to SFP socket
  net: pcs: Add 10GBASE-R mode for Synopsys Designware XPCS
  net: txgbe: Implement phylink pcs
  net: txgbe: Support phylink MAC layer

 drivers/net/ethernet/wangxun/Kconfig          |  10 +
 drivers/net/ethernet/wangxun/libwx/wx_lib.c   |   3 +-
 drivers/net/ethernet/wangxun/libwx/wx_type.h  |   4 +
 drivers/net/ethernet/wangxun/txgbe/Makefile   |   1 +
 .../ethernet/wangxun/txgbe/txgbe_ethtool.c    |  28 +
 .../net/ethernet/wangxun/txgbe/txgbe_main.c   |  65 +-
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 673 ++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_phy.h    |  10 +
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  89 +++
 drivers/net/pcs/pcs-xpcs.c                    |  30 +
 include/linux/pcs/pcs-xpcs.h                  |   1 +
 11 files changed, 881 insertions(+), 33 deletions(-)
 create mode 100644 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
 create mode 100644 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.h

-- 
2.27.0

