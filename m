Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 562D8C9552
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 02:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729237AbfJCADQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 20:03:16 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55778 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbfJCADP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 20:03:15 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 74CBE891AA;
        Thu,  3 Oct 2019 13:03:13 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1570060993;
        bh=duga9/EcB9ODsepVPk+Bsd/e1jD6BQ1JTdG2Xp6Vhgs=;
        h=From:To:Cc:Subject:Date;
        b=Ln3yz2pkIrGyGvOK3h2DunrTNzXsdqldTqPuBEwweioGCxbbI/kouzm6cpPOw3fqM
         CSaDrKYDB4EZY9nLDGSmMC2qG/gHz01URAl2TL4kRGd6AfN5Py4VHrluv0wFeFLP59
         BB8/WfWjp0AztmhDCt7CUGHHe+qF+fRfl6oArbynpgZHPFyQ7hHFTd5hq4iM1qTavp
         M1FIkaBfe//iEGzoxyh7kHZknqZKLwVpVKAbQq3WGzejOclbY/zTcxb6V4BxwPeDr4
         qK2l09a1zZDqEBDfh95fAdZD0zM3LUn5i1DI9hILQGlS3/Xvf3LC1DM/AnaVdOIgy+
         riITwvBPZuy1w==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d953ac10001>; Thu, 03 Oct 2019 13:03:13 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 0CDBA13EEC9;
        Thu,  3 Oct 2019 13:03:17 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 331FE28003E; Thu,  3 Oct 2019 13:03:13 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] pinctrl: iproc: improve error handling
Date:   Thu,  3 Oct 2019 13:03:08 +1300
Message-Id: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I noticed these when debugging another issue. The first patch is a fix
to address some error handling. The second is just cosmetic.

Changes in v2:
- split bug-fix from cosmetic change

Chris Packham (2):
  pinctrl: iproc: allow for error from platform_get_irq()
  pinctrl: iproc: use unique name for irq chip

 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--=20
2.23.0

