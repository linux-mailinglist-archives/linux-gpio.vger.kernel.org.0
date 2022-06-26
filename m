Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3219255ADE5
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 03:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbiFZBEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jun 2022 21:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233433AbiFZBEo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2022 21:04:44 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1668511175
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 18:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656205483; x=1687741483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6/fgz9B1UuUL3Sb65NkPB+6hJrPES4EMdlhewy+Ov5c=;
  b=Q2tDjyFrwgAMpcZKvalXVXAFlszGnuKEPgex6qlHmQ9xBlwwWqCFbrjV
   AsS50y/1kNPRKI2hll/MhFxyaXLWz1LBHzG0OGJgaJOqVioFBI1BMuzBR
   W2iSCUhb4CW2e8OWYO7RNkuDPuYeOZvxVMI8CwegzRoO/Xta+YQMlh0g0
   Y44L1kaeFHAXQCLr0XefYaegTAOeDRD4DbI9Yq8nThiXGNV2cGu9wyB9i
   df6fnPrXRtXLIEymWaJGB3yxQn8VXEC6bQWL/nUM3TzKyu5lQcN0i2j7p
   CMVc2rB92dprYH2AYPLU6AM9oF0/hqTEYPnb/EB+3TUVprUTAWHw1xbgi
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="261041966"
X-IronPort-AV: E=Sophos;i="5.92,222,1650956400"; 
   d="scan'208";a="261041966"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2022 18:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,222,1650956400"; 
   d="scan'208";a="835652139"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jun 2022 18:04:41 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o5Ghc-0006WJ-L5;
        Sun, 26 Jun 2022 01:04:40 +0000
Date:   Sun, 26 Jun 2022 09:04:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guodong Liu <guodong.liu@mediatek.com>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@collabora.com>
Subject: [linusw-pinctrl:devel 17/19]
 drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56: warning: "/*" within
 comment
Message-ID: <202206260954.NjQGnygt-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   2e0a5241577c8893757d4e86f38f26848c0ec4d0
commit: fe44e49840186c93ae26e3eda2c48c823fc7f33f [17/19] pinctrl: mediatek: add rsel setting on mt8192
config: csky-randconfig-r013-20220626
compiler: csky-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=fe44e49840186c93ae26e3eda2c48c823fc7f33f
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl devel
        git checkout fe44e49840186c93ae26e3eda2c48c823fc7f33f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/pinctrl/mediatek/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56: warning: "/*" within comment [-Wcomment]
    1362 |         MTK_PULL_PU_PD_TYPE,/*100* MTK_PULL_PU_PD_TYPE,/*101*/
         |                                                         
   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1363:56: warning: "/*" within comment [-Wcomment]
    1363 |         MTK_PULL_PU_PD_TYPE,/*102* MTK_PULL_PU_PD_TYPE,/*103*/
         |                                                         
   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1364:56: warning: "/*" within comment [-Wcomment]
    1364 |         MTK_PULL_PU_PD_TYPE,/*104* MTK_PULL_PU_PD_TYPE,/*105*/
         |                                                         
   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1365:56: warning: "/*" within comment [-Wcomment]
    1365 |         MTK_PULL_PU_PD_TYPE,/*106* MTK_PULL_PU_PD_TYPE,/*107*/
         |                                                         
   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1366:56: warning: "/*" within comment [-Wcomment]
    1366 |         MTK_PULL_PU_PD_TYPE,/*108* MTK_PULL_PU_PD_TYPE,/*109*/
         |                                                         
   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1367:56: warning: "/*" within comment [-Wcomment]
    1367 |         MTK_PULL_PU_PD_TYPE,/*110* MTK_PULL_PU_PD_TYPE,/*111*/
         |                                                         
   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1368:56: warning: "/*" within comment [-Wcomment]
    1368 |         MTK_PULL_PU_PD_TYPE,/*112* MTK_PULL_PU_PD_TYPE,/*113*/
         |                                                         
   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1369:56: warning: "/*" within comment [-Wcomment]
    1369 |         MTK_PULL_PU_PD_TYPE,/*114* MTK_PULL_PU_PD_TYPE,/*115*/
         |                                                         
   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1370:56: warning: "/*" within comment [-Wcomment]
    1370 |         MTK_PULL_PU_PD_TYPE,/*116* MTK_PULL_PU_PD_TYPE,/*117*/
         |                                                         


