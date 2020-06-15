Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3661F920A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 10:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgFOIpZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 04:45:25 -0400
Received: from gecko.sbs.de ([194.138.37.40]:45062 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729017AbgFOIpZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 04:45:25 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 05F8SO6j021448
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 10:28:24 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.53.252])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05F8SNgH021930;
        Mon, 15 Jun 2020 10:28:23 +0200
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] gpio: Add support for the PCAL9535
Date:   Mon, 15 Jun 2020 10:28:21 +0200
Message-Id: <cover.1592209703.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes in v2:
 - add dt binding update

Jan

Jan Kiszka (2):
  dt-bindings: gpio: pca953x: add nxp,pcal9535
  gpio: pca953x: Add support for the PCAL9535

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 drivers/gpio/gpio-pca953x.c                             | 1 +
 2 files changed, 2 insertions(+)

-- 
2.26.2

