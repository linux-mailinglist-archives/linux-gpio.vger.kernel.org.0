Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7AA16ED178
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Apr 2023 17:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbjDXPgv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Apr 2023 11:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbjDXPgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2023 11:36:49 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347D71FC8
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2023 08:36:48 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-b98415ba97aso6004222276.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2023 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682350607; x=1684942607;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ng7mcmr4QJ6ZL7X9dSXkz6scbTE1whqwn58ZUV1v7fU=;
        b=KO7dphphuGIGYbTlot2H3fnI8xAb2JxbU/R666z3IptdPShtdA1xIXjMnu2Khu/0H/
         zEO/bANcE7vwMCM/j8XXjxjweoIbIc4JtQ6cp5g7v8DceAueuC+etaeb1ue1vemI9zl7
         U23q993GUluk1y5xvlXssaLrVhw72fb5ICQty4MItZjHQjPTAvdjCFV9ZFzzb4WO1ODz
         xG8G55XoJUs5cLuJ4gnA67XWZSJXWP88CoWFisDVgdt7/23u+HRzeR3YqLgWoqcJwlVC
         2OkpbJtMRC99/w/XNHOh6aIAUvj+29mZG7R7gVkdqSfoyj59/eDN8rEdbJCosUTEYSLB
         4ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682350607; x=1684942607;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ng7mcmr4QJ6ZL7X9dSXkz6scbTE1whqwn58ZUV1v7fU=;
        b=L3Q2HqVVjRHjMlm20XNeRhHcFsaHFWcGSe9TMbIHoDU482z+2wnSdc/dnqnTPGU2Tj
         oiXcMzCSTJWTARMfkWUbP29UCJfm33FqDkPJbgjj6xKhaVCMOSxwPog0HLYJnPrl12nN
         zPw8tni7M1Vx2gWDH/n4qIC+wsHRcagCQL3a8cpZJiYDKBphdBYBMf/KdtTk0wzcmu55
         lrZxLL/R5yBTxkMlLeESsU14tWo/SjAj2mL1mCms4IsBZWTt9fbIKnlKgyR4j2nepdKn
         Pv54HJtc0EvuY/ccUVQkVM+VabkC0YvYPZcqwGh/9zXCAYVG07++Dj8ne9VVzERiyYmK
         5Ckw==
X-Gm-Message-State: AAQBX9fe+kuyvxgfQDvKQeInAW+IOY3sWIAOKawJiUYB5/gS5dX+P36E
        GR/BVHvOePpn631T8W1+PV16HQ2KsQEpZkXAlEY=
X-Google-Smtp-Source: AKy350afoBp2AIl9aLPUyl+McHH3D/1YoHhmq/V6msa7zQfk/O59TLXAnVfHUzFBuu+Xwgc01yQ/kC6nhFVOMQeQfjg=
X-Received: by 2002:a25:d95:0:b0:b98:ddf4:7146 with SMTP id
 143-20020a250d95000000b00b98ddf47146mr9295287ybn.21.1682350607381; Mon, 24
 Apr 2023 08:36:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7011:c0a4:b0:348:8a48:5054 with HTTP; Mon, 24 Apr 2023
 08:36:47 -0700 (PDT)
Reply-To: stephenbord61@yahoo.com
From:   Stephen Bordeaux <ajojo6946@gmail.com>
Date:   Mon, 24 Apr 2023 15:36:47 +0000
Message-ID: <CAPgeixX8_rSpdCXc8o=VxKNVrYmJC9bkZ55mcTfXGeO6y+y3RQ@mail.gmail.com>
Subject: =?UTF-8?B?WmRyYXbDrW0gYSBkxJtrdWppIHphIG9kcG92xJvEjw==?=
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
