Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2780F79B19B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238841AbjIKUyZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240364AbjIKOmf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 10:42:35 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF5BCF0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 07:42:31 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a9cd066db5so576287366b.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 07:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694443349; x=1695048149; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3gbT0k9NdeYjyT+O+DqoAOe85gGtNhRbh0FKrOX1DjQ=;
        b=geNsxDdVnD36+63qwxCJS5TxNl50Y3nacZ9NwdfJIvGD6m+K75i2imCx3prtRcBGIt
         u26R84Vsqh8AKapTfZBBRLqxzRN+bHVvkhll0bNSh8MQZri6ovELFYr9Ez8sVsupznbV
         35PDC3io/WtA2NEL1uh89snixZSKBxhBao2wwZgG1AkIKuBYvQkQ5LhOs5392bec+3So
         NrtADXPYEJuWh2R/Y2fSiDT2/fcxNl+3CREtBztt/3YU8KhVaWUmcaxSbbsaBImhU/4/
         vtD+2qw7UYCLXsZJxo1Ush6DU5247n3bfUrKVeI37ImaMekyXTPE3yYfKI/sCHIo1osy
         3lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694443349; x=1695048149;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gbT0k9NdeYjyT+O+DqoAOe85gGtNhRbh0FKrOX1DjQ=;
        b=SoHgGvoyd2l9pliaC1MG29W2jL44S+h4q4TuSuv/Lu0bTlsZs8U+xCoCMQYxNkRlXI
         NwmnGAxI6AixZh4bMeXLZmEX6mdU63ojEI7rjcocOJ8EbuMnBjSH8tCrS0t7Pq3+8MMp
         KFt6QZ1jYGjsyGeuR5VXMgNir9lDXLrMo046v60gp+jTrtev1Nz4Wt+aIgl+e4/h7X58
         zKcZ+rSLbmVrjUQoqDVp0wLVEdlRsIod54asONGaCp9pT2f+bbyaOl7FMksJofqey701
         XLcUZ6lL9rTGoj71io4D6c91uR67p/IvyhpUASGTY3YcOfPJAGBhrYOgaC380qb2ongd
         N7Qw==
X-Gm-Message-State: AOJu0Yz+smuTE5E1c5iGfqKC+xGUyelQPSob0huJl2QY1mMUxSnxwPcH
        lUbPj9XB+tR+iKIG8HKeKeLayOFnooOl4HHiEBU=
X-Google-Smtp-Source: AGHT+IFlSCKHXtB/02ULfk3ufQNPso4U6Y4W8sgOD3WItMii8XK+6+axMjZLdpiO3N07nUGN+YoiEOG3+WPtnccGhlE=
X-Received: by 2002:a17:906:ef8f:b0:9a9:d5dd:dacd with SMTP id
 ze15-20020a170906ef8f00b009a9d5dddacdmr8460952ejb.26.1694443349439; Mon, 11
 Sep 2023 07:42:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:512:b0:e5:c6b1:e1 with HTTP; Mon, 11 Sep 2023
 07:42:28 -0700 (PDT)
Reply-To: laurabr8@outlook.com
From:   Laura McBrown <elizabethjohnson184@gmail.com>
Date:   Mon, 11 Sep 2023 15:42:28 +0100
Message-ID: <CAFDOM0ZMReZXUEs5dyB9qQzSzA8d2qB4BDy9Gh1zXCtVQBDjxQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pozdravy tob=C4=9B

S n=C3=A1le=C5=BEitou =C3=BActou a lidskost=C3=AD jsem byl nucen v=C3=A1m n=
apsat z
humanit=C3=A1rn=C3=ADch d=C5=AFvod=C5=AF. Jmenuji se pan=C3=AD Laura McBrow=
n. Narodil jsem se v
Baltimoru, Maryland. Jsem vdan=C3=A1 za pana Waltera McBrown, =C5=99editele
spole=C4=8Dnosti J.C. Byli jsme man=C5=BEel=C3=A9 36 let bez d=C3=ADt=C4=9B=
te. Zem=C5=99el po
operaci srde=C4=8Dn=C3=ADch tepen.

A ned=C3=A1vno mi m=C5=AFj doktor =C5=99ekl, =C5=BEe p=C5=99=C3=AD=C5=A1t=
=C3=ADch =C5=A1est m=C4=9Bs=C3=ADc=C5=AF nevydr=C5=BE=C3=ADm kv=C5=AFli
m=C3=A9mu probl=C3=A9mu s rakovinou (rakovina jater a mrtvice). Ne=C5=BE m=
=C5=AFj man=C5=BEel
loni zem=C5=99el, ulo=C5=BEil zde v bance =C4=8D=C3=A1stku 2,8 milionu dola=
r=C5=AF. V sou=C4=8Dasn=C3=A9
dob=C4=9B jsou tyto pen=C3=ADze st=C3=A1le v bance. Pot=C3=A9, co jsem znal=
 sv=C5=AFj stav,
rozhodl jsem se darovat tento fond ka=C5=BEd=C3=A9mu dobr=C3=A9mu bratrovi =
nebo
sest=C5=99e, kte=C5=99=C3=AD se boj=C3=AD Boha, kte=C5=99=C3=AD budou tento=
 fond pou=C5=BE=C3=ADvat zp=C5=AFsobem,
kter=C3=BD zde budu instruovat.

 Chci n=C4=9Bkoho, kdo pou=C5=BEije tento fond podle p=C5=99=C3=A1n=C3=AD m=
=C3=A9ho zesnul=C3=A9ho
man=C5=BEela na bezmocn=C3=A9 privilegovan=C3=A9 lidi, sirot=C4=8Dince, vdo=
vy a na =C5=A1=C3=AD=C5=99en=C3=AD
slova Bo=C5=BE=C3=ADho. U=C4=8Dinil jsem toto rozhodnut=C3=AD, proto=C5=BEe=
 nem=C3=A1m =C5=BE=C3=A1dn=C3=A9 d=C3=ADt=C4=9B,
kter=C3=A9 by zd=C4=9Bdilo tento fond, a nechci pry=C4=8D, kde budou tyto p=
en=C3=ADze
pou=C5=BEity bezbo=C5=BEn=C3=BDm zp=C5=AFsobem. To je d=C5=AFvod, pro=C4=8D=
 jsem se rozhodl p=C5=99edat
v=C3=A1m tento fond.

 Neboj=C3=ADm se smrti, proto v=C3=ADm, kam jdu. Chci, abyste na m=C4=9B v=
=C5=BEdy
pamatovali ve sv=C3=BDch ka=C5=BEdodenn=C3=ADch modlitb=C3=A1ch kv=C5=AFli =
m=C3=A9 nadch=C3=A1zej=C3=ADc=C3=AD
operaci rakoviny. Odepi=C5=A1te co nejd=C5=99=C3=ADve, jak=C3=A9koli zpo=C5=
=BEd=C4=9Bn=C3=AD ve va=C5=A1=C3=AD
odpov=C4=9Bdi mi poskytne prostor pro z=C3=ADsk=C3=A1n=C3=AD dal=C5=A1=C3=
=AD osoby pro stejn=C3=BD =C3=BA=C4=8Del.
B=C5=AFh v=C3=A1m =C5=BEehnej, kdy=C5=BE naslouch=C3=A1te hlasu uva=C5=BEov=
=C3=A1n=C3=AD,

pan=C3=AD Laura McBrown
