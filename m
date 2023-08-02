Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950A176CF6D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 16:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234575AbjHBOGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 10:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233935AbjHBOGS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 10:06:18 -0400
Received: from mail.schrack-seconet.com (mail.schrack-seconet.com [81.223.165.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25D6F7
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 07:06:16 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.schrack-seconet.com (Postfix) with ESMTP id 1664B2103F2
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 16:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=schrack-seconet.com;
        s=mail; t=1690985175;
        bh=rCRkerDBg8EgX+gnqaiozy/7750cJUAMSUOwSHBlBGw=;
        h=From:To:CC:Subject:Date;
        b=BgtYoBIYXxa7xQ3frxSZFybqfN92FZbPPQM1kSJ8rZFFVelWsGq9AZcZ/+noLkB9C
         lKzbn5UhRn/5akTWY/26gjl+iQricICka7a/oxZ/ElnPqXW0mYORpYclNxECh9M3YP
         mUKRGG+zqK1Fp0xJ3DWOtF4b9PSijtzkHutyhhGo=
X-Virus-Scanned: Debian amavisd-new at schrack-seconet.com
Received: from mail.schrack-seconet.com ([127.0.0.1])
        by localhost (mail.schrack-seconet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 76JLsmDAHWw7 for <linux-gpio@vger.kernel.org>;
        Wed,  2 Aug 2023 16:06:08 +0200 (CEST)
Received: from outlook.schrack-seconet.com (unknown [10.20.201.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.schrack-seconet.com (Postfix) with ESMTPS id 6AC972103EC
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 16:06:08 +0200 (CEST)
Received: from EXCH-W1.schrack-seconet.works (10.20.201.33) by
 EXCH-W1.schrack-seconet.works (10.20.201.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.16; Wed, 2 Aug 2023 16:06:08 +0200
Received: from EXCH-W1.schrack-seconet.works ([10.20.201.33]) by
 EXCH-W1.schrack-seconet.works ([10.20.201.33]) with mapi id 15.02.1258.016;
 Wed, 2 Aug 2023 16:06:08 +0200
From:   "Hollerer Franz, Schrack Seconet AG, Entwicklung" 
        <f.hollerer@schrack-seconet.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     "Hollerer Franz, Schrack Seconet AG, Entwicklung" 
        <f.hollerer@schrack-seconet.com>,
        "Ullrich Lucas, Schrack Seconet AG, Entwicklung" 
        <l.ullrich@schrack-seconet.com>
Subject: [libgpiod]: feature request: API functions, const correctness
Thread-Topic: [libgpiod]: feature request: API functions, const correctness
Thread-Index: AdnFSksl/z46payhSI6AJ2k+kdDPzg==
Date:   Wed, 2 Aug 2023 14:06:08 +0000
Message-ID: <a6ce12acff7b4ed9bae1df0115bba1f3@schrack-seconet.com>
Accept-Language: de-AT, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.20.190.21]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear libgpiod-team,

I have a request, and it would be great if you could consider it for future=
 versions of libgpiod. Within the current API it is not obvious which funct=
ion parameters are input-only parameters, and which parameter are output pa=
rameters, i.e., will be modified.

I think it would be helpful if the API is const correct. As example, I thin=
k

> struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
> 						 unsigned int offset);

should be changed to

> struct gpiod_line_info *gpiod_chip_get_line_info(const struct gpiod_chip =
*chip,
> 						 unsigned int offset);

making it clear that the chip object is an input parameter which is not cha=
nged by the API function. Same argument applies for many other API function=
s...

Thanks for consideration & Best regards,

Franz Hollerer

