Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9656F0795
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Apr 2023 16:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243892AbjD0Og5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Apr 2023 10:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243743AbjD0Og5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2023 10:36:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC7B133
        for <linux-gpio@vger.kernel.org>; Thu, 27 Apr 2023 07:36:56 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-24782fdb652so6153349a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Apr 2023 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682606215; x=1685198215;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ng7mcmr4QJ6ZL7X9dSXkz6scbTE1whqwn58ZUV1v7fU=;
        b=lXG2fXaNWd6bD001P8EeSHU98xkCA2uz45TM1YRkPIlyxUWHcqpKQRISRRALa6nc8e
         jn80QF2b3ctVS+wkRWqQkNeHolmomsZmKzkzpt0qImY8ikkx8qdcRbvoyo4uGyPsTjYJ
         X+Gj5xZ7TMfxr4rfFlhkYtq+uzWWtgbqlYBiapXFvL5bZnHsKHh2toTaM0m89m0yKJU7
         UkKUHHH1UipbOVdtERkCosisx9qLQIYPTn5jXcWjCpxUfD7iI/o6WwtYedOnWHNFw0LE
         nbZkoIzCy8PMAPbVwv0NUbIWz1F2TXtKxCWZG1QiACuxWRo9OGw+G6/71Dped+pv9ZxT
         knJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682606215; x=1685198215;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ng7mcmr4QJ6ZL7X9dSXkz6scbTE1whqwn58ZUV1v7fU=;
        b=ZHJwoKUB1tTG1TUoHfVfEtNiwVdmAB9d9hnQrrnorm/tGrnWUWEmKryok1XcooyPsj
         PVZS/3c8rwrDNamt3HgnVMSNRQNdkjmP38JOCyZ4tsib3FdChurvggtm4jmQzzqwLOyh
         w0LOx58G7oChEdQW8fJzudHiiLaApM66n9PR5kISnn4v/l7HExkWayFOEZuEBQLQVklk
         GL1FPZO3dcjPR3Fc70bKXUGYC5fQ1b0Ov2ahE8dGAHd5WxLD2EamlHhig+sMaAkRDgXW
         2W2U2M4vtr2cQyoEbFPhz3KuX0elP/hU/JkYQZlx7eV0aSJxi8OpnfFvQ4biY/MSsW3e
         /F+g==
X-Gm-Message-State: AC+VfDw8jGj2cZhCYz77oeE5idJWtbd8f4SQPkMOPSFNie/n4W6LJgON
        WTdge3L0ey9Bspv03y+AWGeRZ+nPBJixfEkSU48=
X-Google-Smtp-Source: ACHHUZ4W2OPHbxzTV//Czp1CAi9qiC2LFaNSXfxFLf4DLggImbMT7ze2PsM320fP15MPZvB1orkMqhjcey+jO9X8fP0=
X-Received: by 2002:a17:90b:4ac3:b0:24c:1de9:493 with SMTP id
 mh3-20020a17090b4ac300b0024c1de90493mr328276pjb.47.1682606215589; Thu, 27 Apr
 2023 07:36:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a11:106:b0:40a:d04c:85cc with HTTP; Thu, 27 Apr 2023
 07:36:55 -0700 (PDT)
Reply-To: stephenbord61@yahoo.com
From:   Stephen Bordeaux <mrsjesswalk200@gmail.com>
Date:   Thu, 27 Apr 2023 14:36:55 +0000
Message-ID: <CAEq=RHa18oA9EPW3Xd7OeEU+7uXVqNr9JMvt9NOV7RxdGyhCAQ@mail.gmail.com>
Subject: =?UTF-8?B?VG91dG8genByw6F2b3UgdsOhbSBuYWLDrXrDrW0gcMWZw6F0ZWxzdHbDrSBhIHBhcnRuZQ==?=
        =?UTF-8?B?cnN0dsOt?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dobr=C3=BD den

Jsem Stephen Bordeaux, pr=C3=A1vn=C3=AD z=C3=A1stupce z advok=C3=A1tn=C3=AD=
 kancel=C3=A1=C5=99e Bordeaux.
Kontaktoval jsem v=C3=A1s ohledn=C4=9B poz=C5=AFstalosti fondu zesnul=C3=A9=
ho Dr. Edwin ve
v=C3=BD=C5=A1i 8,5 milionu dolar=C5=AF, kter=C3=A9 maj=C3=AD b=C3=BDt repat=
riov=C3=A1ny na v=C3=A1=C5=A1 =C3=BA=C4=8Det.
Nav=C3=ADc v t=C3=A9to transakci chci, abyste odpov=C4=9Bd=C4=9Bli d=C5=AFv=
=C4=9Brn=C4=9B.

Stephen Bordeaux
