Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB3D71FB19
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 09:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbjFBHht (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 03:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbjFBHh0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 03:37:26 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E2F1B5
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 00:37:25 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-568928af8f5so27894567b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685691444; x=1688283444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvq6bwMEo7GyPxU0mcZ8WejLPf/Ab7ld+tHMWCid2RA=;
        b=TwqM4HcEqZ28xLHUV3HMqJVI2hYFsCiDmL4EN0O2raEV8AxESeld3kesoXc0HCw9px
         nbIAgnWODPpgG2TVoVpsCejVEz1KUsCCS/IYiS/YuatLgRRzIX8LPvzI1/O0txHeVrn/
         rChiiZmj9ssmstlb/V47IH6TZv2fyqUSvbR8wEDQfGgAh+gSLKe6mvh1VytA/EUHAPS1
         BRt5llR7HfbF989zqlc+LcoOpLyCFVwg6R4GmBrSbuk8wNcvtxOrLNBDxWMDAXRqbWJm
         TbziWkgiDPn+oyMJjhrT/TDdnzSvJgGSYruxxnTvR+pyGRUZiNV4Hp5QFiaytHV4AA90
         +QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685691444; x=1688283444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvq6bwMEo7GyPxU0mcZ8WejLPf/Ab7ld+tHMWCid2RA=;
        b=FNMN/qwK8BsjkDt8+s+nJ6nfNnSOZNYuRQCeOROoeI6g30BjGkpQoVWD/ZEWcRzhQi
         PEBHH+z70x/52QEUue1Z5Xxo7+F22DV6kNZoBUKr5GEcc5mm1rgphTEGUZM5Pqf1F9Oz
         JH8AIRW7JEHp4UiGstrrpkfERIIEkH9VQsDTCU0VmRlfVychqrjs3Nu/bl8648Dlughk
         ytB9fZURuf1hEJnVg96gzE8YVv+aVyb90020YnRqfDqrgJG3WaZpqkRkrf3ERYyd4djh
         IQy0LJrX1a5D91Gc0kK2tCUyhIaYr21Q1kJrhssYDPDg9ahjGrebkN6EtM/pcDsZhhKu
         LNJQ==
X-Gm-Message-State: AC+VfDxUX6/6rRMlrqDKJlwMMgDNv13yQGKhq+N+BajfHSJZW2S2jtgn
        6n2EzYQQOq32oXY21WvnY5wwjy7mzuxVx2Atezbk1Q==
X-Google-Smtp-Source: ACHHUZ7M+/92HP6eSeidMwSIWVFM3D7fbOM3XGDDkpnNN0b3sJTc5uF/30IjLNu7lZWpAgVBmQx3ABI40Hrbki1HcXc=
X-Received: by 2002:a81:8443:0:b0:561:9bcc:6c81 with SMTP id
 u64-20020a818443000000b005619bcc6c81mr5053826ywf.24.1685691444521; Fri, 02
 Jun 2023 00:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <ZHhRa9FgA5ZWV/sD@linux-8mug>
In-Reply-To: <ZHhRa9FgA5ZWV/sD@linux-8mug>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Jun 2023 09:37:13 +0200
Message-ID: <CACRpkdZ05OKQmaueJWhHE6t1Uk1GQ2wEK5x+CoiRjHoPzG8uaw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: s32: Updates for v6.5
To:     Chester Lin <clin@suse.com>
Cc:     linux-gpio@vger.kernel.org, s32@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 1, 2023 at 10:06=E2=80=AFAM Chester Lin <clin@suse.com> wrote:

> Please pull the following change for v6.5.

Complicated with a pull request for a single patch :D

But nice to practice.

I just took the one patch and applied it.

Yours,
Linus Walleij
