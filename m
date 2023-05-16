Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F48B7056B7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 May 2023 21:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjEPTF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 May 2023 15:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjEPTF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2023 15:05:57 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBA11717
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 12:05:56 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-199fd9a0e62so548948fac.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 12:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684263956; x=1686855956;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cIuacTUe55V68yxCoo7ary9vLzT4+1nPwynRvBBZauw=;
        b=d2I16jlzh9qod7a8cEB0SHbweLhgwoLESt1CUoYBOR17JUYYtlEqcHCP00PboNR61d
         UOZMhdwwJEVBGNi+waVKwprf+SKgzzjRq80YwPhhLpWzro0Gz2joZ82nlsyBxI9Ifg17
         pSfU2h9MbvrDMvlRuHvmqiK2cNrPGH5vrImFsDRAyYz25ftvFJF/j//MHXjXl4NKpGsE
         EudPli2IHNZhEDvsuQOMuAxfuwo9ZWmckhxiMveRyR5WehpfOLmJEEgyX5rnpnT0goLX
         AWQcoJplTcwg6M7NgSATO2P9pt2ugYSQk8RZ8l67NuY+oDHp2rJn/EA4a9E7o9QIlhB8
         Nk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684263956; x=1686855956;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIuacTUe55V68yxCoo7ary9vLzT4+1nPwynRvBBZauw=;
        b=Fm/4xSRkjPVGoKg9xlvczbZ27DTlCJSXO96TwSoc9W0oROE4csKTn9YCYlMmHBgY+7
         FhZHEkjho/tuciYjnTsi3j1tMIRP1RypFDk8gAqvfFlx+1/TNcwVIyOL3i5/Q+/vOALq
         7grc/kIqK2XPcBGNeHd1E9bBAqD7RuOI01HKEYSsxHiqdsAtTxJf5bb655jvOEe3Ya8F
         W2bEWJmAiAwRgDZzyKVxXFL9NhcDKOKNFLkTD/a+wM3/YkrAgBvNHUpQUPhjWDkjo0Z9
         a3QIiYsg0DmzBvJYR8369N1WzAkBZQoxXLV6z2l2mMQmSW7xDPW4vwXh+JVJruqoIZ8i
         Kb1g==
X-Gm-Message-State: AC+VfDyDALjmL/kondMuApNl4I9P0PayFh8bTo3O3hP9TxMwDEniSFBd
        o45laHFfJ1dhAYPNsWLqxNFMj+7QFHhisgDghHFHzDTaM6I=
X-Google-Smtp-Source: ACHHUZ7M0rt3somU7rNoNoHn3k3J0ilJwlzaNc0gm4238KfxSdI8mzS3OxhrR3UT6IVQ3D3h86r0LM1F7zYGWBseOcc=
X-Received: by 2002:a05:6808:1999:b0:395:7577:1533 with SMTP id
 bj25-20020a056808199900b0039575771533mr9593138oib.37.1684263956046; Tue, 16
 May 2023 12:05:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6841:4da3:b0:128e:4a83:b402 with HTTP; Tue, 16 May 2023
 12:05:55 -0700 (PDT)
Reply-To: sharharshalom@gmail.com
From:   Shahar shalom <shalomshahar47@gmail.com>
Date:   Tue, 16 May 2023 19:05:55 +0000
Message-ID: <CADDwMLJ2taUMeQ8UN5zA4Emaps-C3EKkDZufWPA1jDC3w9FnUQ@mail.gmail.com>
Subject: =?UTF-8?B?5YaN5Lya?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

LS0gDQrkuIrlkajmn5DkuKrml7blgJnlr4TkuobkuIDlsIHpgq7ku7bnu5nkvaDvvIzmnJ/mnJsN
CuaUtuWIsOS9oOeahOWbnuS/oe+8jOS9huS7pOaIkeaDiuiutueahOaYr+S9oOS7juadpeayoeac
iei0ueW/g+WbnuWkjeOAgg0K6K+35Zue5aSN6L+b5LiA5q2l55qE6Kej6YeK44CCDQoNCuiCg+eE
tu+8jA0K5rKZ5ZOI5bCU5bmz5a6JDQo=
