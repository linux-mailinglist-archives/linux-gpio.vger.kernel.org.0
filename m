Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168977AF4DA
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 22:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjIZUNl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 16:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbjIZUNl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 16:13:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD5211F
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695759214; x=1727295214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N72NV8O8nD1FFy0IiqR7hFgCPZ0FcqUNYJqI2fHkI8o=;
  b=H+GCoxeXEvknePjJTmvOJKbIILbhCaexdAPXG14fbgEIhBzqt1vcMAud
   bZyN2JBRU452+00+rKiBqpoGi+NJ+GqdsO5rbr0QQJlt6iP/tRfzQ9W9W
   8v7Hrjr5N4N9mev6Az7E0jU6ioYcZI0QsUR4TTK0DngIF5EJPreHdQ+x8
   NQbBdg2KU7PD6v/nF5Mh25KYv+trAqJ6kL2t2XMGn1cZjC9AFyggPeoKF
   bEobPs8/gNfu/UyS/L7bXKi3RzM4jH1wIKlY3z5sQ8lRFQ9/1A1M9YqO7
   t6LS68ftjeqRJz+57FpADJ8Y8AkU1McHD/703oITSFEV26JJm615fBvNY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448154317"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="448154317"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 13:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819163317"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="819163317"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2023 13:13:32 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlER0-0003KF-0Z;
        Tue, 26 Sep 2023 20:13:30 +0000
Date:   Wed, 27 Sep 2023 04:13:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tzuyi Chang <tychang@realtek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 17/25]
 drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning:
 'rtd1319d_testmode_pins' defined but not used
