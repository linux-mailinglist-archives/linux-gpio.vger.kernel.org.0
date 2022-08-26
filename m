Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C92B5A2B01
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 17:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbiHZPUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 11:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344527AbiHZPTx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 11:19:53 -0400
X-Greylist: delayed 517 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 Aug 2022 08:13:37 PDT
Received: from srvmx2.cyfronet.pl (srvmx2.cyfronet.pl [149.156.2.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D22E3983
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 08:13:37 -0700 (PDT)
Received: from srvmx2.cyfronet.pl (localhost [127.0.0.1])
        by srvmx2.cyfronet.pl (Postfix) with ESMTP id 933EE18030017
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 17:04:58 +0200 (CEST)
X-Virus-Scanner: This message was checked by ESET Mail Security
        for Linux/BSD. For more information on ESET Mail Security,
        please, visit our website: http://www.eset.com/.
Received: by srvmx2.cyfronet.pl (Postfix, from userid 99)
        id 923E718030019; Fri, 26 Aug 2022 17:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
Received: from kinga.cyf-kr.edu.pl (kinga.cyf-kr.edu.pl [149.156.2.32])
        by srvmx2.cyfronet.pl (Postfix) with ESMTP id 6E05918030017
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 17:04:58 +0200 (CEST)
Received: from AdamZ (gw-ur.cyf-kr.edu.pl [149.156.6.26])
        by kinga.cyf-kr.edu.pl (Postfix) with ESMTPSA id 5E0B64106E
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 17:04:58 +0200 (CEST)
From:   "Adam Tofilski" <rotofils@cyf-kr.edu.pl>
To:     <linux-gpio@vger.kernel.org>
Subject: libgpiod - bufor problem
Date:   Fri, 26 Aug 2022 17:04:58 +0200
Message-ID: <001901d8b95d$359a2060$a0ce6120$@edu.pl>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Adi5XTVsOOktbCYIS8yCFCIwWOsXGg==
Content-Language: pl
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Bartosz
First of all thank you for gpiomon software.

I try to use if for data acquisition from an optical sensor. It works fine
from command line but when I try to run it as QProcess in QT (GUI) there is
a problem with buffering. The output is transferred occasionally in large
pieces. What I need is to get output immediately after each line. I plan to
distribute my software as open source.

As I understand this problem can be solved by adding to your code 
setbuf(stdout, NULL);
or 
fflush(stdout) 
after each line.

I hope you will be able to help me with this.
Best wishes
Adam

Adam Tofilski
Department of Zoology and Animal Welfare
Agricultural University
29 Listopada 56
31-425 Krakow
Poland
rotofils@cyf-kr.edu.pl
tel: +48 12 6625069


