Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C833130247
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2020 13:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgADMDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Jan 2020 07:03:09 -0500
Received: from mga18.intel.com ([134.134.136.126]:19358 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgADMDJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 4 Jan 2020 07:03:09 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jan 2020 04:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,394,1571727600"; 
   d="scan'208";a="214717996"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jan 2020 04:03:05 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ini93-0009qt-B6; Sat, 04 Jan 2020 20:03:05 +0800
Date:   Sat, 4 Jan 2020 20:02:16 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     kbuild-all@lists.01.org, sricharan@codeaurora.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH 2/2] clk: qcom: Add ipq6018 Global Clock Controller
 support
Message-ID: <202001041937.BBQYk2aO%lkp@intel.com>
References: <1578050744-3761-3-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578050744-3761-3-git-send-email-sricharan@codeaurora.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sricharan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.5-rc4 next-20191220]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sricharan-R/Add-Global-clock-controller-support-for-IPQ6018/20200104-133041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-129-g341daf20-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/qcom/gcc-ipq6018.c:2623:17: sparse: sparse: symbol 'lpass_core_axim_clk_src' was not declared. Should it be static?
>> drivers/clk/qcom/gcc-ipq6018.c:2642:17: sparse: sparse: symbol 'lpass_snoc_cfg_clk_src' was not declared. Should it be static?
>> drivers/clk/qcom/gcc-ipq6018.c:2661:17: sparse: sparse: symbol 'lpass_q6_axim_clk_src' was not declared. Should it be static?
>> drivers/clk/qcom/gcc-ipq6018.c:2674:17: sparse: sparse: symbol 'ftbl_rbcpr_wcss_clk_src' was not declared. Should it be static?
>> drivers/clk/qcom/gcc-ipq6018.c:2680:17: sparse: sparse: symbol 'rbcpr_wcss_clk_src' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
