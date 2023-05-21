Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31CF470BCF2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 14:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjEVMIf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 08:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEVMIe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 08:08:34 -0400
X-Greylist: delayed 85577 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 May 2023 05:08:18 PDT
Received: from silec.com.co (unknown [186.155.227.156])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B23118;
        Mon, 22 May 2023 05:08:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by silec.com.co (Postfix) with ESMTP id DF8C574E6C3A;
        Sun, 21 May 2023 02:13:35 -0500 (-05)
Received: from silec.com.co ([127.0.0.1])
        by localhost (silec.com.co [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id rla3vMJ0SKUq; Sun, 21 May 2023 02:13:35 -0500 (-05)
Received: from localhost (localhost [127.0.0.1])
        by silec.com.co (Postfix) with ESMTP id 39CE074E6DA7;
        Sun, 21 May 2023 02:13:31 -0500 (-05)
DKIM-Filter: OpenDKIM Filter v2.10.3 silec.com.co 39CE074E6DA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silec.com.co;
        s=7EE18876-0B6B-11EC-ADD2-D54151E56927; t=1684653211;
        bh=3DuXWiZC+hCKu7q7bKqvoS3B3zt+zYJYDMke5QOTtAg=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=CdbUekq7fxLCbW3D7YoWb6x/tYmHEfC98XpifB0QaSKoM3ckvp8DbgPl1rtLAcNoW
         2iDxDJockdXIwS4ohhYECmImoP3D3djyJM5N4cnLhhw6sM0bf5z04nmQuGo79jRpTq
         vQk4aMRgEzacjOoTparzMeyg+TMIrRoLJQJ5Jy4M1NfQCEsLteCyTYWPkrvhOueewj
         5BorRYQymcbM6mK6piv8bG4PDNd/hq+pLVRxVTIG9Sk5x/JaPfgioTZM2Ik6AAiut6
         I3BK60jxi/8h3fJ2zDnkj86y4aSbcp+FT2SHNby6SC10pecYq82sZhTtma7obKCyyD
         l4cwh4XUGDpUA==
X-Virus-Scanned: amavisd-new at silec.com.co
Received: from silec.com.co ([127.0.0.1])
        by localhost (silec.com.co [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id jty3PH0Lqxj7; Sun, 21 May 2023 02:13:31 -0500 (-05)
Received: from [10.4.18.247] (unknown [217.138.192.221])
        by silec.com.co (Postfix) with ESMTPSA id 131F574E6C65;
        Sun, 21 May 2023 02:13:08 -0500 (-05)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE
To:     Recipients <manuel.trivino@silec.com.co>
From:   "Yuliia Kadulina" <manuel.trivino@silec.com.co>
Date:   Sun, 21 May 2023 08:12:36 +0100
Reply-To: yuliakadulina2@gmail.com
Message-Id: <20230521071309.131F574E6C65@silec.com.co>
X-Spam-Status: Yes, score=6.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5745]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [217.138.192.221 listed in zen.spamhaus.org]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [yuliakadulina2[at]gmail.com]
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [186.155.227.156 listed in wl.mailspike.net]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Top of the day to you, =


I'm Yuliia Kadulina Deputy Chairman of the Management Board, and Personal F=
inance Director @ Ukrsibbank Ukraine. I have a proposal for you. Kindly rev=
ert so I can fill you in on the details.

Thanks,
Yuliia
