Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456C011D90C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 23:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731226AbfLLWJo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 17:09:44 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:47609 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730779AbfLLWJo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 17:09:44 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 22897806B6;
        Fri, 13 Dec 2019 11:09:42 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576188582;
        bh=+GrjulGj8W3gsECBwATbZi+48pIVbe0VIJhJK0bHuQo=;
        h=From:To:Cc:Subject:Date;
        b=XHVTDYJzJrcV2AkpsdI44AqHF0qaBFkgasGDVcYAGOKfR4BXJap+uloTrglnYIPf3
         dDM/NoZR8MT2JNID49K+BkPBArU/MDC+LopMauX0hDcXAUJZAR6HqUEAwfYnAlEb4M
         cOcl3leqEFPK028/VlwsLGi5Wo8pbLH1eKC8RabqZwlhQLG6h/J3VfsUTloZ5PNlNm
         KX/JraNZgCTrZ2neWEvEV1/SFaHWYBe6Co6ydnXv+DAcQSVDztySN1PY0LPeo1ZU2c
         T9JH48yw8puJjvHYLcFQzptLPdwyp0u9egE2LD4cw6x0/cZoEZrjNdmMIkemu4QeVE
         oPtBgYBnRWH6g==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5df2baa10000>; Fri, 13 Dec 2019 11:09:42 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
        by smtp (Postfix) with ESMTP id 2237113EED2;
        Fri, 13 Dec 2019 11:09:37 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 63604540505; Fri, 13 Dec 2019 11:09:37 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 0/1] pinctrl: iproc: Fix level interrupt handling
Date:   Fri, 13 Dec 2019 11:09:22 +1300
Message-Id: <20191212220923.15089-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

An issue is seen on the BCM56060 SoC using the pinctrl-iproc-gpio.c drive=
r
for one of its GPIO blocks.
When a GPIO on this block is used as a level sensitive interrupt the
downstream handler is not invoked until the level returns to its previous
(non-interrupting) state. This makes the level sensitive interrupts
unusable. Edge sensitive interrupts are not affected.

The fix is to simply ensure that we use a more appropriate handler
(handle_level_irq) for the interrupt based on what trigger type has been
configured.
Similar setting of the handler is done in numerous other drivers.

Hamish Martin (1):
  pinctrl: iproc: Set irq handler based on trig type

 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

--=20
2.24.1

