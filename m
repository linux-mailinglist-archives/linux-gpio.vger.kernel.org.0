Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D4B5BCE3E
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 16:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiISONs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 10:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiISONr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 10:13:47 -0400
Received: from mail-yw1-x1144.google.com (mail-yw1-x1144.google.com [IPv6:2607:f8b0:4864:20::1144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107B53207E
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 07:13:46 -0700 (PDT)
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-324ec5a9e97so340930487b3.7
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=5N+aMihLorZXBHcklDfHgYNT/W4ZQvt0cLc1vwY1KVE=;
        b=mUWl7S2Y4/CWgqFso+XmN6Xqp8+CFE05l7JuQpZyPgBkK+hCv4nAf5riUlWYlCEvT4
         5Qky6Sqf87ecwSE6ZgnN/M4JNgb90eWdXgvublcOBvJ4fmSXto+LIN17Nd+Zo7LkKAXH
         JiFkCIcsM4TzAFdhHNb4/dvx19hVFUsWVLCQeexD0+XseruCvKpUl3dGh0D334YkmTHI
         VmtrQ3fTwTXkV5l50FR04UN5RMTqmDkNSISD/PkMGvv0O95GNPhQ0hzc9I6ayYV1BhHx
         MEoi6AxmJxiODxUnIj2Hd0gj/rRMdCp1bmwPwXIY3ff8pNSca2pGQXJpLDpwHL7VxXVq
         tLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5N+aMihLorZXBHcklDfHgYNT/W4ZQvt0cLc1vwY1KVE=;
        b=JYyLo98XWWD2Q4lSFpPJuIJR6CMA/fN/8jQ8SItztz6h7eMsctN6oL4Sk2RnMQpJtx
         ZpoNXPDjsAJl0byzRiG9lU1VoJtLtOVDNbqvhsYiIEkS7PIzjtP5O0j7bJEj6FKvBku4
         eAYkqi7HnGHzF56ZwtZ2CmjCJ1GWarQlAFzdJy1h/t/fGQCEiuiZONyaj4K5wsv742Jz
         6kTZlx4ZH+6KrPFz/8YnEdfIop27kmj2Ps6cpQ5U4yu6MNspU4IGTi3N3vrtY7lUqNJA
         PrwE/hw4kpRu6RG1DD+O+/D08++21aXkeNpdN2bqypGkhRUR5dJ3qs+zAP84p8KBvU4q
         1JFw==
X-Gm-Message-State: ACrzQf2svJ9I6I4S2o8XB2CgL3ysKBYCrVo9fAyQ4ERfKLdunFCuo+qm
        1j09A5XkdiWUfWokLjcjknsC6k0ffvN+Pi5/Yi4=
X-Google-Smtp-Source: AMsMyM7Ef0u62N/5DUXX0q86EAugLF0XHftnjQsZCYkMa85rQjam7b1SYONFq2Dyyl8oo9VHyrqGiu8Le9FphSdDf7o=
X-Received: by 2002:a81:1dd6:0:b0:349:c9c9:eb61 with SMTP id
 d205-20020a811dd6000000b00349c9c9eb61mr14822070ywd.7.1663596825274; Mon, 19
 Sep 2022 07:13:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:8e28:b0:305:bafb:f9c2 with HTTP; Mon, 19 Sep 2022
 07:13:44 -0700 (PDT)
Reply-To: jennifermbaya036@gmail.com
From:   "Mrs.Jennifer Mbaya" <tantisayo@gmail.com>
Date:   Mon, 19 Sep 2022 15:13:44 +0100
Message-ID: <CAOOke06_EYisqAAMuj_qqrsu7FL6WSsJKocc3LQa_4H1emUOPA@mail.gmail.com>
Subject: Edunsaaja
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Edunsaaja

Nimess=C3=A4si on palkinto Yhdistyneilt=C3=A4 Kansakunnilta ja Maailman
terveysj=C3=A4rjest=C3=B6lt=C3=A4, joka on osa kansainv=C3=A4list=C3=A4 val=
uuttarahastoa, johon
s=C3=A4hk=C3=B6postisi, osoite ja raha on luovutettu meille siirtoa varten,
vahvista yst=C3=A4v=C3=A4llisesti tietosi siirtoa varten.
Meit=C3=A4 kehotettiin siirt=C3=A4m=C3=A4=C3=A4n kaikki vireill=C3=A4 oleva=
t tapahtumat
seuraavien kahden aikana, mutta jos olet vastaanottanut rahasi, j=C3=A4t=C3=
=A4
t=C3=A4m=C3=A4 viesti huomioimatta, jos et toimi heti.
Tarvitsemme kiireellist=C3=A4 vastausta t=C3=A4h=C3=A4n viestiin, t=C3=A4m=
=C3=A4 ei ole yksi
niist=C3=A4 Internet-huijareista, se on pandemiaapu.
Jennifer