vim +1362 drivers/pinctrl/mediatek/pinctrl-mt8192.c

  1310	
  1311	static const unsigned int mt8192_pull_type[] = {
  1312		MTK_PULL_PU_PD_TYPE,/*0*/ MTK_PULL_PU_PD_TYPE,/*1*/
  1313		MTK_PULL_PU_PD_TYPE,/*2*/ MTK_PULL_PU_PD_TYPE,/*3*/
  1314		MTK_PULL_PU_PD_TYPE,/*4*/ MTK_PULL_PU_PD_TYPE,/*5*/
  1315		MTK_PULL_PU_PD_TYPE,/*6*/ MTK_PULL_PU_PD_TYPE,/*7*/
  1316		MTK_PULL_PU_PD_TYPE,/*8*/ MTK_PULL_PU_PD_TYPE,/*9*/
  1317		MTK_PULL_PUPD_R1R0_TYPE,/*10*/ MTK_PULL_PUPD_R1R0_TYPE,/*11*/
  1318		MTK_PULL_PUPD_R1R0_TYPE,/*12*/ MTK_PULL_PUPD_R1R0_TYPE,/*13*/
  1319		MTK_PULL_PUPD_R1R0_TYPE,/*14*/ MTK_PULL_PUPD_R1R0_TYPE,/*15*/
  1320		MTK_PULL_PU_PD_TYPE,/*16*/ MTK_PULL_PU_PD_TYPE,/*17*/
  1321		MTK_PULL_PU_PD_TYPE,/*18*/ MTK_PULL_PU_PD_TYPE,/*19*/
  1322		MTK_PULL_PU_PD_TYPE,/*20*/ MTK_PULL_PU_PD_TYPE,/*21*/
  1323		MTK_PULL_PU_PD_TYPE,/*22*/ MTK_PULL_PU_PD_TYPE,/*23*/
  1324		MTK_PULL_PU_PD_TYPE,/*24*/ MTK_PULL_PU_PD_TYPE,/*25*/
  1325		MTK_PULL_PU_PD_TYPE,/*26*/ MTK_PULL_PU_PD_TYPE,/*27*/
  1326		MTK_PULL_PU_PD_TYPE,/*28*/ MTK_PULL_PU_PD_TYPE,/*29*/
  1327		MTK_PULL_PU_PD_TYPE,/*30*/ MTK_PULL_PU_PD_TYPE,/*31*/
  1328		MTK_PULL_PU_PD_TYPE,/*32*/ MTK_PULL_PU_PD_TYPE,/*33*/
  1329		MTK_PULL_PU_PD_TYPE,/*34*/ MTK_PULL_PU_PD_TYPE,/*35*/
  1330		MTK_PULL_PU_PD_TYPE,/*36*/ MTK_PULL_PU_PD_TYPE,/*37*/
  1331		MTK_PULL_PU_PD_TYPE,/*38*/ MTK_PULL_PU_PD_TYPE,/*39*/
  1332		MTK_PULL_PU_PD_TYPE,/*40*/ MTK_PULL_PU_PD_TYPE,/*41*/
  1333		MTK_PULL_PU_PD_TYPE,/*42*/ MTK_PULL_PU_PD_TYPE,/*43*/
  1334		MTK_PULL_PU_PD_TYPE,/*44*/ MTK_PULL_PUPD_R1R0_TYPE,/*45*/
  1335		MTK_PULL_PUPD_R1R0_TYPE,/*46*/ MTK_PULL_PUPD_R1R0_TYPE,/*47*/
  1336		MTK_PULL_PUPD_R1R0_TYPE,/*48*/ MTK_PULL_PUPD_R1R0_TYPE,/*49*/
  1337		MTK_PULL_PUPD_R1R0_TYPE,/*50*/ MTK_PULL_PUPD_R1R0_TYPE,/*51*/
  1338		MTK_PULL_PUPD_R1R0_TYPE,/*52*/ MTK_PULL_PUPD_R1R0_TYPE,/*53*/
  1339		MTK_PULL_PUPD_R1R0_TYPE,/*54*/ MTK_PULL_PUPD_R1R0_TYPE,/*55*/
  1340		MTK_PULL_PUPD_R1R0_TYPE,/*56*/ MTK_PULL_PU_PD_TYPE,/*57*/
  1341		MTK_PULL_PU_PD_TYPE,/*58*/ MTK_PULL_PU_PD_TYPE,/*59*/
  1342		MTK_PULL_PU_PD_TYPE,/*60*/ MTK_PULL_PU_PD_TYPE,/*61*/
  1343		MTK_PULL_PU_PD_TYPE,/*62*/ MTK_PULL_PU_PD_TYPE,/*63*/
  1344		MTK_PULL_PU_PD_TYPE,/*64*/ MTK_PULL_PU_PD_TYPE,/*65*/
  1345		MTK_PULL_PU_PD_TYPE,/*66*/ MTK_PULL_PU_PD_TYPE,/*67*/
  1346		MTK_PULL_PU_PD_TYPE,/*68*/ MTK_PULL_PU_PD_TYPE,/*69*/
  1347		MTK_PULL_PU_PD_TYPE,/*70*/ MTK_PULL_PU_PD_TYPE,/*71*/
  1348		MTK_PULL_PU_PD_TYPE,/*72*/ MTK_PULL_PU_PD_TYPE,/*73*/
  1349		MTK_PULL_PU_PD_TYPE,/*74*/ MTK_PULL_PU_PD_TYPE,/*75*/
  1350		MTK_PULL_PU_PD_TYPE,/*76*/ MTK_PULL_PU_PD_TYPE,/*77*/
  1351		MTK_PULL_PU_PD_TYPE,/*78*/ MTK_PULL_PU_PD_TYPE,/*79*/
  1352		MTK_PULL_PU_PD_TYPE,/*80*/ MTK_PULL_PU_PD_TYPE,/*81*/
  1353		MTK_PULL_PU_PD_TYPE,/*82*/ MTK_PULL_PU_PD_TYPE,/*83*/
  1354		MTK_PULL_PU_PD_TYPE,/*84*/ MTK_PULL_PU_PD_TYPE,/*85*/
  1355		MTK_PULL_PU_PD_TYPE,/*86*/ MTK_PULL_PU_PD_TYPE,/*87*/
  1356		MTK_PULL_PU_PD_TYPE,/*88*/ MTK_PULL_PU_PD_TYPE,/*89*/
  1357		MTK_PULL_PU_PD_TYPE,/*90*/ MTK_PULL_PU_PD_TYPE,/*91*/
  1358		MTK_PULL_PU_PD_TYPE,/*92*/ MTK_PULL_PU_PD_TYPE,/*93*/
  1359		MTK_PULL_PU_PD_TYPE,/*94*/ MTK_PULL_PU_PD_TYPE,/*95*/
  1360		MTK_PULL_PU_PD_TYPE,/*96*/ MTK_PULL_PU_PD_TYPE,/*97*/
  1361		MTK_PULL_PU_PD_TYPE,/*98*/ MTK_PULL_PU_PD_TYPE,/*99*/
> 1362		MTK_PULL_PU_PD_TYPE,/*100* MTK_PULL_PU_PD_TYPE,/*101*/
  1363		MTK_PULL_PU_PD_TYPE,/*102* MTK_PULL_PU_PD_TYPE,/*103*/
  1364		MTK_PULL_PU_PD_TYPE,/*104* MTK_PULL_PU_PD_TYPE,/*105*/
  1365		MTK_PULL_PU_PD_TYPE,/*106* MTK_PULL_PU_PD_TYPE,/*107*/
  1366		MTK_PULL_PU_PD_TYPE,/*108* MTK_PULL_PU_PD_TYPE,/*109*/
  1367		MTK_PULL_PU_PD_TYPE,/*110* MTK_PULL_PU_PD_TYPE,/*111*/
  1368		MTK_PULL_PU_PD_TYPE,/*112* MTK_PULL_PU_PD_TYPE,/*113*/
  1369		MTK_PULL_PU_PD_TYPE,/*114* MTK_PULL_PU_PD_TYPE,/*115*/
  1370		MTK_PULL_PU_PD_TYPE,/*116* MTK_PULL_PU_PD_TYPE,/*117*/
  1371		MTK_PULL_PU_PD_RSEL_TYPE,/*118*/ MTK_PULL_PU_PD_RSEL_TYPE,/*119*/
  1372		MTK_PULL_PU_PD_RSEL_TYPE,/*120*/ MTK_PULL_PU_PD_RSEL_TYPE,/*121*/
  1373		MTK_PULL_PU_PD_RSEL_TYPE,/*122*/ MTK_PULL_PU_PD_RSEL_TYPE,/*123*/
  1374		MTK_PULL_PU_PD_RSEL_TYPE,/*124*/ MTK_PULL_PU_PD_RSEL_TYPE,/*125*/
  1375		MTK_PULL_PU_PD_TYPE,/*126*/ MTK_PULL_PU_PD_TYPE,/*127*/
  1376		MTK_PULL_PU_PD_TYPE,/*128*/ MTK_PULL_PU_PD_TYPE,/*129*/
  1377		MTK_PULL_PU_PD_TYPE,/*130*/ MTK_PULL_PU_PD_TYPE,/*131*/
  1378		MTK_PULL_PU_PD_TYPE,/*132*/ MTK_PULL_PU_PD_TYPE,/*133*/
  1379		MTK_PULL_PU_PD_TYPE,/*134*/ MTK_PULL_PU_PD_TYPE,/*135*/
  1380		MTK_PULL_PU_PD_TYPE,/*136*/ MTK_PULL_PU_PD_TYPE,/*137*/
  1381		MTK_PULL_PU_PD_TYPE,/*138*/ MTK_PULL_PU_PD_RSEL_TYPE,/*139*/
  1382		MTK_PULL_PU_PD_RSEL_TYPE,/*140*/ MTK_PULL_PU_PD_RSEL_TYPE,/*141*/
  1383		MTK_PULL_PU_PD_RSEL_TYPE,/*142*/ MTK_PULL_PU_PD_TYPE,/*143*/
  1384		MTK_PULL_PU_PD_TYPE,/*144*/ MTK_PULL_PU_PD_TYPE,/*145*/
  1385		MTK_PULL_PU_PD_TYPE,/*146*/ MTK_PULL_PU_PD_TYPE,/*147*/
  1386		MTK_PULL_PU_PD_TYPE,/*148*/ MTK_PULL_PU_PD_TYPE,/*149*/
  1387		MTK_PULL_PU_PD_TYPE,/*150*/ MTK_PULL_PU_PD_TYPE,/*151*/
  1388		MTK_PULL_PUPD_R1R0_TYPE,/*152*/ MTK_PULL_PUPD_R1R0_TYPE,/*153*/
  1389		MTK_PULL_PUPD_R1R0_TYPE,/*154*/ MTK_PULL_PUPD_R1R0_TYPE,/*155*/
  1390		MTK_PULL_PU_PD_TYPE,/*156*/ MTK_PULL_PU_PD_TYPE,/*157*/
  1391		MTK_PULL_PU_PD_TYPE,/*158*/ MTK_PULL_PU_PD_TYPE,/*159*/
  1392		MTK_PULL_PU_PD_RSEL_TYPE,/*160*/ MTK_PULL_PU_PD_RSEL_TYPE,/*161*/
  1393		MTK_PULL_PU_PD_TYPE,/*162*/ MTK_PULL_PU_PD_TYPE,/*163*/
  1394		MTK_PULL_PU_PD_TYPE,/*164*/ MTK_PULL_PU_PD_TYPE,/*165*/
  1395		MTK_PULL_PU_PD_TYPE,/*166*/ MTK_PULL_PU_PD_TYPE,/*167*/
  1396		MTK_PULL_PU_PD_TYPE,/*168*/ MTK_PULL_PU_PD_TYPE,/*169*/
  1397		MTK_PULL_PU_PD_TYPE,/*170*/ MTK_PULL_PU_PD_TYPE,/*171*/
  1398		MTK_PULL_PU_PD_TYPE,/*172*/ MTK_PULL_PU_PD_TYPE,/*173*/
  1399		MTK_PULL_PU_PD_TYPE,/*174*/ MTK_PULL_PU_PD_TYPE,/*175*/
  1400		MTK_PULL_PU_PD_TYPE,/*176*/ MTK_PULL_PU_PD_TYPE,/*177*/
  1401		MTK_PULL_PU_PD_TYPE,/*178*/ MTK_PULL_PU_PD_TYPE,/*179*/
  1402		MTK_PULL_PU_PD_TYPE,/*180*/ MTK_PULL_PU_PD_TYPE,/*181*/
  1403		MTK_PULL_PU_PD_TYPE,/*182*/ MTK_PULL_PUPD_R1R0_TYPE,/*183*/
  1404		MTK_PULL_PUPD_R1R0_TYPE,/*184*/ MTK_PULL_PUPD_R1R0_TYPE,/*185*/
  1405		MTK_PULL_PUPD_R1R0_TYPE,/*186*/ MTK_PULL_PUPD_R1R0_TYPE,/*187*/
  1406		MTK_PULL_PUPD_R1R0_TYPE,/*188*/ MTK_PULL_PUPD_R1R0_TYPE,/*189*/
  1407		MTK_PULL_PUPD_R1R0_TYPE,/*190*/ MTK_PULL_PUPD_R1R0_TYPE,/*191*/
  1408		MTK_PULL_PUPD_R1R0_TYPE,/*192*/ MTK_PULL_PUPD_R1R0_TYPE,/*193*/
  1409		MTK_PULL_PUPD_R1R0_TYPE,/*194*/ MTK_PULL_PU_PD_TYPE,/*195*/
  1410		MTK_PULL_PU_PD_TYPE,/*196*/ MTK_PULL_PU_PD_TYPE,/*197*/
  1411		MTK_PULL_PU_PD_TYPE,/*198*/ MTK_PULL_PU_PD_TYPE,/*199*/
  1412		MTK_PULL_PU_PD_RSEL_TYPE,/*200*/ MTK_PULL_PU_PD_RSEL_TYPE,/*201*/
  1413		MTK_PULL_PU_PD_RSEL_TYPE,/*202*/ MTK_PULL_PU_PD_RSEL_TYPE,/*203*/
  1414		MTK_PULL_PU_PD_RSEL_TYPE,/*204*/ MTK_PULL_PU_PD_RSEL_TYPE,/*205*/
  1415		MTK_PULL_PU_PD_TYPE,/*206*/ MTK_PULL_PU_PD_TYPE,/*207*/
  1416		MTK_PULL_PU_PD_TYPE,/*208*/ MTK_PULL_PU_PD_TYPE,/*209*/
  1417		MTK_PULL_PU_PD_TYPE,/*210*/ MTK_PULL_PU_PD_TYPE,/*211*/
  1418		MTK_PULL_PU_PD_TYPE,/*212*/ MTK_PULL_PU_PD_TYPE,/*213*/
  1419		MTK_PULL_PU_PD_TYPE,/*214*/ MTK_PULL_PU_PD_TYPE,/*215*/
  1420		MTK_PULL_PU_PD_TYPE,/*216*/ MTK_PULL_PU_PD_TYPE,/*217*/
  1421		MTK_PULL_PU_PD_TYPE,/*218*/ MTK_PULL_PU_PD_TYPE,/*219*/
  1422	};
  1423	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
