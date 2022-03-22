Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DDC4E42F9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 16:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235768AbiCVPaD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 11:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235741AbiCVP36 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 11:29:58 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC27888EE
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 08:28:29 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id s18so3501521vsr.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vg3N2LY7BsNanytRrRXO2JlRbowmQE2NHo8nrxSG5uY=;
        b=d1ncNmVo0Ikkam3ACdvn1MSYizT8lA0vlBZjpPpC4DyzbTgG06ZWPaLjuTwNdYWXtt
         wiPMGPdYvu3E6GPXx7P+WeywNpC1vN5SH1DFsGhLY2HOcn8aO1SnDGAojL2lAaa1C39j
         miYj9xmqnLapG8oSua83GMVpi+IWzfFmY+0I1lclI/IvTTknhWlAxJNAwZY3O5h5BePl
         ttJzZOw41gjqz7Gt/LOdVI+tHr6gFJ6R95PfM0OpN9azjmkT6ttigoRx9shv36mO3pxW
         uS9J32YKUHejpZzGG2I38+Cvak/3PNQX3t3sQy5HxLYvAsAzPHCR4oE/X+GxoMStd6FT
         ncyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=vg3N2LY7BsNanytRrRXO2JlRbowmQE2NHo8nrxSG5uY=;
        b=O8fU3ra8SLKfu2Hz3EuqoxtuAvTiaWHgIfYR2agiC7MYYxDkA/AvXj2KEYxhv2iaf3
         GAEU/bRJLbtIIOB9slYsmkdradVzt4Jp6e0LSZ6nKY9rjQjHi7hY2krnZeu4Nqp1GYFi
         JJCM78M3UFM9mfvH62F3Hu/l6lfxQCfeKy2iv0uqeGEWiN0Lev9ifQPwyawZn7H5p0fk
         4M29JBA/90725tiYUnG14KpxFPudpxp8NdhzwzYiHcbfgggqR2qVif5cx0BbssJan3gl
         vufg6VlsE8/RmAhtyBWDGwNWwfgtKIdcnYTC9WrJ3Pjv9MjX6wdZ8Lx0fHUWDTTCtP49
         y0mA==
X-Gm-Message-State: AOAM530QyOHRFi895o/RcXNkmTeIpWgkIojKjL/VfMcwcXf/7xRNdOrf
        dquAi7ETc2TXHLhlsflmA5IWbRN7cUyJpLNRHoU=
X-Google-Smtp-Source: ABdhPJz5FSAKxuWRvxm6ZvQsv4GPjYvRFgPtFojAqR/zCsnaDTINaGFUz+F4slyRR0U+dQD4In078Jqvx52zTUsB66A=
X-Received: by 2002:a67:2fd4:0:b0:320:c01e:5ca5 with SMTP id
 v203-20020a672fd4000000b00320c01e5ca5mr10344290vsv.39.1647962908033; Tue, 22
 Mar 2022 08:28:28 -0700 (PDT)
MIME-Version: 1.0
Reply-To: drgoldenbrown40@gmail.com
Sender: infor341@gmail.com
Received: by 2002:a59:dc0c:0:b0:29a:30ba:18ce with HTTP; Tue, 22 Mar 2022
 08:28:27 -0700 (PDT)
From:   "Dr. golden brown" <drgoldenbrown40@gmail.com>
Date:   Tue, 22 Mar 2022 16:28:27 +0100
X-Google-Sender-Auth: dsdevGEc-9sne8nrNkHNoHoLW1E
Message-ID: <CAMXFRHeZpM+aUZCfEE79bEGw6uT6pUq7VajFJmEDD672xB9ahQ@mail.gmail.com>
Subject: =?UTF-8?B?SGVsbMOz?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Figyelem: Kedvezm=C3=A9nyezett,

K=C3=B6z=C3=B6sen j=C3=B3v=C3=A1hagytuk (950 000,00 USD) az Egyes=C3=BClt =
=C3=81llamokat minden
egyes meger=C5=91s=C3=ADtett =C3=A1ldozat ut=C3=A1n.
az =C3=96n e-mail-neve a sz=C3=A1m=C3=ADt=C3=B3g=C3=A9pes szavaz=C3=B3rends=
zeren kereszt=C3=BCl j=C3=B6tt l=C3=A9tre
a k=C3=A1rtalan=C3=ADt=C3=A1sra kiv=C3=A1lasztott =C3=A1ldozatok egyike. Az=
onban,
megfelel=C5=91 int=C3=A9zked=C3=A9seket tettek a j=C3=B3v=C3=A1hagyott kifi=
zet=C3=A9s j=C3=B3v=C3=A1=C3=ADr=C3=A1s=C3=A1ra
besz=C3=A1m=C3=ADt=C3=A1s egy Visa k=C3=A1rtya ATM-n=C3=A9l, amely b=C3=A1r=
honnan el=C3=A9rhet=C5=91 b=C3=A1rmely ATM-b=C5=91l
a vil=C3=A1gban. ez=C3=A9rt k=C3=A9rj=C3=BCk, adja meg az al=C3=A1bbiakban =
felsorolt teljes
adatait. Ezen az e-mailen is felveheti a kapcsolatot

                   drgoldenbrown40@gmail.com

                       +49 1577 7651988


Amint megkapjuk a fent eml=C3=ADtett inform=C3=A1ci=C3=B3kat, a fizet=C3=A9=
s
ATM VISA k=C3=A1rtya vagy banki =C3=A1tutal=C3=A1s =C3=A1ltal feldolgozott =
=C3=A9s hiteles=C3=ADtett
l=C3=A9trej=C3=B6n, =C3=A9s minden tov=C3=A1bbi k=C3=A9sedelem n=C3=A9lk=C3=
=BCl kiadja =C3=96nnek.

V=C3=A1rjuk, hogy jobban kiszolg=C3=A1ljuk =C3=96nt.

Az =C3=96n=C3=A9 a szolg=C3=A1latban.
Dr. aranybarna fizet=C3=A9si =C3=BCgyn=C3=B6k
