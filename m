Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC004EB5CF
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Mar 2022 00:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbiC2WV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 18:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236762AbiC2WVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 18:21:25 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B456054BE5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 15:19:36 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u16so26767121wru.4
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 15:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=YXpOd5khX7cpLcZNKN0CbanmR3NCItseA/RstGbC7jmNHQ7x1YcNSSvgUz/dM10dtQ
         jdiFHHNU5nf3eeruLurqxBvxLvbD1VuXk1xfyY6nvq5I91L7Y3TXtwRMtgmr4WsRERmn
         e/snp/JMuZ2bUL7MYZWhc7MmUvdz/VeN+6GH032/qr7jxV4dYuktz+kSStUJo/6bNdWe
         dnLzBuv8ILqMRGXO/6AQTXIFt6KUsCWbrNz6ZzJUOm+/eMggDhFz0LnspnY4Ezi+E5sv
         tJrYAIpq29qcxJcCz4qPe4cfBld/0AlLAKiuBghu0/vq8Xew9Ghn2VzXEcEPW9aWeq74
         GJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=by3KNys+1EV0S0CIEv10kfbp8QbjoM7IN8/EKrwCyUfhCmvuUSTxM9xC1MIBwCwPLw
         TE0EcT0HlT1TMRGVwRtJwiA0zhYMJ0Ngeu4OgRa1/jXvtHI62p1xv0uikitIyAVSdO3C
         YWo03K7jK11wmb8dWOVKXV+vHX60oFO8Xt2jBNsTaZB2NttyyEUT0FZSLEG16cPFYsBN
         ilVgs9YA7A4w9A22aoLYxxO16uqmk9GI6HeiuCgwzOVSKmiSALAWq5KpadexpgSCAu+v
         DSGb40Y9wDLr3tphMPlIUq8V2A3pE3xzWSLaejI8cTA/HX3qK4ErzgqEUa4ec2JnvM3b
         LAcg==
X-Gm-Message-State: AOAM533FArM6FwDQMHsGyXh3StEzzbbZJGiCnDyDdgU+TkJEf6QYoVz3
        b8EtVQzvTyOiFSjiGlecM1k=
X-Google-Smtp-Source: ABdhPJw3XwA7kESWW4BsXnrWb8L3MLI1D8uZbswnBTmuLg74po0I+MRn2n5qmOiRvX/92ePjhj6zKg==
X-Received: by 2002:a05:6000:1ace:b0:203:d45b:fbce with SMTP id i14-20020a0560001ace00b00203d45bfbcemr33387176wry.673.1648592375401;
        Tue, 29 Mar 2022 15:19:35 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.5.18])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c19c700b0038cc9aac1a3sm3344347wmq.23.2022.03.29.15.19.31
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:19:34 -0700 (PDT)
Message-ID: <624385f6.1c69fb81.4c767.e473@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:19:25 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
