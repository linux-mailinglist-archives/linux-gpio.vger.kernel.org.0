Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B90751D49
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jul 2023 11:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbjGMJdZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jul 2023 05:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbjGMJdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2023 05:33:10 -0400
X-Greylist: delayed 541 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 13 Jul 2023 02:33:09 PDT
Received: from mail.schrack-seconet.com (mail.schrack-seconet.com [81.223.165.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A4D1FC7
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 02:33:09 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.schrack-seconet.com (Postfix) with ESMTP id 91E3A2151D2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 11:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=schrack-seconet.com;
        s=mail; t=1689240246;
        bh=NLZQeCM3jb1sNYRunVGiuqh9uzpTAGK7F9bkIIjjUYg=;
        h=From:To:CC:Subject:Date;
        b=wXZOiDvQ1EriiET9R0GpfKBFr6sH6o2wHcGkAnsmgI7GcqZs86I+UFiZwjuSOpCx5
         zABVjLhxqCc3DqYujJSPH0SpXHE7rbqmH7d+5P9M0PbgLa0KYt3J9g9f4lg8izxclB
         GE0W/r6Y8ikQDSeqd+zbN/skQQpHjlfMxaGNdpDk=
X-Virus-Scanned: Debian amavisd-new at schrack-seconet.com
Received: from mail.schrack-seconet.com ([127.0.0.1])
        by localhost (mail.schrack-seconet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id l9tAm-_-eKiT for <linux-gpio@vger.kernel.org>;
        Thu, 13 Jul 2023 11:24:04 +0200 (CEST)
Received: from outlook.schrack-seconet.com (unknown [10.20.201.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.schrack-seconet.com (Postfix) with ESMTPS id EE0E82151C3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 11:24:03 +0200 (CEST)
Received: from EXCH-W1.schrack-seconet.works (10.20.201.33) by
 EXCH-W1.schrack-seconet.works (10.20.201.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jul 2023 11:24:03 +0200
Received: from EXCH-W1.schrack-seconet.works ([10.20.201.33]) by
 EXCH-W1.schrack-seconet.works ([10.20.201.33]) with mapi id 15.02.1118.026;
 Thu, 13 Jul 2023 11:24:03 +0200
From:   "Hollerer Franz, Schrack Seconet AG, Entwicklung" 
        <f.hollerer@schrack-seconet.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     "Hollerer Franz, Schrack Seconet AG, Entwicklung" 
        <f.hollerer@schrack-seconet.com>,
        "Ullrich Lucas, Schrack Seconet AG, Entwicklung" 
        <l.ullrich@schrack-seconet.com>
Subject: [libgpiod]: non-exclusive use of input lines
Thread-Topic: [libgpiod]: non-exclusive use of input lines
Thread-Index: AQHZtWuEh9n9Kes53kSKdCJUa+2C9w==
Date:   Thu, 13 Jul 2023 09:24:03 +0000
Message-ID: <1337f994e3ad45f49dc86787bcb3a019@schrack-seconet.com>
Accept-Language: de-AT, en-GB, en-US
Content-Language: de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.20.202.1]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


I have several processes (one of them is a shell scripts, others are C/C++ =
programs) which need to read the same input line. Is it somehow possible to=
 request input lines for non-exclusive use? If not, is this a feature which=
 will be added sometime in the future?

Thanks

Franz Hollerer=
