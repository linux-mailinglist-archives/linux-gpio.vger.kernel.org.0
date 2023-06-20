Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815CF7365B0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 10:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbjFTIGO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 04:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbjFTIGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 04:06:02 -0400
Received: from mail.mahavavy.com (mail.mahavavy.com [92.222.170.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9B3128
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 01:06:00 -0700 (PDT)
Received: by mail.mahavavy.com (Postfix, from userid 1002)
        id 1695423262; Tue, 20 Jun 2023 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mahavavy.com; s=mail;
        t=1687248358; bh=IfqQW79nVX/qUpmHcJiWDpV9BQnOf/s+Zcq9ON74QJY=;
        h=Date:From:To:Subject:From;
        b=Pp5ChBe649lYOfK69dDYEt7+pO0yVDcmlQSrJMruKtsO9mbtTfBJZC9kyczlH2658
         iCqPunjhJm2gTIRkg8Zg6gL/D29b56X11xyqKblfe8b+0WUGUYUQoA0CL+dHr004/7
         HD4IyVTUbvtcy+aBjQa45/QWs7txHfJEq//RrxDU82PUQqZLsygpnO+Tgiccyjj6sG
         WygaQx5eyOL0Hwwlka4V06strq3QR1DjoAg5HKNv9A0TJbV5C4dmNfQcbTzPsUufh2
         eeR8V/OK2Bod9PwAmFEmdQkWpNRP0aqtcHmiFC2ckaE1vpaClWXO8rQ15j9MLdH8En
         A2baGxYRJqlVA==
Received: by mail.mahavavy.com for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 08:05:53 GMT
Message-ID: <20230620064500-0.1.38.6zmo.0.ochy134d22@mahavavy.com>
Date:   Tue, 20 Jun 2023 08:05:53 GMT
From:   =?UTF-8?Q? "Kristi=C3=A1n_Plet=C3=A1nek" ?= 
        <kristian.pletanek@mahavavy.com>
To:     <linux-gpio@vger.kernel.org>
Subject: =?UTF-8?Q?Tlakov=C4=9B_lit=C3=BD?=
X-Mailer: mail.mahavavy.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIXED_ES,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dobr=C3=A9 r=C3=A1no,

zaji=C5=A1=C5=A5ujeme technologii tlakov=C3=A9ho lit=C3=AD hlin=C3=ADku.

M=C3=A1me v=C3=BDrobn=C3=AD z=C3=A1vody v Polsku, =C5=A0v=C3=A9dsku a =C4=
=8C=C3=ADn=C4=9B se schopnost=C3=AD flexibiln=C4=9B p=C5=99esouvat v=C3=BD=
robu mezi lokalitami.

Na=C5=A1e lic=C3=AD bu=C5=88ky jsou v=C4=9Bt=C5=A1inou automatick=C3=A9 n=
ebo poloautomatick=C3=A9, co=C5=BE umo=C5=BE=C5=88uje v=C3=BDrobu velk=C3=
=BDch v=C3=BDrobn=C3=ADch s=C3=A9ri=C3=AD s vysokou flexibilitou detail=C5=
=AF.
=20
Poskytujeme podporu v ka=C5=BEd=C3=A9 f=C3=A1zi v=C3=BDvoje projektu, vyv=
=C3=ADj=C3=ADme strukturu detailu.

Cht=C4=9Bli byste mluvit o spolupr=C3=A1ci v t=C3=A9to oblasti?

Pozdravy
Kristi=C3=A1n Plet=C3=A1nek
