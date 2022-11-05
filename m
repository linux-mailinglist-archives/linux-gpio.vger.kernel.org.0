Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E41661D9C3
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Nov 2022 12:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiKELyB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Nov 2022 07:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKELyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Nov 2022 07:54:00 -0400
X-Greylist: delayed 1819 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 05 Nov 2022 04:53:59 PDT
Received: from pott.psjt.org (pott.psjt.org [46.38.234.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353DF2AE13
        for <linux-gpio@vger.kernel.org>; Sat,  5 Nov 2022 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=psjt.org;
        s=psjt01; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
        Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=mpDcZc01pZViMYSVMkHvzduLdn1V2GWusqkCdYjkBbo=; b=Af5bUYSRjl9dUlJ77/pupcerL2
        z0NkB3MMpjy5+JViE9sZKMROmaLna2i1uuNtNMnsZJ1yaok2CCgrHBOgWwxAajKPsjYuZp1yBnYUq
        Ww93pt9ssenpingMlhQUjiFAFNpDlCQVGFKpSU1yaDv75Fx/QajFQIz0IPI5jo2N8fhGs3KLkitk9
        mdG9B1e+j9p4TV/hmRCXnPwbjY/VYWkmPCs1KHHX0//qk6kEHJvdUKcunEN2/Yu4v69g2662iapdx
        R7Q9hzKdN48bUUAXNbZNSMgDQxwf0EU9Uk70fVyMNG0ymLpGPUZMgmQKezXSNllNoabQaVmendtJg
        TI2gdvgg==;
Received: from [10.1.1.3] (helo=malachite.psjt.org)
        by pott.psjt.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <stephan@psjt.org>)
        id 1orHGz-0004jD-2t
        for linux-gpio@vger.kernel.org;
        Sat, 05 Nov 2022 12:23:37 +0100
Received: from blaulicht.dmz.brux ([10.1.1.10])
        by malachite.psjt.org with esmtp (Exim 4.96)
        (envelope-from <stephan@psjt.org>)
        id 1orHGz-0005LQ-1l;
        Sat, 05 Nov 2022 12:23:37 +0100
Received: from stephan by blaulicht.dmz.brux with local (Exim 4.96)
        (envelope-from <stephan@psjt.org>)
        id 1orHGz-0001SM-1h;
        Sat, 05 Nov 2022 12:23:37 +0100
From:   =?utf-8?Q?Stephan_B=C3=B6ttcher?= <linux@psjt.org>
To:     linux-gpio@vger.kernel.org
Subject: Question: switching alternate pin functions in bcm2835
Date:   Sat, 05 Nov 2022 12:23:37 +0100
Message-ID: <s6n8rkpably.fsf@psjt.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Moin,

is it appropriate to ask user questions here?=20

On a Raspberry Pi 2B, I connected the UART pins among others to an
ATtiny =C2=B5C to use avrdude in linuxgpio bit-banging mode to flash the
program, and then use the same pins to talk to the ATtiny via
/dev/ttyAMA0.  After a reboot I can use the serial port.  After using
gpio on those pins, the serial link does not receive anything.  There
are not errors opening, writing, or reading /dev/ttyAMA0.  Just no
answer.

Is there a way (sysfs, ioclt, =E2=80=A6) to reconnect the pins to the UART
without a reboot?

Thanks!

Gru=C3=9F,
--=20
Stephan
