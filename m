Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBF370F1B8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 11:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240490AbjEXJD7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 05:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240526AbjEXJDr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 05:03:47 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206DFE4A
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 02:03:41 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3943fdc59f9so16925b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684919020; x=1687511020;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cpy7HUUl9JUJVfHeyZRx3CTbUVGObKlyKlmgTELiasw=;
        b=cWDAM+21vLU4SoMEXpWKAEy12D5yg7pL7zQIxW/gNAuSZanK+yqZzhXxEYBva2PGEO
         7NLR1KCf84M+z81XdFqRRf/UGOi7GPwbWsapDhKTov5fIBGzfDk2AtGAYE6eTcAf9QTl
         6SxXIu4YijOPFzXh7FE0k70pA+LrSKNjBFuCzrB4ddcWwP/nQRAAo5xasR8U1fbhlgAx
         vulqYSxvkgT91xlQpgsPMVw77uf/7ZBpe+/j0bzH3oGMO+bEwVwqOSL5nZG927Ss3Hc5
         ulWv1ULYXs9KxhP1dJysF3Yilbd2n07E/BvwQIiIR1davE6PioTthdkxOV1LMF3+Ve7Z
         IodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684919020; x=1687511020;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpy7HUUl9JUJVfHeyZRx3CTbUVGObKlyKlmgTELiasw=;
        b=VdKq2Bjc7Hj8T2Ojilp+yB8yoWs/BTy2b7B1kOxUdlMvhJksVR5gKdNIlMlwqiUVRu
         9KvVZDJugufyz1Ml5ksR9lVHUCiRLTLA7PIZ5drAxOirbvlcHafprKM4K//Xv46089uC
         vOpHD8WNmEk4M3+x/5RqOkdPtcC1S5KrQZYBl2qFMmtIWCOuwelFhHrtemr9spOGOl4B
         hePsYhOGq/fjwqRq8ybk8ftOS74nEmiPvKz01qxRBQJpOIbqV1R6jVED0PFGHii6uk8p
         jVY780eY8C2QC2ovwHgAn2ORuo9dq6LXkSehgMwsrO5V/fBX7oMMfMVJg5gtjbFXgXEg
         0z1A==
X-Gm-Message-State: AC+VfDwrzMfGAs3MsaS9xVR4db94SX0qAT5O0ScfQOwRFxzH+n0DiDz3
        z0lX86dspyAI3mmPd0xG4XCI+qLrPj2kddnGn+w=
X-Google-Smtp-Source: ACHHUZ5IPpatVJYtnrvOrUct9BEWxwJphoKGDkqGjwjbHJjTA6BKQxg/xsmhCRVcWTn8EEqjOMblwU7I38M4cyfGov8=
X-Received: by 2002:aca:2408:0:b0:395:e452:47c1 with SMTP id
 n8-20020aca2408000000b00395e45247c1mr8651440oic.30.1684919019992; Wed, 24 May
 2023 02:03:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:1355:0:b0:4d8:54d2:13b4 with HTTP; Wed, 24 May 2023
 02:03:38 -0700 (PDT)
Reply-To: philipsjohnsongoodp@gmail.com
From:   philips <robertandersonhappy1@gmail.com>
Date:   Wed, 24 May 2023 11:03:38 +0200
Message-ID: <CAGRoA83_LoiO2Au9Jstr-084mikBO2AjE=REOQPFb7kiar9jWw@mail.gmail.com>
Subject: good
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