Message-ID: <202309270448.7Aen3Sgx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   caaeb8c551123e26e86270c8dec99a78f1f6fe0f
commit: 916cc2b734cbdfdd4c58887be51a8a8a398e18d7 [17/25] pinctrl: realtek: Add pinctrl driver for RTD1319D
config: arm-randconfig-001-20230926 (https://download.01.org/0day-ci/archive/20230927/202309270448.7Aen3Sgx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270448.7Aen3Sgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270448.7Aen3Sgx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_testmode_pins' defined but not used [-Wunused-const-variable=]
     237 |         static const unsigned int rtd1319d_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1319d.c:344:1: note: in expansion of macro 'DECLARE_RTD1319D_PIN'
     344 | DECLARE_RTD1319D_PIN(RTD1319D_ISO_TESTMODE, testmode);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_reset_n_pins' defined but not used [-Wunused-const-variable=]
     237 |         static const unsigned int rtd1319d_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1319d.c:343:1: note: in expansion of macro 'DECLARE_RTD1319D_PIN'
     343 | DECLARE_RTD1319D_PIN(RTD1319D_ISO_RESET_N, reset_n);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_boot_sel_pins' defined but not used [-Wunused-const-variable=]
     237 |         static const unsigned int rtd1319d_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1319d.c:342:1: note: in expansion of macro 'DECLARE_RTD1319D_PIN'
     342 | DECLARE_RTD1319D_PIN(RTD1319D_ISO_BOOT_SEL, boot_sel);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_wd_rset_pins' defined but not used [-Wunused-const-variable=]
     237 |         static const unsigned int rtd1319d_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1319d.c:341:1: note: in expansion of macro 'DECLARE_RTD1319D_PIN'
     341 | DECLARE_RTD1319D_PIN(RTD1319D_ISO_WD_RSET, wd_rset);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_scan_switch_pins' defined but not used [-Wunused-const-variable=]
     237 |         static const unsigned int rtd1319d_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1319d.c:340:1: note: in expansion of macro 'DECLARE_RTD1319D_PIN'
     340 | DECLARE_RTD1319D_PIN(RTD1319D_ISO_SCAN_SWITCH, scan_switch);
         | ^~~~~~~~~~~~~~~~~~~~


vim +/rtd1319d_testmode_pins +237 drivers/pinctrl/realtek/pinctrl-rtd1319d.c

   235	
   236	#define DECLARE_RTD1319D_PIN(_pin, _name) \
 > 237		static const unsigned int rtd1319d_## _name ##_pins[] = { _pin }
   238	
   239	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_0, gpio_0);
   240	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_1, gpio_1);
   241	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_2, gpio_2);
   242	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_3, gpio_3);
   243	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_4, gpio_4);
   244	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_5, gpio_5);
   245	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_6, gpio_6);
   246	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_7, gpio_7);
   247	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_8, gpio_8);
   248	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_9, gpio_9);
   249	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_10, gpio_10);
   250	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_11, gpio_11);
   251	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_12, gpio_12);
   252	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_13, gpio_13);
   253	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_14, gpio_14);
   254	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_15, gpio_15);
   255	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_16, gpio_16);
   256	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_17, gpio_17);
   257	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_18, gpio_18);
   258	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_19, gpio_19);
   259	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_20, gpio_20);
   260	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_21, gpio_21);
   261	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_22, gpio_22);
   262	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_23, gpio_23);
   263	DECLARE_RTD1319D_PIN(RTD1319D_ISO_USB_CC2, usb_cc2);
   264	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_25, gpio_25);
   265	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_26, gpio_26);
   266	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_27, gpio_27);
   267	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_28, gpio_28);
   268	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_29, gpio_29);
   269	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_30, gpio_30);
   270	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_31, gpio_31);
   271	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_32, gpio_32);
   272	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_33, gpio_33);
   273	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_34, gpio_34);
   274	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_35, gpio_35);
   275	DECLARE_RTD1319D_PIN(RTD1319D_ISO_HIF_DATA, hif_data);
   276	DECLARE_RTD1319D_PIN(RTD1319D_ISO_HIF_EN, hif_en);
   277	DECLARE_RTD1319D_PIN(RTD1319D_ISO_HIF_RDY, hif_rdy);
   278	DECLARE_RTD1319D_PIN(RTD1319D_ISO_HIF_CLK, hif_clk);
   279	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_40, gpio_40);
   280	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_41, gpio_41);
   281	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_42, gpio_42);
   282	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_43, gpio_43);
   283	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_44, gpio_44);
   284	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_45, gpio_45);
   285	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_46, gpio_46);
   286	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_47, gpio_47);
   287	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_48, gpio_48);
   288	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_49, gpio_49);
   289	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_50, gpio_50);
   290	DECLARE_RTD1319D_PIN(RTD1319D_ISO_USB_CC1, usb_cc1);
   291	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_52, gpio_52);
   292	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_53, gpio_53);
   293	DECLARE_RTD1319D_PIN(RTD1319D_ISO_IR_RX, ir_rx);
   294	DECLARE_RTD1319D_PIN(RTD1319D_ISO_UR0_RX, ur0_rx);
   295	DECLARE_RTD1319D_PIN(RTD1319D_ISO_UR0_TX, ur0_tx);
   296	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_57, gpio_57);
   297	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_58, gpio_58);
   298	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_59, gpio_59);
   299	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_60, gpio_60);
   300	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_61, gpio_61);
   301	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_62, gpio_62);
   302	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_63, gpio_63);
   303	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_64, gpio_64);
   304	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_RST_N, emmc_rst_n);
   305	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DD_SB, emmc_dd_sb);
   306	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_CLK, emmc_clk);
   307	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_CMD, emmc_cmd);
   308	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DATA_0, emmc_data_0);
   309	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DATA_1, emmc_data_1);
   310	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DATA_2, emmc_data_2);
   311	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DATA_3, emmc_data_3);
   312	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DATA_4, emmc_data_4);
   313	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DATA_5, emmc_data_5);
   314	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DATA_6, emmc_data_6);
   315	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EMMC_DATA_7, emmc_data_7);
   316	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_78, gpio_78);
   317	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_79, gpio_79);
   318	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_80, gpio_80);
   319	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_81, gpio_81);
   320	DECLARE_RTD1319D_PIN(RTD1319D_ISO_UR2_LOC, ur2_loc);
   321	DECLARE_RTD1319D_PIN(RTD1319D_ISO_GSPI_LOC, gspi_loc);
   322	DECLARE_RTD1319D_PIN(RTD1319D_ISO_HI_WIDTH, hi_width);
   323	DECLARE_RTD1319D_PIN(RTD1319D_ISO_SF_EN, sf_en);
   324	DECLARE_RTD1319D_PIN(RTD1319D_ISO_ARM_TRACE_DBG_EN, arm_trace_dbg_en);
   325	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EJTAG_AUCPU_LOC, ejtag_aucpu_loc);
   326	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EJTAG_ACPU_LOC, ejtag_acpu_loc);
   327	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EJTAG_VCPU_LOC, ejtag_vcpu_loc);
   328	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EJTAG_SCPU_LOC, ejtag_scpu_loc);
   329	DECLARE_RTD1319D_PIN(RTD1319D_ISO_DMIC_LOC, dmic_loc);
   330	DECLARE_RTD1319D_PIN(RTD1319D_ISO_EJTAG_SECPU_LOC, ejtag_secpu_loc);
   331	DECLARE_RTD1319D_PIN(RTD1319D_ISO_VTC_DMIC_LOC, vtc_dmic_loc);
   332	DECLARE_RTD1319D_PIN(RTD1319D_ISO_VTC_TDM_LOC, vtc_tdm_loc);
   333	DECLARE_RTD1319D_PIN(RTD1319D_ISO_VTC_I2SI_LOC, vtc_i2si_loc);
   334	DECLARE_RTD1319D_PIN(RTD1319D_ISO_TDM_AI_LOC, tdm_ai_loc);
   335	DECLARE_RTD1319D_PIN(RTD1319D_ISO_AI_LOC, ai_loc);
   336	DECLARE_RTD1319D_PIN(RTD1319D_ISO_SPDIF_LOC, spdif_loc);
   337	DECLARE_RTD1319D_PIN(RTD1319D_ISO_HIF_EN_LOC, hif_en_loc);
   338	DECLARE_RTD1319D_PIN(RTD1319D_ISO_SC0_LOC, sc0_loc);
   339	DECLARE_RTD1319D_PIN(RTD1319D_ISO_SC1_LOC, sc1_loc);
   340	DECLARE_RTD1319D_PIN(RTD1319D_ISO_SCAN_SWITCH, scan_switch);
   341	DECLARE_RTD1319D_PIN(RTD1319D_ISO_WD_RSET, wd_rset);
 > 342	DECLARE_RTD1319D_PIN(RTD1319D_ISO_BOOT_SEL, boot_sel);
 > 343	DECLARE_RTD1319D_PIN(RTD1319D_ISO_RESET_N, reset_n);
 > 344	DECLARE_RTD1319D_PIN(RTD1319D_ISO_TESTMODE, testmode);
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
