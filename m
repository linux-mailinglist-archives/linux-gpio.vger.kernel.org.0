Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168767020BD
	for <lists+linux-gpio@lfdr.de>; Mon, 15 May 2023 02:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjEOAUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 May 2023 20:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236077AbjEOAUK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 May 2023 20:20:10 -0400
X-Greylist: delayed 555 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 14 May 2023 17:20:07 PDT
Received: from mail-out02.belwue.de (mail-out02.belwue.de [129.143.76.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B67F10EA
        for <linux-gpio@vger.kernel.org>; Sun, 14 May 2023 17:20:06 -0700 (PDT)
Received: from mail-hub01.belwue.de (mail-hub01.belwue.de [129.143.76.41])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by mail-out02.belwue.de (Postfix) with ESMTPS id 4QKKX92vJMz9yW2l;
        Mon, 15 May 2023 02:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dhbw-ravensburg.de;
        s=DKIM001; t=1684109449; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:cc:mime-version:mime-version:
         content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
        bh=RNaOgrSy70wp7WTLmZJTA9WP9+nLRpFE39oHhVNwQlE=;
        b=OFksk8iBFC27h/Pw4HO4xwt4yR11JTJ0nec4gLEFkqk98RFbZGIPY27d+aQ8tHhcvu6r9x
        Wiwx39ip/2zgh01BnE3FjoMXWJmnWb63W4T82CzyJRAo1wNsrvRHPaSIJAOACg9ZEZwBMh
        GwMnTwgIjQzlbi/Hp2YyZNFBnc8EuT+ZMsrfoXV4tIPoBIPIQkjTGkdUjGyHH+1uVQlbBK
        WywtfTyyJ7kMQpHyVPqLndulcmsbm86glFRYxl3V2XD+jTmf/8yrXNRKF5Yn7CnXqwFbi3
        v0E/y6hm1VVBnAWG0WDqejgkxRrWtNXEdbTc+MJkAxTm7f1j/7mH8/EOQbqSHA==
Received: from exhubcas01.dhbw-ravensburg.de (unknown [141.68.130.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by mail-hub01.belwue.de (Postfix) with ESMTPS id 4QKKVq54W0z52B67;
        Mon, 15 May 2023 02:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dhbw-ravensburg.de;
        s=DKIM001; t=1684109449; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:cc:mime-version:mime-version:
         content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
        bh=RNaOgrSy70wp7WTLmZJTA9WP9+nLRpFE39oHhVNwQlE=;
        b=OFksk8iBFC27h/Pw4HO4xwt4yR11JTJ0nec4gLEFkqk98RFbZGIPY27d+aQ8tHhcvu6r9x
        Wiwx39ip/2zgh01BnE3FjoMXWJmnWb63W4T82CzyJRAo1wNsrvRHPaSIJAOACg9ZEZwBMh
        GwMnTwgIjQzlbi/Hp2YyZNFBnc8EuT+ZMsrfoXV4tIPoBIPIQkjTGkdUjGyHH+1uVQlbBK
        WywtfTyyJ7kMQpHyVPqLndulcmsbm86glFRYxl3V2XD+jTmf/8yrXNRKF5Yn7CnXqwFbi3
        v0E/y6hm1VVBnAWG0WDqejgkxRrWtNXEdbTc+MJkAxTm7f1j/7mH8/EOQbqSHA==
Received: from EXMAIL02.msx-dhbw-rv.intra ([141.68.130.22]) by exhubcas01
 ([141.68.130.11]) with mapi id 14.03.0513.000; Mon, 15 May 2023 01:58:50
 +0200
From:   "Bergmann, Michaela - DHBW-Ravensburg" <bergmann@dhbw-ravensburg.de>
Subject: Aw: Das META-Unternehmen Zuschuss 
Thread-Topic: Aw: Das META-Unternehmen Zuschuss 
Thread-Index: AdmGv8PQj5pSwbbXQbCGUnnW8YF04QAAAC9QAAAALgAAAAAcYAAAAB2AAAAAIxAAAAAa0AAAAByg
Date:   Sun, 14 May 2023 23:58:50 +0000
Message-ID: <9B98CDA3A8E98B478103857425C9C0FD042A441735@exmail02>
Reply-To: "contact@mtagroup.info" <contact@mtagroup.info>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.68.120.240]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Rspamd-UID: c7a58a
X-Rspamd-Queue-Id: 4QKKX92vJMz9yW2l
X-Rspamd-UID: 720a23
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,LOTS_OF_MONEY,
        MISSING_HEADERS,MONEY_FORM,RCVD_IN_DNSWL_MED,REPLYTO_WITHOUT_TO_CC,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_LOAN,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


META Unternehmen
Facebook, Instagram und WhatsApp
1601 WILLOW ROAD MENLO PARK, CA 94025
www. facebook. com

Dem Unternehmen META geh=F6ren neben anderen Produkten und Dienstleistungen=
 auch Facebook, Instagram und WhatsApp. Meta ist eines der wertvollsten Unt=
ernehmen der Welt.

META (die Muttergesellschaft von Facebook, Instagram und WhatsApp) vergibt =
einen Zuschuss in H=F6he von $920.000,00USD an 10 gl=FCckliche Kunden aus a=
llen L=E4ndern der Welt. Wir gratulieren Ihnen, dass Sie einer der zehn Gl=
=FCcklichen sind, die diesen Zuschuss von $920.000,00USD erhalten.

Kontaktieren Sie uns per E-Mail: contact@mtagroup.info mit den folgenden In=
formationen, um Ihren Zuschuss zu bearbeiten.
=A0
Vollst=E4ndige Namen .............
Telefonnummer ........
Adresse .............
Land ................
Geschlecht .................
Alter ....................
Beruf .............
=A0
Die Firma META sch=E4tzt Ihr Recht auf Privatsph=E4re! Ihre Daten sind zu 1=
00 % sicher und werden ausschlie=DFlich f=FCr den Zweck dieses Zuschusses v=
erwendet.

Es gelten die allgemeinen Gesch=E4ftsbedingungen.



B=FCro des Pr=E4sidenten von
Facebook-CEO
Herr Mark Zuckerberg
