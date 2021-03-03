Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A5D32BB4A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbhCCMVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842962AbhCCKXF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 05:23:05 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E37C08ECB4
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 01:58:45 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id e6so15968315pgk.5
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cNGljFPZRpYFKEu48myr7eYFUT4vLWZX348426Ewac8=;
        b=UoZjQqYLx4j8UgN/r+LD97q+8Z7lsdZplWksSV8bDbyq7Ic76jnKcvTZFZjf1gFqwc
         9S6XIYB4572hvctqTlXLsD8eGKoKndyT3jjtwGUPnHMCo3Tl9vKGu1bPnbPBEA3dgLZq
         G2dNpbakM//RHMxNCqN30UR3a1HBHKGloHcyB5dIiHsLyg22cUz7MYERo/4lx2LdlOaz
         r7/cZjghaU0BLy5hCbKuNijjdFL6L45jvhkTE8puo9ZEIt2X7ezWT6UeKmJGGYqbcxwE
         ilPCaAgVQ3ZWsEyA7UzRjcb2v6VAaCt70S3Wk+duVIQyI7LMYhwl5uk7bXGJVun4dBCG
         GtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=cNGljFPZRpYFKEu48myr7eYFUT4vLWZX348426Ewac8=;
        b=kd/cDH+1MoTJD+sSaqnAkIA4YFGRqVxZ5+CYiR7PDo33XhfeY0AAxQVZM+R0Kr6pAn
         dNU6C6QixYEGT+wmk0yivN3fTAfi2eHBYF2cHGcqrwIjk/GJDmqnX8UxNtnWh+P8Vfvp
         jT0IL399zy6OooZ/8xhfSBWnLuyDOLhmcNw/p2wA6MYhTuptWdpxMwvMnqweHUTI7WNQ
         uhoqMD97wQziMxQZUHFyvq9a40Vdd+jEJuv+5ARIDV63bMDZTIj+w7Yqab4iSfcC7LDk
         J1On3Q8U8EwOJnvKbbG6k4/+pOI3i99yqGyUbszK+ysSs0n/mZbw84IAqdcgIWd6K5fM
         TqZw==
X-Gm-Message-State: AOAM532lZ+/M/ePuFrmBLk72yPp0aRr/jjjUV2Wu877rhbfIzKU7qMqU
        jIarrvIWOVtHytJQB21uv5pb8xyncpFw0vXmfUU=
X-Google-Smtp-Source: ABdhPJyw1EexgZMnIy5hXaDoo+Gl6lRToQrpNaUM809TnKgYSc7rBRVsLIHXDg8FCGmeff6L1eoCw/CSPlBwhHM9Nck=
X-Received: by 2002:a05:6a00:1385:b029:1be:ac19:3a9d with SMTP id
 t5-20020a056a001385b02901beac193a9dmr2352299pfg.65.1614765525345; Wed, 03 Mar
 2021 01:58:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:6d0c:0:0:0:0 with HTTP; Wed, 3 Mar 2021 01:58:44
 -0800 (PST)
Reply-To: georgemike7031@gmail.com
From:   george mike <crepinak.vainqueur@gmail.com>
Date:   Wed, 3 Mar 2021 10:58:44 +0100
Message-ID: <CAHwNn8JPtdU1yhfJ5i3P9P_1HwkD4T3PuDDp=JXNPx3PjvT5Ug@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hallo

Ich hei=C3=9Fe George Mike. Ich bin von Beruf Rechtsanwalt. Ich m=C3=B6chte=
 dir anbieten
engster Verwandter meines Klienten. Sie erben die Gesamtsumme (8,5
Millionen US-Dollar).
Dollar, die mein Kunde vor seinem Tod auf der Bank gelassen hat.

Mein Klient ist ein Staatsangeh=C3=B6riger Ihres Landes, der mit seiner
Frau bei einem Autounfall ums Leben gekommen ist
und einziger Sohn. Ich habe Anspruch auf 50% des Gesamtfonds, w=C3=A4hrend
50% davon berechtigt sind
Sein f=C3=BCr dich.
F=C3=BCr weitere Informationen wenden Sie sich bitte an meine private
E-Mail-Adresse: georgemike7031@gmail.com

Vielen Dank im Voraus,
Herr George Mike,
