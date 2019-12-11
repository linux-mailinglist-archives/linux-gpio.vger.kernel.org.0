Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8503111B8E9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 17:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730570AbfLKQf0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 11:35:26 -0500
Received: from pbmsgap02.intersil.com ([192.157.179.202]:60818 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730107AbfLKQf0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 11:35:26 -0500
X-Greylist: delayed 1686 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Dec 2019 11:35:26 EST
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id xBBG2sOW011995;
        Wed, 11 Dec 2019 11:07:11 -0500
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap02.intersil.com with ESMTP id 2wr74gk1j6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 11 Dec 2019 11:07:11 -0500
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Wed, 11 Dec 2019 11:07:10 -0500
Received: from localhost.localdomain (132.158.202.109) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Wed, 11 Dec 2019 11:07:09 -0500
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH] pinctrl: rza1: reduce printed messages
Date:   Wed, 11 Dec 2019 11:06:38 -0500
Message-ID: <20191211160638.31853-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-12-11_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911200000 definitions=main-1912110135
X-Proofpoint-Spam-Reason: mlx
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since this message is printed for each port, it creates a lot of output
during boot and would serve better only during debugging.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 017fc6b3e27e..86e5bf59bde5 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1235,7 +1235,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
 
 	pinctrl_add_gpio_range(rza1_pctl->pctl, range);
 
-	dev_info(rza1_pctl->dev, "Parsed gpiochip %s with %d pins\n",
+	dev_dbg(rza1_pctl->dev, "Parsed gpiochip %s with %d pins\n",
 		 chip->label, chip->ngpio);
 
 	return 0;
-- 
2.23.0

