Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 604EE130244
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2020 13:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgADMDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Jan 2020 07:03:09 -0500
Received: from mga01.intel.com ([192.55.52.88]:39773 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgADMDJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 4 Jan 2020 07:03:09 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jan 2020 04:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,394,1571727600"; 
   d="scan'208";a="245137670"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2020 04:03:06 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ini93-0009yX-NR; Sat, 04 Jan 2020 20:03:05 +0800
Date:   Sat, 4 Jan 2020 20:02:28 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     kbuild-all@lists.01.org, sricharan@codeaurora.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: [RFC PATCH] clk: qcom: lpass_core_axim_clk_src can be static
Message-ID: <20200104120228.brohuapo4d632jcq@f53c9c00458a>
References: <1578050744-3761-3-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578050744-3761-3-git-send-email-sricharan@codeaurora.org>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Fixes: ac86608aeb82 ("clk: qcom: Add ipq6018 Global Clock Controller support")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 gcc-ipq6018.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index a3597f46ad017..3f9c2f61a5d93 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -2620,7 +2620,7 @@ static const struct freq_tbl ftbl_lpass_core_axim_clk_src[] = {
 	{ }
 };
 
-struct clk_rcg2 lpass_core_axim_clk_src = {
+static struct clk_rcg2 lpass_core_axim_clk_src = {
 	.cmd_rcgr = 0x1F020,
 	.freq_tbl = ftbl_lpass_core_axim_clk_src,
 	.hid_width = 5,
@@ -2639,7 +2639,7 @@ static const struct freq_tbl ftbl_lpass_snoc_cfg_clk_src[] = {
 	{ }
 };
 
-struct clk_rcg2 lpass_snoc_cfg_clk_src = {
+static struct clk_rcg2 lpass_snoc_cfg_clk_src = {
 	.cmd_rcgr = 0x1F040,
 	.freq_tbl = ftbl_lpass_snoc_cfg_clk_src,
 	.hid_width = 5,
@@ -2658,7 +2658,7 @@ static const struct freq_tbl ftbl_lpass_q6_axim_clk_src[] = {
 	{ }
 };
 
-struct clk_rcg2 lpass_q6_axim_clk_src = {
+static struct clk_rcg2 lpass_q6_axim_clk_src = {
 	.cmd_rcgr = 0x1F008,
 	.freq_tbl = ftbl_lpass_q6_axim_clk_src,
 	.hid_width = 5,
@@ -2671,13 +2671,13 @@ struct clk_rcg2 lpass_q6_axim_clk_src = {
 	},
 };
 
-struct freq_tbl ftbl_rbcpr_wcss_clk_src[] = {
+static struct freq_tbl ftbl_rbcpr_wcss_clk_src[] = {
 	F(24000000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
 	{ }
 };
 
-struct clk_rcg2 rbcpr_wcss_clk_src = {
+static struct clk_rcg2 rbcpr_wcss_clk_src = {
 	.cmd_rcgr = 0x3a00c,
 	.freq_tbl = ftbl_rbcpr_wcss_clk_src,
 	.hid_width = 5,
