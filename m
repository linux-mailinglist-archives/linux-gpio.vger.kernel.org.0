Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557054EAD20
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 14:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbiC2M3e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 08:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236297AbiC2M3e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 08:29:34 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC9BA8891
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 05:27:51 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id i186so18945820vsc.9
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=v/yvavUyPwGerxMA/IE+Pbrkfw+f2eQSM7TzLTQJVSI=;
        b=RqB3TZmkBFin0/S4021XBGvxJfVszlGayULJUt/JG9RXR+pSLU19X8Eud9pt5N0KOP
         z/dowel/746aIDzoL/cDUW8IpJ8TPNgK7eVFa+H/ouoisOnDW0bF+Aco1XNQMuW547G1
         ojxAt5jndF2E3iCNXfZkY+nCGV9Z6DmtlWdX0cKH5GJpqLNvnUd1QZL7xY1gCQwE40/t
         n1wQsA+hNOLuRhQkicokaDne5j+CRclk7mkpEUd7T3D/KRZK6HCuJiy3aqbvwycmxcDh
         TmYolByWfG9GgL8sC0VE8u0cZYtJ7i7nesOTRJiU2kIngXYZATWS0jr6gd+i6RUtymY4
         C4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=v/yvavUyPwGerxMA/IE+Pbrkfw+f2eQSM7TzLTQJVSI=;
        b=u8gzYCujW+xs4kgpxpEMMhL7AyAuL6R+oH3ksV7M0iHGWoOA+HFeIph42DQJFuA5h0
         OZsd3SiQ5KOmfkyC8Ta3divKsgcrGFrLqW5d7Xc+vMKoupTnwhwUEnRavyvkQ2fY4p9u
         AY2iJKnXinzgrtpux7NzV++095Ooz21TWWc5QplmclqgAJ9bByDR6L8BZW25LA+M6qfE
         BryP3M0C+Hii+RXnoDER4jIPgSKgzU7FMEkAOhvUEbfxDfuTjrnHdAucM7Fs3jnuFWEG
         FHcjdy97Af64uep2T6grrP5/HJKBO6AKBxuTzxHWjux3GogwMKZJlDLte4o1c9bZHw1e
         tfBw==
X-Gm-Message-State: AOAM533BoYKY3ZwQSFCPQ3SwwkmFo7dr7xgxILx2S1ZLi1qfrmn7iD7M
        5ixFLn6Z2u1EY1xAJVsNIkscy7IReBLKUTrSjKQ=
X-Google-Smtp-Source: ABdhPJymjal4/yQSRfS5bkQVZsRGNTmyjjkCkVV/9aqLDKjK7SR5SPxosRmvX6TbzjjXlWrHbbGJixz1lTymLXWdUek=
X-Received: by 2002:a05:6102:e11:b0:325:a79c:6e82 with SMTP id
 o17-20020a0561020e1100b00325a79c6e82mr7809203vst.32.1648556870880; Tue, 29
 Mar 2022 05:27:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:93d1:0:b0:2a3:2686:e231 with HTTP; Tue, 29 Mar 2022
 05:27:50 -0700 (PDT)
Reply-To: wwheadoffic@gmail.com
From:   "wwheadoffic@gmail.com" <bankdirector001@gmail.com>
Date:   Tue, 29 Mar 2022 12:27:50 +0000
Message-ID: <CACOECayzdrsdaRODbXhJZrOgTWrKxLiTcKpN8L52Rg_Xj9Hqpw@mail.gmail.com>
Subject: hello
To:     bankdirector001@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        NAME_EMAIL_DIFF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=20
 Irod=C3=A1nk el=C3=A9rhet=C5=91s=C3=A9ge: 2554 Road Of Kpalime Face Pharma=
cy Bet, Lome, Gulf.

Ez a WU bank igazgat=C3=B3ja =C3=A9rtes=C3=ADti =C3=96nt arr=C3=B3l, hogy a=
 Nemzetk=C3=B6zi
Valutaalap (IMF) 850 000,00 USD k=C3=A1rt=C3=A9r=C3=ADt=C3=A9st fizet =C3=
=96nnek, mert
megtal=C3=A1lta az =C3=96n e-mail c=C3=ADm=C3=A9t a csal=C3=A1s =C3=A1ldoza=
tainak list=C3=A1j=C3=A1n. Hajland=C3=B3
vagy venni ezt az alapot vagy sem?

V=C3=A1rjuk s=C3=BCrg=C5=91s h=C3=ADr=C3=A9t.

Tisztelettel
  Tony Albert
  BANKIGAZGAT=C3=93
