Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECD6266DC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 17:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbfEVP3l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 11:29:41 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:56828 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729583AbfEVP3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 May 2019 11:29:41 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4MFS0QP013371;
        Wed, 22 May 2019 17:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=af5swlhbaK9EFB2Ce0GcSHjdnw9kOF0tq2rYW3RXNLc=;
 b=C0x6m+kW21kL/j3aH0KfBVEmmxXa3xcTqGOG7ilBvScnzb3g4JZXqkiTNOqUc04n7wzz
 dDfqm2ZRomEm+5PXw6T+WJnVw7vDxpqegPk4AFmJob3h7tMEUKJeoSMHMKE0jitdrYqh
 KhwMmmt8S1qLTrNXrCGF3zp1fPN6cmip2722PiTFuqVRefGidItaFVYNmu/4I51FiSHq
 k+T7LUIyOTvPqMWQNk+F0fEyyJmH7gqPy4k6FlIvX5uMYRpAfcBAn6MgUiCFrYYbIHg6
 SB8mLJCfKhLCchjamgAH2dFcOXFt5yzxGS+Qvbb2sNQNe+8bRK6c0TPbl24xRJ17wEl/ Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sj8xgh9jm-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 22 May 2019 17:29:29 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0DCE3D;
        Wed, 22 May 2019 15:29:28 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB7642CD5;
        Wed, 22 May 2019 15:29:28 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 17:29:28 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 17:29:28
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <linus.walleij@linaro.org>, <alexandre.torgue@st.com>,
        <amelie.delaunay@st.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <benjamin.gaignard@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 0/2] Allow pinctrl framework to create links
Date:   Wed, 22 May 2019 17:29:23 +0200
Message-ID: <20190522152925.12419-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-22_08:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some pin controllers may need to ensure suspend/resume calls ordering between
themselves and their clients.
That is the case for STMFX (an I2C GPIO expender) which need to be suspended
after all it clients to let them call pinctrl_pm_select_sleep_state() before
perform it own suspend function. It is the same problem for resume but in
reverse order.

This series allow to let pinctrl core knows if a controller would like to
create link between itself and it client by setting create_link to true.

Benjamin Gaignard (2):
  pinctrl: Allow to create link between controller and consumer
  pinctrl: stmfx: enable links creations

 drivers/pinctrl/core.c          | 11 +++++++++++
 drivers/pinctrl/pinctrl-stmfx.c |  1 +
 include/linux/pinctrl/pinctrl.h |  2 ++
 3 files changed, 14 insertions(+)

-- 
2.15.0