0JTQvtGA0L7Qs9C+0Lkg0LTRgNGD0LMsDQrQnNC10L3RjyDQt9C+0LLRg9GCINCR0LDRgC7QpNC4
0LvQuNC/0YEg0JTQttC+0L3RgdC+0L0sINGPINCw0LTQstC+0LrQsNGCINC4INGH0LDRgdGC0L3R
i9C5DQrQvNC10L3QtdC00LbQtdGAINC/0L4g0YDQsNCx0L7RgtC1INGBINC60LvQuNC10L3RgtCw
0LzQuCDQvNC+0LXQvNGDINC/0L7QutC+0LnQvdC+0LzRgyDQutC70LjQtdC90YLRgy4g0JIgMjAx
NyDQs9C+0LTRgw0K0LzQvtC5INC60LvQuNC10L3RgiDQv9C+INC40LzQtdC90LgNCtCc0LjRgdGC
0LXRgCDQmtCw0YDQu9C+0YEsINGPINGB0LLRj9C30LDQu9GB0Y8g0YEg0LLQsNC80Lgg0L/QviDR
gtC+0Lkg0L/RgNC40YfQuNC90LUsINGH0YLQviDQstGLDQrQvdC+0YHQuNGC0Ywg0L7QtNC90YMg
0YTQsNC80LjQu9C40Y4g0YEg0L/QvtC60L7QudC90YvQvCwg0Lgg0Y8g0LzQvtCz0YMg0L/RgNC1
0LTRgdGC0LDQstC40YLRjCDQstCw0YEg0LrQsNC6DQrQsdC10L3QtdGE0LjRhtC40LDRgCDQuCDQ
sdC70LjQttCw0LnRiNC40Lkg0YDQvtC00YHRgtCy0LXQvdC90LjQuiDRgdGA0LXQtNGB0YLQsiDQ
vNC+0LXQs9C+INC/0L7QutC+0LnQvdC+0LPQviDQutC70LjQtdC90YLQsCwg0YLQvtCz0LTQsCDQ
stGLDQrQstGL0YHRgtGD0L/QuNGC0Ywg0LIg0LrQsNGH0LXRgdGC0LLQtSDQtdCz0L4g0LHQu9C4
0LbQsNC50YjQtdCz0L4g0YDQvtC00YHRgtCy0LXQvdC90LjQutCwINC4INC/0L7RgtGA0LXQsdC+
0LLQsNGC0YwNCtGB0YDQtdC00YHRgtCy0LAuINC+0YHRgtCw0LLQu9GP0YLRjCDQvdCw0LvQuNGH
0L3Ri9C1DQrQvdCw0YHQu9C10LTRgdGC0LLQviDRgdC10LzQuCDQvNC40LvQu9C40L7QvdC+0LIg
0L/Rj9GC0LjRgdC+0YIg0YLRi9GB0Y/RhyDQodC+0LXQtNC40L3QtdC90L3Ri9GFINCo0YLQsNGC
0L7Qsg0K0JTQvtC70LvQsNGA0L7QsiAoNyA1MDAgMDAwLDAwINC00L7Qu9C70LDRgNC+0LIg0KHQ
qNCQKS4g0JzQvtC5INC/0L7QutC+0LnQvdGL0Lkg0LrQu9C40LXQvdGCINC4INC30LDQutCw0LTR
i9GH0L3Ri9C5DQrQtNGA0YPQsyDQstGL0YDQvtGBINCyDQrCq9CU0L7QvCDQsdC10Lcg0LzQsNGC
0LXRgNC4wrsuINCjINC90LXQs9C+INC90LUg0LHRi9C70L4g0L3QuCDRgdC10LzRjNC4LCDQvdC4
INCx0LXQvdC10YTQuNGG0LjQsNGA0LAsINC90Lgg0YHQu9C10LTRg9GO0YnQtdCz0L4NCtGA0L7Q
tNGB0YLQstC10L3QvdC40LrQvtCyINCyINC90LDRgdC70LXQtNGB0YLQstC+INCh0YDQtdC00YHR
gtCy0LAg0L7RgdGC0LDQstC70LXQvdGLINCyINCx0LDQvdC60LUuDQrQktGLINC00L7Qu9C20L3R
iyDRgdCy0Y/Qt9Cw0YLRjNGB0Y8g0YHQviDQvNC90L7QuSDRh9C10YDQtdC3INC80L7QuSDQu9C4
0YfQvdGL0Lkg0LDQtNGA0LXRgSDRjdC70LXQutGC0YDQvtC90L3QvtC5INC/0L7Rh9GC0Ys6DQpw
aGlsaXBzam9obnNvbmdvb2RwQGdtYWlsLmNvbQ0K0KEg0L3QsNC40LvRg9GH0YjQuNC80Lgg0L/Q
vtC20LXQu9Cw0L3QuNGP0LzQuCwNCtCR0LDRgC4g0KTQuNC70LjQv9GBINCU0LbQvtC90YHQvtC9
DQo=
